import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView(this.details, {super.key});

  final CalendarAppointmentDetails details;

  @override
  Widget build(BuildContext context) {
    final appointment = details.appointments.first as CalendarEvent;
    final color = appointment.getEventColor(context);
    return Container(
      height: details.bounds.height,
      width: details.bounds.width,
      decoration: BoxDecoration(
          color: color.withOpacity(0.5),
          border: Border(left: BorderSide(color: color, width: 5.0))),
      child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 4,
                  child: Text(
                    appointment.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        decoration: appointment.isCanceled
                            ? TextDecoration.lineThrough
                            : null,
                        decorationColor: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )),
              Expanded(
                  flex: 3,
                  child: Text(
                    appointment.location.toString(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        decoration: appointment.isCanceled
                            ? TextDecoration.lineThrough
                            : null,
                        decorationColor: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )),
              Expanded(
                  flex: 3,
                  child: Text(
                    appointment.timeDatePeriod.toString(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        decoration: appointment.isCanceled
                            ? TextDecoration.lineThrough
                            : null,
                        decorationColor: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )),
            ],
          )),
    );
  }
}
