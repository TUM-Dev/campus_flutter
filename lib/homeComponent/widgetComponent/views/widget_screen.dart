import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/enums/home_widget.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/calendarComponent/views/homeWidget/calendar_widget_view.dart';
import 'package:campus_flutter/departuresComponent/views/homeWidget/departures_widget_view.dart';
import 'package:campus_flutter/movieComponent/views/homeWidget/movies_widget_view.dart';
import 'package:campus_flutter/newsComponent/views/homeWidget/news_widget_view.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/cafeteria_widget_view.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/study_room_widget_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WidgetScreen extends ConsumerStatefulWidget {
  const WidgetScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends ConsumerState<WidgetScreen> {
  @override
  initState() {
    ref.read(recommenderViewModel).getRecommendations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(recommenderViewModel).recommendations,
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
          } else if (snapshot.hasError) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * 2 / 5,
              child: ErrorHandlingView(
                  error: snapshot.error ?? Error(),
                  errorHandlingViewType: ErrorHandlingViewType.textOnly),
            );
          } else {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * 2 / 5,
              child: const DelayedLoadingIndicator(
                name: "Widgets",
              ),
            );
          }
        });
  }
}
