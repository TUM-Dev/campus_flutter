import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calendarEvent.g.dart';

@JsonSerializable()
class CalendarEvent {
  @JsonKey(name: "nr")
  final String id;
  final String status;
  final String url;
  final String title;
  @JsonKey(name: "description")
  final String descriptionText;
  @JsonKey(name: "dtstart")
  final DateTime startDate;
  @JsonKey(name: "dtend")
  final DateTime endDate;
  final String location;

  String? get lvNr {
    return url.split("LvNr=").last;
  }

  String get timePeriod {
    return "${DateFormat.Hm().format(startDate)} - ${DateFormat.Hm().format(endDate)}";
  }

  // TODO: Mon, dd.mm.yyyy, hh:mm - hh:mm
  String get timeDatePeriod {
    if (startDate.day == endDate.day) {
      return "coming soon";
    } else {
      return "coming soon";
    }
  }

  CalendarEvent(
      {required this.id,
      required this.status,
      required this.url,
      required this.title,
      required this.descriptionText,
      required this.startDate,
      required this.endDate,
      required this.location});

  factory CalendarEvent.fromJson(Map<String, dynamic> json) => _$CalendarEventFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarEventToJson(this);
}

@JsonSerializable()
class CalendarEventsData {
  final CalendarEvents events;

  CalendarEventsData({required this.events});

  factory CalendarEventsData.fromJson(Map<String, dynamic> json) => _$CalendarEventsDataFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarEventsDataToJson(this);
}

@JsonSerializable()
class CalendarEvents {
  final List<CalendarEvent> event;

  CalendarEvents({required this.event});

  factory CalendarEvents.fromJson(Map<String, dynamic> json) => _$CalendarEventsFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarEventsToJson(this);
}
