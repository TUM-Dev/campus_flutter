import 'dart:async';
import 'dart:io';

import 'package:campus_flutter/base/networking/cache/grpc_cache_interceptor.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:isar/isar.dart';
import 'package:package_info_plus/package_info_plus.dart';

class GrpcClient extends CampusClient {
  static Future<GrpcClient> createGrpcClient(Isar isar) async {
    return GrpcClient(isar, await _callOptions());
  }

  GrpcClient(Isar isar, CallOptions callOptions)
      : super(
          _channel(),
          options: callOptions,
          interceptors: [GrpcCacheInterceptor(isar)],
        );

  static Future<CallOptions> _callOptions() async {
    final packageInfo = await PackageInfo.fromPlatform();
    String osVersion = "unknown";
    String deviceId = "unknown";
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      osVersion = "${iosInfo.systemName} ${iosInfo.systemVersion}";
      deviceId = iosInfo.identifierForVendor ?? "unknown";
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      osVersion = androidInfo.version.toString();
      deviceId = androidInfo.serialNumber;
    } else if (Platform.isMacOS) {
      MacOsDeviceInfo macInfo = await deviceInfo.macOsInfo;
      osVersion = macInfo.osRelease;
      deviceId = macInfo.model;
    }
    return CallOptions(
      metadata: {
        "x-app-version": packageInfo.packageName,
        "x-app-build": packageInfo.version,
        "x-device-id": deviceId,
        "x-os-version": osVersion,
      },
      timeout: const Duration(seconds: 10),
    );
  }

  static GrpcOrGrpcWebClientChannel _channel() {
    return GrpcOrGrpcWebClientChannel.toSeparateEndpoints(
      grpcHost: "api.tum.app",
      grpcPort: 443,
      grpcTransportSecure: true,
      grpcWebHost: "api-grpc.tum.app",
      grpcWebPort: 443,
      grpcWebTransportSecure: true,
    );
  }
}
