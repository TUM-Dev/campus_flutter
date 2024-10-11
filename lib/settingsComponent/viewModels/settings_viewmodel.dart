import 'package:campus_flutter/base/enums/appearance.dart';
import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/icon_text.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/base/services/user_preferences_service.dart';
import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsViewModel = Provider(
  (ref) => SettingsViewModel(ref),
);

class SettingsViewModel {
  final Ref ref;

  SettingsViewModel(this.ref);

  Future<void> loadPreferences() async {
    return Future(() async {
      Map<UserPreference, dynamic> preferences = {};
      for (var preference in UserPreference.values) {
        final value = getIt<UserPreferencesService>().load(preference);
        preferences[preference] = value;
        if (value != null) {
          switch (preference) {
            case UserPreference.theme:
              ref.read(appearance.notifier).state =
                  Appearance.values[value as int];
            case UserPreference.browser:
              ref.read(useWebView.notifier).state = value as bool;
            case UserPreference.failedGrades:
              ref.read(hideFailedGrades.notifier).state = value as bool;
            case UserPreference.weekends:
              ref.read(showWeekends.notifier).state = value as bool;
            case UserPreference.hiddenCalendarEntries:
              ref.read(showHiddenCalendarEntries.notifier).state =
                  value as bool;
            default:
              break;
          }
        }
      }
    });
  }

  void savePreference(UserPreference userPreference, Object? value) {
    switch (userPreference) {
      case UserPreference.theme:
        value = value as Appearance;
        ref.read(appearance.notifier).state = value;
        value = value.index;
      case UserPreference.browser:
        ref.read(useWebView.notifier).state = value as bool;
      case UserPreference.failedGrades:
        ref.read(hideFailedGrades.notifier).state = value as bool;
      case UserPreference.weekends:
        ref.read(showWeekends.notifier).state = value as bool;
      case UserPreference.hiddenCalendarEntries:
        ref.read(showHiddenCalendarEntries.notifier).state = value as bool;
      default:
        break;
    }
    getIt<UserPreferencesService>().save(userPreference, value);
  }

  void resetUserPreferences() {
    for (var userPreference in UserPreference.values) {
      getIt<UserPreferencesService>().reset(userPreference);
    }
  }

  static List<DropdownMenuItem<Appearance>> getAppearanceEntries(
    BuildContext context,
  ) {
    return Appearance.values
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: IconText(
              iconData: e.icon,
              iconColor: context.primaryColor,
              label: Localizations.localeOf(context).languageCode == "de"
                  ? e.german
                  : e.english,
            ),
          ),
        )
        .toList();
  }
}
