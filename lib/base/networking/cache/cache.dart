import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:campus_flutter/base/services/connection_service.dart';
import 'package:campus_flutter/base/util/fast_hash.dart';
import 'package:campus_flutter/main.dart';
import 'package:drift/drift.dart';

class Cache {
  final CacheDatabase cacheDatabase;

  final Duration onlineTtl = Duration(minutes: 10);
  final Duration onlineStudentCardTtl = Duration(hours: 3);
  final Duration offlineTtl = const Duration(days: 30);

  Cache({required this.cacheDatabase});

  void add(String body, String key) {
    final today = DateTime.now();
    final id = fastHash(key);

    cacheDatabase.managers.cacheEntry.create(
      (o) => CacheEntryCompanion.insert(
        id: id,
        url: key,
        validUntil: today.add(offlineTtl),
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

    if (entry != null) {
      final today = DateTime.now();
      if (getIt<ConnectionService>().hasInternet()) {
        if (!key.contains("tumCard")) {
          if (entry.saved.isAfter(today.subtract(onlineTtl))) {
            return entry;
          } else {
            delete(key);
            return null;
          }
        } else {
          if (entry.saved.isAfter(today.subtract(onlineStudentCardTtl))) {
            return entry;
          } else {
            delete(key);
            return null;
          }
        }
      } else {
        if (entry.validUntil.isAfter(today)) {
          return entry;
        } else {
          delete(key);
          return null;
        }
      }
    } else {
      return null;
    }
  }

  void delete(String key) {
    final id = fastHash(key);
    cacheDatabase.managers.cacheEntry.filter((f) => f.id.equals(id)).delete();
  }

  Future<void> resetCache() async {
    await cacheDatabase.managers.cacheEntry.delete();
  }
}
