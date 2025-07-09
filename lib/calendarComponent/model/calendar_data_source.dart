import 'package:campus_flutter/base/extensions/cast.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MeetingDataSource extends CalendarDataSource {
  final BuildContext context;
  final WidgetRef ref;

  MeetingDataSource(List<CalendarEvent> source, this.context, this.ref) {
    if (!ref.read(showHiddenCalendarEntries)) {
      appointments = source
          .where((element) => element.isVisible ?? true)
          .toList();
    } else {
      appointments = source;
    }
  }

  @override
  DateTime getStartTime(int index) {
    return cast<CalendarEvent>(appointments![index])!.startDate;
  }

  @override
  DateTime getEndTime(int index) {
    return cast<CalendarEvent>(appointments![index])!.endDate;
  }

  @override
  String getSubject(int index) {
    final calendarEvent = cast<CalendarEvent>(appointments![index])!;
    return calendarEvent.subject;
  }

  @override
  Object getId(int index) {
    return cast<CalendarEvent>(appointments![index])!.id;
  }

  @override
  Color getColor(int index) {
    final appointment = appointments![index]! as CalendarEvent;
    return appointment.getColor();
  }
}
