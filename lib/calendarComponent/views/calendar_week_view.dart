import 'package:campus_flutter/calendarComponent/model/calendar_data_source.dart';
import 'package:campus_flutter/calendarComponent/views/calendars_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWeekView extends ConsumerWidget {
  const CalendarWeekView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
        child: SfCalendar(
      view: CalendarView.week,
      dataSource: MeetingDataSource(
          ref.read(calendarViewModel).events.value ?? [], context),
      onTap: (details) {
        showModalSheet(details, null, context, ref);
      },
      firstDayOfWeek: 1,
      showDatePickerButton: true,
      headerDateFormat: "",
      showWeekNumber: true,
      showNavigationArrow: true,
    ));
  }
}
