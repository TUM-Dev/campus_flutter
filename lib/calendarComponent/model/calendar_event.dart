import 'package:campus_flutter/searchComponent/model/comparison_token.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calendar_event.g.dart';

@JsonSerializable()
class CalendarEvent extends Searchable {
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
    final start = DateFormat("EE, dd.MM.yyyy, HH:mm").format(startDate);
    final end = DateFormat("HH:mm").format(endDate);
    return "$start - $end";
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ComparisonToken> get comparisonTokens => [
        ComparisonToken(value: title),
        ComparisonToken(value: location),
      ];

  CalendarEvent(
      {required this.id,
      required this.status,
      required this.url,
      required this.title,
      required this.descriptionText,
      required this.startDate,
      required this.endDate,
      required this.location});

  factory CalendarEvent.fromJson(Map<String, dynamic> json) =>
      _$CalendarEventFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarEventToJson(this);
}

@JsonSerializable()
class CalendarEventsData {
  final CalendarEvents events;

  CalendarEventsData({required this.events});

  factory CalendarEventsData.fromJson(Map<String, dynamic> json) =>
      _$CalendarEventsDataFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarEventsDataToJson(this);
}

@JsonSerializable()
class CalendarEvents {
  final List<CalendarEvent> event;

  CalendarEvents({required this.event});

  factory CalendarEvents.fromJson(Map<String, dynamic> json) =>
      _$CalendarEventsFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarEventsToJson(this);
}
