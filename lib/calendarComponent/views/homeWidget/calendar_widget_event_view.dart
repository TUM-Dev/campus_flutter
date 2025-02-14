import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_view_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarHomeWidgetEventView extends ConsumerWidget {
  const CalendarHomeWidgetEventView({super.key, required this.calendarEvent});

  final CalendarEvent calendarEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String startTime = DateFormat(
      DateFormat.HOUR24_MINUTE,
    ).format(calendarEvent.startDate);
    final String endTime = DateFormat(
      DateFormat.HOUR24_MINUTE,
    ).format(calendarEvent.endDate);
    final DateTime today = DateTime.now();
    final DateTime todayDate = DateTime(today.year, today.month, today.day);
    final DateTime tomorrowDate = DateTime(
      today.year,
      today.month,
      today.day,
    ).add(const Duration(days: 1));
    final DateTime startDate = DateTime(
      calendarEvent.startDate.year,
      calendarEvent.startDate.month,
      calendarEvent.startDate.day,
    );

    return InkWell(
      onTap: () {
        getIt<CalendarViewService>().showDetails(
          null,
          calendarEvent,
          context,
          ref,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            startDate.isAtSameMomentAs(todayDate)
                ? context.tr("today")
                : startDate.isAtSameMomentAs(tomorrowDate)
                ? context.tr("tomorrow")
                : DateFormat(
                  "EEEE, d. MMM",
                  context.locale.languageCode,
                ).format(calendarEvent.startDate),
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: context.halfPadding)),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: calendarEvent.getColor(), width: 2.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    calendarEvent.title ?? "-",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    "$startTime - $endTime",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    calendarEvent.locations.firstOrNull ??
                        context.tr("unknown"),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
