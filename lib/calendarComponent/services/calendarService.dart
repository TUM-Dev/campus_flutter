import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApi.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiError.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/calendarComponent/model/calendarEvent.dart';
import 'package:get/get.dart';

class CalendarService {
  static Future<List<CalendarEvent>> fetchCalendar() async {
    MainApi mainApi = Get.find();
    final response = await mainApi.makeRequest<CalendarEventsData, TumOnlineApi, TumOnlineApiError>(
        TumOnlineApi(TumOnlineServiceCalendar()),
        CalendarEventsData.fromJson,
        TumOnlineApiError.fromJson,
        false
    );

    return response.data.events.event;
  }
}