import 'package:json_annotation/json_annotation.dart';

part 'color_preferences.g.dart';

@JsonSerializable()
class ColorPreferences {
  final Map<String, int> preferences;

  ColorPreferences(this.preferences);

  factory ColorPreferences.fromJson(Map<String, dynamic> json) =>
      _$ColorPreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$ColorPreferencesToJson(this);
}
