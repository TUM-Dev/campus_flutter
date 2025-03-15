import 'package:campus_flutter/base/extensions/color.dart';
import 'package:campus_flutter/base/theme/constants.dart';
import 'package:campus_flutter/base/util/read_list_value.dart';
import 'package:campus_flutter/searchComponent/model/comparison_token.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calendar_event.g.dart';

@JsonSerializable()
class CalendarEvent extends Searchable {
  @JsonKey(name: "nr")
  final String id;
  final String status;
  final String? url;
  final String? title;
  final String? description;
  @JsonKey(name: "dtstart")
  final DateTime startDate;
  @JsonKey(name: "dtend")
  final DateTime endDate;
  @JsonKey(name: "location", readValue: readListValue)
  final List<String> locations;

  int? color;
  bool? isVisible;

  Duration get duration {
    return endDate.difference(startDate);
  }

  String? get lvNr {
    return url?.split("LvNr=").last;
  }

  String get timePeriod {
    return "${DateFormat.Hm().format(startDate)} - ${DateFormat.Hm().format(endDate)}";
  }

  String _dateTimePeriod(BuildContext context) {
    final start = DateFormat(
      "EE, dd.MM.yyyy, HH:mm",
      context.locale.languageCode,
    ).format(startDate);
    final end = DateFormat("HH:mm").format(endDate);
    return "$start - $end";
  }

  String timePeriodText(BuildContext context) {
    if (startDate.day == endDate.day) {
      return _dateTimePeriod(context);
    } else {
      final start = DateFormat(null, "de").format(startDate);
      final end = DateFormat(null, "de").format(endDate);
      return "$start ${context.tr("to").toLowerCase()}\n$end";
    }
  }

  bool get isCanceled {
    return status == "CANCEL";
  }

  String get subject {
    final location = locations.firstOrNull ?? "";
    return "$title\n$location";
  }

  void setColor(Color? color) {
    this.color = color?.intValue;
  }

  Color getColor() {
    if (description != null &&
        description!.toLowerCase().contains("prüfungstermin")) {
      return Colors.orange;
    } else if (color == null) {
      return primaryLightColor;
    } else {
      return Color(color!);
    }
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ComparisonToken> get comparisonTokens => [
    if (title != null) ComparisonToken(value: title!),
    if (locations.isNotEmpty)
      for (var location in locations) ComparisonToken(value: location),
  ];

  CalendarEvent({
    required this.id,
    required this.status,
    this.url,
    this.title,
    this.description,
    required this.startDate,
    required this.endDate,
    required this.locations,
    this.color,
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
