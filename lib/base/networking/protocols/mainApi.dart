import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:campus_flutter/base/networking/custom_cache_interceptor.dart';
import 'package:campus_flutter/base/networking/errors/noConnectionError.dart';
import 'package:campus_flutter/base/networking/errors/responseError.dart';
import 'package:campus_flutter/base/networking/protocols/apiError.dart';
import 'package:campus_flutter/base/networking/protocols/apiResponse.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
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
        policy: CachePolicy.forceCache,
        maxStale: const Duration(days: 30),
        hitCacheOnErrorExcept: [401, 404]
    );

    final dio = Dio()
      ..interceptors
          .add(CustomCacheInterceptor(cacheStore: cacheStore, cacheOptions: cacheOptions));
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
        Dio noCacheDio = Dio()..interceptors.addAll(dio.interceptors);
        noCacheDio.options.extra["forcedRefresh"] = "true";
        response = await endpoint.asResponse(dioClient: noCacheDio);
      } else {
        response = await endpoint.asResponse(dioClient: dio);
      }
    } catch (e) {
      log(endpoint.toString());
      log(e.toString());
      throw NoConnectionError();
    }

    if (response.statusCode != 200 && response.statusCode != 304) {
      throw ResponseError();
    } else {
      log("${response.statusCode}: ${response.realUri}");
      try {
        /// check if response is error message by  attempting to decoding it
        throw ApiResponse<U>.fromJson(
                jsonDecode(response.data.toString()), response.headers, createError)
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
  }
}
