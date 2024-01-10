import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_addition_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/event_creation_date_time_picker.dart';
import 'package:campus_flutter/calendarComponent/views/event_creation_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventCreationScaffold extends ConsumerWidget {
  const EventCreationScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(context.localizations.createCalendarEvent),
      ),
      body: const EventCreationView(),
    );
  }
}

class EventCreationView extends ConsumerWidget {
  const EventCreationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            EventCreationFormField(
              title: context.localizations.title,
              controller: ref.read(calendarAdditionViewModel).titleController,
              maxLength: 255,
              maxLines: 2,
            ),
            EventCreationFormField(
              title: context.localizations.annotation,
              controller:
                  ref.read(calendarAdditionViewModel).annotationController,
              maxLength: 4000,
              maxLines: 200,
            ),
            EventCreationDateTimePicker(
              title: context.localizations.from,
              currentDate: ref.watch(calendarAdditionViewModel).from,
              onDateSet: ref.read(calendarAdditionViewModel).setFromDate,
              onTimeOfDaySet:
                  ref.read(calendarAdditionViewModel).setFromTimeOfDay,
            ),
            EventCreationDateTimePicker(
              title: context.localizations.to,
              currentDate: ref.watch(calendarAdditionViewModel).to,
              onDateSet: ref.read(calendarAdditionViewModel).setToDate,
              onTimeOfDaySet:
                  ref.read(calendarAdditionViewModel).setToTimeOfDay,
            ),
            _submitButton(ref),
          ],
        ),
      ),
    );
  }

  Widget _submitButton(WidgetRef ref) {
    return StreamBuilder(
      stream: ref.watch(calendarAdditionViewModel).isValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: (snapshot.data ?? false)
              ? () =>
                  ref.read(calendarAdditionViewModel).saveEvent().then((value) {
                    ref.invalidate(calendarAdditionViewModel);
                    Navigator.pop(context);
                  })
              : null,
          child: Text(context.localizations.submit),
        );
      },
    );
  }
}
