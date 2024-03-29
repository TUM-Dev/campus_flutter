import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/string_parser.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/opening_hours.dart';
import 'package:flutter/material.dart';

class PlacesUtil {
  static Widget? openingHours(
    (bool, OpeningHour?)? openingHours,
    DateTime? dateTime,
    BuildContext context,
  ) {
    if (openingHours != null && dateTime != null) {
      final dayString = StringParser.getDayString(dateTime, context);
      return Padding(
        padding: EdgeInsets.only(left: context.padding),
        child: Text(
          context.localizations.open(
            dayString,
            openingHours.$2!.start,
            openingHours.$2!.end,
          ),
        ),
      );
    } else {
      return null;
    }
  }
}
