import 'dart:async';
import 'dart:io';

import 'package:campus_flutter/base/networking/apis/tumdev/cache_interceptor.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:hive/hive.dart';

class CachedCampusClient extends CampusClient {
  static Future<CachedCampusClient> createWebCache() async {
    return CachedCampusClient._webCache();
  }

  static Future<CachedCampusClient> createMobileCache(
      Directory directory) async {
    await Hive.openBox('grpc_cache', path: directory.path);
    return CachedCampusClient._mobileCache(directory);
  }

  CachedCampusClient._webCache()
      : super(_channel(),
            options: _callOptions(),
            interceptors: [CacheInterceptor.webCache()]);

  CachedCampusClient._mobileCache(Directory directory)
      : super(_channel(),
            options: _callOptions(),
            interceptors: [CacheInterceptor.mobileCache(directory)]);

  void invalidateCache() {
    // TODO: implement
  }

  static CallOptions _callOptions() {
    return CallOptions(metadata: {
      "x-app-version": "unknown",
      "x-app-build": "unknown",
      "x-device-id": "unknown",
      "x-os-version": "unknown",
    });
  }

  static GrpcOrGrpcWebClientChannel _channel() {
    return GrpcOrGrpcWebClientChannel.toSeparateEndpoints(
        grpcHost: "api.tum.app",
        grpcPort: 443,
        grpcTransportSecure: true,
        grpcWebHost: "api-grpc.tum.app",
        grpcWebPort: 443,
        grpcWebTransportSecure: true);
  }
}
