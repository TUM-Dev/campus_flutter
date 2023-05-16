import 'package:campus_flutter/calendarComponent/model/calendarDataSource.dart';
import 'package:campus_flutter/calendarComponent/model/event.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendarViewModel.dart';
import 'package:campus_flutter/lectureComponent/viewModels/lectureDetailsViewModel.dart';
import 'package:campus_flutter/lectureComponent/views/lectureDetailsView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarDayView extends StatelessWidget {
  const CalendarDayView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            Provider.of<CalendarViewModel>(context, listen: true).events.stream,
        builder: (context, snapshot) {
          return Expanded(
              child: SfCalendar(
            view: CalendarView.day,
            dataSource:
                snapshot.hasData ? MeetingDataSource(snapshot.data!) : null,
            onTap: (details) {
              if (details.appointments != null &&
                  details.appointments!.isNotEmpty) {
                showModalBottomSheet(
                    isScrollControlled: true,
                    useSafeArea: true,
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      var event = details.appointments?.first as Event;
                      return DraggableScrollableSheet(
                          initialChildSize: 1,
                          minChildSize: 1,
                          builder: (context, scrollController) {
                            return Provider(
                                create: (context) =>
                                    LectureDetailsViewModel(event: event),
                                child: LectureDetailsView(
                                    scrollController: scrollController));
                          }
                      );
                    });
              }
            },
            appointmentBuilder: (context, details) {
              var element = details.appointments.first as Event;
              return Container(
                  width: details.bounds.width,
                  height: details.bounds.height,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(children: [
                    // TODO: format time and add location
                    Text("${element.title} (${element.startDate.hour}:${element.startDate.minute} - ${element.endDate.hour}:${element.endDate.minute})"),
                    //Text(element.location, overflow: TextOverflow.clip)
                  ]));
            },
          ));
        });
  }
}
