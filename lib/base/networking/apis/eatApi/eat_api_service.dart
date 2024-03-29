import 'package:campus_flutter/base/extensions/date_time.dart';

sealed class EatApiService {}

class EatApiServiceCanteens extends EatApiService {}

class EatApiServiceLanguages extends EatApiService {}

class EatApiServiceLabels extends EatApiService {}

class EatApiServiceAll extends EatApiService {}

class EatApiServiceAllRef extends EatApiService {}

class EatApiServiceMenu extends EatApiService {
  final String location;
  final int year;
  final String week;

  EatApiServiceMenu({required this.location, int? year, String? week})
      : year = year ?? DateTime.now().year,
        week = week ?? DateTime.now().weekNumber();
}
