import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_view_service.dart';
import 'package:campus_flutter/homeComponent/split_view_viewmodel.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_details_view.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CalendarHomeWidgetEventView extends ConsumerWidget {
  const CalendarHomeWidgetEventView({super.key, required this.calendarEvent});

  final CalendarEvent calendarEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String startTime =
        DateFormat(DateFormat.HOUR24_MINUTE, context.localizations.localeName)
            .format(calendarEvent.startDate);
    final String endTime =
        DateFormat(DateFormat.HOUR24_MINUTE, context.localizations.localeName)
            .format(calendarEvent.endDate);
    final DateTime today = DateTime.now();
    final DateTime todayDate = DateTime(today.year, today.month, today.day);
    final DateTime tomorrowDate = DateTime(today.year, today.month, today.day)
        .add(const Duration(days: 1));
    final DateTime startDate = DateTime(
      calendarEvent.startDate.year,
      calendarEvent.startDate.month,
      calendarEvent.startDate.day,
    );

    return GestureDetector(
      onTap: () {
        if (MediaQuery.orientationOf(context) == Orientation.portrait) {
          getIt<CalendarViewService>()
              .showModalSheet(null, calendarEvent, context, ref);
        } else {
          ref.read(homeSplitViewModel).selectedWidget.add(
                LectureDetailsView(
                  event: calendarEvent,
                ),
              );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //const Spacer(),
          Text(
            startDate.isAtSameMomentAs(todayDate)
                ? context.localizations.today
                : startDate.isAtSameMomentAs(tomorrowDate)
                    ? context.localizations.tomorrow
                    : DateFormat(
                        "EEEE, d. MMM",
                        context.localizations.localeName,
                      ).format(calendarEvent.startDate),
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.halfPadding),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: calendarEvent.getEventColor(context),
                  width: 2.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    calendarEvent.title,
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
                    calendarEvent.location ?? context.localizations.unknown,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ),
          //const Spacer()
        ],
      ),
    );
  }
}
