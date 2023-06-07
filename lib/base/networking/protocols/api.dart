import 'dart:convert';

import 'package:campus_flutter/base/networking/protocols/apiError.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xml2json/xml2json.dart';

abstract class Api {
  String get baseURL;

  String get path;

  Map<String, String> get baseHeaders;

  ApiError get error;

  String get paths;

  Map<String, String> get parameters;

  bool get needsAuth;

  Future<Response<String>> asResponse({String? token}) async {
    // TODO: move this to mainAPI?
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

    if (needsAuth) {
      var finalParameters = parameters;
      finalParameters.addAll({"pToken": token ?? ""});
      final uri = Uri.https(baseURL, paths, finalParameters);
      print(uri);
      return dio.getUri(uri, options: _customDecodingOptions(baseHeaders));
    } else {
      final uri = Uri.https(baseURL, paths, parameters);
      print(uri);
      return dio.getUri(uri, options: _customDecodingOptions(baseHeaders));
    }
  }

  Options _customDecodingOptions(Map<String, String> headers) {
    return Options(responseDecoder: (data, options, body) {
      final decoded = utf8.decoder.convert(data);
      if (body.headers["content-type"]?.first.contains("json") ?? false) {
        return decoded;
      } else {
        try {
          final transformer = Xml2Json();
          transformer.parse(decoded);
          return transformer.toParker();
        } catch (error) {
          print(error);
          return "";
        }
      }
    }, headers: headers);
  }

  @override
  String toString() {
    return baseURL + paths;
  }
}
