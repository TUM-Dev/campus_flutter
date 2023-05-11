import 'package:campus_flutter/base/networking/protocols/apiError.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';

class EatAPI extends API {

  final EatAPIServices eatAPIServices;
  final String? location;
  final int? year;
  final int? week;

  EatAPI(this.eatAPIServices, this.location, this.year, this.week);

  @override
  String get baseURL => "tum-dev.github.io";

  @override
  String get path => "/eat-api/";

  @override
  List<String> get baseHeaders => [];

  @override
  // TODO: implement error
  APIError get error => throw UnimplementedError();

  @override
  String get paths {
    switch (eatAPIServices) {
      case EatAPIServices.canteens:
        return "${path}enums/canteens.json";
      case EatAPIServices.languages:
        return "${path}enums/languages.json";
      case EatAPIServices.labels:
        return "${path}enums/labels.json";
      case EatAPIServices.all:
        return "${path}all.json";
      case EatAPIServices.allRef:
        return "${path}all_ref.json";
      case EatAPIServices.menu:
        return "$path$location/$year/${week.toString().padLeft(1, "0")}.json";
    }
  }

  @override
  Map<String, String> get parameters => {};

  @override
  bool get needsAuth => false;
}

enum EatAPIServices {
  canteens,
  languages,
  labels,
  all,
  allRef,
  menu;
}