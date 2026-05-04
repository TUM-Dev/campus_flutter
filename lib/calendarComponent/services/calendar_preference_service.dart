import 'dart:convert';
import 'dart:developer';

import 'package:campus_flutter/base/extensions/color.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarPreferenceService {
  static const key = "calendar";

  final SharedPreferences sharedPreferences;

  Map<String, int> colorPreferences = {};
  Map<String, bool> visibilityPreferences = {};
  Map<String, String> seriesPreferences = {};
  bool _loaded = false;

  CalendarPreferenceService(this.sharedPreferences);

  void saveColorPreference(String id, Color color) {
    colorPreferences[id] = color.intValue;
    _persist();
  }

  Color? getColorPreference(String key) {
    if (!_loaded) {
      loadPreferences();
    }

    final color = colorPreferences[key];
    return color != null ? Color(color) : null;
  }

  void saveVisibilityPreference(String id, bool isVisible) {
    visibilityPreferences[id] = isVisible;
    _persist();
  }

  bool? getVisibilityPreference(String key) {
    if (!_loaded) {
      loadPreferences();
    }

    return visibilityPreferences[key];
  }

  void saveSeriesId(String eventId, String seriesId) {
    seriesPreferences[eventId] = seriesId;
    _persist();
  }

  String? getSeriesId(String eventId) {
    if (!_loaded) {
      loadPreferences();
    }
    return seriesPreferences[eventId];
  }

  List<String> getSeriesEventIds(String seriesId) {
    if (!_loaded) {
      loadPreferences();
    }
    return seriesPreferences.entries
        .where((e) => e.value == seriesId)
        .map((e) => e.key)
        .toList();
  }

  void removeEventPreferences(Iterable<String> eventIds) {
    for (final eventId in eventIds) {
      colorPreferences.remove(eventId);
      visibilityPreferences.remove(eventId);
      seriesPreferences.remove(eventId);
    }
    _persist();
  }

  void _persist() {
    try {
      sharedPreferences.setString(
        key,
        jsonEncode(
          CalendarPreferences(
            colorPreferences,
            visibilityPreferences,
            seriesPreferences,
          ).toJson(),
        ),
      );
    } catch (e) {
      log('Failed to persist calendar preferences: $e');
    }
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
        seriesPreferences = Map.from(calendarPreferences.seriesPreferences);
      }
      _loaded = true;
    } catch (e) {
      log('Failed to load calendar preferences: $e');
    }
  }

  void resetPreferences() {
    sharedPreferences.remove(key);
  }
}
