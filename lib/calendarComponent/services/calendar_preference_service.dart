import 'dart:convert';

import 'package:campus_flutter/calendarComponent/model/calendar_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarPreferenceService {
  static const key = "calendar";

  final SharedPreferences sharedPreferences;

  Map<String, int> colorPreferences = {};
  Map<String, bool> visibilityPreferences = {};

  CalendarPreferenceService(this.sharedPreferences);

  void saveColorPreference(String id, Color color) {
    colorPreferences[id] = color.value;
    try {
      sharedPreferences.setString(
        key,
        jsonEncode(
          CalendarPreferences(
            colorPreferences,
            visibilityPreferences,
          ).toJson(),
        ),
      );
    } catch (_) {}
  }

  Color? getColorPreference(String key) {
    if (colorPreferences.isEmpty) {
      loadPreferences();
    }

    final color = colorPreferences[key];
    return color != null ? Color(color) : null;
  }

  void saveVisibilityPreference(String id, bool isVisible) {
    visibilityPreferences[id] = isVisible;
    try {
      sharedPreferences.setString(
        key,
        jsonEncode(
          CalendarPreferences(
            colorPreferences,
            visibilityPreferences,
          ).toJson(),
        ),
      );
    } catch (_) {}
  }

  bool? getVisibilityPreference(String key) {
    if (visibilityPreferences.isEmpty) {
      loadPreferences();
    }

    return visibilityPreferences[key];
  }

  void loadPreferences() {
    try {
      final data = sharedPreferences.getString(key);
      if (data != null) {
        final json = jsonDecode(data);
        final calendarPreferences = CalendarPreferences.fromJson(
          json as Map<String, dynamic>,
        );
        colorPreferences = calendarPreferences.colorPreferences;
        visibilityPreferences = calendarPreferences.visibilityPreferences;
      }
    } catch (_) {}
  }

  void resetPreferences() {
    sharedPreferences.remove(key);
  }
}
