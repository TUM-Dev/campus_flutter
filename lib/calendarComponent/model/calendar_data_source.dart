import 'package:campus_flutter/base/extensions/cast.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MeetingDataSource extends CalendarDataSource {
  final BuildContext context;

  MeetingDataSource(List<CalendarEvent> source, this.context) {
    appointments = source;
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
    return "${calendarEvent.title}\n${calendarEvent.location}";
  }

  @override
  Object getId(int index) {
    return cast<CalendarEvent>(appointments![index])!.id;
  }

  @override
  Color getColor(int index) {
    final appointment = appointments![index]! as CalendarEvent;
    return appointment.getEventColor(context);
  }
}
