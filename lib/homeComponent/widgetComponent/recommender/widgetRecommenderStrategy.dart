import 'package:campus_flutter/base/enums/homeWidget.dart';

abstract interface class WidgetRecommenderStrategy {
  Future<Map<HomeWidget, int>> getRecommendations();
}