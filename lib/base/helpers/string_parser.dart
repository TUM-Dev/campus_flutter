import 'package:flutter/material.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:intl/intl.dart';

class StringParser {
  static String degreeShortFromID(String studyID, BuildContext context) {
    final splitDegreeNumbers = studyID.split(" ");

    if (splitDegreeNumbers.length != 3) {
      return context.localizations.unknown;
    }

    final academicDegreeNumber = splitDegreeNumbers[1];

    switch (academicDegreeNumber) {
      case "04":
      case "05":
      case "06":
      case "07":
        return "PhD";
      case "14":
      case "19":
        return "B.Ed.";
      case "16":
      case "20":
      case "28":
        return "M.Sc.";
      case "17":
        return "B.Sc.";
      case "18":
        return "MBA";
      case "29":
        return "M.A.";
      case "30":
        return "B.A.";
      case "37":
      case "38":
      case "39":
      case "42":
        return "M.Ed.";
      case "53":
        return "MBD";
      case "60":
        return "BECE";
      case "61":
        return "BEEDE";
      default:
        return "";
    }
  }

  static String degreeShort(String degree, BuildContext context) {
    // TODO: add missing degrees
    switch (degree) {
      case "Bachelor of Science":
        return "B.Sc.";
      case "Master of Science":
        return "M.Sc.";
      case "Bachelor of Arts":
        return "B.A.";
      case "Master of Arts":
        return "M.A.";
      case "Bachelor of Education":
        return "B.Ed.";
      case "Master of Education":
        return "M.Ed.";
      default:
        return "";
    }
  }

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
      "de",
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
