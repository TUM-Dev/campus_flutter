import 'dart:convert';

import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';
import 'package:rxdart/rxdart.dart';

final calendarViewModel = Provider((ref) => CalendarViewModel());

class CalendarViewModel {
  BehaviorSubject<List<CalendarEvent>?> events = BehaviorSubject.seeded(null);

  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  BehaviorSubject<(List<CalendarEvent>, List<CalendarEvent>)?> widgetEvents =
      BehaviorSubject.seeded(null);

  Future fetch(bool forcedRefresh) async {
    CalendarService.fetchCalendar(forcedRefresh).then(
      (response) async {
        lastFetched.add(response.$1);
        events.add(response.$2);
        await HomeWidget.saveWidgetData("calendar", jsonEncode(response.$2));
        await HomeWidget.updateWidget(iOSName: "CalendarWidget", androidName: "widgets.calendar.CalendarWidget");
      },
      onError: (error) => events.addError(error),
    );
  }

  (CalendarEvent?, List<CalendarEvent>) getWidgetEvents() {
    CalendarEvent? leftColumn;
    List<CalendarEvent> rightColumn = [];

    final filteredEvents = events.value
            ?.where(
              (element) => element.startDate.isAfter(
                DateTime.now(),
              ),
            )
            .toList() ??
        [];
    filteredEvents.sort((a, b) => a.startDate.compareTo(b.startDate));
    final currentDate = DateTime.now();
    final currentDay =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

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
}
