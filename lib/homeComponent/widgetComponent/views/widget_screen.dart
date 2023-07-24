import 'package:campus_flutter/base/enums/home_widget.dart';
import 'package:campus_flutter/calendarComponent/views/homeWidget/calendar_widget_view.dart';
import 'package:campus_flutter/departuresComponent/views/homeWidget/departures_widget_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/recommender/spatial_temporal_strategy.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/recommender/widget_recommender.dart';
import 'package:campus_flutter/movieComponent/views/homeWidget/movies_widget_view.dart';
import 'package:campus_flutter/newsComponent/views/homeWidget/news_widget_view.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/cafeteria_widget_view.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/study_room_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WidgetScreen extends ConsumerStatefulWidget {
  const WidgetScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends ConsumerState<WidgetScreen> {
  late Future<Map<HomeWidget, int>> recommendations;

  @override
  initState() {
    super.initState();
    recommendations =
        WidgetRecommender(SpatialTemporalStrategy()).fetchRecommendations(ref);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: recommendations,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                for (var recommendation in snapshot.data!.entries)
                  Builder(
                    builder: (context) {
                      switch (recommendation.key) {
                        case HomeWidget.cafeteria:
                          return const CafeteriaWidgetView();
                        case HomeWidget.calendar:
                          return const CalendarHomeWidgetView();
                        case HomeWidget.departures:
                          return const DeparturesHomeWidget();
                        case HomeWidget.studyRoom:
                          return const StudyRoomWidgetView.closest();
                        case HomeWidget.movies:
                          return const MoviesHomeWidget();
                        default:
                          return const SizedBox.shrink();
                      }
                    },
                  ),
                const NewsWidgetView()
              ],
            );
          } else {
            // TODO: error handling
            if (snapshot.hasError) {}
            return const SizedBox.shrink();
          }
        });
  }
}
