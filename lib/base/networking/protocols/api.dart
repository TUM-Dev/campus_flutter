import 'package:campus_flutter/base/networking/protocols/apiError.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

abstract class API {

  String get baseURL;

  String get path;

  List<String> get baseHeaders;

  APIError get error;

  String get paths;

  Map<String, String> get parameters;

  bool get needsAuth;

 Future<Response<String>> asResponse({String? token}) async {
   late CacheStore cacheStore;

   final directory = await getTemporaryDirectory();

   cacheStore = HiveCacheStore(directory.path);

   var cacheOptions = CacheOptions(
     store: cacheStore,
     maxStale: const Duration(days: 30),
     hitCacheOnErrorExcept: [], // for offline behaviour
   );

   final dio = Dio()
     ..interceptors.add(
       DioCacheInterceptor(options: cacheOptions),
     );

   if (needsAuth) {
     var finalParameters = parameters;
     finalParameters.addAll({"pToken": token ?? ""});
     final uri = Uri.https(baseURL, paths, finalParameters);
     print(uri);
     return dio.getUri(uri);
   } else {
     final uri = Uri.https(baseURL, paths, parameters);
     print(uri);
     return dio.getUri(uri);
   }
 }

  @override
  String toString() {
    return baseURL+paths;
  }
}