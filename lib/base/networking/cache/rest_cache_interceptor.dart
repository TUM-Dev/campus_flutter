import 'dart:convert';

import 'package:campus_flutter/base/errorHandling/api_failure.dart';
import 'package:campus_flutter/base/networking/cache/cache.dart';
import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';

/// caching itself happens in RestClient after successful parsing
class RestCacheInterceptor implements Interceptor {
  static const String staleEntryKey = "staleCacheEntry";
  static const String fromCacheKey = "fromCache";
  static const String staleKey = "stale";

  late Cache cache;

  RestCacheInterceptor({required this.cache});

  static String cacheKey(RequestOptions options) {
    final uri = options.uri;
    if (!uri.queryParameters.containsKey('pToken')) return uri.toString();
    // Keep accounts isolated without persisting their bearer credentials.
    final digest = sha256.convert(utf8.encode(uri.toString()));
    return '${uri.origin}${uri.path}:$digest';
  }

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
    if (entry is CacheEntryData &&
        ApiFailure.from(err).allowsStale &&
        !_hasDomainError(err.response?.data)) {
      return handler.resolve(
        responseFromEntry(entry, err.requestOptions, stale: true),
      );
    }
    handler.next(err);
  }

  // XML is already converted to JSON by the response decoder. An explicit
  // domain-error envelope must reach RestClient even on a temporary HTTP status.
  static bool _hasDomainError(Object? body) {
    try {
      final json = body is String ? jsonDecode(body) : body;
      return json is Map &&
          json['error'] is Map &&
          (json['error'] as Map)['message'] is String;
    } catch (_) {
      return false;
    }
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
