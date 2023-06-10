import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:campus_flutter/base/networking/errors/noConnectionError.dart';
import 'package:campus_flutter/base/networking/errors/responseError.dart';
import 'package:campus_flutter/base/networking/protocols/apiError.dart';
import 'package:campus_flutter/base/networking/protocols/apiResponse.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';

class MainApi {

  late Dio dio;

  MainApi(Directory directory) {
    final cacheStore = HiveCacheStore(directory.path);

    /// cache duration is 30 days for offline mode
    var cacheOptions = CacheOptions(
      store: cacheStore,
      policy: CachePolicy.request,
      maxStale: const Duration(days: 30)
    );

    final dio = Dio();

    /// add custom interceptor to enforce cache for at least 10 minutes
    /// the custom interceptor also invalidates caches for force refreshes
    // TODO: maybe move connectivity check to app startup and use get
    dio.interceptors.add(
        InterceptorsWrapper(onRequest: (options, handler) async {
          final connectivityStatus = await Connectivity().checkConnectivity();
          if (connectivityStatus != ConnectivityResult.none
              && connectivityStatus != ConnectivityResult.bluetooth) {
            final key = CacheOptions.defaultCacheKeyBuilder(options);
            final cache = await cacheStore.get(key);
            if (cache != null && DateTime.now().difference(cache.responseDate).inMinutes < 10) {
              return handler.resolve(cache.toResponse(options, fromNetwork: false));
            }
          } else if (options.extra.isNotEmpty) {
            final key = CacheOptions.defaultCacheKeyBuilder(options);
            cacheStore.delete(key);
          }
          handler.next(options);
        })
    );

    dio.interceptors.add(
      DioCacheInterceptor(options: cacheOptions),
    );

    this.dio = dio;
  }

  Future<ApiResponse<T>> makeRequest<T, S extends Api, U extends ApiError>(
          S endpoint,
          dynamic Function(Map<String, dynamic>) createObject,
          dynamic Function(Map<String, dynamic>) createError,
          bool forcedRefresh) async {

    Response<String> response;

    try {
      if (forcedRefresh) {
        final tempDio = dio;
        tempDio.options.extra["forceRefresh"] = true;
        response = await endpoint.asResponse(dio: dio);
      } else {
        response = await endpoint.asResponse(dio: dio);
      }
    } catch (e) {
      print(e);
      throw NoConnectionError();
    }

    if (response.statusCode != 200 && response.statusCode != 304) {
      throw ResponseError();
    } else {
      log("${response.statusCode}: ${response.realUri}");
      try {
        /// check if response is error message by  attempting to decoding it
        throw ApiResponse<U>.fromJson(
            jsonDecode(response.data.toString()),
            response.headers,
            createError
        ).data;
      } on U catch (e) {
        e.toString();
        /// rethrow error if specified error U
        rethrow;
      } catch (_) {
        /// catch possible decoding error and return actual expected object
        return ApiResponse<T>.fromJson(
            jsonDecode(response.data.toString()),
            response.headers,
            createObject
        );
      }
    }
  }
}
