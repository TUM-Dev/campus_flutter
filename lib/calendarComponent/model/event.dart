import 'package:campus_flutter/base/networking/protocols/apiResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event extends Serializable {
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

  Event(
      {required this.id,
      required this.status,
      required this.url,
      required this.title,
      required this.descriptionText,
      required this.startDate,
      required this.endDate,
      required this.location});

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class EventData extends Serializable {
  final Events events;

  EventData({required this.events});

  factory EventData.fromJson(Map<String, dynamic> json) => _$EventDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EventDataToJson(this);
}

@JsonSerializable()
class Events extends Serializable {
  final List<Event> event;

  Events({required this.event});

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EventsToJson(this);
}
