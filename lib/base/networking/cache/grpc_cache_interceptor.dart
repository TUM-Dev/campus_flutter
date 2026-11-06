import 'dart:async';

import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/base/networking/cache/cache.dart';
import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:protobuf/protobuf.dart';

class GrpcCacheInterceptor implements ClientInterceptor {
  late Cache cache;

  GrpcCacheInterceptor(CacheDatabase cacheDatabase) {
    cache = Cache(cacheDatabase: cacheDatabase);
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    return invoker(method, requests, options);
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    final factory = _getFactory<R>();

    if (factory == null) {
      return invoker(method, request, options);
    }

    final key = cacheKey(method.path, request);

    Future<R> fetch() async {
      final entry = await cache.get(key);
      if (entry != null && cache.isFresh(entry, key)) {
        try {
          return applyTimeWindow<R>(factory(entry.body), request);
        } catch (_) {
          cache.delete(key);
        }
      }

      try {
        final response = await invoker(method, request, options);
        cache.add((response as GeneratedMessage).writeToJson(), key);
        return response;
      } catch (_) {
        if (entry != null) {
          try {
            return applyTimeWindow<R>(factory(entry.body), request);
          } catch (_) {
            cache.delete(key);
          }
        }
        rethrow;
      }
    }

    return ResponseFuture<R>(
      ClientCall(method, Stream.value(request), options, null, fetch()),
    );
  }

  /// `oldestDateAt` moves with the current time, so it is left out of the key.
  /// Otherwise previously fetched data could not be found again while offline.
  /// Requests with and without a time window still get separate entries.
  @visibleForTesting
  static String cacheKey(String path, Object? request) {
    if (request is ListMoviesRequest && request.hasOldestDateAt()) {
      final stable = request.deepCopy()..clearOldestDateAt();
      return "$path:${stable.writeToJson()}:windowed";
    }
    if (request is ListNewsRequest && request.hasOldestDateAt()) {
      final stable = request.deepCopy()..clearOldestDateAt();
      return "$path:${stable.writeToJson()}:windowed";
    }
    return request is GeneratedMessage
        ? "$path:${request.writeToJson()}"
        : path;
  }

  /// Applies the backend's `date > oldestDateAt` filter to a cached reply, which
  /// may have been fetched with an earlier time window.
  @visibleForTesting
  static R applyTimeWindow<R>(R reply, Object? request) {
    if (reply is ListMoviesReply &&
        request is ListMoviesRequest &&
        request.hasOldestDateAt()) {
      final oldest = request.oldestDateAt.toDateTime();
      reply.movies.retainWhere(
        (movie) => movie.date.toDateTime().isAfter(oldest),
      );
    } else if (reply is ListNewsReply &&
        request is ListNewsRequest &&
        request.hasOldestDateAt()) {
      final oldest = request.oldestDateAt.toDateTime();
      reply.news.retainWhere((news) => news.date.toDateTime().isAfter(oldest));
    }
    return reply;
  }

  // TODO: figure out nicer solution or add missing classes
  R Function(String, [ExtensionRegistry])? _getFactory<R>() {
    if (R == ListNewsReply) {
      return ListNewsReply.fromJson as R Function(String, [ExtensionRegistry]);
    } else if (R == ListMoviesReply) {
      return ListMoviesReply.fromJson
          as R Function(String, [ExtensionRegistry]);
    } else {
      return null;
    }
  }

  void invalidateCache() {
    cache.resetCache();
  }
}
