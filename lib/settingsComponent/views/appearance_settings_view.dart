import 'package:campus_flutter/base/enums/appearance.dart';
import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/util/seperated_list.dart';
import 'package:campus_flutter/personComponent/viewModel/profile_viewmodel.dart';
import 'package:campus_flutter/studiesComponent/viewModel/grade_viewmodel.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/settingsComponent/viewModels/settings_viewmodel.dart';
import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            _useWebView(context, ref),
            _showStudentCardPicture(context, ref),
            _hideFailedGrades(context, ref),
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
            ref.read(settingsViewModel).savePreference(
                  UserPreference.theme,
                  newAppearance,
                );
          }
        },
        value: ref.watch(appearance),
        items: SettingsViewModel.getAppearanceEntries(context),
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
          ref.read(settingsViewModel).savePreference(
                UserPreference.browser,
                showWebView,
              );
          ref.read(useWebView.notifier).state = showWebView;
        },
      ),
    );
  }

  Widget _showStudentCardPicture(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      title: Text(
        context.tr("showStudentCardPicture"),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Switch(
        value: ref.watch(showStudentCardPicture),
        onChanged: (value) {
          ref.read(settingsViewModel).savePreference(
                UserPreference.studentCardPicture,
                value,
              );
          ref.read(profileViewModel).fetch(false);
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
          ref.read(settingsViewModel).savePreference(
                UserPreference.failedGrades,
                value,
              );
          ref.read(gradeViewModel).fetch(false);
        },
      ),
    );
  }
}
