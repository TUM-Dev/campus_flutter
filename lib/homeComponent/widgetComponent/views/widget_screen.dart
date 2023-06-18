import 'package:campus_flutter/base/enums/homeWidget.dart';
import 'package:campus_flutter/calendarComponent/views/homeWidget/calendarHomeWidgetView.dart';
import 'package:campus_flutter/departuresComponent/views/homeWidget/departuresHomeWidget.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/recommender/SpatialTemporalStrategy.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/recommender/widgetRecommender.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/movieComponent/views/homeWidget/moviesHomeWidgetView.dart';
import 'package:campus_flutter/newsComponent/views/homeWidget/newsWidgetView.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/cafeteria_widget_view.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/studyroom_widget_view.dart';
import 'package:flutter/material.dart';

class WidgetScreen extends StatefulWidget {
  const WidgetScreen({super.key});

  @override
  State<StatefulWidget> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  late Future<Map<HomeWidget, int>> recommendations;

  @override
  initState() {
    super.initState();
    recommendations = WidgetRecommender(SpatialTemporalStrategy()).fetchRecommendations();
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
                          return const WidgetFrameView(
                              title: "Calendar",
                              child: CalendarHomeWidgetView());
                        case HomeWidget.departures:
                          return const DeparturesHomeWidget();
                        case HomeWidget.studyRoom:
                          return const WidgetFrameView(
                              title: "Nearest Study Room",
                              child: StudyRoomWidgetView());
                        default:
                          return const SizedBox.shrink();
                      }
                    },
                  ),
                const MoviesHomeWidget(),
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
