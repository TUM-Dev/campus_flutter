import 'package:campus_flutter/calendarComponent/model/calendarEvent.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarHomeWidgetEventView extends StatelessWidget {
  const CalendarHomeWidgetEventView({super.key, required this.calendarEvent});

  final CalendarEvent calendarEvent;

  @override
  Widget build(BuildContext context) {
    final String startTime = DateFormat(DateFormat.HOUR24_MINUTE).format(calendarEvent.startDate);
    final String endTime = DateFormat(DateFormat.HOUR24_MINUTE).format(calendarEvent.endDate);
    final DateTime today = DateTime.now();
    final DateTime tomorrow =
        DateTime(today.year, today.month, today.day).add(const Duration(days: 1));
    final DateTime startDate = DateTime(
        calendarEvent.startDate.year, calendarEvent.startDate.month, calendarEvent.startDate.day);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Text(startDate.isAtSameMomentAs(tomorrow)
            ? "Tomorrow"
            : DateFormat("EEEE, d. MMM").format(calendarEvent.startDate)),
        const Spacer(),
        Container(
            decoration: BoxDecoration(
                border:
                    Border(left: BorderSide(color: Theme.of(context).primaryColor, width: 2.0))),
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(calendarEvent.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium),
                  Text("$startTime - $endTime",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall),
                  Text(calendarEvent.location,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall)
                ],
              ),
            )),
        const Spacer()
      ],
    );
  }
}
