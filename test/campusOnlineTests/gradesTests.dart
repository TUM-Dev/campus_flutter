import 'dart:convert';
import 'dart:io';

import 'package:campus_flutter/gradeComponent/model/grade.dart';
import 'package:test/test.dart';
import 'package:xml2json/xml2json.dart';

import 'campusOnline_test.dart';

void gradesTests() {
  test('Test empty Grades response body', () async {
    final file = File('test/campusOnlineTests/resources/grades_none.xml');
    final responseBody = await file.readAsString();
    final gradesData = GradeData.fromJson(xml2JsonConverter(responseBody));
    expect(null, gradesData.gradesAttribute);
  });

  test('Test single Grades response body', () async {
    final file = File('test/campusOnlineTests/resources/grades_single.xml');
    final responseBody = await file.readAsString();
    final gradesData = GradeData.fromJson(xml2JsonConverter(responseBody));
    expect(1, gradesData.gradesAttribute?.personalGrades.length);
  });

  test('Test multiple Grades response body', () async {
    final file = File('test/campusOnlineTests/resources/grades_multiple.xml');
    final responseBody = await file.readAsString();
    final gradesData = GradeData.fromJson(xml2JsonConverter(responseBody));
    expect(2, gradesData.gradesAttribute?.personalGrades.length);
  });
}
