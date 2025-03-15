import 'package:campus_flutter/base/util/diagonalStripePattern/diagonal_stripe_pattern_view.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:flutter/material.dart';

class CalendarEventView extends StatelessWidget {
  const CalendarEventView({
    super.key,
    required this.calendarEvent,
    required this.bounds,
    this.isMonthly = false,
  });

  final CalendarEvent calendarEvent;
  final Rect bounds;
  final bool isMonthly;

  @override
  Widget build(BuildContext context) {
    if (!(calendarEvent.isVisible ?? true)) {
      return _hiddenCalendarEvent(context);
    } else {
      return _visibleCalendarEvent(context);
    }
  }

  Widget _hiddenCalendarEvent(BuildContext context) {
    return SizedBox(
      height: bounds.height,
      width: bounds.width,
      child: Stack(
        children: [
          DiagonalStripePatternView(
            stripeColor: calendarEvent.getColor(),
            bgColor: calendarEvent.getColor().withValues(
              alpha:
                  Theme.of(context).brightness == Brightness.light
                      ? 0.625
                      : 0.5,
            ),
          ),
          _content(context),
        ],
      ),
    );
  }

  Widget _visibleCalendarEvent(BuildContext context) {
    return Container(
      height: bounds.height,
      width: bounds.width,
      decoration: BoxDecoration(color: calendarEvent.getColor()),
      child: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    final padding = 2.5;
    final style = Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );

    return Padding(
      padding: EdgeInsets.only(
        top: padding,
        left: padding,
        right: padding,
        bottom: 2.5,
      ),
      child:
          isMonthly
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _text(style, padding, context)),
                  _timePeriod(style),
                ],
              )
              : _text(style, padding, context),
    );
  }

  Widget _text(TextStyle? style, double padding, BuildContext context) {
    return Text(
      calendarEvent.subject,
      style: style,
      maxLines: _calculateLineLimit(style, padding, context),
    );
  }

  Widget _timePeriod(TextStyle? style) {
    return Text(calendarEvent.timePeriod, style: style, maxLines: 1);
  }

  int? _calculateLineLimit(
    TextStyle? style,
    double padding,
    BuildContext context,
  ) {
    var absoluteHeight = bounds.height - padding * 2;

    if (style == null) {
      return null;
    }

    final lineHeight = (style.height ?? 0.0) * (style.fontSize ?? 0.0);

    if (lineHeight == 0.0) {
      return null;
    }

    if (isMonthly) {
      absoluteHeight = absoluteHeight - lineHeight;
    }

    return (absoluteHeight / lineHeight).floor();
  }
}
