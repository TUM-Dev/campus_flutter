import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/custom_event_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarViewService {
  DateTime? minDate(WidgetRef ref) {
    final firstDate =
        ref.read(calendarViewModel).events.value?.firstOrNull?.startDate;
    if (firstDate != null) {
      final today = DateTime.now();
      if (firstDate.isBefore(today)) {
        return DateTime(firstDate.year, firstDate.month, firstDate.day);
      } else {
        return DateTime(today.year, today.month, today.day);
      }
    } else {
      return null;
    }
  }

  DateTime? maxDate(WidgetRef ref) {
    final firstDate =
        ref.read(calendarViewModel).events.value?.lastOrNull?.endDate;
    if (firstDate != null) {
      return DateTime(firstDate.year, firstDate.month, firstDate.day, 23, 59);
    } else {
      return null;
    }
  }

  showDetails(
    CalendarTapDetails? details,
    CalendarEvent? event,
    BuildContext context,
    WidgetRef ref,
  ) {
    CalendarEvent? calendarEvent;
    if (details != null) {
      if (details.targetElement == CalendarElement.appointment &&
          details.appointments!.isNotEmpty) {
        calendarEvent = details.appointments?.first as CalendarEvent;
      }
    } else if (event != null) {
      calendarEvent = event;
    }

    if (calendarEvent != null && calendarEvent.url != null) {
      context.push(calendarDetails, extra: calendarEvent);
    } else if (calendarEvent != null) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text(
                calendarEvent!.title ?? "-",
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              content: CustomEventView(calendarEvent: calendarEvent),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.redAccent),
                  ),
                  onPressed: () {
                    ref
                        .read(calendarViewModel)
                        .deleteCalendarElement(calendarEvent!.id)
                        .then((value) {
                          if (context.mounted) {
                            context.pop();
                          }
                        });
                  },
                  child: Text(context.tr("delete")),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                    context.push(eventCreation, extra: calendarEvent);
                  },
                  child: Text(context.tr("edit")),
                ),
              ],
            ),
      );
    }
  }
}
