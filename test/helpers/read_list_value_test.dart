import 'package:campus_flutter/base/util/read_list_value.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('readListValue', () {
    test('returns empty list when key is absent', () {
      final result = readListValue({'other': 'value'}, 'location');
      expect(result, isEmpty);
    });

    test('returns empty list when value is null', () {
      final result = readListValue({'location': null}, 'location');
      expect(result, isEmpty);
    });

    test('passes a List through unchanged', () {
      final result = readListValue({
        'location': ['Room A', 'Room B'],
      }, 'location');
      expect(result, ['Room A', 'Room B']);
    });

    test('wraps a String in a list', () {
      final result = readListValue({'location': 'Room A'}, 'location');
      expect(result, ['Room A']);
    });

    test('wraps a Map in a list', () {
      final map = {'nummer': '001', 'gebaeude': 'MI'};
      final result = readListValue({'raum': map}, 'raum');
      expect(result, [map]);
    });

    test('returns empty list for numeric value (unrecognised type)', () {
      final result = readListValue({'count': 42}, 'count');
      expect(result, isEmpty);
    });

    test('preserves list with mixed-type entries', () {
      final result = readListValue({
        'items': ['a', 'b', 'c'],
      }, 'items');
      expect(result.length, 3);
    });
  });
}
