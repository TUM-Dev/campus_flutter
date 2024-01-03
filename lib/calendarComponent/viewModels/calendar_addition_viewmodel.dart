import 'package:campus_flutter/calendarComponent/model/calendar_editing.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_service.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final calendarAdditionViewModel = Provider(
  (ref) => CalendarAdditionViewModel(ref),
);

class CalendarAdditionViewModel {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController annotationController = TextEditingController();
  final BehaviorSubject<bool> isValid = BehaviorSubject.seeded(false);
  final BehaviorSubject<DateTime> from = BehaviorSubject.seeded(DateTime.now());
  final BehaviorSubject<DateTime> to = BehaviorSubject.seeded(DateTime.now());

  final Ref ref;

  CalendarAdditionViewModel(this.ref);

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
    await CalendarService.createCalendarEvent(
      AddedCalendarEvent(
        title: titleController.text,
        annotation: annotationController.text.isEmpty
            ? null
            : annotationController.text,
        from: from.value,
        to: to.value,
      ),
    ).then((value) => ref.read(calendarViewModel).fetch(true));
  }

  void checkValidity() {
    if (titleController.text.isNotEmpty) {
      isValid.add(true);
    } else {
      isValid.add(false);
    }
  }
}
