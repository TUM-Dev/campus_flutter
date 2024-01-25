import 'package:campus_flutter/base/enums/calendar_event_type.dart';
import 'package:campus_flutter/searchComponent/model/comparison_token.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calendar_event.g.dart';

@JsonSerializable()
class CalendarEvent extends Searchable {
  @JsonKey(name: "nr")
  final String id;
  final String status;
  final String? url;
  final String title;
  final String? description;
  @JsonKey(name: "dtstart")
  final DateTime startDate;
  @JsonKey(name: "dtend")
  final DateTime endDate;
  final String? location;

  Duration get duration {
    return endDate.difference(startDate);
  }

  String? get lvNr {
    return url?.split("LvNr=").last;
  }

  String get timePeriod {
    return "${DateFormat.Hm("de").format(startDate)} - ${DateFormat.Hm("de").format(endDate)}";
  }

  String _dateTimePeriod(BuildContext context) {
    final start = DateFormat("EE, dd.MM.yyyy, HH:mm", "de").format(startDate);
    final end = DateFormat("HH:mm", "de").format(endDate);
    return "$start - $end";
  }

  String timePeriodText(BuildContext context) {
    if (startDate.day == endDate.day) {
      return _dateTimePeriod(context);
    } else {
      final start = DateFormat(
        null,
        "de",
      ).format(startDate);
      final end = DateFormat(
        null,
        "de",
      ).format(endDate);
      return "$start ${context.localizations.to.toLowerCase()}\n$end";
    }
  }

  bool get isCanceled {
    return status == "CANCEL";
  }

  CalendarEventType get type {
    if (isCanceled) {
      return CalendarEventType.canceled;
    } else if (title.endsWith("VO") ||
        title.endsWith("VU") ||
        title.endsWith("VI")) {
      return CalendarEventType.lecture;
    } else if (title.endsWith("UE")) {
      return CalendarEventType.exercise;
    } else {
      return CalendarEventType.other;
    }
  }

  Color getEventColor(BuildContext context) {
    switch (type) {
      case CalendarEventType.canceled:
        return Colors.red;
      case CalendarEventType.lecture:
        return Colors.green;
      case CalendarEventType.exercise:
        return Colors.orange;
      default:
        return Theme.of(context).primaryColor;
    }
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ComparisonToken> get comparisonTokens => [
        ComparisonToken(value: title),
        if (location != null) ComparisonToken(value: location!),
      ];

  CalendarEvent({
    required this.id,
    required this.status,
    this.url,
    required this.title,
    this.description,
    required this.startDate,
    required this.endDate,
    this.location,
  });

  factory CalendarEvent.fromJson(Map<String, dynamic> json) =>
      _$CalendarEventFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarEventToJson(this);
}

@JsonSerializable()
class CalendarEvents {
  @JsonKey(name: "event", defaultValue: [])
  final List<CalendarEvent> events;

  CalendarEvents({required this.events});

  factory CalendarEvents.fromJson(Map<String, dynamic> json) =>
      _$CalendarEventsFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarEventsToJson(this);
}
