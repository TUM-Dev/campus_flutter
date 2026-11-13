import 'dart:async';

import 'package:campus_flutter/base/networking/cache/cache.dart';
import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:campus_flutter/base/networking/cache/student_card_cache_cipher.dart';
import 'package:drift/native.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

class _DelayedCipher extends StudentCardCacheCipher {
  final started = Completer<void>();
  final release = Completer<void>();

  @override
  Future<String> encrypt(String plaintext, String cacheKey) async {
    started.complete();
    await release.future;
    return super.encrypt(plaintext, cacheKey);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const key = 'https://campus.tum.de/tumonline/wbservicesbasic.tumCard:account';
  const body = '{"name":"Private Student","foto":"private-photo"}';
  late CacheDatabase database;
  late Cache cache;

  setUp(() {
    FlutterSecureStorage.setMockInitialValues({});
    database = CacheDatabase.forTesting(NativeDatabase.memory());
    cache = Cache(cacheDatabase: database);
  });
  tearDown(() => database.close());

  test(
    'card data is encrypted on disk and decrypts after reopening the cache',
    () async {
      cache.add(body, key);
      expect((await cache.get(key))?.body, body);
      final stored =
          (await database.select(database.cacheEntry).get()).single.body;
      expect(stored, startsWith('card-aes-gcm-v1:'));
      expect(stored, isNot(contains('Private Student')));
      expect(stored, isNot(contains('private-photo')));
      expect((await Cache(cacheDatabase: database).get(key))?.body, body);
    },
  );

  test('tampered ciphertext is evicted instead of displayed', () async {
    cache.add(body, key);
    await cache.get(key);
    final row = (await database.select(database.cacheEntry).get()).single;
    await database
        .update(database.cacheEntry)
        .replace(
          row.copyWith(
            body: row.body.replaceFirst(
              'card-aes-gcm-v1:',
              'card-aes-gcm-v1:AA',
            ),
          ),
        );
    expect(await cache.get(key), isNull);
    await cache.get(key);
    expect(await database.select(database.cacheEntry).get(), isEmpty);
  });

  test(
    'ciphertext cannot be substituted into another account cache entry',
    () async {
      final cipher = StudentCardCacheCipher();
      final encrypted = await cipher.encrypt(body, key);
      await expectLater(
        cipher.decrypt(encrypted, '$key-other-account'),
        throwsA(anything),
      );
      expect(await cipher.encrypt(body, key), isNot(encrypted));
    },
  );

  test('missing encryption key makes an existing card a cache miss', () async {
    cache.add(body, key);
    await cache.get(key);
    FlutterSecureStorage.setMockInitialValues({});
    expect(await Cache(cacheDatabase: database).get(key), isNull);
  });

  test(
    'logout waits for encryption and prevents queued data from returning',
    () async {
      final cipher = _DelayedCipher();
      cache = Cache(cacheDatabase: database, cardCipher: cipher);
      cache.add(body, key);
      await cipher.started.future;
      final logout = cache.resetCache();
      cipher.release.complete();
      await logout;
      expect(await cache.get(key), isNull);
      expect(await database.select(database.cacheEntry).get(), isEmpty);
    },
  );
  test('refresh replaces the previous encrypted card record', () async {
    cache.add(body, key);
    await cache.get(key);
    const updated = '{"name":"Updated Student"}';
    cache.add(updated, key);
    expect((await cache.get(key))?.body, updated);
    expect((await database.select(database.cacheEntry).get()).length, 1);
  });
}
