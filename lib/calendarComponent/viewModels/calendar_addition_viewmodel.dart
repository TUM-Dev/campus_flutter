import 'package:campus_flutter/calendarComponent/model/calendar_editing.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_service.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/calendars_view.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final calendarAdditionViewModel =
    Provider.autoDispose.family<CalendarAdditionViewModel, CalendarEvent?>(
  (ref, calendarEvent) {
    if (calendarEvent != null) {
      return CalendarAdditionViewModel.edit(ref, calendarEvent);
    } else {
      return CalendarAdditionViewModel(ref);
    }
  },
);

class CalendarAdditionViewModel {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController annotationController = TextEditingController();
  final BehaviorSubject<bool> isValid = BehaviorSubject.seeded(false);
  late final BehaviorSubject<DateTime> from;
  late final BehaviorSubject<DateTime> to;

  String? id;
  final Ref ref;

  CalendarAdditionViewModel(this.ref) {
    final date = ref.read(selectedDate);
    from = BehaviorSubject.seeded(date.$1 ?? DateTime.now());
    to = BehaviorSubject.seeded(
      (date.$1 ?? DateTime.now()).add(const Duration(hours: 1)),
    );
  }

  CalendarAdditionViewModel.edit(this.ref, CalendarEvent calendarEvent) {
    titleController.text = calendarEvent.title ?? "";
    annotationController.text = calendarEvent.description ?? "";
    from = BehaviorSubject.seeded(calendarEvent.startDate);
    to = BehaviorSubject.seeded(calendarEvent.endDate);
    id = calendarEvent.id;
    isValid.value = true;
  }

  void setFromDate(DateTime? dateTime) {
    if (dateTime != null) {
      from.add(
        DateTime(
          dateTime.year,
          dateTime.month,
          dateTime.day,
          from.value.hour,
          from.value.minute,
        ),
      );
      to.add(
        DateTime(
          dateTime.year,
          dateTime.month,
          dateTime.day,
          from.value.hour,
          from.value.minute,
          0,
        ),
      );
    }
  }

  void setFromTimeOfDay(TimeOfDay? timeOfDay) {
    if (timeOfDay != null) {
      from.add(
        DateTime(
          from.value.year,
          from.value.month,
          from.value.day,
          timeOfDay.hour,
          timeOfDay.minute,
          0,
        ),
      );
    }
  }

  void setToDate(DateTime? dateTime) {
    if (dateTime != null) {
      to.add(
        DateTime(
          dateTime.year,
          dateTime.month,
          dateTime.day,
          to.value.hour,
          to.value.minute,
          0,
        ),
      );
    }
  }

  void setToTimeOfDay(TimeOfDay? timeOfDay) {
    if (timeOfDay != null) {
      to.add(
        DateTime(
          to.value.year,
          to.value.month,
          to.value.day,
          timeOfDay.hour,
          timeOfDay.minute,
          0,
        ),
      );
    }
  }

  Future<void> saveEvent() async {
    if (id != null) {
      await CalendarService.deleteCalendarEvent(id!);
    }
    final response = await CalendarService.createCalendarEvent(
      AddedCalendarEvent(
        title: titleController.text,
        annotation: annotationController.text.isEmpty
            ? null
            : annotationController.text,
        from: from.value,
        to: to.value,
      ),
    );
    await ref.read(calendarViewModel).fetch(true);
    if (ref
            .read(calendarViewModel)
            .events
            .value
            ?.firstWhereOrNull((e) => e.id == response.eventId) ==
        null) {
      ref.read(calendarViewModel).events.value?.add(
            CalendarEvent(
              id: response.eventId,
              status: "FT",
              title: titleController.text,
              startDate: from.value,
              endDate: to.value,
              locations: [],
            ),
          );
    }
  }

  void checkValidity() {
    if (titleController.text.isNotEmpty) {
      isValid.add(true);
    } else {
      isValid.add(false);
    }
  }
}
