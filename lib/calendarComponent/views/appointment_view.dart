import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView(this.details, {super.key});

  final CalendarAppointmentDetails details;

  @override
  Widget build(BuildContext context) {
    final calendarEvent = details.appointments.first as CalendarEvent;
    final color = calendarEvent.getEventColor(context);
    return Container(
      height: details.bounds.height / 4,
      width: details.bounds.width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: color.withOpacity(0.5),
        border: Border(left: BorderSide(color: color, width: 5.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _eventTitle(
              calendarEvent.title,
              calendarEvent.duration,
              calendarEvent.isCanceled,
              context,
            ),
            if (calendarEvent.duration
                    .compareTo(const Duration(hours: 0, minutes: 45)) >
                0)
              _eventLocation(
                calendarEvent.location ?? context.localizations.unknown,
                calendarEvent.isCanceled,
                context,
              ),
            if (calendarEvent.endDate
                    .difference(calendarEvent.startDate)
                    .compareTo(const Duration(hours: 1, minutes: 30)) >=
                0)
              _eventTime(
                calendarEvent.dateTimePeriod(context),
                calendarEvent.isCanceled,
                context,
              ),
          ],
        ),
      ),
    );
  }

  Widget _eventTitle(
    String title,
    Duration duration,
    bool isCanceled,
    BuildContext context,
  ) {
    return Expanded(
      flex: 4,
      child: Text(
        title,
        style: duration.compareTo(const Duration(minutes: 60)) >= 0
            ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  decoration: isCanceled ? TextDecoration.lineThrough : null,
                  decorationColor: Colors.white,
                )
            : Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  decoration: isCanceled ? TextDecoration.lineThrough : null,
                  decorationColor: Colors.white,
                ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  Widget _eventLocation(
    String location,
    bool isCanceled,
    BuildContext context,
  ) {
    return Expanded(
      flex: 3,
      child: Text(
        location.toString(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              decoration: isCanceled ? TextDecoration.lineThrough : null,
              decorationColor: Colors.white,
            ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  Widget _eventTime(
    String timeDatePeriod,
    bool isCanceled,
    BuildContext context,
  ) {
    return Expanded(
      flex: 3,
      child: Text(
        timeDatePeriod.toString(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              decoration: isCanceled ? TextDecoration.lineThrough : null,
              decorationColor: Colors.white,
            ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
