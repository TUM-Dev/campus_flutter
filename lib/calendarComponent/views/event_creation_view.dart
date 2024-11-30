import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_addition_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/event_creation_date_time_picker.dart';
import 'package:campus_flutter/calendarComponent/views/event_creation_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EventCreationScaffold extends ConsumerWidget {
  const EventCreationScaffold({
    super.key,
    required this.calendarEvent,
  });

  final CalendarEvent? calendarEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
          onPressed: () {
            ref.invalidate(calendarAdditionViewModel(calendarEvent));
            context.pop();
          },
        ),
        title: Text(context.tr("createCalendarEvent")),
      ),
      body: EventCreationView(
        calendarEvent: calendarEvent,
      ),
    );
  }
}

class EventCreationView extends ConsumerWidget {
  const EventCreationView({
    super.key,
    required this.calendarEvent,
  });

  final CalendarEvent? calendarEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            EventCreationFormField(
              title: context.tr("title"),
              controller: ref
                  .read(calendarAdditionViewModel(calendarEvent))
                  .titleController,
              maxLength: 255,
              maxLines: 2,
              calendarEvent: calendarEvent,
            ),
            EventCreationFormField(
              title: context.tr("annotation"),
              controller: ref
                  .read(calendarAdditionViewModel(calendarEvent))
                  .annotationController,
              maxLength: 4000,
              maxLines: 200,
              calendarEvent: calendarEvent,
            ),
            EventCreationDateTimePicker(
              title: context.tr("from"),
              currentDate:
                  ref.watch(calendarAdditionViewModel(calendarEvent)).from,
              onDateSet: ref
                  .read(calendarAdditionViewModel(calendarEvent))
                  .setFromDate,
              onTimeOfDaySet: ref
                  .read(calendarAdditionViewModel(calendarEvent))
                  .setFromTimeOfDay,
            ),
            EventCreationDateTimePicker(
              title: context.tr("to"),
              currentDate:
                  ref.watch(calendarAdditionViewModel(calendarEvent)).to,
              onDateSet:
                  ref.read(calendarAdditionViewModel(calendarEvent)).setToDate,
              onTimeOfDaySet: ref
                  .read(calendarAdditionViewModel(calendarEvent))
                  .setToTimeOfDay,
            ),
            _submitButton(ref),
          ],
        ),
      ),
    );
  }

  Widget _submitButton(WidgetRef ref) {
    return StreamBuilder(
      stream: ref.watch(calendarAdditionViewModel(calendarEvent)).isValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: (snapshot.data ?? false)
              ? () => ref
                      .read(calendarAdditionViewModel(calendarEvent))
                      .saveEvent()
                      .then((value) {
                    if (context.mounted) {
                      ref.invalidate(calendarAdditionViewModel);
                      context.canPop() ? context.pop() : context.go(calendar);
                    }
                  })
              : null,
          child: Text(context.tr("submit")),
        );
      },
    );
  }
}
