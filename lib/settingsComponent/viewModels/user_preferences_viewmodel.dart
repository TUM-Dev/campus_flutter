import 'package:campus_flutter/providers_get_it.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            ref.read(selectedMapsApp.notifier).state = installedMaps.first;
          }
      }
    }
  }

  void saveUserPreference(
      UserPreference userPreference, dynamic newValue) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (userPreference == UserPreference.defaultMapsApplication) {
      await sharedPreferences.setString(
          userPreference.name, (newValue as MapType).name);
    } else {
      await sharedPreferences.setBool(userPreference.name, newValue as bool);
    }
  }
}

enum UserPreference {
  webView,
  hideFailedGrades,
  defaultMapsApplication;
}
