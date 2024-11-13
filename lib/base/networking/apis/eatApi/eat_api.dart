import 'package:campus_flutter/base/networking/apis/eatApi/eat_api_endpoint.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';

class EatApi extends Api {
  final EatApiEndpoint eatApiEndpoint;

  EatApi(this.eatApiEndpoint);

  @override
  String get domain => "tum-dev.github.io";

  @override
  String get path => "eat-api/";

  @override
  String get slug {
    switch (eatApiEndpoint) {
      case EatApiEndpointCanteens _:
        return "enums/canteens.json";
      case EatApiEndpointLanguages _:
        return "enums/languages.json";
      case EatApiEndpointLabels _:
        return "enums/labels.json";
      case EatApiEndpointAll _:
        return "all.json";
      case EatApiEndpointAllRef _:
        return "all_ref.json";
      case EatApiEndpointMenu menu:
        return "${menu.location}/${menu.year}/${menu.week.toString().padLeft(1, "0")}.json";
    }
  }

  @override
  Map<String, String> get parameters => {};

  @override
  bool get needsAuth => false;
}
