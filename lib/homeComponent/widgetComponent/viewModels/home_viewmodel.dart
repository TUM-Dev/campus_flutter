import 'package:campus_flutter/base/enums/home_widget.dart';
import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/enums/widget_type.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/calendarComponent/views/homeWidget/calendar_widget_view.dart';
import 'package:campus_flutter/departuresComponent/views/homeWidget/departures_widget_view.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/movieComponent/views/homeWidget/movies_widget_view.dart';
import 'package:campus_flutter/newsComponent/views/homeWidget/news_widget_view.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/cafeteria_widget_view.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/study_room_widget_view.dart';
import 'package:campus_flutter/settingsComponent/service/user_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final homeViewModel = Provider((ref) => HomeViewModel(ref));

class HomeViewModel {
  late BehaviorSubject<List<HomeWidget>> widgets;

  final Ref ref;

  HomeViewModel(this.ref) {
    final data = getIt<UserPreferencesService>()
            .load(UserPreference.homeWidgets) as List<String>? ??
        <String>[];
    List<HomeWidget> widgets = defaultWidgets;
    final types = data.map((e) => HomeWidget.fromString(e)).toList();
    if (types.isNotEmpty) {
      widgets = types;
    }
    this.widgets = BehaviorSubject.seeded(widgets);
  }

  void toggleWidget(int index, bool value) {
    if (widgets.value.length - 1 >= index) {
      final data = widgets.value;
      final widget = data[index];
      widget.enabled = value;
      data[index] = widget;
      savePreference(data);
      widgets.add(data);
    }
  }

  void reorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final data = widgets.value;
    final HomeWidget item = data.removeAt(oldIndex);
    data.insert(newIndex, item);
    savePreference(data);
    widgets.add(data);
  }

  void savePreference(List<HomeWidget> data) {
    final enabledWidgets = data.map((e) => e.convertToString()).toList();
    getIt<UserPreferencesService>()
        .save(UserPreference.homeWidgets, enabledWidgets);
  }

  List<HomeWidget> getEnabledWidgets() {
    return widgets.value.where((element) => element.enabled).toList();
  }

  bool widgetsEnabled() {
    return widgets.value.where((element) => element.enabled).isNotEmpty;
  }

  static Widget getWidget(WidgetType widgetType) {
    switch (widgetType) {
      case WidgetType.cafeterias:
        return const CafeteriaWidgetView();
      case WidgetType.calendar:
        return const CalendarHomeWidgetView();
      case WidgetType.departures:
        return const DeparturesHomeWidget();
      case WidgetType.studyRooms:
        return const StudyRoomWidgetView.closest();
      case WidgetType.movies:
        return const MoviesHomeWidget();
      case WidgetType.news:
        return const NewsWidgetView();
    }
  }

  static String getTitle(WidgetType widgetType, BuildContext context) {
    switch (widgetType) {
      case WidgetType.cafeterias:
        return context.localizations.cafeteria;
      case WidgetType.calendar:
        return context.localizations.calendar;
      case WidgetType.departures:
        return context.localizations.departures;
      case WidgetType.studyRooms:
        return context.localizations.nearestStudyRooms;
      case WidgetType.movies:
        return context.localizations.movies;
      case WidgetType.news:
        return context.localizations.news;
    }
  }

  static List<HomeWidget> get defaultWidgets => [
        HomeWidget(widgetType: WidgetType.cafeterias),
        HomeWidget(widgetType: WidgetType.calendar),
        HomeWidget(widgetType: WidgetType.departures),
        HomeWidget(widgetType: WidgetType.studyRooms),
        HomeWidget(widgetType: WidgetType.movies),
        HomeWidget(widgetType: WidgetType.news),
      ];

  void reset() {
    widgets.add(defaultWidgets);
    savePreference(defaultWidgets);
  }
}
