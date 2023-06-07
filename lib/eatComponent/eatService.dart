import 'package:campus_flutter/base/networking/apis/eatApi/eatApi.dart';
import 'package:campus_flutter/base/networking/apis/eatApi/eatApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/eatComponent/model/mensaMenu.dart';

import 'model/mealPlan.dart';

class EatService {
  static Future<MealPlan> fetchFood() async {
    // TODO: location based
    return await MainApi.makeRequest<MealPlan, EatApi>(
        EatApi(EatApiServiceMenu(location: "mensa-arcisstr")),
        MealPlan.fromJson,
        null,
        false
    );
  }

  static Future<MensaMenu> fetchTodayFood() async {
    final mealPlan = await fetchFood();
    final today = DateTime.now();

    if (today.weekday == 6 || today.weekday == 7) {
      throw Exception("no mensa today");
    }

    return mealPlan.days
        .firstWhere((element) => element.date.weekday == today.weekday);
  }
}
