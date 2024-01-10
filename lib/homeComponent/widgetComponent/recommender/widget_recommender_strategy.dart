import 'package:campus_flutter/base/enums/home_widget.dart';

abstract interface class WidgetRecommenderStrategy {
  Future<Map<HomeWidget, int>> getRecommendations();
}
