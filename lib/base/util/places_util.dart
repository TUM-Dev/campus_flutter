import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/extensions/date_time.dart';
import 'package:campus_flutter/base/util/string_parser.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/opening_hours.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
              ? context.tr("closedToday")
              : context.tr(
                  "closedOn",
                  args: [
                    DateFormat.EEEE(context.tr("localeName")).format(dateTime),
                  ],
                ),
        ),
      );
    } else if (openingHours?.$2 != null && dateTime != null) {
      final dayString = StringParser.getDayString(dateTime, context);
      return Padding(
        padding: EdgeInsets.only(left: context.padding),
        child: Text(
          context.tr(
            "open",
            args: [dayString, openingHours!.$2!.start, openingHours.$2!.end],
          ),
        ),
      );
    } else {
      return null;
    }
  }
}
