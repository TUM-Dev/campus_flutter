import 'package:campus_flutter/calendarComponent/model/calendarDataSource.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendarViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'calendarsView.dart';

class CalendarMonthView extends StatelessWidget {
  const CalendarMonthView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider
            .of<CalendarViewModel>(context, listen: true)
            .events
            .stream,
        builder: (context, snapshot) {
          return Expanded(child: SfCalendar(
            view: CalendarView.month,
            monthViewSettings: const MonthViewSettings(
                showAgenda: true,
                navigationDirection: MonthNavigationDirection.vertical),
            dataSource: snapshot.hasData
                ? MeetingDataSource(snapshot.data!, context)
                : null,
            firstDayOfWeek: 1,
            showDatePickerButton: true,
            showNavigationArrow: true,
            onTap: (details) {
              showModalSheet(details, context);
            },
          ));
        });
  }
}