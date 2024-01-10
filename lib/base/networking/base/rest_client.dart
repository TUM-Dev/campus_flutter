import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/networking/protocols/api_exception.dart';
import 'package:campus_flutter/base/networking/base/api_response.dart';
import 'package:campus_flutter/base/networking/base/custom_cache_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:xml2json/xml2json.dart';

class RESTClient {
  late Dio dio;
  late MemCacheStore memCacheStore;
  late HiveCacheStore hiveCacheStore;

  RESTClient.webCache() {
    memCacheStore = MemCacheStore();

    var cacheOptions = CacheOptions(
      store: memCacheStore,
      policy: CachePolicy.forceCache,
      maxStale: const Duration(minutes: 10),
      hitCacheOnErrorExcept: [401, 404],
    );

    final dio = Dio()
      ..interceptors.add(DioCacheInterceptor(options: cacheOptions));

    dio.options = BaseOptions(
      responseDecoder: (data, options, body) {
        final decoded = utf8.decoder.convert(data);
        if (body.headers["content-type"]?.first.contains("xml") ?? false) {
          final transformer = Xml2Json();
          transformer.parse(decoded);
          return transformer.toParkerWithAttrsCustom(
            array: [
              "row",
              "event",
              "studium",
              "raeume",
              "gruppen",
              "telefon_nebenstellen",
            ],
          );
        } else {
          return decoded;
        }
      },
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );

    this.dio = dio;
  }

  RESTClient.mobileCache(Directory directory) {
    hiveCacheStore = HiveCacheStore(directory.path);

    /// cache duration is 30 days for offline mode
    var cacheOptions = CacheOptions(
      store: hiveCacheStore,
      policy: CachePolicy.forceCache,
      maxStale: const Duration(days: 30),
      hitCacheOnErrorExcept: [401, 404],
    );

    /// add custom cache interceptor to dio
    final dio = Dio()
      ..interceptors.add(
        CustomCacheInterceptor(
          cacheStore: hiveCacheStore,
          cacheOptions: cacheOptions,
        ),
      );

    /// convert xml to json first - needs to happen here to
    /// avoid conversion everytime it's loaded out of cache
    dio.options = BaseOptions(
      responseDecoder: (data, options, body) {
        final decoded = utf8.decoder.convert(data);
        if (body.headers["content-type"]?.first.contains("xml") ?? false) {
          final transformer = Xml2Json();
          transformer.parse(decoded);
          return transformer.toParkerWithAttrsCustom(
            array: [
              "row",
              "event",
              "studium",
              "raeume",
              "gruppen",
              "telefon_nebenstellen",
            ],
          );
        } else {
          return decoded;
        }
      },
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
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
    Response<String> response;

    /// add forcedRefresh flag to temporary options
    if (forcedRefresh) {
      Dio noCacheDio = Dio()..interceptors.addAll(dio.interceptors);
      noCacheDio.options.responseDecoder = dio.options.responseDecoder;
      noCacheDio.options.extra["forcedRefresh"] = "true";
      response = await endpoint.get(dioClient: noCacheDio);
    } else {
      response = await endpoint.get(dioClient: dio);
    }

    log("${response.statusCode}: ${response.realUri}");
    try {
      /// check if response is error message by  attempting to decoding it
      throw ApiResponse<U>.fromJson(
        jsonDecode(response.data.toString()),
        response.headers,
        createError,
      ).data;
    } on U catch (e) {
      /// rethrow error if specified error U
      log(e.toString());
      rethrow;
    } catch (_) {
      /// catch possible decoding error and return actual expected object
      try {
        return ApiResponse<T>.fromJson(
          jsonDecode(response.data.toString()),
          response.headers,
          createObject,
        );
      } catch (e) {
        if (e is Error) {
          log(e.stackTrace.toString());
        } else {
          log(e.toString());
        }
        rethrow;
      }
    }
  }

  Future<ApiResponse<T>>
      postWithException<T, S extends Api, U extends ApiException>(
    S endpoint,
    dynamic Function(Map<String, dynamic>) createObject,
    dynamic Function(Map<String, dynamic>) createError,
  ) async {
    Response<String> response;

    /// add forcedRefresh flag to temporary options
    response = await endpoint.post(dioClient: dio);

    log("${response.statusCode}: ${response.realUri}");
    try {
      /// check if response is error message by  attempting to decoding it
      throw ApiResponse<U>.fromJson(
        jsonDecode(response.data.toString()),
        response.headers,
        createError,
      ).data;
    } on U catch (e) {
      /// rethrow error if specified error U
      log(e.toString());
      rethrow;
    } catch (_) {
      /// catch possible decoding error and return actual expected object
      try {
        return ApiResponse<T>.fromJson(
          jsonDecode(response.data.toString()),
          response.headers,
          createObject,
        );
      } catch (e) {
        if (e is Error) {
          log(e.stackTrace.toString());
        } else {
          log(e.toString());
        }
        rethrow;
      }
    }
  }

  /// without possible error in response body
  Future<ApiResponse<T>> get<T, S extends Api>(
    S endpoint,
    dynamic Function(Map<String, dynamic>) createObject,
    bool forcedRefresh,
  ) async {
    Response<String> response;

    try {
      if (forcedRefresh) {
        Dio noCacheDio = Dio()..interceptors.addAll(dio.interceptors);
        noCacheDio.options.responseDecoder = dio.options.responseDecoder;
        noCacheDio.options.extra["forcedRefresh"] = "true";
        response = await endpoint.get(dioClient: noCacheDio);
      } else {
        response = await endpoint.get(dioClient: dio);
      }

      log("${response.statusCode}: ${response.realUri}");

      return ApiResponse<T>.fromJson(
        jsonDecode(response.data.toString()),
        response.headers,
        createObject,
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

  clearCache() async {
    if (kIsWeb) {
      memCacheStore.clean();
    } else {
      hiveCacheStore.clean();
    }
  }
}
