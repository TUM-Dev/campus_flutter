import 'package:campus_flutter/calendarComponent/model/calendarEvent.dart';
import 'package:campus_flutter/calendarComponent/services/calendarService.dart';
import 'package:rxdart/rxdart.dart';

class CalendarViewModel {
  late BehaviorSubject<List<CalendarEvent>?> events = BehaviorSubject.seeded(null);

  fetchEvents() async {
    final events = await CalendarService.fetchCalendar();
    this.events.add(events);
  }
}