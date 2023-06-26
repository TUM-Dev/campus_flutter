import 'package:campus_flutter/base/enums/homeWidget.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
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
    
    Map<HomeWidget, int> recommendations = Map.fromIterable(HomeWidget.values, key: (homeWidget) => homeWidget, value: (homeWidget) {
      if (timeRecommendations[homeWidget] != 0) {
        return (timeRecommendations[homeWidget] ?? 0) + (locationRecommendations[homeWidget] ?? 0);
      } else {
        return 0;
      }
    });

    if (Api.tumToken.isEmpty) {
      recommendations.remove(HomeWidget.calendar);
    }

    /// remove all where priority is 0
    recommendations.removeWhere((key, value) => value <= 1);

    return recommendations;
  }
}
