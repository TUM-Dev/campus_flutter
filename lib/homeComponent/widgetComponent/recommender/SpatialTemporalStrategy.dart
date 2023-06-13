import 'dart:collection';

import 'package:campus_flutter/base/enums/homeWidget.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/recommender/locationStrategy.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/recommender/timeStrategy.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/recommender/widgetRecommenderStrategy.dart';

class SpatialTemporalStrategy implements WidgetRecommenderStrategy {
  @override
  Future<Map<HomeWidget, int>> getRecommendations() async {
    final timeStrategy = TimeStrategy();
    final locationStrategy = LocationStrategy();

    final timeRecommendations = await timeStrategy.getRecommendations();
    final locationRecommendations = await locationStrategy.getRecommendations();

    final recommendations = {
      for (var e in HomeWidget.values)
        e: (timeRecommendations[e] ?? 0) + (locationRecommendations[e] ?? 0)
    };

    /// remove all where priority is 0
    recommendations.removeWhere((key, value) => value <= 1);

    return recommendations;
  }
}
