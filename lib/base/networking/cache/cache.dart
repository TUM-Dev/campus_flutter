import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:campus_flutter/base/util/fast_hash.dart';

class Cache {
  final CacheDatabase cacheDatabase;

  final Duration ttl = const Duration(days: 30);

  Cache({required this.cacheDatabase});

  void add(String body, String uri) {
    final today = DateTime.now();
    final id = fastHash(uri);
    cacheDatabase.into(cacheDatabase.cacheEntry).insert(
          CacheEntryCompanion.insert(
            id: id,
            url: uri,
            validUntil: today.add(ttl),
            saved: today,
            body: body,
          ),
        );
  }

  Future<CacheEntryData?> get(String uri) async {
    final id = fastHash(uri);
    final entry = await (cacheDatabase.select(cacheDatabase.cacheEntry)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
    if (entry != null) {
      final today = DateTime.now();
      if (entry.validUntil.isAfter(today)) {
        return entry;
      } else {
        cacheDatabase.delete(cacheDatabase.cacheEntry).delete(entry);
        return null;
      }
    } else {
      return null;
    }
  }

  void delete(String key) {
    final hash = fastHash(key);
    (cacheDatabase.delete(cacheDatabase.cacheEntry)
          ..where((tbl) => tbl.id.equals(hash)))
        .go();
  }

  Future<void> resetCache() async {
    cacheDatabase.delete(cacheDatabase.cacheEntry);
  }
}
