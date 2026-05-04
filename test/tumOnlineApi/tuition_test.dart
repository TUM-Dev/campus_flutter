import 'package:campus_flutter/personComponent/model/profile/tuition.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/xml_decoder.dart';

void main() {
  group('Tuitions XML decoding', () {
    test('decodes tuition status — single row unwrap', () {
      const xml = '''
<rowset>
  <row>
    <soll>117,10</soll>
    <frist>2024-04-30 00:00:00</frist>
    <semester_bezeichnung>Sommersemester 2024</semester_bezeichnung>
    <semester_id>24S</semester_id>
  </row>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final tuitions = Tuitions.fromJson(json);
      final tuition = tuitions.tuition;

      // StringParser.stringToDouble replaces comma with dot
      expect(tuition.amount, closeTo(117.10, 0.001));
      expect(tuition.deadline, DateTime.parse('2024-04-30 00:00:00'));
      expect(tuition.semester, 'Sommersemester 2024');
      expect(tuition.semesterID, '24S');
    });

    test('handles null amount when soll is absent', () {
      const xml = '''
<rowset>
  <row>
    <frist>2024-04-30 00:00:00</frist>
    <semester_bezeichnung>Sommersemester 2024</semester_bezeichnung>
    <semester_id>24S</semester_id>
  </row>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final tuition = Tuitions.fromJson(json).tuition;

      expect(tuition.amount, isNull);
    });

    test('single-row list unwrap: takes first row when multiple rows present', () {
      const xml = '''
<rowset>
  <row>
    <soll>100,00</soll>
    <frist>2024-04-30 00:00:00</frist>
    <semester_bezeichnung>Sommersemester 2024</semester_bezeichnung>
    <semester_id>24S</semester_id>
  </row>
  <row>
    <soll>200,00</soll>
    <frist>2024-10-31 00:00:00</frist>
    <semester_bezeichnung>Wintersemester 2024/25</semester_bezeichnung>
    <semester_id>24W</semester_id>
  </row>
</rowset>
''';
      final json = tumXmlToJson(xml);
      // _tuitionFromJson takes data.first when it's a List
      final tuition = Tuitions.fromJson(json).tuition;

      expect(tuition.amount, closeTo(100.00, 0.001));
      expect(tuition.semesterID, '24S');
    });

    test('decodes zero tuition amount', () {
      const xml = '''
<rowset>
  <row>
    <soll>0,00</soll>
    <frist>2024-04-30 00:00:00</frist>
    <semester_bezeichnung>Sommersemester 2024</semester_bezeichnung>
    <semester_id>24S</semester_id>
  </row>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final tuition = Tuitions.fromJson(json).tuition;

      expect(tuition.amount, closeTo(0.0, 0.001));
    });
  });
}
