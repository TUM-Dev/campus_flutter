import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/base/networking/cache/cache.dart';
import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
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

  // TODO(Jakob): figure out possibility to access cache
  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    final key = method.path;
    final cachedResponse = cache.get(key);
    /*final factory = _getFactory<R>();
    if (cachedResponse != null && factory != null) {
      final data = factory(cachedResponse.body);
      return ResponseFuture<R>(
        ClientCall(
          ClientMethod<Q, R>(method.path, (value) => [], (value) => data),
          Stream.value(request),
          options,
          null,
          true,
        ),
      );
    }*/

    /// If not found in cache, invoke the actual RPC and cache the response
    final response = invoker(method, request, options);
    response.then((data) {
      cache.add((data as GeneratedMessage).writeToJson(), key);
    });

    return response;
  }

  // TODO: figure out nicer solution or add missing classes
  R Function(String, [ExtensionRegistry])? _getFactory<R>() {
    if (R == ListNewsReply) {
      return ListNewsReply.fromJson as R Function(
        String, [
        ExtensionRegistry,
      ]);
    } else if (R == ListMoviesReply) {
      return ListMoviesReply.fromJson as R Function(
        String, [
        ExtensionRegistry,
      ]);
    } else {
      return null;
    }
  }

  void invalidateCache() {
    cache.resetCache();
  }
}
