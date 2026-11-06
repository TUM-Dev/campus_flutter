import 'package:campus_flutter/base/util/days_parser.dart';
import 'package:json_annotation/json_annotation.dart';

part 'study_room_opening_hours.g.dart';

@JsonSerializable()
class StudyRoomOpeningHours {
  @JsonKey(name: "days")
  final String daysString;
  @JsonKey(name: "daysbitmask", fromJson: _daysBitMaskFromJson)
  final String daysBitMask;
  final String start;
  final String end;

  List<int> get days => decodeDaysBitmask(daysBitMask);

  String get firstDay {
    return getDayOfWeek(days.first);
  }

  String? get lastDay {
    if (days.length == 1) {
      return null;
    } else {
      return getDayOfWeek(days.last);
    }
  }

  String get startString => start.substring(0, start.length - 3);

  String get endString => end.substring(0, end.length - 3);

  int get startTime => int.parse(start.substring(0, 2));

  int get endTime => int.parse(end.substring(0, 2));

  StudyRoomOpeningHours({
    required this.daysString,
    required this.daysBitMask,
    required this.start,
    required this.end,
  });

  factory StudyRoomOpeningHours.fromJson(Map<String, dynamic> json) =>
      _$StudyRoomOpeningHoursFromJson(json);

  Map<String, dynamic> toJson() => _$StudyRoomOpeningHoursToJson(this);
}

String _daysBitMaskFromJson(Object? value) {
  // Support both integers and string bitmasks from IRIS
  if (value is int) return value.toString();
  if (value is String) return value;
  throw const FormatException('Invalid study room days bitmask');
}
