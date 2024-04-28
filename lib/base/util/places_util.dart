import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/extensions/date_time.dart';
import 'package:campus_flutter/base/util/string_parser.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/opening_hours.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlacesUtil {
  static Widget? openingHours(
    (bool, OpeningHour?)? openingHours,
    DateTime? dateTime,
    BuildContext context,
  ) {
    if (openingHours != null && !openingHours.$1 && dateTime != null) {
      return Padding(
        padding: EdgeInsets.only(left: context.padding),
        child: Text(
          dateTime.isAtSameDay(DateTime.now())
              ? context.localizations.closedToday
              : context.localizations.closedOn(
                  DateFormat.EEEE(context.localizations.localeName)
                      .format(dateTime),
                ),
        ),
      );
    } else if (openingHours?.$2 != null && dateTime != null) {
      final dayString = StringParser.getDayString(dateTime, context);
      return Padding(
        padding: EdgeInsets.only(left: context.padding),
        child: Text(
          context.localizations.open(
            dayString,
            openingHours!.$2!.start,
            openingHours.$2!.end,
          ),
        ),
      );
    } else {
      return null;
    }
  }
}
