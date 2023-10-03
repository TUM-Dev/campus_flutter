import 'package:campus_flutter/base/networking/apis/eatApi/eat_api_service.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';

class EatApi extends Api {
  final EatApiService eatApiService;

  EatApi(this.eatApiService);

  @override
  String get baseURL => "tum-dev.github.io";

  @override
  String get path => "/eat-api/";

  @override
  String get paths {
    switch (eatApiService) {
      case EatApiServiceCanteens _:
        return "${path}enums/canteens.json";
      case EatApiServiceLanguages _:
        return "${path}enums/languages.json";
      case EatApiServiceLabels _:
        return "${path}enums/labels.json";
      case EatApiServiceAll _:
        return "${path}all.json";
      case EatApiServiceAllRef _:
        return "${path}all_ref.json";
      case EatApiServiceMenu menu:
        return "$path${menu.location}/${menu.year}/${menu.week.toString().padLeft(1, "0")}.json";
    }
  }

  @override
  Map<String, String> get parameters => {};

  @override
  bool get needsAuth => false;
}
