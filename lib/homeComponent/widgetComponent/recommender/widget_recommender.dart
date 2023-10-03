import 'dart:collection';

import 'package:campus_flutter/base/enums/home_widget.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/recommender/widget_recommender_strategy.dart';
import 'package:campus_flutter/loginComponent/viewModels/login_viewmodel.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WidgetRecommender {
  final WidgetRecommenderStrategy _strategy;

  WidgetRecommender(this._strategy);

  Future<Map<HomeWidget, int>> fetchRecommendations(WidgetRef ref) async {
    final recommendations = await _strategy.getRecommendations();

    /// sort by ascending priority
    LinkedHashMap<HomeWidget, int> sortedRecommendations =
        LinkedHashMap<HomeWidget, int>.fromEntries(
            recommendations.entries.toList()
              ..sort((a, b) => b.value.compareTo(a.value)));

    if (ref.read(loginViewModel).credentials.value != Credentials.tumId) {
      sortedRecommendations.remove(HomeWidget.calendar);
    }

    return sortedRecommendations;
  }
}
