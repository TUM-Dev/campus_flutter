import 'dart:io';

import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:grpc/service_api.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive/hive.dart';
import 'campus_backend.pbgrpc.dart';

class CachedCampusClient extends CampusClient {
  CachedCampusClient.webCache()
      : super(_channel(),
      options: _callOptions(),
      interceptors: [CacheInterceptor.webCache()]);

  CachedCampusClient.mobileCache(Directory directory)
      : super(_channel(),
      options: _callOptions(),
      interceptors: [CacheInterceptor.mobileCache(directory)]);

  void invalidateCache() {
    // TODO: implement interceptUnary
    throw UnimplementedError();
  }

  static CallOptions _callOptions() {
    return CallOptions(metadata: {
      "x-app-version": "unknown",
      "x-app-build": "unknown",
      "x-device-id": "unkonwn",
      "x-os-version": "unknown",
    });
  }

  static GrpcOrGrpcWebClientChannel _channel() {
    return GrpcOrGrpcWebClientChannel.toSeparateEndpoints(
        grpcHost: "api.tum.app",
        grpcPort: 443,
        grpcTransportSecure: true,
        grpcWebHost: "api-grpc.tum.app",
        grpcWebPort: 443,
        grpcWebTransportSecure: true);
  }
}

class CacheInterceptor implements ClientInterceptor {
  late HiveCacheStore hiveCacheStore;
  late LRUMemoryCacheStore memCacheStore;

  CacheInterceptor.mobileCache(Directory directory) {
    hiveCacheStore = HiveCacheStore(directory.path);
  }
  CacheInterceptor.webCache() {
    memCacheStore = LRUMemoryCacheStore();
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
      ClientMethod<Q, R> method,
      Stream<Q> requests,
      CallOptions options,
      ClientStreamingInvoker<Q, R> invoker) {
    final key = "${method.path}?${requests.toString()}";
    final (bool, dynamic) cachedResponse;
    if (kIsWeb) {
      cachedResponse = hiveCacheStore.get(key);
    } else {
      cachedResponse = memCacheStore.get(key);
    }
    if (cachedResponse.$1 && cachedResponse.$2 != null) {
      return ResponseStream(cachedResponse.$2);
    }

    final response = invoker(method, requests, options);
    response.listen((data) {
      if (kIsWeb) {
        memCacheStore.put(key, data);
      } else {
        hiveCacheStore.put(key, data);
      }
    });

    return response;
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
      ClientMethod<Q, R> method,
      Q request,
      CallOptions options,
      ClientUnaryInvoker<Q, R> invoker,
      ) {
    final key = "${method.path}?${request.toString()}";
    final (bool, dynamic) cachedResponse;
    if (kIsWeb) {
      cachedResponse = hiveCacheStore.get(key);
    } else {
      cachedResponse = memCacheStore.get(key);
    }
    if (cachedResponse.$1 && cachedResponse.$2 != null) {
      return ResponseFuture(cachedResponse.$2);
    }

    // If not found in cache, invoke the actual RPC and cache the response
    final response = invoker(method, request, options);
    response.then((data) {
      if (kIsWeb) {
        memCacheStore.put(key, data);
      } else {
        hiveCacheStore.put(key, data);
      }
    });

    return response;
  }
}

class HiveCacheStore {
  final String _cachePath;
  final Duration ttl;
  HiveCacheStore(this._cachePath, {this.ttl=const Duration(days: 30)});

  (bool,dynamic) get(String key) {
    final box = Hive.box('grpc_cache_$_cachePath');
    final result = box.get(key) as (DateTime,dynamic)?;
    if (result == null) return (false,null);

    final fresh=result.$1.isBefore(DateTime.now().subtract(ttl));
    return (fresh,result);
  }

  void put(String key, dynamic data) {
    final box = Hive.box('grpc_cache_$_cachePath');
    box.put(key, (DateTime.now(),data));
  }
}

class LRUMemoryCacheStore {
  final Duration ttl;
  final Map<String, (DateTime,dynamic)> _cache = {};
  final int _maxSize = 10;
  LRUMemoryCacheStore({this.ttl=const Duration(minutes: 10)});

  (bool,dynamic) get(String key) {
    final result = _cache[key];
    if (result == null) return (false,null);

    final fresh=result.$1.isBefore(DateTime.now().subtract(ttl));
    return (fresh,result);

  }

  void put(String key, dynamic data) {
    if (_cache.length >= _maxSize) {
      _cache.remove(_cache.keys.first);
    }
    _cache[key] = (DateTime.now(),data);
  }
}