import 'package:campus_flutter/base/extensions/date_time.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StringParser {
  static String toFullSemesterName(BuildContext context, String semester) {
    final yearOffset = int.parse(semester.substring(0, 2));
    if (semester.substring(2) == "W") {
      return context.tr(
        "fullWinter",
        args: [(2000 + yearOffset).toString(), (yearOffset + 1).toString()],
      );
    } else if (semester.substring(2) == "S") {
      return context.tr(
        "fullSummer",
        args: [(2000 + yearOffset).toString(), (yearOffset + 1).toString()],
      );
    } else {
      return context.tr("unknown");
    }
  }

  static String toShortSemesterName(BuildContext context, String semester) {
    final yearOffset = int.parse(semester.substring(0, 2));
    if (semester.substring(2) == "W") {
      return context.tr(
        "shortWinter",
        args: [(2000 + yearOffset).toString(), (yearOffset + 1).toString()],
      );
    } else if (semester.substring(2) == "S") {
      return context.tr(
        "shortSummer",
        args: [(2000 + yearOffset).toString(), (yearOffset + 1).toString()],
      );
    } else {
      return context.tr("unknown");
    }
  }

  static String dateFormatter(DateTime dateTime, BuildContext context) {
    return DateFormat(
      DateFormat.YEAR_MONTH_DAY,
      context.locale.languageCode,
    ).format(dateTime);
  }

  static double? stringToDouble(String? number) {
    if (number != null) {
      number = number.replaceAll(",", ".");
      return double.tryParse(number);
    } else {
      return null;
    }
  }

  static double? optStringToOptDouble(String? number) {
    if (number != null) {
      number = number.replaceAll(",", ".");
      return double.tryParse(number);
    } else {
      return null;
    }
  }

  static int stringToInt(String? number) {
    if (number != null) {
      return int.tryParse(number) ?? 0;
    } else {
      return 0;
    }
  }

  static int? optStringToOptInt(String? number) {
    return number != null ? int.tryParse(number) : null;
  }

  static String getDayString(DateTime dateTime, BuildContext context) {
    final today = DateTime.now();
    if (dateTime.isAtSameDay(today)) {
      return context.tr("today");
    } else {
      return DateFormat.EEEE(context.locale.languageCode).format(dateTime);
    }
  }
}
