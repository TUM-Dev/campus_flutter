import 'dart:io';

import 'package:campus_flutter/base/networking/apis/tumdev/cached_response.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/custom_hive_cache_store.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/lru_memory_cache_store.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:protobuf/protobuf.dart';

class CacheInterceptor implements ClientInterceptor {
  late CustomHiveCacheStore hiveCacheStore;
  late LRUMemoryCacheStore memCacheStore;

  CacheInterceptor.mobileCache(Directory directory) {
    hiveCacheStore =
        CustomHiveCacheStore(directory.path, getIt<ConnectivityResult>());
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
      cachedResponse = memCacheStore.get(key);
    } else {
      cachedResponse = hiveCacheStore.get(key);
    }
    final factory = _getFactory<R>();
    if (cachedResponse.$1 && cachedResponse.$2 != null && factory != null) {
      final data = factory(cachedResponse.$2!.data);
      return ResponseStream<R>(
        ClientCall(
            ClientMethod<Q, R>(method.path, (value) => [], (value) => data),
            requests,
            options,
            null,
            true),
      );
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
    final key = "${method.path}?${requests.toString()}";
    final (bool, CacheResponse?) cachedResponse;
    if (kIsWeb) {
      cachedResponse = memCacheStore.get(key);
    } else {
      cachedResponse = hiveCacheStore.get(key);
    }
    final factory = _getFactory<R>();
    if (cachedResponse.$1 && cachedResponse.$2 != null && factory != null) {
      final data = factory(cachedResponse.$2!.data);
      return ResponseFuture<R>(
        ClientCall(
            ClientMethod<Q, R>(method.path, (value) => [], (value) => data),
            Stream.value(request),
            options,
            null,
            true),
      );
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

  // TODO: figure out nicer solution or add missing classes
  Uint8List? _convertToBuffer<R>(R data) {
    switch (R) {
      case ListNewsReply:
        final listData = data as ListNewsReply;
        return listData.writeToBuffer();
      case ListMoviesReply:
        final movieData = data as ListMoviesReply;
        return movieData.writeToBuffer();
      default:
        return null;
    }
  }

  // TODO: figure out nicer solution or add missing classes
  R Function(List<int>, [ExtensionRegistry])? _getFactory<R>() {
    switch (R) {
      case ListNewsReply:
        return ListNewsReply.fromBuffer as R Function(List<int>,
            [ExtensionRegistry]);
      case ListMoviesReply:
        return ListMoviesReply.fromBuffer as R Function(List<int>,
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
