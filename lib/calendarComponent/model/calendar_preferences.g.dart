// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarPreferences _$CalendarPreferencesFromJson(Map<String, dynamic> json) =>
    CalendarPreferences(
      Map<String, int>.from(json['colorPreferences'] as Map),
      Map<String, bool>.from(json['visibilityPreferences'] as Map),
    );

Map<String, dynamic> _$CalendarPreferencesToJson(
        CalendarPreferences instance) =>
    <String, dynamic>{
      'colorPreferences': instance.colorPreferences,
      'visibilityPreferences': instance.visibilityPreferences,
    };
