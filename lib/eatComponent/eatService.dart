

class EatService {
  /*static Future<MealPlan> fetchFood() async {
    // TODO: location based
    final response = await MainApi.makeRequest<MealPlan, EatApi>(
        EatApi(EatApiServiceMenu(location: "mensa-arcisstr")),
        MealPlan.fromJson,
        null,
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
  }*/
}
