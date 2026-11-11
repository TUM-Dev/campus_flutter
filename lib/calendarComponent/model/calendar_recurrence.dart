import 'package:campus_flutter/calendarComponent/model/calendar_editing.dart';
import 'package:flutter/material.dart';

/// Adds calendar days without changing the local wall-clock time across DST.
DateTime addCalendarDays(DateTime date, int days) => DateTime(
  date.year,
  date.month,
  date.day + days,
  date.hour,
  date.minute,
  date.second,
  date.millisecond,
  date.microsecond,
);

DateTime addCalendarMonths(DateTime date, int months) {
  final targetMonth = date.month + months;
  final year = date.year + (targetMonth - 1) ~/ 12;
  final month = (targetMonth - 1) % 12 + 1;
  return DateTime(
    year,
    month,
    date.day.clamp(1, DateUtils.getDaysInMonth(year, month)),
    date.hour,
    date.minute,
    date.second,
    date.millisecond,
    date.microsecond,
  );
}

DateTime recurrenceStart(DateTime start, RecurrenceType type, int index) =>
    switch (type) {
      RecurrenceType.daily => addCalendarDays(start, index),
      RecurrenceType.weekly => addCalendarDays(start, 7 * index),
      RecurrenceType.biweekly => addCalendarDays(start, 14 * index),
      RecurrenceType.monthly => addCalendarMonths(start, index),
      RecurrenceType.none => start,
    };

/// Moves both ends by the same number of calendar days, including overnight events.
(DateTime, DateTime) recurrenceOccurrence(
  DateTime start,
  DateTime end,
  RecurrenceType type,
  int index,
) {
  final nextStart = recurrenceStart(start, type, index);
  final dayOffset = DateTime.utc(
    nextStart.year,
    nextStart.month,
    nextStart.day,
  ).difference(DateTime.utc(start.year, start.month, start.day)).inDays;
  return (nextStart, addCalendarDays(end, dayOffset));
}

int calendarDayDifference(DateTime first, DateTime second) => DateTime.utc(
  second.year,
  second.month,
  second.day,
).difference(DateTime.utc(first.year, first.month, first.day)).inDays;
