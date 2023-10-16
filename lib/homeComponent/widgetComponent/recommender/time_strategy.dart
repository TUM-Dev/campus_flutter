import 'package:campus_flutter/base/enums/home_widget.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/recommender/widget_recommender_strategy.dart';

class TimeStrategy implements WidgetRecommenderStrategy {
  @override
  Future<Map<HomeWidget, int>> getRecommendations() {
    return Future(() => {for (var e in HomeWidget.values) e: _priority(e)});
  }

  int _priority(HomeWidget homeWidget) {
    int priority = 1;

    final currentDate = DateTime.now();

    switch (homeWidget) {
      case HomeWidget.cafeteria:
        // There is no menu on weekends.
        if (currentDate.weekday == 6 || currentDate.weekday == 7) {
          priority = 0;
          break;
        }

        /* Cafeteria opening hours. */
        // The menu is not interesting anymore after the cafeteria has closed.
        if (14 <= currentDate.hour) {
          priority = 0;
          break;
        }

        // The menu might be interesting before the opening hours.
        if (currentDate.hour < 14 && 6 < currentDate.hour) {
          priority += 1;
        }

        // TODO: useful?
        if (currentDate.hour >= 10 && currentDate.hour <= 12) {
          priority += 1;
        }

        // Bonus points during the opening hours.
        if (currentDate.hour >= 11 && currentDate.hour <= 13) {
          priority += 1;
        }

      case HomeWidget.studyRoom:
        if ([9, 10, 11, 14, 15, 16, 17].contains(currentDate.hour)) {
          priority += 2;
        }

        // Bonus points if we are at the end of the semester (exams).
        if ((currentDate.month == 7 && currentDate.day >= 15) ||
            [2, 3, 8].contains(currentDate.month)) {
          priority += 1;
        }

      case HomeWidget.calendar:
        // The calendar is most interesting during the semester.
        if ((currentDate.month == 4 && currentDate.day >= 15) ||
            [5, 6, 7].contains(currentDate.month) ||
            [10, 11, 12, 1].contains(currentDate.month) ||
            (currentDate.month == 2 && currentDate.day <= 15)) {
          priority += 1;
        }

      case HomeWidget.departures:
        // departures are always interesting
        priority += 1;

        // bonus if during workdays
        if (currentDate.weekday != 1 && currentDate.weekday != 7) {
          priority += 1;
        }

        // bonus if during workhours
        if (currentDate.hour >= 9 && currentDate.hour <= 20) {
          priority += 1;
        }
    }

    return priority;
  }
}
