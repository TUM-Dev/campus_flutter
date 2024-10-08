import 'package:json_annotation/json_annotation.dart';

part 'calendar_preferences.g.dart';

@JsonSerializable()
class CalendarPreferences {
  final Map<String, int> colorPreferences;
  final Map<String, bool> visibilityPreferences;

  CalendarPreferences(
    this.colorPreferences,
    this.visibilityPreferences,
  );

  factory CalendarPreferences.fromJson(Map<String, dynamic> json) =>
      _$CalendarPreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarPreferencesToJson(this);
}
