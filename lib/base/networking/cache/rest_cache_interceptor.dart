import 'package:campus_flutter/base/networking/cache/cache.dart';
import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:dio/dio.dart';

/// caching itself happens in RestClient after successful parsing
class RestCacheInterceptor implements Interceptor {
  static const String staleEntryKey = "staleCacheEntry";
  static const String fromCacheKey = "fromCache";
  static const String staleKey = "stale";

  late Cache cache;

  RestCacheInterceptor({required this.cache});

  static String cacheKey(RequestOptions options) => options.uri.toString();

  static bool isCacheable(RequestOptions options) =>
      options.method.toUpperCase() == "GET" &&
      options.extra[Api.noCacheKey] != true;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!isCacheable(options)) {
      return handler.next(options);
    }

    final key = cacheKey(options);
    final entry = await cache.get(key);

    if (entry != null) {
      final forcedRefresh = options.extra["forcedRefresh"] == "true";
      if (!forcedRefresh && cache.isFresh(entry, key)) {
        return handler.resolve(responseFromEntry(entry, options, stale: false));
      }

      options.extra[staleEntryKey] = entry;
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    response.extra = response.extra..addAll({"saved": DateTime.now()});
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final entry = err.requestOptions.extra[staleEntryKey];
    if (entry is CacheEntryData && err.type != DioExceptionType.cancel) {
      return handler.resolve(
        responseFromEntry(entry, err.requestOptions, stale: true),
      );
    }
    handler.next(err);
  }

  static Response<String> responseFromEntry(
    CacheEntryData entry,
    RequestOptions options, {
    required bool stale,
  }) {
    return Response(
      data: entry.body,
      extra: {"saved": entry.saved, fromCacheKey: true, staleKey: stale},
      statusCode: 304,
      requestOptions: options,
    );
  }
}
