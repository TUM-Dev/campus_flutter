import 'package:campus_flutter/base/enums/appearance.dart';
import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/util/icon_text.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/settingsComponent/service/user_preferences_service.dart';
import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userPreferencesViewModel = Provider(
  (ref) => UserPreferencesViewModel(ref),
);

class UserPreferencesViewModel {
  final Ref ref;

  UserPreferencesViewModel(this.ref);

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
            case UserPreference.locale:
              ref.read(customLocale.notifier).state = Locale(value as String);
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
      case UserPreference.locale:
        ref.read(customLocale.notifier).state = value as Locale?;
        value = value?.languageCode;
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
              iconColor: Theme.of(context).primaryColor,
              label: Localizations.localeOf(context).languageCode == "de"
                  ? e.german
                  : e.english,
            ),
          ),
        )
        .toList();
  }
}
