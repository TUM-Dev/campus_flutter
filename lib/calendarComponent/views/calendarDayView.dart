import 'package:campus_flutter/calendarComponent/model/calendarDataSource.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendarViewModel.dart';
import 'package:campus_flutter/calendarComponent/views/calendarsView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarDayView extends StatelessWidget {
  const CalendarDayView({super.key, required this.calendarController});

  final CalendarController calendarController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            Provider.of<CalendarViewModel>(context, listen: true).events.stream,
        builder: (context, snapshot) {
          return Expanded(
              child: SfCalendar(
            controller: calendarController,
            showDatePickerButton: true,
            view: CalendarView.day,
            dataSource: snapshot.hasData
                ? MeetingDataSource(snapshot.data!, context)
                : null,
            onTap: (details) {
              showModalSheet(details, context);
            },
            headerDateFormat: "EEEE, dd.MM.yyyy",
            showNavigationArrow: true,
            timeSlotViewSettings: const TimeSlotViewSettings(
                startHour: 7,
                endHour: 22,
                timeFormat: "Hm"),
          ));
        });
  }
}
