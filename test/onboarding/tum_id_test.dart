import 'package:campus_flutter/onboardingComponent/model/tum_id.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'accepts a full ID pasted with uppercase and surrounding whitespace',
    () {
      expect(TumId.normalize('  GO42TUM\n'), 'go42tum');
      expect(TumId.validationError('  GO42TUM\n'), isNull);
    },
  );

  for (final input in ['go42tum@mytum.de', 'name.surname@tum.de']) {
    test('explains why email $input cannot be used', () {
      expect(TumId.validationError(input), 'tumIdEmailError');
    });
  }

  test('identifies a matriculation number', () {
    expect(TumId.validationError('03712345'), 'tumIdNumberError');
  });

  for (final input in [
    '',
    'go42tu',
    'go42tumm',
    'g042tum',
    'go 42tum',
    'gö42tum',
  ]) {
    test('rejects invalid ID "$input" without truncating or stripping it', () {
      expect(TumId.validationError(input), 'tumIdFormatError');
    });
  }
}
