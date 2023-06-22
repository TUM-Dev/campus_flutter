class SemesterCalculator {
  static String getCurrentSemester() {
    final date = DateTime.now();
    if (date.isBefore(DateTime(date.year, 4, 1))) {
      final year = (date.year - 1).toString().substring(2, 4);
      return "${year}W";
    } else if (date.isBefore(DateTime(date.year, 9, 1))) {
      final year = (date.year).toString().substring(2, 4);
      return "${year}S";
    } else {
      final year = (date.year).toString().substring(2, 4);
      return "${year}W";
    }
  }

  static String getPriorSemester() {
    final date = DateTime.now();
    if (date.isBefore(DateTime(date.year, 4, 1))) {
      final year = (date.year - 1).toString().substring(2, 4);
      return "${year}S";
    } else if (date.isBefore(DateTime(date.year, 9, 1))) {
      final year = (date.year - 1).toString().substring(2, 4);
      return "${year}W";
    } else {
      final year = (date.year).toString().substring(2, 4);
      return "${year}S";
    }
  }
}