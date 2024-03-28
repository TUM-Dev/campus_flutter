import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:campus_flutter/base/routing/routes.dart' as routes;

enum ShortcutItemType {
  home(en: "Home"),
  cafeterias(en: "Cafeterias", de: "Mensen"),
  studyRooms(en: "Study Rooms", de: "Lernräume"),
  calendar(en: "Calendar", de: "Kalendar"),
  grades(en: "Grades", de: "Noten");

  final String en;
  final String? de;

  const ShortcutItemType({required this.en, this.de});
}

extension Routing on ShortcutItemType {
  String get type => "action_$name";

  String localizedTitle(Locale? locale) {
    final isGerman =
        (locale != null && locale.languageCode == "de" && de != null);
    return isGerman ? de! : en;
  }

  String? get icon {
    switch (this) {
      case ShortcutItemType.home:
      case ShortcutItemType.cafeterias:
      case ShortcutItemType.studyRooms:
      case ShortcutItemType.calendar:
      case ShortcutItemType.grades:
        return null;
    }
  }

  ShortcutItem shortcutItem(Locale? locale) {
    return ShortcutItem(
      type: type,
      localizedTitle: localizedTitle(locale),
      icon: icon,
    );
  }

  String get route {
    switch (this) {
      case ShortcutItemType.home:
        return routes.home;
      case ShortcutItemType.cafeterias:
        return routes.cafeterias;
      case ShortcutItemType.studyRooms:
        return routes.studyRooms;
      case ShortcutItemType.calendar:
        return routes.calendar;
      case ShortcutItemType.grades:
        return routes.grades;
    }
  }
}

extension ActiveShortcuts on ShortcutItemType {
  static List<ShortcutItemType> get items => [
        ShortcutItemType.cafeterias,
        ShortcutItemType.studyRooms,
        ShortcutItemType.calendar,
        ShortcutItemType.grades,
      ];
}
