import 'dart:core';

List<int> decodeDaysBitmask(String bitmaskString) {
  final bitmask = int.tryParse(bitmaskString);
  if (bitmask == null) {
    return [];
  }

  final decodedDays = <int>[];

  for (int i = 0; i < 7; i++) {
    if (bitmask & (1 << i) != 0) {
      decodedDays.add(i + 1);
    }
  }

  return decodedDays;
}

String getDayOfWeek(int dayNumber) {
  final daysOfWeek = [
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
    'sunday',
  ];
  return daysOfWeek[dayNumber - 1];
}
