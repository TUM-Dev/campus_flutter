import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/views/homeWidget/calendar_widget_event_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:campus_flutter/base/extensions/context.dart';

class CalendarHomeWidgetView extends ConsumerStatefulWidget {
  const CalendarHomeWidgetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CalendarHomeWidgetView();
}

class _CalendarHomeWidgetView extends ConsumerState<CalendarHomeWidgetView> {
  @override
  void initState() {
    ref.read(calendarViewModel).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetFrameView(
      title: context.localizations.calendar,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.25,
        child: CardWithPadding(
          child: StreamBuilder(
            stream: ref.watch(calendarViewModel).events,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _calendarWidgetCard(
                  ref.read(calendarViewModel).getWidgetEvents(),
                );
              } else if (snapshot.hasError) {
                return SizedBox(
                  height: 200,
                  child: Card(
                    child: ErrorHandlingView(
                      error: snapshot.error!,
                      errorHandlingViewType: ErrorHandlingViewType.textOnly,
                      retry: ref.read(calendarViewModel).fetch,
                    ),
                  ),
                );
              } else {
                return DelayedLoadingIndicator(
                  name: context.localizations.events,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _calendarWidgetCard((CalendarEvent?, List<CalendarEvent>) events) {
    if (events.$1 == null && events.$2.isEmpty) {
      return Stack(
        children: [
          _todayWidget(),
          Center(
            child: Text(context.localizations.noUpcomingEvents),
          ),
        ],
      );
    } else if (events.$2.length == 1) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: _todayWidget(),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (events.$1 != null)
                  Expanded(
                    child: CalendarHomeWidgetEventView(
                      calendarEvent: events.$1!,
                    ),
                  ),
                Expanded(
                  child: CalendarHomeWidgetEventView(
                    calendarEvent: events.$2[0],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _todayWidget(),
                ),
                Expanded(
                  child: (events.$1 != null)
                      ? CalendarHomeWidgetEventView(calendarEvent: events.$1!)
                      : Container(),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CalendarHomeWidgetEventView(
                    calendarEvent: events.$2.first,
                  ),
                ),
                Expanded(
                  child: CalendarHomeWidgetEventView(
                    calendarEvent: events.$2[1],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  Widget _todayWidget() {
    final today = DateTime.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat.EEEE(context.localizations.localeName).format(today),
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        Text(
          DateFormat.MMMd(context.localizations.localeName).format(today),
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
