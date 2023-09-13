import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/last_updated_text.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/views/calendar_day_view.dart';
import 'package:campus_flutter/calendarComponent/views/calendar_month_view.dart';
import 'package:campus_flutter/calendarComponent/views/calendar_week_view.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_details_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalendarsView extends ConsumerStatefulWidget {
  const CalendarsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarsViewState();
}

class _CalendarsViewState extends ConsumerState<CalendarsView> {
  int _selectedCalendarTab = 0;

  final CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    ref.read(calendarViewModel).fetch(false);
    super.initState();
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
                          child: Text(AppLocalizations.of(context)!.calendarViewToday,
                              style: Theme.of(context).textTheme.titleMedium)),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                      Expanded(
                          child: CupertinoSlidingSegmentedControl(
                              children: {
                                0: Text(AppLocalizations.of(context)!.calendarViewDay),
                                1: Text(AppLocalizations.of(context)!.calendarViewWeek),
                                2: Text(AppLocalizations.of(context)!.calendarViewMonth)
                              },
                              onValueChanged: (i) {
                                setState(() {
                                  _selectedCalendarTab = i ?? 0;
                                });
                              },
                              groupValue: _selectedCalendarTab))
                    ],
                  )),
              if(lastFetched != null) LastUpdatedText(lastFetched),
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
            return DelayedLoadingIndicator(name: AppLocalizations.of(context)!.calendar);
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

  ref.read(selectedEvent.notifier).state = calendarEvent;
  ref.read(selectedLecture.notifier).state = null;

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
                return LectureDetailsView(scrollController: scrollController);
              });
        });
  }
}
