import 'package:campus_flutter/base/errorHandling/error_snackbar.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
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
            _syncWithDeviceCalendar(context, ref),
            StreamBuilder(
              stream: ref.watch(calendarViewModel).integrationErrors,
              builder: (context, snapshot) => snapshot.hasError
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: ErrorHandlingRouter(
                        error: snapshot.error!,
                        stackTrace: snapshot.stackTrace,
                        isMutation: true,
                        errorHandlingViewType: ErrorHandlingViewType.textOnly,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
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

  Widget _syncWithDeviceCalendar(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      title: Text(
        context.tr("exportToDeviceCalendar"),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Switch(
        value: ref.watch(syncCalendarWithDevice),
        onChanged: (value) async {
          if (value) {
            _showEnableExportDialog(context, ref);
          } else {
            _showDisableExportDialog(context, ref);
          }
        },
      ),
    );
  }

  void _showEnableExportDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          context.tr("exportToDeviceCalendar"),
          textAlign: TextAlign.center,
        ),
        content: Text(context.tr("exportCalendarDescription")),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.tr("cancel")),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
              try {
                final success = await ref
                    .read(calendarViewModel)
                    .enableCalendarSync();
                if (success) {
                  ref.read(syncCalendarWithDevice.notifier).state = true;
                }
              } catch (error, stack) {
                if (context.mounted) {
                  showErrorSnackBar(
                    context,
                    error,
                    stackTrace: stack,
                    isMutation: true,
                  );
                }
              }
            },
            child: Text(context.tr("enable")),
          ),
        ],
      ),
    );
  }

  void _showDisableExportDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          context.tr("removeExportedCalendar"),
          textAlign: TextAlign.center,
        ),
        content: Text(context.tr("removeExportedCalendarDescription")),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.tr("cancel")),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.redAccent),
            ),
            onPressed: () async {
              Navigator.of(context).pop();
              try {
                await ref.read(calendarViewModel).disableCalendarSync();
                ref.read(syncCalendarWithDevice.notifier).state = false;
              } catch (error, stack) {
                if (context.mounted) {
                  showErrorSnackBar(
                    context,
                    error,
                    stackTrace: stack,
                    isMutation: true,
                  );
                }
              }
            },
            child: Text(context.tr("remove")),
          ),
        ],
      ),
    );
  }
}
