import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApi.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiError.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/calendarComponent/model/calendarEvent.dart';
import 'package:campus_flutter/providers_get_it.dart';

class CalendarService {
  static Future<List<CalendarEvent>> fetchCalendar(bool forcedRefresh) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequest<CalendarEventsData, TumOnlineApi, TumOnlineApiError>(
        TumOnlineApi(TumOnlineServiceCalendar()),
        CalendarEventsData.fromJson,
        TumOnlineApiError.fromJson,
        forcedRefresh
    );

    return response.data.events.event;
  }
}