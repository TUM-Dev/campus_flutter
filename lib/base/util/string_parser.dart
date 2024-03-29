import 'package:flutter/material.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:intl/intl.dart';

class StringParser {
  static String toFullSemesterName(BuildContext context, String semester) {
    final yearOffset = int.parse(semester.substring(0, 2));
    return context.localizations.fullSemesterName(
      semester.substring(2),
      2000 + yearOffset,
      yearOffset + 1,
    );
  }

  static String toShortSemesterName(BuildContext context, String semester) {
    final yearOffset = int.parse(semester.substring(0, 2));
    return context.localizations.shortSemesterName(
      semester.substring(2),
      2000 + yearOffset,
      yearOffset + 1,
    );
  }

  static String dateFormatter(DateTime dateTime, BuildContext context) {
    return DateFormat(
      DateFormat.YEAR_MONTH_DAY,
      context.localizations.localeName,
    ).format(dateTime);
  }

  static double stringToDouble(String? number) {
    if (number != null) {
      number = number.replaceAll(",", ".");
      return double.tryParse(number) ?? 0.0;
    } else {
      return 0.0;
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
}
