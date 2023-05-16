import 'package:campus_flutter/calendarComponent/viewModels/calendarViewModel.dart';
import 'package:campus_flutter/calendarComponent/views/calendarDayView.dart';
import 'package:campus_flutter/calendarComponent/views/calendarMonthView.dart';
import 'package:campus_flutter/calendarComponent/views/calendarWeekView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<StatefulWidget> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  int _selectedCalendarTab = 0;

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
                    });
                  },
                  child: const Text("Today")),
              Expanded(
                child: CupertinoSlidingSegmentedControl(
                  children: calendarTabs,
                  onValueChanged: (i) {
                    setState(() {
                      _selectedCalendarTab = i ?? 0;
                    });
                  },
                  groupValue: _selectedCalendarTab,
                ),
              )
            ],
          )),
      <Widget>[
        const CalendarDayView(),
        const CalendarWeekView(),
        const CalendarMonthView()
      ][_selectedCalendarTab]
    ]);
  }
}
