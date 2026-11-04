import 'dart:convert';
import 'dart:developer';

import 'package:campus_flutter/base/networking/cache/cache.dart';
import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:campus_flutter/base/networking/cache/rest_cache_interceptor.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/networking/protocols/api_exception.dart';
import 'package:campus_flutter/base/networking/base/api_response.dart';
import 'package:dio/dio.dart';
import 'package:xml2json/xml2json.dart';

class RestClient {
  late Dio dio;
  late Cache cache;

  RestClient(CacheDatabase cacheDatabase) {
    final cache = Cache(cacheDatabase: cacheDatabase);
    this.cache = cache;

    /// add custom cache interceptor to dio
    final dio = Dio()..interceptors.add(RestCacheInterceptor(cache: cache));

    /// convert xml to json first - needs to happen here to
    /// avoid conversion everytime it's loaded out of cache
    dio.options = BaseOptions(
      responseDecoder: (data, options, body) {
        final decoded = utf8.decoder.convert(data);
        if (body.headers["content-type"]?.first.contains("xml") ?? false) {
          final transformer = Xml2Json();
          transformer.parse(decoded);
          return transformer.toParkerWithAttrs(
            entries: {
              "row": "rowset",
              "event": "events",
              "studium": "studien",
              "raum": "raeume",
              "gruppe": "gruppen",
              "nebenstelle": "telefon_nebenstellen",
              "card": "cards",
            },
          );
        } else {
          return decoded;
        }
      },
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    this.dio = dio;
  }

  /// with possible error in response body
  Future<ApiResponse<T>>
  getWithException<T, S extends Api, U extends ApiException>(
    S endpoint,
    dynamic Function(Map<String, dynamic>) createObject,
    dynamic Function(Map<String, dynamic>) createError,
    bool forcedRefresh,
  ) async {
    final response = await _get(endpoint, forcedRefresh);
    log("${response.statusCode}: ${response.realUri}");
    return _parseAndCache<T>(
      response,
      (response) =>
          _parseWithException<T, U>(response, createObject, createError),
      isApiError: (e) => e is U,
    );
  }

  Future<ApiResponse<T>>
  postWithException<T, S extends Api, U extends ApiException>(
    S endpoint,
    dynamic Function(Map<String, dynamic>) createObject,
    dynamic Function(Map<String, dynamic>) createError,
  ) async {
    final response = await endpoint.post(dioClient: dio);
    log("${response.statusCode}: ${response.realUri}");
    return _parseWithException<T, U>(response, createObject, createError);
  }

  /// without possible error in response body
  Future<ApiResponse<T>> get<T, S extends Api>(
    S endpoint,
    dynamic Function(Map<String, dynamic>) createObject,
    bool forcedRefresh,
  ) async {
    try {
      final response = await _get(endpoint, forcedRefresh);
      log("${response.statusCode}: ${response.realUri}");
      return _parseAndCache<T>(
        response,
        (response) => ApiResponse<T>.fromJson(
          jsonDecode(response.data.toString()),
          response.extra,
          createObject,
        ),
      );
    } catch (e) {
      if (e is Error) {
        log("${endpoint.asURL().toString()}: ${e.stackTrace.toString()}");
      } else {
        log("${endpoint.asURL().toString()}: ${e.toString()}");
      }
      rethrow;
    }
  }

  Future<Response<String>> _get(Api endpoint, bool forcedRefresh) {
    if (forcedRefresh) {
      /// add forcedRefresh flag to temporary options
      Dio noCacheDio = Dio()..interceptors.addAll(dio.interceptors);
      noCacheDio.options.responseDecoder = dio.options.responseDecoder;
      noCacheDio.options.connectTimeout = dio.options.connectTimeout;
      noCacheDio.options.receiveTimeout = dio.options.receiveTimeout;
      noCacheDio.options.extra["forcedRefresh"] = "true";
      return endpoint.get(dioClient: noCacheDio);
    } else {
      return endpoint.get(dioClient: dio);
    }
  }

  /// only cache parsable responses, fall back to stale entry otherwise
  ApiResponse<T> _parseAndCache<T>(
    Response<String> response,
    ApiResponse<T> Function(Response<String>) parse, {
    bool Function(Object)? isApiError,
  }) {
    final options = response.requestOptions;
    final key = RestCacheInterceptor.cacheKey(options);
    final fromCache = response.extra[RestCacheInterceptor.fromCacheKey] == true;

    try {
      final result = parse(response);
      final body = response.data;
      if (!fromCache &&
          body != null &&
          RestCacheInterceptor.isCacheable(options)) {
        cache.add(body, key);
      }
      return result;
    } catch (e) {
      if (fromCache) {
        cache.delete(key);
        rethrow;
      }

      final staleEntry = options.extra[RestCacheInterceptor.staleEntryKey];
      final apiError = isApiError?.call(e) ?? false;
      if (staleEntry is CacheEntryData && !apiError) {
        log("${response.realUri}: unreadable response, using cached data");
        return parse(
          RestCacheInterceptor.responseFromEntry(
            staleEntry,
            options,
            stale: true,
          ),
        );
      }
      rethrow;
    }
  }

  ApiResponse<T> _parseWithException<T, U extends ApiException>(
    Response<String> response,
    dynamic Function(Map<String, dynamic>) createObject,
    dynamic Function(Map<String, dynamic>) createError,
  ) {
    try {
      final json = jsonDecode(response.data.toString());

      U? error;
      try {
        error = ApiResponse<U>.fromJson(json, response.extra, createError).data;
      } catch (_) {}
      if (error != null) {
        log(error.toString());
        throw error;
      }

      return ApiResponse<T>.fromJson(json, response.extra, createObject);
    } catch (e) {
      if (e is Error) {
        log(e.stackTrace.toString());
      } else if (e is! U) {
        log(e.toString());
      }
      rethrow;
    }
  }

  Future<void> clearCache() async {
    await cache.resetCache();
  }
}
