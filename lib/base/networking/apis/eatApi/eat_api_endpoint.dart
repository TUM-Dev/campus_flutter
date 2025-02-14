import 'package:campus_flutter/base/extensions/date_time.dart';

sealed class EatApiEndpoint {}

class EatApiEndpointCanteens extends EatApiEndpoint {}

class EatApiEndpointLanguages extends EatApiEndpoint {}

class EatApiEndpointLabels extends EatApiEndpoint {}

class EatApiEndpointAll extends EatApiEndpoint {}

class EatApiEndpointAllRef extends EatApiEndpoint {}

class EatApiEndpointMenu extends EatApiEndpoint {
  final String location;
  final int year;
  final String week;

  EatApiEndpointMenu({required this.location, int? year, String? week})
    : year = year ?? DateTime.now().year,
      week = week ?? DateTime.now().weekNumber();
}
