import 'dart:typed_data';

import 'package:campus_flutter/base/networking/apis/eatApi/eat_api.dart';
import 'package:campus_flutter/base/networking/apis/eatApi/eat_api_endpoint.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_endpoint.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/base/networking/cache/cache.dart';
import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:campus_flutter/base/networking/cache/rest_cache_interceptor.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/services/mealplan_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

class MemoryCache implements Cache {
  final entries = <String, CacheEntryData>{};
  @override
  Future<CacheEntryData?> get(String key) async => entries[key];
  @override
  bool isFresh(CacheEntryData entry, String key) => false;
  @override
  void add(String body, String key) => entries[key] = CacheEntryData(
    id: 1,
    url: key,
    body: body,
    saved: DateTime.now(),
    validUntil: DateTime.now().add(const Duration(days: 1)),
  );
  @override
  void delete(String key) => entries.remove(key);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class StubAdapter implements HttpClientAdapter {
  StubAdapter(this.reply);
  final ResponseBody Function(RequestOptions) reply;
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? stream,
    Future<void>? cancelFuture,
  ) async => reply(options);
  @override
  void close({bool force = false}) {}
}

ResponseBody body(String data, int status) => ResponseBody.fromString(
  data,
  status,
  headers: {
    Headers.contentTypeHeader: ['application/json'],
  },
);

void main() {
  late RestClient client;
  late MemoryCache cache;
  late CacheDatabase database;
  final endpoint = EatApi(EatApiEndpointCanteens());

  setUp(() {
    database = CacheDatabase();
    cache = MemoryCache();
    client = RestClient(database)..cache = cache;
    client.dio.interceptors.clear();
    client.dio.interceptors.add(RestCacheInterceptor(cache: cache));
  });
  tearDown(() async {
    client.dio.close(force: true);
    await database.close();
    if (getIt.isRegistered<RestClient>()) getIt.unregister<RestClient>();
  });

  Future<Map<String, dynamic>> fetch() async =>
      (await client.get<Map<String, dynamic>, EatApi>(
        endpoint,
        (json) => json,
        true,
      )).data;

  test(
    'server outage uses stale data but access and missing errors surface',
    () async {
      cache.add('{"cached":true}', endpoint.asURL().toString());
      client.dio.httpClientAdapter = StubAdapter((_) => body('outage', 503));
      expect(await fetch(), {'cached': true});
      for (final status in [401, 403, 404]) {
        client.dio.httpClientAdapter = StubAdapter(
          (_) => body('error', status),
        );
        await expectLater(
          fetch(),
          throwsA(
            isA<DioException>().having(
              (e) => e.response?.statusCode,
              'status',
              status,
            ),
          ),
        );
      }
    },
  );

  test('cancellation and TLS failures do not use stale data', () async {
    cache.add('{"cached":true}', endpoint.asURL().toString());
    for (final type in [
      DioExceptionType.cancel,
      DioExceptionType.badCertificate,
    ]) {
      client.dio.httpClientAdapter = StubAdapter(
        (options) => throw DioException(requestOptions: options, type: type),
      );
      await expectLater(
        fetch(),
        throwsA(isA<DioException>().having((e) => e.type, 'type', type)),
      );
    }
  });

  test('malformed success falls back to stale and is never cached', () async {
    cache.add('{"cached":true}', endpoint.asURL().toString());
    client.dio.httpClientAdapter = StubAdapter(
      (_) => body('<html>oops</html>', 200),
    );
    expect(await fetch(), {'cached': true});
    expect(cache.entries.values.single.body, '{"cached":true}');
    cache.entries.clear();
    await expectLater(fetch(), throwsFormatException);
    expect(cache.entries, isEmpty);
  });

  test('domain error bodies are recognized on success and non-2xx', () async {
    final api = TumOnlineApi(TumOnlineEndpointTumCard());
    cache.add('{"cached":true}', api.asURL().toString());
    for (final status in [200, 403, 503]) {
      client.dio.httpClientAdapter = StubAdapter(
        (_) => body('{"error":{"message":"Token ist ungültig!"}}', status),
      );
      await expectLater(
        client.getWithException<Object, TumOnlineApi, TumOnlineApiException>(
          api,
          (json) => json,
          TumOnlineApiException.fromJson,
          true,
        ),
        throwsA(
          isA<TumOnlineApiException>().having(
            (e) => e.tumOnlineApiExceptionType,
            'type',
            isA<TumOnlineApiExceptionInvalidToken>(),
          ),
        ),
      );
    }
    expect(cache.entries.values.single.body, '{"cached":true}');
  });

  test(
    'XML domain envelopes survive decoding on failed HTTP responses',
    () async {
      client.dio.httpClientAdapter = StubAdapter(
        (_) => ResponseBody.fromString(
          '<error><message>Token ist nicht bestätigt!</message></error>',
          403,
          headers: {
            Headers.contentTypeHeader: ['application/xml'],
          },
        ),
      );
      await expectLater(
        client.getWithException<Object, TumOnlineApi, TumOnlineApiException>(
          TumOnlineApi(TumOnlineEndpointTumCard()),
          (json) => json,
          TumOnlineApiException.fromJson,
          true,
        ),
        throwsA(
          isA<TumOnlineApiException>().having(
            (e) => e.tumOnlineApiExceptionType,
            'type',
            isA<TumOnlineApiExceptionTokenNotConfirmed>(),
          ),
        ),
      );
    },
  );

  test('POST domain errors surface and never use cached reads', () async {
    final api = TumOnlineApi(TumOnlineEndpointTumCard());
    cache.add('{"cached":true}', api.asURL().toString());
    client.dio.httpClientAdapter = StubAdapter((options) {
      expect(options.method, 'POST');
      return body('{"error":{"message":"Token ist ungültig!"}}', 403);
    });
    await expectLater(
      client.postWithException<Object, TumOnlineApi, TumOnlineApiException>(
        api,
        (json) => json,
        TumOnlineApiException.fromJson,
      ),
      throwsA(isA<TumOnlineApiException>()),
    );
    expect(cache.entries.values.single.body, '{"cached":true}');
  });

  test('HTML error page preserves HTTP failure', () async {
    client.dio.httpClientAdapter = StubAdapter(
      (_) => body('<html>error</html>', 502),
    );
    await expectLater(
      client.getWithException<Object, TumOnlineApi, TumOnlineApiException>(
        TumOnlineApi(TumOnlineEndpointTumCard()),
        (json) => json,
        TumOnlineApiException.fromJson,
        true,
      ),
      throwsA(isA<DioException>()),
    );
  });

  test('meal plan is empty only when both weekly files are missing', () async {
    getIt.registerSingleton<RestClient>(client);
    final cafeteria = Cafeteria.fromJson({
      'canteen_id': 'mensa-garching',
      'name': 'Mensa',
      'location': {'latitude': 48.0, 'longitude': 11.0, 'address': 'Campus'},
    });
    client.dio.httpClientAdapter = StubAdapter((_) => body('missing', 404));
    expect(
      (await MealPlanService.getCafeteriaMenu(true, cafeteria)).$2,
      isEmpty,
    );
    for (final status in [503, 401]) {
      client.dio.httpClientAdapter = StubAdapter((_) => body('outage', status));
      await expectLater(
        MealPlanService.getCafeteriaMenu(true, cafeteria),
        throwsA(isA<DioException>()),
      );
    }
  });
}
