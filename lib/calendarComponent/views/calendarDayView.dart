import 'package:campus_flutter/calendarComponent/model/calendarDataSource.dart';
import 'package:campus_flutter/calendarComponent/views/calendarsView.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarDayView extends ConsumerWidget {
  const CalendarDayView({super.key, required this.calendarController});

  final CalendarController calendarController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
        child: SfCalendar(
      controller: calendarController,
      showDatePickerButton: true,
      view: CalendarView.day,
      dataSource: MeetingDataSource(
          ref.read(calendarViewModel).events.value?.$2 ?? [], context),
      onTap: (details) {
        showModalSheet(details, null, context, ref);
      },
      headerDateFormat: "EEEE, dd.MM.yyyy",
      showNavigationArrow: true,
      timeSlotViewSettings: const TimeSlotViewSettings(
          startHour: 7, endHour: 22, timeFormat: "Hm"),
    ));
  }
}
