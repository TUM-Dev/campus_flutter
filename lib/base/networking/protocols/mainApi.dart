import 'dart:convert';
import 'dart:developer';

import 'package:campus_flutter/base/networking/protocols/apiError.dart';
import 'package:campus_flutter/base/networking/protocols/apiResponse.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:dio/dio.dart';

class MainApi {
  /*static Future<Dio> get dio async {
    late CacheStore cacheStore;

    final directory = await getTemporaryDirectory();

    cacheStore = HiveCacheStore(directory.path);

    var cacheOptions = CacheOptions(
      //store: BackupCacheStore(primary: MemCacheStore(), secondary: cacheStore),
      store: cacheStore,
      policy: CachePolicy.forceCache,
      maxStale: const Duration(days: 30),
      hitCacheOnErrorExcept: [], // for offline behaviour
    );

    final dio = Dio();

    dio.interceptors.add(
      DioCacheInterceptor(options: cacheOptions),
    );

    return dio;
  }*/

  static Future<T> makeRequest<T extends Serializable, S extends Api/*, U extends ApiError*/>(
          S endpoint,
          dynamic Function(Map<String, dynamic>) createObject,
          //dynamic Function(Map<String, dynamic>) createError,
          String? token,
          bool forcedRefresh) async {

    Response<String> response;

    try {
      response = await endpoint.asResponse(token: token);
    } catch (e) {
      log(e.toString());
      // TODO: networking Error
      throw Exception();
    }

    if (response.statusCode != 200 && response.statusCode != 304) {
      //// TODO: response Error
      throw Exception();
    } else {
      log("${response.statusCode}: ${response.realUri}");
      try {
        /// check if response is error message by decoding it
        /*return ApiResponse<T>
            .fromJson(jsonDecode(response.data.toString()), createError)
            .data;*/
        throw Error();
      } catch (_) {
        /// if it's not, decode response to expected object
        return ApiResponse<T>
            .fromJson(jsonDecode(response.data.toString()), createObject)
            .data;
      }
    }
  }
}
