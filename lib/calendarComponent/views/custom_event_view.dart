import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/color_picker_view.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/util/last_updated_text.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_preference_service.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/visibility_button_view.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/studiesComponent/view/lectureDetail/basic_lecture_info_row_view.dart';
import 'package:campus_flutter/studiesComponent/view/lectureDetail/lecture_info_card_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomEventScaffold extends ConsumerWidget {
  const CustomEventScaffold({super.key, required this.calendarEvent});

  final CalendarEvent calendarEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        actions: [
          VisibilityButtonView(
            id: calendarEvent.lvNr ?? calendarEvent.id,
            isVisible: calendarEvent.isVisible,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.padding),
            child: ColorPickerView(
              color: calendarEvent.getColor(),
              onColorChanged: (color) {
                ref
                    .read(calendarViewModel)
                    .setEventColor(
                      calendarEvent.lvNr ?? calendarEvent.id,
                      color,
                    );
              },
            ),
          ),
        ],
      ),
      body: CustomEventDetailsView(calendarEvent: calendarEvent),
    );
  }
}

class CustomEventDetailsView extends ConsumerWidget {
  const CustomEventDetailsView({super.key, required this.calendarEvent});

  final CalendarEvent calendarEvent;

  bool get isSeries =>
      getIt<CalendarPreferenceService>().getSeriesId(calendarEvent.id) != null;

  Future<bool> _confirmDelete(
    BuildContext context, {
    required String title,
    required String message,
  }) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(title, textAlign: TextAlign.center),
        content: Text(message),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(context.tr("cancel")),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.redAccent),
            ),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(context.tr("delete")),
          ),
        ],
      ),
    );

    return shouldDelete ?? false;
  }

  Future<void> _deleteEvent(BuildContext context, WidgetRef ref) async {
    final confirmed = await _confirmDelete(
      context,
      title: context.tr("confirmDeleteEventTitle"),
      message: context.tr("confirmDeleteEventMessage"),
    );
    if (!confirmed) return;

    await ref.read(calendarViewModel).deleteCustomCalendarEvent(calendarEvent);
    if (context.mounted) context.pop();
  }

  Future<void> _deleteSeries(BuildContext context, WidgetRef ref) async {
    final seriesCount = ref
        .read(calendarViewModel)
        .getSeriesEventCount(calendarEvent);
    final confirmed = await _confirmDelete(
      context,
      title: context.tr("confirmDeleteSeriesTitle"),
      message: context.tr(
        "confirmDeleteSeriesMessage",
        args: [seriesCount.toString()],
      ),
    );
    if (!confirmed) return;

    await ref.read(calendarViewModel).deleteRecurringSeries(calendarEvent);
    if (context.mounted) context.pop();
  }

  CalendarEvent _latestEvent(WidgetRef ref) {
    return ref
            .read(calendarViewModel)
            .events
            .value
            ?.firstWhere(
              (event) => event.id == calendarEvent.id,
              orElse: () => calendarEvent,
            ) ??
        calendarEvent;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastFetched = ref.read(calendarViewModel).lastFetched.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      calendarEvent.title ?? "-",
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  if (isSeries) ...[
                    const SizedBox(width: 12),
                    const _SeriesIndicator(),
                  ],
                ],
              ),
              if (!isSeries)
                Text(context.tr("customEvent"), textAlign: TextAlign.start),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 3.0)),
        if (lastFetched != null) LastUpdatedText(lastFetched),
        Expanded(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    LectureInfoCardView(
                      icon: Icons.info_outline_rounded,
                      title: context.tr("details"),
                      widgets: [
                        BasicLectureInfoRowView(
                          information: calendarEvent.timePeriodText(context),
                          iconData: Icons.access_time_rounded,
                        ),
                        if (calendarEvent.description != null)
                          ListTile(
                            dense: true,
                            leading: const Icon(Icons.notes_rounded, size: 20),
                            title: Text(calendarEvent.description!),
                          ),
                      ],
                    ),
                    LectureInfoCardView(
                      icon: Icons.tune_rounded,
                      title: context.tr("actions"),
                      widgets: [
                        ListTile(
                          dense: true,
                          leading: const Icon(Icons.edit_rounded, size: 20),
                          title: Text(
                            context.tr(isSeries ? "editSeries" : "editEvent"),
                          ),
                          onTap: () async {
                            final shouldClose = await context.push<bool>(
                              eventCreation,
                              extra: _latestEvent(ref),
                            );
                            if (shouldClose == true && context.mounted) {
                              context.pop();
                            }
                          },
                        ),
                        ListTile(
                          dense: true,
                          leading: Icon(
                            Icons.delete_outline_rounded,
                            size: 20,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          title: Text(
                            isSeries
                                ? context.tr("deleteThisEvent")
                                : context.tr("delete"),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                          onTap: () =>
                              _deleteEvent(context, ref).catchError((error) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(error.toString()),
                                      backgroundColor: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                    ),
                                  );
                                }
                              }),
                        ),
                        if (isSeries)
                          ListTile(
                            dense: true,
                            leading: Icon(
                              Icons.delete_sweep_rounded,
                              size: 20,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            title: Text(
                              context.tr("deleteSeries"),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                            onTap: () =>
                                _deleteSeries(context, ref).catchError((error) {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(error.toString()),
                                        backgroundColor: Theme.of(
                                          context,
                                        ).colorScheme.error,
                                      ),
                                    );
                                  }
                                }),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SeriesIndicator extends StatelessWidget {
  const _SeriesIndicator();

  @override
  Widget build(BuildContext context) {
    final color = context.primaryColor;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.repeat_rounded, size: 16, color: color),
            const SizedBox(width: 6),
            Text(
              context.tr("series"),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
