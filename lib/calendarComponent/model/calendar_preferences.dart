import 'package:json_annotation/json_annotation.dart';

part 'calendar_preferences.g.dart';

@JsonSerializable()
class CalendarPreferences {
  final Map<String, int> colorPreferences;
  final Map<String, bool> visibilityPreferences;
  @JsonKey(defaultValue: {})
  final Map<String, String> seriesPreferences;

  CalendarPreferences(
    this.colorPreferences,
    this.visibilityPreferences, [
    this.seriesPreferences = const {},
  ]);

  factory CalendarPreferences.fromJson(Map<String, dynamic> json) =>
      _$CalendarPreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarPreferencesToJson(this);
}
