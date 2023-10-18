import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/last_updated_text.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/views/calendar_day_view.dart';
import 'package:campus_flutter/calendarComponent/views/calendar_month_view.dart';
import 'package:campus_flutter/calendarComponent/views/calendar_week_view.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_details_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:campus_flutter/theme.dart';

class CalendarsView extends ConsumerStatefulWidget {
  const CalendarsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarsViewState();
}

class _CalendarsViewState extends ConsumerState<CalendarsView> {
  late int _selectedCalendarTab;

  final CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    ref.read(calendarViewModel).fetch(false);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _selectedCalendarTab =
        MediaQuery.orientationOf(context) == Orientation.landscape ? 1 : 0;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(calendarViewModel).events,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final lastFetched = ref.read(calendarViewModel).lastFetched.value;
            return Column(children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              _selectedCalendarTab = 0;
                              _calendarController.displayDate = DateTime.now();
                            });
                          },
                          child: Text(context.localizations.calendarViewToday,
                              style: Theme.of(context).textTheme.titleMedium)),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0)),
                      Expanded(
                          child: SegmentedButton(
                              segments: <ButtonSegment>[
                            ButtonSegment(
                                value: 0,
                                label:
                                    Text(context.localizations.calendarViewDay),
                                icon: const Icon(Icons.calendar_view_day)),
                            ButtonSegment(
                                value: 1,
                                label: Text(
                                    context.localizations.calendarViewWeek),
                                icon: const Icon(Icons.calendar_view_week)),
                            ButtonSegment(
                                value: 2,
                                label: Text(
                                    context.localizations.calendarViewMonth),
                                icon: const Icon(Icons.calendar_view_month)),
                          ],
                              selected: {
                            _selectedCalendarTab
                          },
                              onSelectionChanged: (newSelection) =>
                                  setState(() {
                                    _selectedCalendarTab = newSelection.first;
                                  })))
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: context.halfPadding)),
              if (lastFetched != null) LastUpdatedText(lastFetched),
              <Widget>[
                CalendarDayView(calendarController: _calendarController),
                const CalendarWeekView(),
                const CalendarMonthView()
              ][_selectedCalendarTab]
            ]);
          } else if (snapshot.hasError) {
            return ErrorHandlingView(
                error: snapshot.error!,
                errorHandlingViewType: ErrorHandlingViewType.fullScreen,
                retry: ref.read(calendarViewModel).fetch);
          } else {
            return DelayedLoadingIndicator(
                name: context.localizations.calendar);
          }
        });
  }
}

showModalSheet(CalendarTapDetails? details, CalendarEvent? event,
    BuildContext context, WidgetRef ref) {
  CalendarEvent? calendarEvent;
  if (details != null) {
    if (details.targetElement == CalendarElement.appointment &&
        details.appointments!.isNotEmpty) {
      calendarEvent = details.appointments?.first as CalendarEvent;
    }
  } else if (event != null) {
    calendarEvent = event;
  }

  if (calendarEvent != null) {
    showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        showDragHandle: true,
        context: context,
        builder: (context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 1,
              builder: (context, scrollController) {
                return LectureDetailsView(
                    event: calendarEvent, scrollController: scrollController);
              });
        });
  }
}
