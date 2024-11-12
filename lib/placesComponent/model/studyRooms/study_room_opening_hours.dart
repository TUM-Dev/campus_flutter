import 'package:json_annotation/json_annotation.dart';

part 'study_room_opening_hours.g.dart';

@JsonSerializable()
class StudyRoomOpeningHours {
  final String days;
  @JsonKey(name: "daysbitmask")
  final String daysBitMask;
  final String start;
  final String end;

  StudyRoomOpeningHours({
    required this.days,
    required this.daysBitMask,
    required this.start,
    required this.end,
  });

  factory StudyRoomOpeningHours.fromJson(Map<String, dynamic> json) =>
      _$StudyRoomOpeningHoursFromJson(json);

  Map<String, dynamic> toJson() => _$StudyRoomOpeningHoursToJson(this);
}
