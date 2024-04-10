import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/util/last_updated_text.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/calendar_day_view.dart';
import 'package:campus_flutter/calendarComponent/views/calendar_month_view.dart';
import 'package:campus_flutter/calendarComponent/views/calendar_week_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:campus_flutter/base/extensions/context.dart';

final selectedDate = StateProvider<(DateTime?, CalendarView?)>(
  (ref) => (null, null),
);

final calendarsKey = GlobalKey<_CalendarsViewState>(
  debugLabel: "calendarsKey",
);

class CalendarsView extends ConsumerStatefulWidget {
  CalendarsView({Key? key}) : super(key: calendarsKey);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarsViewState();
}

class _CalendarsViewState extends ConsumerState<CalendarsView>
    with AutomaticKeepAliveClientMixin<CalendarsView> {
  late int _selectedCalendarTab;

  final CalendarController dayController = CalendarController();
  final CalendarController weekController = CalendarController();
  final CalendarController monthController = CalendarController();

  @override
  void initState() {
    ref.read(calendarViewModel).fetch(false);
    ref
        .read(selectedDate.notifier)
        .addListener((state) => _selectedDateListener(state));
    _selectedCalendarTab = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder(
      stream: ref.watch(calendarViewModel).events,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final lastFetched = ref.read(calendarViewModel).lastFetched.value;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedCalendarTab = 0;
                          dayController.displayDate = DateTime.now();
                        });
                      },
                      child: Text(
                        context.localizations.calendarViewToday,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                    ),
                    Expanded(
                      child: SegmentedButton(
                        showSelectedIcon: false,
                        segments: <ButtonSegment>[
                          ButtonSegment(
                            value: 0,
                            label: Text(
                              context.localizations.calendarViewDay,
                            ),
                          ),
                          ButtonSegment(
                            value: 1,
                            label: Text(
                              context.localizations.calendarViewWeek,
                            ),
                          ),
                          ButtonSegment(
                            value: 2,
                            label: Text(
                              context.localizations.calendarViewMonth,
                            ),
                          ),
                        ],
                        selected: {
                          _selectedCalendarTab,
                        },
                        onSelectionChanged: (newSelection) => setState(() {
                          _selectedCalendarTab = newSelection.first;
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.halfPadding),
              ),
              if (lastFetched != null) LastUpdatedText(lastFetched),
              <Widget>[
                CalendarDayView(calendarController: dayController),
                CalendarWeekView(
                  calendarController: weekController,
                ),
                CalendarMonthView(
                  calendarController: monthController,
                ),
              ][_selectedCalendarTab],
            ],
          );
        } else if (snapshot.hasError) {
          return ErrorHandlingRouter(
            error: snapshot.error!,
            errorHandlingViewType: ErrorHandlingViewType.fullScreen,
            retry: ref.read(calendarViewModel).fetch,
          );
        } else {
          return DelayedLoadingIndicator(
            name: context.localizations.calendar,
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _selectedDateListener((DateTime?, CalendarView?) state) {
    switch (state.$2) {
      case CalendarView.day:
        weekController.selectedDate = state.$1;
        weekController.displayDate = state.$1;
        monthController.selectedDate = state.$1;
        monthController.displayDate = state.$1;
      case CalendarView.week:
        dayController.selectedDate = state.$1;
        dayController.displayDate = state.$1;
        monthController.selectedDate = state.$1;
        monthController.displayDate = state.$1;
      case CalendarView.month:
        dayController.selectedDate = state.$1;
        dayController.displayDate = state.$1;
        weekController.selectedDate = state.$1;
        weekController.displayDate = state.$1;
      default:
    }
  }
}
