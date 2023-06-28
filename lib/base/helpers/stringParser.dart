import 'package:intl/intl.dart';

class StringParser {
  static String degreeShortFromID(String studyID) {
    switch (studyID) {
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
        // TODO: what does it stand for?
        return "MBD";
      case "60":
      // TODO: what does it stand for?
        return "BECE";
      case "61":
      // TODO: what does it stand for?
        return "BEEDE";
      default:
        return "unknown";
    }
  }

  static String degreeShort(String degree) {
    // TODO:
    switch (degree) {
      case "Bachelor of Science": return "B.Sc.";
      default: return "unknown";
    }
  }

  static String toFullSemesterName(String semester) {
    final year = "20${semester.substring(0, 2)}";
    final nextYearShort = (int.parse(year) + 1).toString().substring(2, 4);

    switch (semester.substring(2)) {
      case "W":
        return "Wintersemester" " $year/$nextYearShort";
      case "S":
        return "Summersemester" " $year";
      default:
        return "Unknown";
    }
  }

  static String toShortSemesterName(String semester) {
    final year = "20${semester.substring(0, 2)}";
    final nextYearShort = (int.parse(year) + 1).toString().substring(2, 4);

    switch (semester.substring(2)) {
      case "W":
        return "WiSe" " $year/$nextYearShort";
      case "S":
        return "SoSe" " $year";
      default:
        return "Unknown";
    }
  }

  static String dateFormatter(DateTime dateTime) {
    return DateFormat(DateFormat.YEAR_MONTH_DAY).format(dateTime);
  }
}