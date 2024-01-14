import 'package:campus_flutter/base/enums/home_widget.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/recommender/location_strategy.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/recommender/time_strategy.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/recommender/widget_recommender_strategy.dart';

class SpatialTemporalStrategy implements WidgetRecommenderStrategy {
  @override
  Future<Map<HomeWidget, int>> getRecommendations() async {
    final timeStrategy = TimeStrategy();
    final locationStrategy = LocationStrategy();

    final timeRecommendations = await timeStrategy.getRecommendations();
    final locationRecommendations = await locationStrategy.getRecommendations();

    Map<HomeWidget, int> recommendations = Map.fromIterable(
      HomeWidget.values,
      key: (homeWidget) => homeWidget,
      value: (homeWidget) {
        if (timeRecommendations[homeWidget] != 0 &&
            locationRecommendations[homeWidget] != 0) {
          return (timeRecommendations[homeWidget] ?? 0) +
              (locationRecommendations[homeWidget] ?? 0);
        } else {
          return 0;
        }
      },
    );

    /// remove all where priority is 0
    recommendations.removeWhere((key, value) => value < 1);

    recommendations.remove(HomeWidget.departures);

    return recommendations;
  }
}
