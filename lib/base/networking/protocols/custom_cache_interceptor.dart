import 'package:campus_flutter/providers_get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';

class CustomCacheInterceptor implements Interceptor {
  final HiveCacheStore cacheStore;

  final CacheOptions cacheOptions;

  CustomCacheInterceptor(
      {required this.cacheStore, required this.cacheOptions});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    ConnectivityResult connectivityResult = getIt<ConnectivityResult>();
    options.extra[CacheResponse.requestSentDate] = DateTime.now();
    final key = CacheOptions.defaultCacheKeyBuilder(options);

    /// checks if device has a working internet connection
    if (connectivityResult != ConnectivityResult.none &&
        !options.path.contains("tumCard")) {
      /// if forcedRefresh parameter is passed the cache is invalidated
      if (options.extra["forcedRefresh"] == "true") {
        cacheStore.delete(key);
      } else {
        final cache = await cacheStore.get(key);

        /// device is online, fetch every 10 minutes
        if (cache != null &&
            DateTime.now().difference(cache.responseDate).inMinutes <= 10) {
          return handler.resolve(cache.toResponse(options, fromNetwork: false));
        } else {
          /// if older than than 10 minutes -> invalidate cache
          cacheStore.delete(key);
        }
      }
    } else {
      /// if device is online, the cache is valid for 30 days
      final cache = await cacheStore.get(key);
      if (cache != null &&
          DateTime.now().difference(cache.responseDate).inDays <= 30) {
        return handler.resolve(cache.toResponse(options, fromNetwork: false));
      } else {
        cacheStore.delete(key);
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final key = CacheOptions.defaultCacheKeyBuilder(response.requestOptions);
    final cacheResponse = await CacheResponse.fromResponse(
        key: key, options: cacheOptions, response: response);
    await cacheStore.set(
        await cacheResponse.writeContent(cacheOptions, response: response));
    handler.next(response);
  }
}
