import 'package:campus_flutter/calendarComponent/model/calendarEvent.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendarViewModel.dart';
import 'package:campus_flutter/calendarComponent/views/calendarDayView.dart';
import 'package:campus_flutter/calendarComponent/views/calendarMonthView.dart';
import 'package:campus_flutter/calendarComponent/views/calendarWeekView.dart';
import 'package:campus_flutter/lectureComponent/viewModels/lectureDetailsViewModel.dart';
import 'package:campus_flutter/lectureComponent/views/lectureDetailsView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarsView extends StatefulWidget {
  const CalendarsView({super.key});

  @override
  State<StatefulWidget> createState() => _CalendarsViewState();
}

class _CalendarsViewState extends State<CalendarsView> {
  int _selectedCalendarTab = 0;

  final CalendarController _calendarController = CalendarController();

  final Map<int, Widget> calendarTabs = const {
    0: Text("Day"),
    1: Text("Week"),
    2: Text("Month")
  };

  @override
  void initState() {
    Provider.of<CalendarViewModel>(context, listen: false).fetchEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Text("Today",
                      style: Theme.of(context).textTheme.titleMedium)),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
              Expanded(
                  child: CupertinoSlidingSegmentedControl(
                      children: calendarTabs,
                      onValueChanged: (i) {
                        setState(() {
                          _selectedCalendarTab = i ?? 0;
                        });
                      },
                      groupValue: _selectedCalendarTab))
            ],
          )),
      <Widget>[
        CalendarDayView(calendarController: _calendarController),
        const CalendarWeekView(),
        const CalendarMonthView()
      ][_selectedCalendarTab]
    ]);
  }
}

showModalSheet(CalendarTapDetails details, BuildContext context) {
  if (details.targetElement == CalendarElement.appointment &&
      details.appointments!.isNotEmpty) {
    showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        showDragHandle: true,
        context: context,
        builder: (context) {
          var event = details.appointments?.first as CalendarEvent;
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 1,
              builder: (context, scrollController) {
                return Provider(
                    create: (context) => LectureDetailsViewModel(event: event),
                    child:
                        LectureDetailsView(scrollController: scrollController));
              });
        });
  }
}
