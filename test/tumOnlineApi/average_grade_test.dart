import 'package:campus_flutter/studiesComponent/model/average_grade.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/xml_decoder.dart';

void main() {
  group('AverageGrades XML decoding', () {
    test('decodes average grades using the "studien" plural key', () {
      // The xml2json mapping converts each <studium> element to a "studien" list
      const xml = '''
<rowset>
  <studium>
    <studidf>IN20200001</studidf>
    <studbez>Informatik (B.Sc.)</studbez>
    <avg_grade_weighted_by_credits>1,7</avg_grade_weighted_by_credits>
  </studium>
  <studium>
    <studidf>MA20200002</studidf>
    <studbez>Mathematik (B.Sc.)</studbez>
    <avg_grade_weighted_by_credits>2,3</avg_grade_weighted_by_credits>
  </studium>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final averageGrades = AverageGrades.fromJson(json);

      expect(averageGrades.averageGrades.length, 2);

      final first = averageGrades.averageGrades.first;
      expect(first.id, 'IN20200001');
      expect(first.studyDesignation, 'Informatik (B.Sc.)');
      // StringParser.stringToDouble replaces commas with dots
      expect(first.averageGrade, closeTo(1.7, 0.001));

      final second = averageGrades.averageGrades[1];
      expect(second.id, 'MA20200002');
      expect(second.averageGrade, closeTo(2.3, 0.001));
    });

    test('handles null average grade', () {
      const xml = '''
<rowset>
  <studium>
    <studidf>IN20200001</studidf>
    <studbez>Informatik (B.Sc.)</studbez>
  </studium>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final averageGrades = AverageGrades.fromJson(json);

      expect(averageGrades.averageGrades.first.averageGrade, isNull);
    });

    test('returns empty list when rowset has no studium elements', () {
      const xml = '<rowset/>';
      final json = tumXmlToJson(xml);
      final averageGrades = AverageGrades.fromJson(json);

      expect(averageGrades.averageGrades, isEmpty);
    });

    test('decodes comma-formatted grade to double', () {
      const xml = '''
<rowset>
  <studium>
    <studidf>ID001</studidf>
    <studbez>Study</studbez>
    <avg_grade_weighted_by_credits>1,3</avg_grade_weighted_by_credits>
  </studium>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final grade = AverageGrades.fromJson(json).averageGrades.first;

      expect(grade.averageGrade, closeTo(1.3, 0.001));
    });
  });
}
