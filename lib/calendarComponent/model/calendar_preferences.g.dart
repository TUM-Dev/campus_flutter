// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarPreferences _$CalendarPreferencesFromJson(Map<String, dynamic> json) =>
    CalendarPreferences(
      Map<String, int>.from(json['colorPreferences'] as Map),
      Map<String, bool>.from(json['visibilityPreferences'] as Map),
      (json['seriesPreferences'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          {},
    );

Map<String, dynamic> _$CalendarPreferencesToJson(
  CalendarPreferences instance,
) => <String, dynamic>{
  'colorPreferences': instance.colorPreferences,
  'visibilityPreferences': instance.visibilityPreferences,
  'seriesPreferences': instance.seriesPreferences,
};
