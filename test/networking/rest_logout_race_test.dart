import 'dart:async';
import 'dart:typed_data';

import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_endpoint.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

class _HeldResponse implements HttpClientAdapter {
  final started = Completer<void>();
  final response = Completer<ResponseBody>();

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? stream,
    Future<void>? cancelFuture,
  ) {
    started.complete();
    return response.future;
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late CacheDatabase database;
  late RestClient client;
  late _HeldResponse adapter;

  setUp(() {
    FlutterSecureStorage.setMockInitialValues({});
    Api.tumToken = 'old-session';
    database = CacheDatabase.forTesting(NativeDatabase.memory());
    client = RestClient(database);
    adapter = _HeldResponse();
    client.dio.httpClientAdapter = adapter;
  });
  tearDown(() async {
    Api.tumToken = '';
    client.dio.close(force: true);
    await database.close();
  });

  for (final fail in [false, true]) {
    test(
      'late ${fail ? "failure" : "success"} after logout is discarded',
      () async {
        final pending = client.get<Map<String, dynamic>, TumOnlineApi>(
          TumOnlineApi(TumOnlineEndpointTumCard()),
          (json) => json,
          true,
        );
        final rejected = expectLater(
          pending,
          throwsA(
            isA<DioException>().having(
              (error) => error.type,
              'type',
              DioExceptionType.cancel,
            ),
          ),
        );
        await adapter.started.future;
        await client.clearCache();
        Api.tumToken = 'new-session';
        if (fail) {
          adapter.response.completeError(
            DioException(
              requestOptions: RequestOptions(path: '/old-request'),
              type: DioExceptionType.connectionError,
            ),
          );
        } else {
          adapter.response.complete(
            ResponseBody.fromString('{"card": []}', 200),
          );
        }
        await rejected;
        expect(await database.select(database.cacheEntry).get(), isEmpty);
      },
    );
  }
}
