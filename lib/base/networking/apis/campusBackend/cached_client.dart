import 'dart:io';

import 'package:campus_flutter/base/networking/apis/campusBackend/cached_response.dart';
import 'package:campus_flutter/base/networking/apis/campusBackend/hive_cache_store.dart';
import 'package:campus_flutter/base/networking/apis/campusBackend/lru_memory_cache_store.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';

import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;
import 'package:hive/hive.dart';
import 'package:protobuf/protobuf.dart';
import 'campus_backend.pbgrpc.dart';

class CachedCampusClient extends CampusClient {
  static Future<CachedCampusClient> createWebCache() async {
    return CachedCampusClient._webCache();
  }

  static Future<CachedCampusClient> createMobileCache(
      Directory directory) async {
    await Hive.openBox('grpc_cache', path: directory.path);
    return CachedCampusClient._mobileCache(directory);
  }

  CachedCampusClient._webCache()
      : super(_channel(),
            options: _callOptions(),
            interceptors: [CacheInterceptor.webCache()]);

  CachedCampusClient._mobileCache(Directory directory)
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
      "x-device-id": "unknown",
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
    hiveCacheStore =
        HiveCacheStore(directory.path, getIt<ConnectivityResult>());
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
    final key = method.path; //?${requests.toString()}";
    final (bool, dynamic) cachedResponse;
    if (kIsWeb) {
      cachedResponse = memCacheStore.get(key);
    } else {
      cachedResponse = hiveCacheStore.get(key);
    }
    final factory = _getFactory<R>();
    if (cachedResponse.$1 && cachedResponse.$2 != null && factory != null) {
      final data = factory(cachedResponse.$2!.data);
      return invoker(
          ClientMethod<Q, R>(method.path, (value) => [], (value) => data),
          requests,
          options);
    }

    final response = invoker(method, requests, options);
    response.listen((data) {
      if (kIsWeb) {
        memCacheStore.put(key, _convertToBuffer<R>(data));
      } else {
        hiveCacheStore.put(key, _convertToBuffer<R>(data));
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
    final key = method.path; //?${request.toString()}";
    final (bool, CacheResponse?) cachedResponse;
    if (kIsWeb) {
      cachedResponse = memCacheStore.get(key);
    } else {
      cachedResponse = hiveCacheStore.get(key);
    }
    final factory = _getFactory<R>();
    if (cachedResponse.$1 && cachedResponse.$2 != null && factory != null) {
      final data = factory(cachedResponse.$2!.data);
      return invoker(
          ClientMethod<Q, R>(method.path, (value) => [], (value) => data),
          request,
          options);
    }

    /// If not found in cache, invoke the actual RPC and cache the response
    final response = invoker(method, request, options);
    response.then((data) {
      if (kIsWeb) {
        memCacheStore.put(key, _convertToBuffer<R>(data));
      } else {
        hiveCacheStore.put(key, _convertToBuffer<R>(data));
      }
    });

    return response;
  }

  Uint8List? _convertToBuffer<R>(R data) {
    switch (R) {
      case ListNewsReply:
        final listData = data as ListNewsReply;
        return listData.writeToBuffer();
      default:
        return null;
    }
  }

  R Function(List<int>, [ExtensionRegistry])? _getFactory<R>() {
    switch (R) {
      case ListNewsReply:
        return ListNewsReply.fromBuffer as R Function(List<int>,
            [ExtensionRegistry]);
      default:
        return null;
    }
  }

  void invalidateCache() {
    if (kIsWeb) {
      memCacheStore.invalidate();
    } else {
      hiveCacheStore.invalidate();
    }
  }
}
