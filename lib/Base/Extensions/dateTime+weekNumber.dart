import 'package:intl/intl.dart';

/// found here: https://stackoverflow.com/a/54129275/20473653
extension NumberOfWeeks on DateTime {
  int _numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  int weekNumber() {
    int dayOfYear = int.parse(DateFormat("D").format(this));
    int woy =  ((dayOfYear - weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = _numOfWeeks(year - 1);
    } else if (woy > _numOfWeeks(year)) {
      woy = 1;
    }
    return woy;
  }
}