import 'dart:ui';

import 'package:campus_flutter/base/enums/appearance.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/settingsComponent/views/default_maps_picker_view.dart';
import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userPreferencesViewModel = Provider(
  (ref) => UserPreferencesViewModel(ref),
);

class UserPreferencesViewModel {
  final Ref ref;

  UserPreferencesViewModel(this.ref);

  void loadUserPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    for (final userPreferences in UserPreference.values) {
      final data = sharedPreferences.get(userPreferences.name);
      switch (userPreferences) {
        case UserPreference.webView:
          final webView = data != null ? data as bool : true;
          ref.read(useWebView.notifier).state = webView;
        case UserPreference.hideFailedGrades:
          final failedGrades = data != null ? data as bool : false;
          ref.read(hideFailedGrades.notifier).state = failedGrades;
        case UserPreference.defaultMapsApplication:
          final installedMaps = await MapLauncher.installedMaps;
          if (data != null && data is String) {
            final matchingMaps =
                installedMaps.firstWhereOrNull((e) => e.mapType.name == data);
            if (matchingMaps != null) {
              ref.read(selectedMapsApp.notifier).state = matchingMaps;
            } else {
              ref.read(selectedMapsApp.notifier).state = installedMaps.first;
            }
          } else {
            ref.read(selectedMapsApp.notifier).state =
                installedMaps.firstOrNull;
          }
        case UserPreference.locale:
          ref.read(customLocale.notifier).state =
              data != null ? Locale(data as String) : null;
        case UserPreference.theme:
          if (data != null) {
            final theme = Appearance.values
                .firstWhere((element) => element.name == (data as String));
            ref.read(appearance.notifier).state = theme;
          }
        //
      }
    }
  }

  void saveUserPreference(
    UserPreference userPreference,
    dynamic newValue,
  ) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (newValue == null) {
      await sharedPreferences.remove(userPreference.name);
    } else {
      switch (userPreference) {
        case UserPreference.defaultMapsApplication:
          await sharedPreferences.setString(
            userPreference.name,
            (newValue as MapType).name,
          );
        case UserPreference.locale:
          await sharedPreferences.setString(
            userPreference.name,
            (newValue as Locale).languageCode,
          );
        case UserPreference.theme:
          await sharedPreferences.setString(
            userPreference.name,
            (newValue as Appearance).name,
          );
        default:
          await sharedPreferences.setBool(
            userPreference.name,
            newValue as bool,
          );
      }
    }
  }
}

enum UserPreference {
  webView,
  hideFailedGrades,
  defaultMapsApplication,
  locale,
  theme;
}
