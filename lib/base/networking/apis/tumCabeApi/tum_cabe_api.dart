import 'package:campus_flutter/base/networking/apis/tumCabeApi/tum_cabe_api_service.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class TumCabeApi extends Api {
  final TumCabeApiService tumCabeApiService;

  TumCabeApi({required this.tumCabeApiService});

  @override
  String get baseURL => kIsWeb ? "tum-proxy.resch.io" : "api.tum.app";

  @override
  Map<String, String> get baseHeaders {
    return {
      "x-app-version": "not available",
      "x-app-build": "not available",
      "x-device-id": "not available",
      "x-os-version": "not available"
    };
  }

  @override
  String get path => "/v1/";

  @override
  bool get needsAuth => false;

  @override
  String get paths {
    switch (tumCabeApiService) {
      case TumCabeApiServiceMovie _:
        return "${path}movies/-1";
      case TumCabeApiServiceCafeteria _:
        return "$path/canteen/allCanteens";
      case TumCabeApiServiceNews _:
        return "${path}news/-1";
      case TumCabeApiServiceNewsSources _:
        return "${path}news/sources";
      case TumCabeApiServiceNewsAlert _:
        return "${path}news/alerts";
      case TumCabeApiServiceFeedback _:
        return "${path}feedback";
    }
  }

  @override
  Map<String, String> get parameters => tumCabeApiService.getParameters();
}
