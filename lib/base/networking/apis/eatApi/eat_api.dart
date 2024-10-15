import 'package:campus_flutter/base/networking/apis/eatApi/eat_api_endpoint.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';

class EatApi extends Api {
  final EatApiEndpoint eatApiEndpoint;

  EatApi(this.eatApiEndpoint);

  @override
  String get baseURL => "tum-dev.github.io";

  @override
  String get path => "/eat-api/";

  @override
  String get paths {
    switch (eatApiEndpoint) {
      case EatApiEndpointCanteens _:
        return "${path}enums/canteens.json";
      case EatApiEndpointLanguages _:
        return "${path}enums/languages.json";
      case EatApiEndpointLabels _:
        return "${path}enums/labels.json";
      case EatApiEndpointAll _:
        return "${path}all.json";
      case EatApiEndpointAllRef _:
        return "${path}all_ref.json";
      case EatApiEndpointMenu menu:
        return "$path${menu.location}/${menu.year}/${menu.week.toString().padLeft(1, "0")}.json";
    }
  }

  @override
  Map<String, String> get parameters => {};

  @override
  bool get needsAuth => false;
}
