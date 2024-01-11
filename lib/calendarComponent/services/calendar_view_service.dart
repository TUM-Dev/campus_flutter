import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/custom_event_view.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  showModalSheet(
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
      showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        showDragHandle: true,
        context: context,
        builder: (context) {
          return DraggableScrollableSheet(
            initialChildSize: 1,
            minChildSize: 1,
            builder: (context, scrollController) {
              return LectureDetailsView(
                event: calendarEvent,
                scrollController: scrollController,
              );
            },
          );
        },
      );
    } else if (calendarEvent != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            calendarEvent!.title,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          content: CustomEventView(calendarEvent: calendarEvent),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
              ),
              onPressed: () {
                ref
                    .read(calendarViewModel)
                    .deleteCalendarElement(calendarEvent!.id)
                    .then((value) => Navigator.pop(context));
              },
              child: Text(context.localizations.delete),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Okay"),
            ),
          ],
        ),
      );
    }
  }
}
