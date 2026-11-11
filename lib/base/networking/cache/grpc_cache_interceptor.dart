import 'dart:async';

import 'package:campus_flutter/base/errorHandling/api_failure.dart';
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

    return _CachedResponseFuture<R>((response) async {
      void checkCancelled() {
        if (response._cancelled) throw const GrpcError.cancelled();
      }

      checkCancelled();
      final entry = await cache.get(key);
      checkCancelled();
      if (entry != null && cache.isFresh(entry, key)) {
        try {
          return applyTimeWindow<R>(factory(entry.body), request);
        } catch (_) {
          cache.delete(key);
        }
      }

      try {
        response._network = invoker(method, request, options);
        final data = await response._network!;
        checkCancelled();
        cache.add((data as GeneratedMessage).writeToJson(), key);
        response._useNetworkMetadata = true;
        return data;
      } catch (error) {
        checkCancelled();
        if (entry != null && ApiFailure.from(error).allowsStale) {
          try {
            return applyTimeWindow<R>(factory(entry.body), request);
          } catch (_) {
            cache.delete(key);
          }
        }
        rethrow;
      }
    });
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

/// A cache lookup is a normal future, not the fork's ClientCall cache argument:
/// that constructor does not forward rejected cache futures to its response
/// stream. Delegate the Future contract so failures always reach the caller.
class _CachedResponseFuture<R> implements ResponseFuture<R> {
  _CachedResponseFuture(Future<R> Function(_CachedResponseFuture<R>) fetch) {
    _future = Future.sync(() => fetch(this));
  }

  late final Future<R> _future;
  ResponseFuture<R>? _network;
  bool _cancelled = false;
  bool _useNetworkMetadata = false;

  @override
  Future<Map<String, String>> get headers async {
    await _future;
    return _useNetworkMetadata ? await _network!.headers : const {};
  }

  @override
  Future<Map<String, String>> get trailers async {
    await _future;
    return _useNetworkMetadata ? await _network!.trailers : const {};
  }

  @override
  Future<void> cancel() async {
    _cancelled = true;
    await _network?.cancel();
  }

  @override
  Stream<R> asStream() => _future.asStream();

  @override
  Future<R> catchError(Function onError, {bool Function(Object)? test}) =>
      _future.catchError(onError, test: test);

  @override
  Future<S> then<S>(FutureOr<S> Function(R) onValue, {Function? onError}) =>
      _future.then(onValue, onError: onError);

  @override
  Future<R> timeout(Duration timeLimit, {FutureOr<R> Function()? onTimeout}) =>
      _future.timeout(timeLimit, onTimeout: onTimeout);

  @override
  Future<R> whenComplete(FutureOr<void> Function() action) =>
      _future.whenComplete(action);
}
