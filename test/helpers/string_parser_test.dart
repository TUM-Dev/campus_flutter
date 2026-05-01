import 'package:campus_flutter/base/util/string_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringParser.stringToDouble', () {
    test('parses dot-decimal string', () {
      expect(StringParser.stringToDouble('1.7'), closeTo(1.7, 0.001));
    });

    test('parses comma-decimal string (German format)', () {
      expect(StringParser.stringToDouble('1,7'), closeTo(1.7, 0.001));
    });

    test('parses integer string as double', () {
      expect(StringParser.stringToDouble('2'), closeTo(2.0, 0.001));
    });

    test('returns null for null input', () {
      expect(StringParser.stringToDouble(null), isNull);
    });

    test('returns null for non-parseable string (e.g. "n.b.")', () {
      // "nicht benotet" — a real TUM grade value meaning "not yet graded"
      expect(StringParser.stringToDouble('n.b.'), isNull);
    });

    test('returns null for empty string', () {
      // API can return an empty element <soll/> that xml2json converts to ""
      expect(StringParser.stringToDouble(''), isNull);
    });

    test('parses zero', () {
      expect(StringParser.stringToDouble('0,00'), closeTo(0.0, 0.001));
    });

    test('parses tuition amount with comma', () {
      expect(StringParser.stringToDouble('117,10'), closeTo(117.10, 0.001));
    });
  });

  group('StringParser.stringToInt', () {
    test('parses a valid integer string', () {
      expect(StringParser.stringToInt('42'), 42);
    });

    test('returns 0 for null input', () {
      expect(StringParser.stringToInt(null), 0);
    });

    test('returns 0 for non-integer string', () {
      // e.g. org_nr fields can occasionally be malformed
      expect(StringParser.stringToInt('abc'), 0);
    });

    test('returns 0 for empty string', () {
      expect(StringParser.stringToInt(''), 0);
    });

    test('parses large ID numbers', () {
      expect(StringParser.stringToInt('950000001'), 950000001);
    });
  });

  group('StringParser.optStringToOptInt', () {
    test('parses a valid integer string', () {
      expect(StringParser.optStringToOptInt('5'), 5);
    });

    test('returns null for null input', () {
      expect(StringParser.optStringToOptInt(null), isNull);
    });

    test('returns null for non-integer string', () {
      expect(StringParser.optStringToOptInt('abc'), isNull);
    });

    test('returns null for empty string', () {
      expect(StringParser.optStringToOptInt(''), isNull);
    });
  });

  group('StringParser.optStringToOptDouble', () {
    test('parses a comma-decimal string', () {
      expect(StringParser.optStringToOptDouble('2,3'), closeTo(2.3, 0.001));
    });

    test('returns null for null input', () {
      expect(StringParser.optStringToOptDouble(null), isNull);
    });
  });
}
