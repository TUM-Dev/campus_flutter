import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:campus_flutter/base/services/connection_service.dart';
import 'package:campus_flutter/base/util/fast_hash.dart';
import 'package:campus_flutter/main.dart';
import 'package:drift/drift.dart';

class Cache {
  final CacheDatabase cacheDatabase;

  final Duration onlineTtl = const Duration(minutes: 10);
  final Duration onlineStudentCardTtl = const Duration(hours: 3);
  final Duration maxAge = const Duration(days: 30);

  Cache({required this.cacheDatabase});

  void add(String body, String key) {
    final today = DateTime.now();
    final id = fastHash(key);

    cacheDatabase.managers.cacheEntry.create(
      (o) => CacheEntryCompanion.insert(
        id: id,
        url: key,
        validUntil: today.add(maxAge),
        saved: today,
        body: body,
      ),
      mode: InsertMode.replace,
    );
  }

  Future<CacheEntryData?> get(String key) async {
    final id = fastHash(key);

    final entry = await cacheDatabase.managers.cacheEntry
        .filter((f) => f.id.equals(id))
        .limit(1)
        .getSingleOrNull();

    if (entry == null) {
      return null;
    }

    if (entry.validUntil.isAfter(DateTime.now())) {
      return entry;
    } else {
      delete(key);
      return null;
    }
  }

  bool isFresh(CacheEntryData entry, String key) {
    if (!getIt<ConnectionService>().hasInternet()) {
      return true;
    }
    final ttl = key.contains("tumCard") ? onlineStudentCardTtl : onlineTtl;
    return entry.saved.isAfter(DateTime.now().subtract(ttl));
  }

  void delete(String key) {
    final id = fastHash(key);
    cacheDatabase.managers.cacheEntry.filter((f) => f.id.equals(id)).delete();
  }

  Future<void> resetCache() async {
    await cacheDatabase.managers.cacheEntry.delete();
  }
}
