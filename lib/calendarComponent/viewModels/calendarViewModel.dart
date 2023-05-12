import 'package:campus_flutter/calendarComponent/model/event.dart';
import 'package:campus_flutter/calendarComponent/services/calendarService.dart';
import 'package:rxdart/rxdart.dart';

class CalendarViewModel {
  late BehaviorSubject<List<Event>?> events = BehaviorSubject.seeded(null);

  fetchEvents() async {
    final events = await CalendarService.fetchCalendar();
    this.events.add(events);
  }
}