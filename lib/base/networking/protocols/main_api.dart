import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:campus_flutter/base/networking/protocols/custom_cache_interceptor.dart';
import 'package:campus_flutter/base/networking/protocols/api_exception.dart';
import 'package:campus_flutter/base/networking/protocols/api_response.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:xml2json/xml2json.dart';

class MainApi {
  late Dio dio;
  late MemCacheStore memCacheStore;
  late HiveCacheStore hiveCacheStore;

  MainApi.webCache() {
    memCacheStore = MemCacheStore();

    var cacheOptions = CacheOptions(
        store: memCacheStore,
        policy: CachePolicy.forceCache,
        maxStale: const Duration(minutes: 10),
        hitCacheOnErrorExcept: [401, 404]);

    final dio = Dio()
      ..interceptors.add(DioCacheInterceptor(options: cacheOptions));

    dio.options = BaseOptions(
        responseDecoder: (data, options, body) {
          final decoded = utf8.decoder.convert(data);
          if (body.headers["content-type"]?.first.contains("xml") ?? false) {
            final transformer = Xml2Json();
            transformer.parse(decoded);
            return transformer
                .toParkerWithAttrsCustom(array: ["row", "event", "studium"]);
          } else {
            return decoded;
          }
        },
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10));

    this.dio = dio;
  }

  MainApi.mobileCache(Directory directory) {
    hiveCacheStore = HiveCacheStore(directory.path);

    /// cache duration is 30 days for offline mode
    var cacheOptions = CacheOptions(
        store: hiveCacheStore,
        policy: CachePolicy.forceCache,
        maxStale: const Duration(days: 30),
        hitCacheOnErrorExcept: [401, 404]);

    /// add custom cache interceptor to dio
    final dio = Dio()
      ..interceptors.add(CustomCacheInterceptor(
          cacheStore: hiveCacheStore, cacheOptions: cacheOptions));

    /// convert xml to json first - needs to happen here to
    /// avoid conversion everytime it's loaded out of cache
    dio.options = BaseOptions(responseDecoder: (data, options, body) {
      final decoded = utf8.decoder.convert(data);
      if (body.headers["content-type"]?.first.contains("xml") ?? false) {
        final transformer = Xml2Json();
        transformer.parse(decoded);
        return transformer
            .toParkerWithAttrsCustom(array: ["row", "event", "studium"]);
      } else {
        return decoded;
      }
    });

    this.dio = dio;
  }

  /// with possible error in response body
  Future<ApiResponse<T>>
      makeRequestWithException<T, S extends Api, U extends ApiException>(
          S endpoint,
          dynamic Function(Map<String, dynamic>) createObject,
          dynamic Function(Map<String, dynamic>) createError,
          bool forcedRefresh) async {
    Response<String> response;

    /// add forcedRefresh flag to temporary options
    if (forcedRefresh) {
      Dio noCacheDio = Dio()..interceptors.addAll(dio.interceptors);
      noCacheDio.options.responseDecoder = dio.options.responseDecoder;
      noCacheDio.options.extra["forcedRefresh"] = "true";
      response = await endpoint.asResponse(dioClient: noCacheDio);
    } else {
      response = await endpoint.asResponse(dioClient: dio);
    }

    log("${response.statusCode}: ${response.realUri}");
    try {
      /// check if response is error message by  attempting to decoding it
      throw ApiResponse<U>.fromJson(jsonDecode(response.data.toString()),
              response.headers, createError)
          .data;
    } on U catch (e) {
      /// rethrow error if specified error U
      e.toString();
      rethrow;
    } catch (_) {
      /// catch possible decoding error and return actual expected object
      return ApiResponse<T>.fromJson(
          jsonDecode(response.data.toString()), response.headers, createObject);
    }
  }

  /// without possible error in response body
  Future<ApiResponse<T>> makeRequest<T, S extends Api>(
      S endpoint,
      dynamic Function(Map<String, dynamic>) createObject,
      bool forcedRefresh) async {
    Response<String> response;

    if (forcedRefresh) {
      Dio noCacheDio = Dio()..interceptors.addAll(dio.interceptors);
      noCacheDio.options.responseDecoder = dio.options.responseDecoder;
      noCacheDio.options.extra["forcedRefresh"] = "true";
      response = await endpoint.asResponse(dioClient: noCacheDio);
    } else {
      response = await endpoint.asResponse(dioClient: dio);
    }

    log("${response.statusCode}: ${response.realUri}");
    return ApiResponse<T>.fromJson(
        jsonDecode(response.data.toString()), response.headers, createObject);
  }

  clearCache() async {
    if (kIsWeb) {
      memCacheStore.clean();
    } else {
      hiveCacheStore.clean();
    }
  }
}
