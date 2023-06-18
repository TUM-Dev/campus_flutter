import 'package:campus_flutter/base/helpers/cardWithPadding.dart';
import 'package:campus_flutter/base/helpers/delayedLoadingIndicator.dart';
import 'package:campus_flutter/calendarComponent/model/calendarEvent.dart';
import 'package:campus_flutter/calendarComponent/views/homeWidget/calendarHomeWidgetEventView.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CalendarHomeWidgetView extends ConsumerStatefulWidget {
  const CalendarHomeWidgetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarHomeWidgetView();
}

class _CalendarHomeWidgetView extends ConsumerState<CalendarHomeWidgetView> {
  @override
  void initState() {
    ref.read(calendarViewModel).fetchEvents();
    //Provider.of<CalendarViewModel>(context, listen: false).fetchEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(calendarViewModel).events,
        //stream: Provider.of<CalendarViewModel>(context, listen: true).events,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _calendarWidgetCard(
                //Provider.of<CalendarViewModel>(context, listen: false).getWidgetEvents());
                ref.read(calendarViewModel).getWidgetEvents());
          } else if (snapshot.hasError) {
            return const Text("Error!");
          } else {
            return const DelayedLoadingIndicator(name: "Events");
          }
        });
  }

  Widget _calendarWidgetCard((CalendarEvent?, List<CalendarEvent>) events) {
    final today = DateTime.now();

    return SizedBox(
      height: 200,
      width: double.infinity,
      child: CardWithPadding(
          child: Row(
        children: [
          Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(DateFormat.EEEE().format(today),
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                Text(
                  DateFormat(DateFormat.DAY).format(today),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const Spacer()
              ],
            )),
            Expanded(
                child: (events.$1 != null)
                    ? CalendarHomeWidgetEventView(calendarEvent: events.$1!)
                    : const Center(child: Text("No Events Today")))
          ])),
          Expanded(
              child: Column(children: [
            Expanded(child: CalendarHomeWidgetEventView(calendarEvent: events.$2.first)),
            Expanded(child: CalendarHomeWidgetEventView(calendarEvent: events.$2[1]))
          ]))
        ],
      )),
    );
  }
}
