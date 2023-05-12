import 'package:campus_flutter/base/networking/apis/tumOnlineAPI.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/calendarComponent/model/event.dart';

class CalendarService {
  static Future<List<Event>> fetchCalendar() async {
    final response = await MainAPI.makeRequest<EventData, TUMOnlineAPI>(
        TUMOnlineAPI(TUMOnlineServices.calendar, {}),
        EventData.fromJson,
        TUMOnlineAPI.token,
        false);

    return response.events.event;
  }
}