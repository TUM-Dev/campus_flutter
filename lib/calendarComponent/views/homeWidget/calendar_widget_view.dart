import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/views/homeWidget/calendar_widget_event_view.dart';
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
    ref.read(calendarViewModel).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(calendarViewModel).events,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _calendarWidgetCard(ref.read(calendarViewModel).getWidgetEvents());
          } else if (snapshot.hasError) {
            return SizedBox(height: 200, child: Card(child:
            ErrorHandlingView(
                error: snapshot.error!,
                errorHandlingViewType: ErrorHandlingViewType.textOnly,
                retry: ref.read(calendarViewModel).fetch
            )));
          } else {
            return const DelayedLoadingIndicator(name: "Events");
          }
        });
  }

  Widget _calendarWidgetCard((CalendarEvent?, List<CalendarEvent>) events) {
    final today = DateTime.now();

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.25,
      child: CardWithPadding(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Expanded(child: CalendarHomeWidgetEventView(calendarEvent: events.$2.first)),
            Expanded(child: CalendarHomeWidgetEventView(calendarEvent: events.$2[1]))
          ]))
        ],
      )),
    );
  }
}
