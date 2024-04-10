import 'package:isar/isar.dart';
import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:campus_flutter/base/util/fast_hash.dart';

class Cache {
  final Isar isar;

  final Duration ttl = const Duration(days: 30);

  Cache({required this.isar});

  void add(String body, String uri) {
    final today = DateTime.now();
    final cacheEntry = CacheEntry(
      id: fastHash(uri),
      url: uri,
      validUntil: today.add(ttl),
      saved: today,
      data: body,
    );
    isar.writeTxn(
      () => isar.cacheEntrys.put(cacheEntry),
    );
  }

  CacheEntry? get(String uri) {
    final hash = fastHash(uri);
    final entry = isar.txnSync(() => isar.cacheEntrys.getSync(hash));
    if (entry != null) {
      final today = DateTime.now();
      if (entry.validUntil.isAfter(today)) {
        return entry;
      } else {
        isar.writeTxn(() => isar.cacheEntrys.delete(hash));
        return null;
      }
    } else {
      return null;
    }
  }

  Future<CacheEntry?> getAsync(String uri) async {
    final hash = fastHash(uri);
    final entry = await isar.txn(() => isar.cacheEntrys.get(hash));
    if (entry != null) {
      final today = DateTime.now();
      if (entry.validUntil.isAfter(today)) {
        return entry;
      } else {
        isar.writeTxn(() => isar.cacheEntrys.delete(hash));
        return null;
      }
    } else {
      return null;
    }
  }

  void delete(String key) {
    final hash = fastHash(key);
    isar.writeTxn(() => isar.cacheEntrys.delete(hash));
  }

  Future<void> resetCache() async {
    return await isar.writeTxn(() => isar.clear());
  }
}
