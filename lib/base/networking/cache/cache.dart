import 'package:isar/isar.dart';
import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:campus_flutter/base/util/fast_hash.dart';

class Cache {
  final Isar isar;

  final Duration ttl = const Duration(days: 30);

  Cache({required this.isar});

  void add(String body, Uri uri) {
    final today = DateTime.now();
    final cacheEntry = CacheEntry(
      id: fastHash(uri.toString()),
      url: uri.toString(),
      validUntil: today.add(ttl),
      saved: today,
      data: body,
    );
    isar.writeTxn(
      () => isar.cacheEntrys.put(cacheEntry),
    );
  }

  void addString(String body, String uri) {
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

  CacheEntry? get(Uri uri) {
    final hash = fastHash(uri.toString());
    final entry = isar.txnSync(() => isar.cacheEntrys.getSync(hash));
    if (entry != null) {
      final today = DateTime.now();
      if (entry.validUntil.isAfter(today)) {
        return entry;
      } else {
        isar.writeTxnSync(() => isar.cacheEntrys.deleteSync(hash));
        return null;
      }
    } else {
      return null;
    }
  }

  CacheEntry? getString(String uri) {
    final hash = fastHash(uri);
    final entry = isar.txnSync(() => isar.cacheEntrys.getSync(hash));
    if (entry != null) {
      final today = DateTime.now();
      if (entry.validUntil.isAfter(today)) {
        return entry;
      } else {
        isar.writeTxnSync(() => isar.cacheEntrys.deleteSync(hash));
        return null;
      }
    } else {
      return null;
    }
  }

  void delete(String key) {}

  Future<void> resetCache() async {
    return await isar.writeTxn(() => isar.clear());
  }
}
