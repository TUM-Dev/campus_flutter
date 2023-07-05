import 'dart:collection';

import 'package:campus_flutter/base/enums/home_widget.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/recommender/widget_recommender_strategy.dart';

class WidgetRecommender {
  final WidgetRecommenderStrategy _strategy;

  WidgetRecommender(this._strategy);

  Future<Map<HomeWidget, int>> fetchRecommendations() async {
    final recommendations = await _strategy.getRecommendations();
    /// sort by ascending priority
    LinkedHashMap<HomeWidget, int> sortedRecommendations = LinkedHashMap<HomeWidget, int>.fromEntries(
        recommendations.entries.toList()..sort((a, b) => b.value.compareTo(a.value))
    );

    return sortedRecommendations;
  }
}