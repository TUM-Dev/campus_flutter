import 'package:campus_flutter/base/networking/cache/cache.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/base/networking/base/connection_checker.dart';
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
    final hasConnection = await getIt<ConnectionChecker>().checkConnection();
    final key = options.uri.toString();

    /// checks if device has a working internet connection
    if (hasConnection && !options.path.contains("tumCard")) {
      /// if forcedRefresh parameter is passed the cache is invalidated
      if (options.extra["forcedRefresh"] == "true") {
        cache.delete(key);
      } else {
        final cacheEntry = cache.getString(key);

        /// device is online, fetch every 10 minutes
        if (cacheEntry != null &&
            DateTime.now().difference(cacheEntry.saved).inMinutes <= 10) {
          return handler.resolve(
            Response(
              data: cacheEntry.data,
              extra: {
                "saved": cacheEntry.saved,
              },
              statusCode: 304,
              requestOptions: options,
            ),
          );
        } else {
          /// if older than than 10 minutes -> invalidate cache
          cache.delete(key);
        }
      }
    } else {
      /// if device is offline, the cache is valid for 30 days
      final cacheEntry = cache.getString(key);
      if (cacheEntry != null &&
          DateTime.now().difference(cacheEntry.saved).inDays <= 30) {
        return handler.resolve(
          Response(
            data: cacheEntry.data,
            extra: {
              "saved": cacheEntry.saved,
            },
            statusCode: 304,
            requestOptions: options,
          ),
        );
      } else {
        cache.delete(key);
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final key = response.realUri.toString();
    cache.addString(response.data, key);
    response.extra = response.extra..addAll({"saved": DateTime.now()});
    handler.next(response);
  }
}
