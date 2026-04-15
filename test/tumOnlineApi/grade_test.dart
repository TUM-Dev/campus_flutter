import 'package:campus_flutter/studiesComponent/model/grade.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/xml_decoder.dart';

void main() {
  group('Grades XML decoding', () {
    test('decodes a list of grades from XML', () {
      const xml = '''
<rowset>
  <row>
    <datum>2024-01-15 00:00:00</datum>
    <lv_nummer>0000001234</lv_nummer>
    <lv_semester>24S</lv_semester>
    <lv_titel>Introduction to Computer Science</lv_titel>
    <pruefer_nachname>Müller</pruefer_nachname>
    <uninotenamekurz>1,3</uninotenamekurz>
    <exam_typ_name>Modulprüfung</exam_typ_name>
    <modus>Schriftlich</modus>
    <studienidentifikator>IN20200001</studienidentifikator>
    <studienbezeichnung>Informatik (B.Sc.)</studienbezeichnung>
    <st_studium_nr>100001</st_studium_nr>
    <abschluss_name>Bachelor of Science</abschluss_name>
    <abschluss_name_kurz>B.Sc.</abschluss_name_kurz>
  </row>
  <row>
    <datum>2024-02-20 00:00:00</datum>
    <lv_nummer>0000005678</lv_nummer>
    <lv_semester>24S</lv_semester>
    <lv_titel>Linear Algebra</lv_titel>
    <pruefer_nachname>Schmidt</pruefer_nachname>
    <uninotenamekurz>2,0</uninotenamekurz>
    <exam_typ_name>Modulprüfung</exam_typ_name>
    <modus>Schriftlich und Mündlich</modus>
    <studienidentifikator>IN20200001</studienidentifikator>
    <studienbezeichnung>Informatik (B.Sc.)</studienbezeichnung>
    <st_studium_nr>100001</st_studium_nr>
  </row>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final grades = Grades.fromJson(json);

      expect(grades.personalGrades.length, 2);

      final first = grades.personalGrades.first;
      expect(first.lvNumber, '0000001234');
      expect(first.semester, '24S');
      expect(first.title, 'Introduction to Computer Science');
      expect(first.examiner, 'Müller');
      expect(first.grade, '1,3');
      expect(first.examType, 'Modulprüfung');
      expect(first.mode, 'Schriftlich');
      expect(first.studyID, 'IN20200001');
      expect(first.studyDesignation, 'Informatik (B.Sc.)');
      expect(first.studyNumber, '100001');
      expect(first.degree, 'Bachelor of Science');
      expect(first.degreeShort, 'B.Sc.');
      expect(first.date, DateTime.parse('2024-01-15 00:00:00'));

      final second = grades.personalGrades[1];
      expect(second.lvNumber, '0000005678');
      expect(second.degree, isNull);
      expect(second.degreeShort, isNull);
    });

    test('returns empty grades list when rowset has no rows', () {
      const xml = '<rowset/>';
      final json = tumXmlToJson(xml);
      final grades = Grades.fromJson(json);

      expect(grades.personalGrades, isEmpty);
    });

    test('grade id combines date and lvNumber', () {
      const xml = '''
<rowset>
  <row>
    <datum>2024-01-15 00:00:00</datum>
    <lv_nummer>0000001234</lv_nummer>
    <lv_semester>24S</lv_semester>
    <lv_titel>CS</lv_titel>
    <pruefer_nachname>Müller</pruefer_nachname>
    <uninotenamekurz>1,3</uninotenamekurz>
    <exam_typ_name>Prüfung</exam_typ_name>
    <modus>Schriftlich</modus>
    <studienidentifikator>IN001</studienidentifikator>
    <studienbezeichnung>Informatik</studienbezeichnung>
    <st_studium_nr>100</st_studium_nr>
  </row>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final grade = Grades.fromJson(json).personalGrades.first;

      expect(
        grade.id,
        '${grade.date?.toIso8601String()}-${grade.lvNumber}',
      );
    });
  });
}
