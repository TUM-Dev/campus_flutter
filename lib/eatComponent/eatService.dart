import 'package:campus_flutter/eatComponent/model/mensaMenu.dart';
import 'package:campus_flutter/base/extensions/dateTime+weekNumber.dart';
import '../base/networking/protocols/mainApi.dart';
import '../base/networking/apis/eatAPI.dart';
import 'model/mealPlan.dart';

class EatService {
  static Future<MealPlan> fetchFood() async {
    // TODO: location based
    final currentDate = DateTime.now();
    return await MainAPI.makeRequest<MealPlan, EatAPI>(
        EatAPI(EatAPIServices.menu, "mensa-arcisstr", currentDate.year,
            currentDate.weekNumber()),
        MealPlan.fromJson,
        null,
        false);
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
