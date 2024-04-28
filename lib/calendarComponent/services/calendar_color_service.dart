import 'dart:convert';

import 'package:campus_flutter/calendarComponent/model/color_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarColorService {
  static const key = "calendarColors";

  final SharedPreferences sharedPreferences;

  Map<String, int> colorPreferences = {};

  CalendarColorService(this.sharedPreferences);

  void saveColorPreference(String id, Color color) {
    colorPreferences[id] = color.value;
    try {
      sharedPreferences.setString(
        key,
        jsonEncode(ColorPreferences(colorPreferences).toJson()),
      );
    } catch (_) {}
  }

  Color? getColorPreference(String key) {
    if (colorPreferences.isEmpty) {
      loadColorPreferences();
    }

    final color = colorPreferences[key];
    return color != null ? Color(color) : null;
  }

  void loadColorPreferences() {
    try {
      final data = sharedPreferences.getString(key);
      if (data != null) {
        final json = jsonDecode(data);
        colorPreferences = ColorPreferences.fromJson(
          json as Map<String, dynamic>,
        ).preferences;
      }
    } catch (_) {}
  }

  void resetColorPreferences() {
    sharedPreferences.remove(key);
  }
}
