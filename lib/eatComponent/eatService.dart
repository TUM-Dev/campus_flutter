import 'package:campus_flutter/base/networking/apis/eatApi/eatApi.dart';
import 'package:campus_flutter/base/networking/apis/eatApi/eatApiError.dart';
import 'package:campus_flutter/base/networking/apis/eatApi/eatApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/eatComponent/model/mealPlan.dart';
import 'package:campus_flutter/eatComponent/model/mensaMenu.dart';
import 'package:get/get.dart';

class EatService {
  static Future<MealPlan> fetchFood() async {
    // TODO: location based
    MainApi mainApi = Get.find();
    final response = await mainApi.makeRequest<MealPlan, EatApi, EatApiError>(
        EatApi(EatApiServiceMenu(location: "mensa-arcisstr")),
        MealPlan.fromJson,
        EatApiError.fromJson,
        false
    );

    return response.data;
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
