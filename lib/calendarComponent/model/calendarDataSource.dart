import 'package:campus_flutter/base/extensions/cast.dart';
import 'package:campus_flutter/calendarComponent/model/event.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MeetingDataSource extends CalendarDataSource {

  MeetingDataSource(List<Event> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return cast<Event>(appointments![index])!.startDate;
  }

  @override
  DateTime getEndTime(int index) {
    return cast<Event>(appointments![index])!.endDate;
  }

  @override
  String getSubject(int index) {
    return cast<Event>(appointments![index])!.title;
  }

  @override
  Object getId(int index) {
    return cast<Event>(appointments![index])!.id;
  }
}