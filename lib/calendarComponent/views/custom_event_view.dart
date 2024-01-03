import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:flutter/material.dart';

class CustomEventView extends StatelessWidget {
  const CustomEventView({
    super.key,
    required this.calendarEvent,
  });

  final CalendarEvent calendarEvent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _infoEntry(
          context.localizations.timeFrame,
          Text(calendarEvent.timePeriodText(context)),
          context,
        ),
        if (calendarEvent.description != null)
          _infoEntry(
            context.localizations.annotation,
            Text(
              calendarEvent.description!,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
            ),
            context,
          ),
      ],
    );
  }

  Widget _infoEntry(String title, Widget child, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          child,
        ],
      ),
    );
  }
}
