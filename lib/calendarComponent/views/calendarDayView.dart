import 'package:campus_flutter/calendarComponent/model/calendarDataSource.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendarViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarDayView extends StatelessWidget {
  const CalendarDayView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider
            .of<CalendarViewModel>(context, listen: true)
            .events
            .stream,
        builder: (context, snapshot) {
          return Expanded(child: SfCalendar(
            view: CalendarView.day,
            dataSource: snapshot.hasData
                ? MeetingDataSource(snapshot.data!)
                : null,
          ));
        });
  }
}