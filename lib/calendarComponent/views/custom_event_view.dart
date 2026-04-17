import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/color_picker_view.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/visibility_button_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomEventView extends ConsumerWidget {
  const CustomEventView({
    super.key,
    required this.calendarEvent,
    required this.canDeleteSeries,
    required this.isSeries,
  });

  final CalendarEvent calendarEvent;
  final bool canDeleteSeries;
  final bool isSeries;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.padding),
            child: Text(
              calendarEvent.title ?? "-",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          if (isSeries) ...[
            const SizedBox(height: 6),
            Chip(
              avatar: const Icon(Icons.repeat_rounded, size: 16),
              label: Text(context.tr("series")),
              visualDensity: VisualDensity.compact,
            ),
          ],
          const SizedBox(height: 8),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.access_time_rounded),
            title: Text(calendarEvent.timePeriodText(context)),
          ),
          if (calendarEvent.description != null)
            ListTile(
              leading: const Icon(Icons.notes_rounded),
              title: Text(
                calendarEvent.description!,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.palette_rounded),
            title: Text(context.tr("color")),
            trailing: ColorPickerView(
              color: calendarEvent.getColor(),
              onColorChanged: (color) {
                ref.read(calendarViewModel).setEventColor(
                  calendarEvent.lvNr ?? calendarEvent.id,
                  color,
                );
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.visibility_rounded),
            title: Text(context.tr("visibility")),
            trailing: VisibilityButtonView(
              id: calendarEvent.lvNr ?? calendarEvent.id,
              isVisible: calendarEvent.isVisible,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit_rounded),
            title: Text(context.tr("edit")),
            onTap: () {
              context.pop();
              context.push(eventCreation, extra: calendarEvent);
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.delete_outline_rounded,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(
              canDeleteSeries
                  ? context.tr("deleteThisEvent")
                  : context.tr("delete"),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            onTap: () {
              ref
                  .read(calendarViewModel)
                  .deleteCustomCalendarEvent(calendarEvent)
                  .then((_) {
                    if (context.mounted) context.pop();
                  })
                  .catchError((error) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error.toString()),
                          backgroundColor:
                              Theme.of(context).colorScheme.error,
                        ),
                      );
                    }
                  });
            },
          ),
          if (canDeleteSeries)
            ListTile(
              leading: Icon(
                Icons.delete_sweep_rounded,
                color: Theme.of(context).colorScheme.error,
              ),
              title: Text(
                context.tr("deleteThisAndFollowing"),
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              onTap: () {
                ref
                    .read(calendarViewModel)
                    .deleteRecurringSeriesFrom(calendarEvent)
                    .then((_) {
                      if (context.mounted) context.pop();
                    })
                    .catchError((error) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error.toString()),
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                          ),
                        );
                      }
                    });
              },
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
