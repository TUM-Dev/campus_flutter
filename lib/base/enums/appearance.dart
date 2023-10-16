import 'package:flutter/material.dart';

enum Appearance {
  system(Icons.devices, ThemeMode.system, "System", "System"),
  light(Icons.light_mode, ThemeMode.light, "Light", "Hell"),
  dark(Icons.dark_mode, ThemeMode.dark, "Dark", "Dunkel");

  final IconData icon;
  final ThemeMode themeMode;
  final String english;
  final String german;

  const Appearance(this.icon, this.themeMode, this.english, this.german);
}
