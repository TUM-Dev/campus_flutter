import 'package:campus_flutter/calendarComponent/model/calendar_data_source.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_view_service.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/calendars_view.dart';
import 'package:campus_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWeekView extends ConsumerWidget {
  const CalendarWeekView({
    super.key,
    required this.calendarController,
  });

  final CalendarController calendarController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: StreamBuilder(
        stream: ref.watch(calendarViewModel).events,
        builder: (context, snapshot) {
          return SfCalendar(
            view: CalendarView.week,
            controller: calendarController,
            dataSource: MeetingDataSource(
              snapshot.data ?? [],
              context,
            ),
            onTap: (details) {
              if (details.targetElement == CalendarElement.appointment) {
                getIt<CalendarViewService>().showDetails(
                  details,
                  null,
                  context,
                  ref,
                );
              } else {
                ref.read(selectedDate.notifier).state =
                    (details.date, CalendarView.week);
              }
            },
            firstDayOfWeek: 1,
            showDatePickerButton: true,
            headerDateFormat: "",
            showWeekNumber: true,
            showNavigationArrow: true,
            timeSlotViewSettings: const TimeSlotViewSettings(
              startHour: 7,
              endHour: 22,
              timeFormat: "HH:mm",
            ),
          );
        },
      ),
    );
  }
}
