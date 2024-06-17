import 'package:campus_flutter/base/networking/cache/cache.dart';
import 'package:dio/dio.dart';

class RestCacheInterceptor implements Interceptor {
  late Cache cache;

  RestCacheInterceptor({
    required this.cache,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final key = options.uri.toString();

    /// if forcedRefresh parameter is passed the cache is invalidated
    if (options.extra["forcedRefresh"] == "true") {
      cache.delete(key);
    } else {
      final cacheEntry = await cache.get(key);

      /// device is online, fetch every 10 minutes
      if (cacheEntry != null) {
        return handler.resolve(
          Response(
            data: cacheEntry.body,
            extra: {
              "saved": cacheEntry.saved,
            },
            statusCode: 304,
            requestOptions: options,
          ),
        );
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final key = response.realUri.toString();
    cache.add(response.data, key);
    response.extra = response.extra..addAll({"saved": DateTime.now()});
    handler.next(response);
  }
}
