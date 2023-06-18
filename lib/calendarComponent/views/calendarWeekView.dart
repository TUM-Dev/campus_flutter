import 'package:campus_flutter/calendarComponent/model/calendarDataSource.dart';
import 'package:campus_flutter/calendarComponent/views/calendarsView.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWeekView extends ConsumerWidget {
  const CalendarWeekView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
        stream: ref.watch(calendarViewModel).events,
        /*stream: Provider
            .of<CalendarViewModel>(context, listen: true)
            .events
            .stream,*/
        builder: (context, snapshot) {
          return Expanded(child: SfCalendar(
            view: CalendarView.week,
            dataSource: snapshot.hasData
                ? MeetingDataSource(snapshot.data!, context)
                : null,
            onTap: (details) {
              showModalSheet(details, context, ref);
            },
            firstDayOfWeek: 1,
            showDatePickerButton: true,
            headerDateFormat: "",
            showWeekNumber: true,
            showNavigationArrow: true,
          ));
        });
  }
}