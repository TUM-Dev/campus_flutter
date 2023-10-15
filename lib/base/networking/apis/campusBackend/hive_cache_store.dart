import 'package:campus_flutter/base/networking/apis/campusBackend/cached_response.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class HiveCacheStore {
  final String _cachePath;
  final ConnectivityResult _connectivityResult;
  final Duration ttl;

  HiveCacheStore(this._cachePath, this._connectivityResult,
      {this.ttl = const Duration(days: 30)});

  (bool, CacheResponse?) get(String key) {
    final box = Hive.box('grpc_cache');
    final result = box.get(key) as CacheResponse?;
    if (result == null) return (false, null);

    bool valid = false;
    if (_connectivityResult != ConnectivityResult.none) {
      valid = result.saved.isAfter(DateTime.now().subtract(ttl));
    } else {
      valid = result.saved
          .isAfter(DateTime.now().subtract(const Duration(minutes: 10)));
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
