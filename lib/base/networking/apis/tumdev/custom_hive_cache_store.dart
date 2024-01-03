import 'package:campus_flutter/base/networking/apis/tumdev/cached_response.dart';
import 'package:campus_flutter/base/networking/base/connection_checker.dart';
import 'package:campus_flutter/main.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

// TODO: rename to avoid conflicts with dio cache store
class CustomHiveCacheStore {
  final String _cachePath;
  final Duration ttl;

  CustomHiveCacheStore(
    this._cachePath, {
    this.ttl = const Duration(days: 30),
  });

  (bool, CacheResponse?) get(String key) {
    final box = Hive.box('grpc_cache');
    final result = box.get(key) as CacheResponse?;
    if (result == null) return (false, null);

    bool valid = false;
    if (getIt<ConnectionChecker>().hasInternet()) {
      valid = result.saved
          .isAfter(DateTime.now().subtract(const Duration(minutes: 10)));
    } else {
      valid = result.saved.isAfter(DateTime.now().subtract(ttl));
    }

    /// clear cache entry if not valid anymore
    if (!valid) {
      box.delete(key);
    }

    return (valid, result);
  }

  void put(String key, Uint8List? data) {
    if (data != null) {
      final box = Hive.box('grpc_cache');
      box.put(key, CacheResponse(saved: DateTime.now(), data: data.toList()));
    }
  }

  void invalidate() {
    Hive.box(_cachePath).clear();
  }
}
