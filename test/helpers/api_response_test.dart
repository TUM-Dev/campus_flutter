import 'dart:convert';

import 'package:campus_flutter/base/networking/base/api_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApiResponse.fromJson', () {
    test('decodes when root JSON is a Map', () {
      final json = jsonDecode('{"name": "Test", "value": 42}');
      final extras = <String, dynamic>{};

      final response = ApiResponse<Map<String, dynamic>>.fromJson(
        json,
        extras,
        (j) => j,
      );

      expect(response.data['name'], 'Test');
      expect(response.data['value'], 42);
      expect(response.saved, isNull);
    });

    test('wraps root JSON List in {"data": [...]} before calling create', () {
      final json = jsonDecode('[{"id": 1}, {"id": 2}]');
      final extras = <String, dynamic>{};

      final response = ApiResponse<List<dynamic>>.fromJson(
        json,
        extras,
        (j) => j['data'] as List<dynamic>,
      );

      expect(response.data.length, 2);
      expect((response.data[0] as Map)['id'], 1);
    });

    test('threads "saved" DateTime through from extras', () {
      final savedAt = DateTime(2024, 4, 15, 10, 0, 0);
      final json = jsonDecode('{"key": "value"}');
      final extras = <String, dynamic>{'saved': savedAt};

      final response = ApiResponse<Map<String, dynamic>>.fromJson(
        json,
        extras,
        (j) => j,
      );

      expect(response.saved, savedAt);
    });

    test('saved is null when not present in extras', () {
      final json = jsonDecode('{"key": "value"}');
      final extras = <String, dynamic>{};

      final response = ApiResponse<Map<String, dynamic>>.fromJson(
        json,
        extras,
        (j) => j,
      );

      expect(response.saved, isNull);
    });

    test('passes decoded data through the create function', () {
      final json = jsonDecode('{"count": "5"}');
      final extras = <String, dynamic>{};

      final response = ApiResponse<int>.fromJson(
        json,
        extras,
        (j) => int.parse(j['count'] as String),
      );

      expect(response.data, 5);
    });
  });
}
