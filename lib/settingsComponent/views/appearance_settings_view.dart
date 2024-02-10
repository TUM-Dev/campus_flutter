import 'dart:io';

import 'package:campus_flutter/base/enums/appearance.dart';
import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/views/seperated_list.dart';
import 'package:campus_flutter/gradeComponent/viewModels/grade_viewmodel.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/settingsComponent/viewModels/user_preferences_viewmodel.dart';
import 'package:campus_flutter/settingsComponent/views/default_maps_picker_view.dart';
import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_launcher/map_launcher.dart';

class AppearanceSettingsView extends ConsumerWidget {
  const AppearanceSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
      title: context.localizations.appearance,
      child: Card(
        child: SeparatedList.widgets(
          widgets: [
            _appearanceSelection(context, ref),
            if (!kIsWeb && Platform.isIOS) _useWebView(context, ref),
            _hideFailedGrades(context, ref),
            if (!kIsWeb && getIt.get<List<AvailableMap>>().isNotEmpty)
              const DefaultMapsPickerView(),
          ],
        ),
      ),
    );
  }

  Widget _appearanceSelection(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      title: Text(
        context.localizations.theme,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: DropdownButton(
        onChanged: (Appearance? newAppearance) {
          if (newAppearance != null) {
            ref.read(userPreferencesViewModel).savePreference(
                  UserPreference.theme,
                  newAppearance,
                );
          }
        },
        value: ref.watch(appearance),
        items: UserPreferencesViewModel.getAppearanceEntries(context),
      ),
    );
  }

  Widget _useWebView(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      title: Text(
        context.localizations.useWebView,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Switch(
        value: ref.watch(useWebView),
        onChanged: (showWebView) {
          ref.read(userPreferencesViewModel).savePreference(
                UserPreference.browser,
                showWebView,
              );
          ref.read(useWebView.notifier).state = showWebView;
        },
      ),
    );
  }

  Widget _hideFailedGrades(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      title: Text(
        context.localizations.hideFailedGrades,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Switch(
        value: ref.watch(hideFailedGrades),
        onChanged: (value) {
          ref.read(userPreferencesViewModel).savePreference(
                UserPreference.failedGrades,
                value,
              );
          ref.read(gradeViewModel).fetch(false);
        },
      ),
    );
  }
}
