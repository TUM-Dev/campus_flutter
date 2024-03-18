import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/util/card_with_padding.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/homeWidget/calendar_widget_event_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
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
      child: CardWithPadding(
        height: 220,
        child: StreamBuilder(
          stream: ref.watch(calendarViewModel).events,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _calendarWidgetCard(
                ref.read(calendarViewModel).getWidgetEvents(),
              );
            } else if (snapshot.hasError) {
              return SizedBox(
                height: 220,
                child: ErrorHandlingRouter(
                  error: snapshot.error!,
                  errorHandlingViewType: ErrorHandlingViewType.textOnly,
                  retry: ref.read(calendarViewModel).fetch,
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
                if (events.$1 != null)
                  Expanded(
                    child: CalendarHomeWidgetEventView(
                      calendarEvent: events.$1!,
                    ),
                  ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
          if (events.$2.isNotEmpty)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: events.$2.length == 1
                    ? [
                        Expanded(
                          child: CalendarHomeWidgetEventView(
                            calendarEvent: events.$2[0],
                          ),
                        ),
                        const Spacer(),
                      ]
                    : [
                        for (int i = 0; i < events.$2.length && i < 2; i++)
                          Expanded(
                            child: CalendarHomeWidgetEventView(
                              calendarEvent: events.$2[i],
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
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
