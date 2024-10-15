import 'package:campus_flutter/base/networking/apis/eatApi/eat_api_endpoint.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';

class EatApi extends Api {
  final EatApiEndpoint eatApiEndpoint;

  EatApi(this.eatApiEndpoint);

  @override
  String get domain => "tum-dev.github.io";

  @override
  String get slug => "/eat-api/";

  @override
  String get path {
    switch (eatApiEndpoint) {
      case EatApiEndpointCanteens _:
        return "${slug}enums/canteens.json";
      case EatApiEndpointLanguages _:
        return "${slug}enums/languages.json";
      case EatApiEndpointLabels _:
        return "${slug}enums/labels.json";
      case EatApiEndpointAll _:
        return "${slug}all.json";
      case EatApiEndpointAllRef _:
        return "${slug}all_ref.json";
      case EatApiEndpointMenu menu:
        return "$slug${menu.location}/${menu.year}/${menu.week.toString().padLeft(1, "0")}.json";
    }
  }

  @override
  Map<String, String> get parameters => {};

  @override
  bool get needsAuth => false;
}
