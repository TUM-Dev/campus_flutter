import 'package:campus_flutter/base/enums/home_widget.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/recommender/spatial_temporal_strategy.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/recommender/widget_recommender.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

class RecommenderViewModel {
  BehaviorSubject<Map<HomeWidget, int>?> recommendations =
      BehaviorSubject.seeded(null);

  final Ref ref;

  RecommenderViewModel(this.ref);

  getRecommendations() {
    return WidgetRecommender(SpatialTemporalStrategy())
        .fetchRecommendations(ref)
        .then((value) => recommendations.add(value),
            onError: (error) => recommendations.addError(error));
  }
}
