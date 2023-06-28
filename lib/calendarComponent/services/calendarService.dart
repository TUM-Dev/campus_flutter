import 'package:campus_flutter/base/networking/apis/tumOnlineAPI.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/calendarComponent/model/calendarEvent.dart';

class CalendarService {
  static Future<List<CalendarEvent>> fetchCalendar() async {
    final response = await MainAPI.makeRequest<CalendarEventsData, TUMOnlineAPI>(
        TUMOnlineAPI(TUMOnlineServices.calendar, {}),
        CalendarEventsData.fromJson,
        TUMOnlineAPI.token,
        false);

    return response.events.event;
  }
}