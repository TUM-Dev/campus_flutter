import 'package:campus_flutter/calendarComponent/model/calendar_data_source.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_view_service.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/appointment_view.dart';
import 'package:campus_flutter/calendarComponent/views/calendars_view.dart';
import 'package:campus_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarMonthView extends ConsumerWidget {
  const CalendarMonthView({
    super.key,
    required this.calendarController,
  });

  final CalendarController calendarController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: StreamBuilder(
        stream: ref.watch(calendarViewModel).events,
        builder: (context, snapshot) => SfCalendar(
          view: CalendarView.month,
          controller: calendarController,
          monthViewSettings: const MonthViewSettings(
            showAgenda: true,
            agendaItemHeight: 75,
            navigationDirection: MonthNavigationDirection.vertical,
          ),
          dataSource: MeetingDataSource(
            snapshot.data ?? [],
            context,
          ),
          firstDayOfWeek: 1,
          showDatePickerButton: true,
          showNavigationArrow: true,
          maxDate: getIt<CalendarViewService>().maxDate(ref),
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
                  (details.date, CalendarView.month);
            }
          },
          appointmentBuilder: (context, details) => AppointmentView(details),
        ),
      ),
    );
  }
}
