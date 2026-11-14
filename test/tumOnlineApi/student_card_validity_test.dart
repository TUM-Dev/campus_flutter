import 'package:campus_flutter/studentCardComponent/model/student_card.dart';
import 'package:flutter_test/flutter_test.dart';

StudentCard cardWithDates(DateTime start, DateTime end) => StudentCard(
  id: 'test',
  name: 'Test Student',
  birthday: DateTime(2000),
  studyID: '123',
  chipID: 'chip',
  semester: 'Test semester',
  validFrom: start,
  validUntil: end,
  studies: [],
  image: '',
);

void main() {
  test('validity includes both boundaries and rejects dates outside them', () {
    final start = DateTime(2026, 10, 1);
    final end = DateTime(2027, 3, 31, 23, 59, 59);
    final card = cardWithDates(start, end);
    expect(
      card.validityAt(start.subtract(const Duration(microseconds: 1))),
      StudentCardValidity.notYetValid,
    );
    expect(card.validityAt(start), StudentCardValidity.current);
    expect(card.validityAt(end), StudentCardValidity.current);
    expect(
      card.validityAt(end.add(const Duration(microseconds: 1))),
      StudentCardValidity.expired,
    );
  });

  test('reversed validity dates can never produce a current card', () {
    final card = cardWithDates(DateTime(2027), DateTime(2026));
    for (final year in [2025, 2026, 2027, 2028]) {
      expect(card.validityAt(DateTime(year)), StudentCardValidity.invalid);
    }
  });
}
