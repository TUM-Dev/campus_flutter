import 'package:campus_flutter/base/networking/apis/tumdev/cached_response.dart';
import 'package:flutter/foundation.dart';

class LRUMemoryCacheStore {
  final Duration ttl;
  final Map<String, CacheResponse> _cache = {};
  final int _maxSize = 10;

  LRUMemoryCacheStore({this.ttl = const Duration(minutes: 10)});

  (bool, CacheResponse?) get(String key) {
    final result = _cache[key];
    if (result == null) return (false, null);

    final valid = result.saved.isBefore(DateTime.now().subtract(ttl));
    if (!valid) {
      _cache.remove(key);
    }
    return (valid, result);
  }

  void put(String key, Uint8List? data) {
    if (data != null) {
      if (_cache.length >= _maxSize) {
        _cache.remove(_cache.keys.first);
      }
      _cache[key] = CacheResponse(saved: DateTime.now(), data: data);
    }
  }

  void invalidate() {
    _cache.clear();
  }
}
