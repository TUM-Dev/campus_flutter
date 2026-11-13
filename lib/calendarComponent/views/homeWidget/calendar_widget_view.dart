import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/util/card_with_padding.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/homeWidget/calendar_widget_event_view.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      title: context.tr("calendar"),
      child: CardWithPadding.constrained(
        boxConstraints: const BoxConstraints(minHeight: 220),
        child: StreamBuilder(
          stream: ref.watch(calendarViewModel).events,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _calendarWidgetCard(
                ref.read(calendarViewModel).getWidgetEvents(),
              );
            } else if (snapshot.hasError) {
              return ErrorHandlingRouter(
                error: snapshot.error!,
                stackTrace: snapshot.stackTrace,
                errorHandlingViewType: ErrorHandlingViewType.textOnly,
                retry: (() => ref.read(calendarViewModel).fetch(true)),
              );
            } else {
              return DelayedLoadingIndicator(name: context.tr("events"));
            }
          },
        ),
      ),
    );
  }

  Widget _calendarWidgetCard((CalendarEvent?, List<CalendarEvent>) events) {
    final upcomingEvents = events.$2.take(2).toList();
    if (events.$1 == null && upcomingEvents.isEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _todayWidget(),
          SizedBox(height: context.padding),
          Center(child: Text(context.tr("noUpcomingEvents"))),
        ],
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // Each column needs enough room for readable text at the user's scale.
        final textScale = MediaQuery.textScalerOf(context).scale(14) / 14;
        final useSingleColumn = constraints.maxWidth < 320 * textScale;
        final currentEvent = events.$1;
        if (useSingleColumn) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _todayWidget(),
              for (final event in [?currentEvent, ...upcomingEvents]) ...[
                SizedBox(height: context.padding),
                CalendarHomeWidgetEventView(
                  calendarEvent: event,
                  compact: false,
                ),
              ],
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _todayWidget(),
                  if (currentEvent != null) ...[
                    SizedBox(height: context.padding),
                    CalendarHomeWidgetEventView(calendarEvent: currentEvent),
                  ],
                ],
              ),
            ),
            if (upcomingEvents.isNotEmpty) ...[
              SizedBox(width: context.padding),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < upcomingEvents.length; i++) ...[
                      if (i > 0) SizedBox(height: context.padding),
                      CalendarHomeWidgetEventView(
                        calendarEvent: upcomingEvents[i],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _todayWidget() {
    final today = DateTime.now();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat.EEEE(context.locale.languageCode).format(today),
          style: TextStyle(color: context.primaryColor),
        ),
        Text(
          DateFormat.MMMd(context.locale.languageCode).format(today),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
