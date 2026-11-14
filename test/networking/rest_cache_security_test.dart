import 'package:campus_flutter/base/networking/base/api_response.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_endpoint.dart';
import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:campus_flutter/base/networking/cache/rest_cache_interceptor.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/networking_fakes.dart';

void main() {
  String keyFor(String token) => RestCacheInterceptor.cacheKey(
    RequestOptions(
      path: 'https://campus.tum.de/tumonline/wbservicesbasic.tumCard',
      queryParameters: {'pToken': token, 'private': 'personal-value'},
    ),
  );

  test('authenticated cache keys hide credentials and separate accounts', () {
    final key = keyFor('secret-token');
    expect(key, isNot(contains('secret-token')));
    expect(key, isNot(contains('personal-value')));
    expect(key, isNot(contains('pToken')));
    expect(key, contains('tumCard'));
    expect(key, keyFor('secret-token'));
    expect(key, isNot(keyFor('another-token')));
  });

  test(
    'authenticated cards remain available from cache during an outage',
    () async {
      Api.tumToken = 'secret-token';
      addTearDown(() => Api.tumToken = '');
      final database = CacheDatabase.forTesting(NativeDatabase.memory());
      final cache = MemoryCache();
      final client = RestClient(database)..cache = cache;
      addTearDown(database.close);
      addTearDown(() => client.dio.close(force: true));
      client.dio.interceptors
        ..clear()
        ..add(RestCacheInterceptor(cache: cache));
      client.dio.httpClientAdapter = StubAdapter(
        (_) => ResponseBody.fromString('{"card": []}', 200),
      );
      Future<ApiResponse<Map<String, dynamic>>> fetch() =>
          client.get<Map<String, dynamic>, TumOnlineApi>(
            TumOnlineApi(TumOnlineEndpointTumCard()),
            (json) => json,
            true,
          );
      final online = await fetch();
      expect(online.data, {'card': []});
      expect(cache.entries.keys.single, isNot(contains('secret-token')));
      client.dio.httpClientAdapter = StubAdapter(
        (options) => throw DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
        ),
      );
      final offline = await fetch();
      expect(offline.saved, cache.entries.values.single.saved);
      expect(offline.data, {'card': []});
      Api.tumToken = 'other-account';
      await expectLater(fetch(), throwsA(isA<DioException>()));
    },
  );

  test('upgrade purges cached credentials and card bodies', () async {
    final database = CacheDatabase.forTesting(
      NativeDatabase.memory(
        setup: (db) {
          db.execute('''
            CREATE TABLE cache_entry (
              id INTEGER NOT NULL, url TEXT NOT NULL,
              valid_until INTEGER NOT NULL, saved INTEGER NOT NULL,
              body TEXT NOT NULL
            )
          ''');
          db.execute(
            "INSERT INTO cache_entry VALUES (1, 'https://example.org/?pToken=secret', 1, 1, 'private-card')",
          );
          db.execute('PRAGMA user_version = 1');
        },
      ),
    );
    addTearDown(database.close);
    expect(await database.select(database.cacheEntry).get(), isEmpty);
    expect(
      (await database.customSelect('PRAGMA user_version').getSingle())
          .read<int>('user_version'),
      3,
    );
  });
}
