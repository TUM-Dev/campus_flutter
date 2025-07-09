import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/util/seperated_list.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/calendars_view.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:campus_flutter/settingsComponent/viewModels/settings_viewmodel.dart';
import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarSettingsView extends ConsumerWidget {
  const CalendarSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
      title: context.tr("calendar"),
      child: Card(
        child: SeparatedList.widgets(
          widgets: [
            _showWeekends(context, ref),
            _showHiddenCalendarEntries(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _showWeekends(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      title: Text(
        context.tr("showWeekends"),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Switch(
        value: ref.watch(showWeekends),
        onChanged: (value) {
          ref
              .read(settingsViewModel)
              .savePreference(UserPreference.weekends, value);
          calendarsKey.currentState?.weekController.view = value
              ? CalendarView.week
              : CalendarView.workWeek;
        },
      ),
    );
  }

  Widget _showHiddenCalendarEntries(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      title: Text(
        context.tr("showHiddenCalendarEntries"),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Switch(
        value: ref.watch(showHiddenCalendarEntries),
        onChanged: (value) {
          ref
              .read(settingsViewModel)
              .savePreference(UserPreference.hiddenCalendarEntries, value);
          ref.read(calendarViewModel).fetch(false);
        },
      ),
    );
  }
}
