import 'package:json_annotation/json_annotation.dart';

part 'opening_hours.g.dart';

@JsonSerializable()
class OpeningHours {
  final OpeningHour? mon;
  final OpeningHour? tue;
  final OpeningHour? wed;
  final OpeningHour? thu;
  final OpeningHour? fri;

  OpeningHours({this.mon, this.tue, this.wed, this.thu, this.fri});

  factory OpeningHours.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursFromJson(json);

  Map<String, dynamic> toJson() => _$OpeningHoursToJson(this);
}

@JsonSerializable()
class OpeningHour {
  final String start;
  final String end;

  OpeningHour({required this.start, required this.end});

  factory OpeningHour.fromJson(Map<String, dynamic> json) =>
      _$OpeningHourFromJson(json);

  Map<String, dynamic> toJson() => _$OpeningHourToJson(this);
}
