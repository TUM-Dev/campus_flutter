import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_endpoint.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_editing.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/main.dart';

class CalendarService {
  static Future<(DateTime?, List<CalendarEvent>)> fetchCalendar(
    bool forcedRefresh,
  ) async {
    RestClient restClient = getIt<RestClient>();
    final response = await restClient
        .getWithException<CalendarEvents, TumOnlineApi, TumOnlineApiException>(
          TumOnlineApi(TumOnlineEndpointCalendar()),
          CalendarEvents.fromJson,
          TumOnlineApiException.fromJson,
          forcedRefresh,
        );
    return (response.saved, response.data.events);
  }

  static Future<CalendarCreationConfirmation> createCalendarEvent(
    AddedCalendarEvent addedCalendarEvent,
  ) async {
    RestClient restClient = getIt<RestClient>();
    final response = await restClient.getWithException<
      CalendarCreationConfirmationData,
      TumOnlineApi,
      TumOnlineApiException
    >(
      TumOnlineApi(
        TumOnlineEndpointEventCreate(
          title: addedCalendarEvent.title,
          annotation: addedCalendarEvent.annotation,
          from: TumOnlineApi.dateFormat.format(addedCalendarEvent.from),
          to: TumOnlineApi.dateFormat.format(addedCalendarEvent.to),
        ),
      ),
      CalendarCreationConfirmationData.fromJson,
      TumOnlineApiException.fromJson,
      true,
    );
    return response.data.calendarCreationConfirmation;
  }

  static Future<void> deleteCalendarEvent(String id) async {
    RestClient restClient = getIt<RestClient>();
    restClient.getWithException(
      TumOnlineApi(TumOnlineEndpointEventDelete(eventId: id)),
      CalendarDeletionConfirmationData.fromJson,
      TumOnlineApiException.fromJson,
      true,
    );
  }
}
