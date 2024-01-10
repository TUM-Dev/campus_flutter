import 'package:campus_flutter/calendarComponent/model/calendar_data_source.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_view_service.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/appointment_view.dart';
import 'package:campus_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarDayView extends ConsumerWidget {
  const CalendarDayView({super.key, required this.calendarController});

  final CalendarController calendarController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: StreamBuilder(
        stream: ref.watch(calendarViewModel).events,
        builder: (context, snapshot) => SfCalendar(
          controller: calendarController,
          showDatePickerButton: true,
          view: CalendarView.day,
          dataSource: MeetingDataSource(
            snapshot.data ?? [],
            context,
          ),
          onTap: (details) {
            getIt<CalendarViewService>()
                .showModalSheet(details, null, context, ref);
          },
          headerDateFormat: "EEEE, dd.MM.yyyy",
          showNavigationArrow: true,
          maxDate: getIt<CalendarViewService>().maxDate(ref),
          timeSlotViewSettings: const TimeSlotViewSettings(
            startHour: 7,
            endHour: 22,
            timeFormat: "HH:mm",
          ),
          appointmentBuilder: (context, details) => AppointmentView(details),
        ),
      ),
    );
  }
}
