/// found here: https://stackoverflow.com/a/54129275/20473653
extension NumberOfWeeks on DateTime {
  int _numOfWeeks(int year) {
    final dec28 = DateTime.utc(year, 12, 28);
    int dayOfDec28 = dec28.difference(DateTime.utc(year)).inDays + 1;
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  String weekNumber() {
    int dayOfYear =
        DateTime.utc(year, month, day).difference(DateTime.utc(year)).inDays +
        1;
    int woy = ((dayOfYear - weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = _numOfWeeks(year - 1);
    } else if (woy > _numOfWeeks(year)) {
      woy = 1;
    }
    return woy.toString().padLeft(2, "0");
  }
}

extension SameDay on DateTime {
  bool isAtSameDay(DateTime dateTime) {
    return day == dateTime.day &&
        month == dateTime.month &&
        year == dateTime.year;
  }
}
