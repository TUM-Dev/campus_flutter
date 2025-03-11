import 'dart:convert';

import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_preference_service.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/base/services/user_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';
import 'package:rxdart/rxdart.dart';

final calendarViewModel = Provider((ref) => CalendarViewModel());

class CalendarViewModel {
  final BehaviorSubject<List<CalendarEvent>?> events = BehaviorSubject.seeded(
    null,
  );
  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);
  final BehaviorSubject<(List<CalendarEvent>, List<CalendarEvent>)?>
  widgetEvents = BehaviorSubject.seeded(null);

  Future fetch(bool forcedRefresh) async {
    CalendarService.fetchCalendar(forcedRefresh).then((response) {
      lastFetched.add(response.$1);
      response.$2.removeWhere((element) => element.isCanceled);
      getIt<CalendarPreferenceService>().loadPreferences();
      for (var element in response.$2) {
        final eventColor = getIt<CalendarPreferenceService>()
            .getColorPreference(element.lvNr ?? element.id);
        if (eventColor != null) {
          element.setColor(eventColor);
        }

        final eventVisibility = getIt<CalendarPreferenceService>()
            .getVisibilityPreference(element.lvNr ?? element.id);
        if (eventVisibility != null) {
          element.isVisible = eventVisibility;
        }
      }
      events.add(response.$2);
      updateHomeWidget(response.$2);
    }, onError: (error) => events.addError(error));
  }

  Future<void> updateHomeWidget(List<CalendarEvent> calendarEvents) async {
    await HomeWidget.saveWidgetData(
      "calendar",
      jsonEncode(
        calendarEvents
            .where(
              (element) =>
                  (element.isVisible ?? true) &&
                  element.endDate.isAfter(DateTime.now()),
            )
            .toList(),
      ),
    );
    await HomeWidget.saveWidgetData(
      "calendar_save",
      DateTime.now().toIso8601String(),
    );
    await HomeWidget.updateWidget(
      iOSName: "CalendarWidget",
      androidName: "widgets.calendar.CalendarWidgetProvider",
    );
  }

  (CalendarEvent?, List<CalendarEvent>) getWidgetEvents() {
    CalendarEvent? leftColumn;
    List<CalendarEvent> rightColumn = [];

    final filteredEvents =
        events.value
            ?.where(
              (element) =>
                  element.startDate.isAfter(DateTime.now()) &&
                  (element.isVisible ?? true),
            )
            .toList() ??
        [];
    filteredEvents.sort((a, b) => a.startDate.compareTo(b.startDate));
    final currentDate = DateTime.now();
    final currentDay = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
    );

    for (CalendarEvent event in filteredEvents) {
      final dateToCheck = DateTime(
        event.startDate.year,
        event.startDate.month,
        event.startDate.day,
      );
      if (dateToCheck == currentDay && leftColumn == null) {
        leftColumn = event;
      } else if (rightColumn.length < 2 &&
          (rightColumn.firstOrNull == null ||
              rightColumn.first.startDate.isBefore(event.startDate))) {
        rightColumn.add(event);
      } else {
        continue;
      }
    }

    return (leftColumn, rightColumn);
  }

  Future<void> deleteCalendarElement(String id) async {
    await CalendarService.deleteCalendarEvent(id).then((value) => fetch(true));
  }

  void setEventColor(String key, Color color) {
    getIt<CalendarPreferenceService>().saveColorPreference(key, color);
    final elements = events.value;
    elements?.forEach((element) {
      if (element.lvNr == key || element.id == key) {
        element.setColor(color);
      }
    });
    events.add(elements);
    updateHomeWidget(events.value ?? []);
  }

  void toggleEventVisibility(String key) {
    var preference = getIt<CalendarPreferenceService>().getVisibilityPreference(
      key,
    );

    if (preference != null) {
      preference = !preference;
    } else {
      preference = false;
    }

    getIt<CalendarPreferenceService>().saveVisibilityPreference(
      key,
      preference,
    );

    final elements = events.value;
    elements?.forEach((element) {
      if (element.lvNr == key || element.id == key) {
        element.isVisible = preference;
      }
    });
    events.add(elements);
    updateHomeWidget(events.value ?? []);
  }

  int getTabPreference() {
    return (getIt<UserPreferencesService>().load(UserPreference.calendarTab)
            as int?) ??
        0;
  }

  void saveTabPreference(int currentTab) {
    getIt<UserPreferencesService>().save(
      UserPreference.calendarTab,
      currentTab,
    );
  }

  void resetPreferences() {
    _resetEventColors();
    _resetVisibility();
  }

  void _resetEventColors() {
    final elements = events.value;
    elements?.forEach((element) => element.setColor(null));
    events.add(elements);
    updateHomeWidget(events.value ?? []);
  }

  void _resetVisibility() {
    final elements = events.value;
    elements?.forEach((element) => element.setColor(null));
    events.add(elements);
    updateHomeWidget(events.value ?? []);
  }
}
