import 'dart:io';

import 'package:campus_flutter/base/enums/appearance.dart';
import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/views/seperated_list.dart';
import 'package:campus_flutter/calendarComponent/views/calendars_view.dart';
import 'package:campus_flutter/studiesComponent/viewModel/grade_viewmodel.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/settingsComponent/viewModels/user_preferences_viewmodel.dart';
import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppearanceSettingsView extends ConsumerWidget {
  const AppearanceSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
      title: context.tr("appearance"),
      child: Card(
        child: SeparatedList.widgets(
          widgets: [
            _appearanceSelection(context, ref),
            if (Platform.isIOS) _useWebView(context, ref),
            _hideFailedGrades(context, ref),
            _showWeeks(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _appearanceSelection(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      title: Text(
        context.tr("theme"),
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
        context.tr("useWebView"),
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
        context.tr("hideFailedGrades"),
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

  Widget _showWeeks(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      title: Text(
        context.tr("showWeekends"),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Switch(
        value: ref.watch(showWeekends),
        onChanged: (value) {
          ref.read(userPreferencesViewModel).savePreference(
                UserPreference.weekends,
                value,
              );
          calendarsKey.currentState?.weekController.view =
              value ? CalendarView.week : CalendarView.workWeek;
        },
      ),
    );
  }
}
