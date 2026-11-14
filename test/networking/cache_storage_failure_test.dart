import 'package:campus_flutter/base/networking/cache/cache.dart';
import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late CacheDatabase database;
  late Cache cache;
  setUp(() async {
    FlutterSecureStorage.setMockInitialValues({});
    database = CacheDatabase.forTesting(NativeDatabase.memory());
    cache = Cache(cacheDatabase: database);
    await database.customSelect('SELECT * FROM cache_entry').get();
  });
  tearDown(() => database.close());

  test('unavailable cache reads are misses', () async {
    await database.customStatement('DROP TABLE cache_entry');
    expect(await cache.get('key'), isNull);
  });
  test('asynchronous write, delete and reset failures do not escape', () async {
    await database.customStatement('PRAGMA query_only = ON');
    cache.add('response', 'key');
    cache.delete('key');
    await cache.resetCache();
    expect(await cache.get('key'), isNull);
  });
  test('successful writes still round-trip and reset', () async {
    cache.add('response', 'key');
    await Future<void>.delayed(Duration.zero);
    expect((await cache.get('key'))?.body, 'response');
    await cache.resetCache();
    expect(await cache.get('key'), isNull);
  });
}
