import 'dart:async';
import 'dart:developer';

import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:campus_flutter/base/networking/cache/student_card_cache_cipher.dart';
import 'package:campus_flutter/base/services/connection_service.dart';
import 'package:campus_flutter/base/util/fast_hash.dart';
import 'package:campus_flutter/main.dart';
import 'package:drift/drift.dart';

class Cache {
  final CacheDatabase cacheDatabase;
  Future<void> _pendingWrites = Future.value();
  int _generation = 0;
  final StudentCardCacheCipher _cardCipher;

  final Duration onlineTtl = const Duration(minutes: 10);
  final Duration onlineStudentCardTtl = const Duration(hours: 3);
  final Duration maxAge = const Duration(days: 30);

  Cache({required this.cacheDatabase, StudentCardCacheCipher? cardCipher})
    : _cardCipher = cardCipher ?? StudentCardCacheCipher();

  static bool _isStudentCard(String key) =>
      key.contains('/wbservicesbasic.tumCard');

  void add(String body, String key) {
    final today = DateTime.now();
    final id = fastHash(key);
    final generation = _generation;

    unawaited(
      _write(() async {
        if (generation != _generation) return;
        final storedBody = _isStudentCard(key)
            ? await _cardCipher.encrypt(body, key)
            : body;
        if (generation != _generation) return;
        await cacheDatabase.managers.cacheEntry.create(
          (o) => CacheEntryCompanion.insert(
            id: Value(id),
            url: key,
            validUntil: today.add(maxAge),
            saved: today,
            body: storedBody,
          ),
          mode: InsertMode.replace,
        );
      }),
    );
  }

  Future<CacheEntryData?> get(String key) async {
    final id = fastHash(key);

    try {
      await _pendingWrites;
      final entry = await cacheDatabase.managers.cacheEntry
          .filter((f) => f.id.equals(id))
          .limit(1)
          .getSingleOrNull();
      if (entry == null) return null;
      if (entry.validUntil.isAfter(DateTime.now())) {
        if (!_isStudentCard(key)) return entry;
        try {
          return entry.copyWith(
            body: await _cardCipher.decrypt(entry.body, key),
          );
        } catch (_) {
          // Missing keys, plaintext legacy rows, and tampering are cache misses.
          delete(key);
          return null;
        }
      }
      delete(key);
    } on Exception catch (error) {
      // The cache is optional; an unavailable database must not block network.
      log('Cache read failed: ${error.runtimeType}');
    }
    return null;
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
    unawaited(
      _write(() async {
        await cacheDatabase.managers.cacheEntry
            .filter((f) => f.id.equals(id))
            .delete();
      }),
    );
  }

  Future<void> resetCache() {
    _generation++;
    return _write(() async {
      try {
        await cacheDatabase.managers.cacheEntry.delete();
      } finally {
        // Destroy the card key even if optional database cleanup fails.
        await _cardCipher.reset();
      }
    });
  }

  Future<void> _write(Future<void> Function() operation) {
    // Cleanup must run after already-started writes, never race them.
    return _pendingWrites = _pendingWrites.then((_) async {
      try {
        await operation();
      } on Exception catch (error) {
        // Do not log cache keys or response bodies: they can contain credentials.
        log('Cache write failed: ${error.runtimeType}');
      }
    });
  }
}
