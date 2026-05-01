import 'package:campus_flutter/studiesComponent/model/lecture_details.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/xml_decoder.dart';

void main() {
  group('LectureDetailsElement XML decoding', () {
    test('decodes a single lecture details row from XML', () {
      const xml = '''
<rowset>
  <row>
    <stp_sp_nr>100001</stp_sp_nr>
    <stp_lv_nr>950000001</stp_lv_nr>
    <stp_sp_titel>Introduction to Computer Science</stp_sp_titel>
    <dauer_info>4</dauer_info>
    <stp_sp_sst>4</stp_sp_sst>
    <stp_lv_art_name>Vorlesung</stp_lv_art_name>
    <stp_lv_art_kurz>VO</stp_lv_art_kurz>
    <semester_name>Wintersemester 2023/24</semester_name>
    <semester>W</semester>
    <semester_id>23W</semester_id>
    <sj_name>2023/24</sj_name>
    <org_nr_betreut>54321</org_nr_betreut>
    <org_name_betreut>Informatik</org_name_betreut>
    <org_kennung_betreut>IN</org_kennung_betreut>
    <vortragende_mitwirkende>Prof. Dr. Müller</vortragende_mitwirkende>
    <lehrinhalt>Fundamentals of CS</lehrinhalt>
    <lehrziel>Understand CS basics</lehrziel>
    <voraussetzung_lv>None</voraussetzung_lv>
    <lehrmethode>Lecture + Exercises</lehrmethode>
    <pruefmodus>Written exam</pruefmodus>
    <anmerkung>Please register early</anmerkung>
    <stellung_im_stp_url>https://example.com/curriculum</stellung_im_stp_url>
    <termine_url>https://example.com/dates</termine_url>
    <pruef_termine_url>https://example.com/exam-dates</pruef_termine_url>
  </row>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final element = LectureDetailsElement.fromJson(json);
      final details = element.lectureDetails;

      // StringParser.stringToInt converts the string fields to int
      expect(details.id, 100001);
      expect(details.lvNumber, 950000001);
      expect(details.title, 'Introduction to Computer Science');
      expect(details.duration, '4');
      expect(details.stpSpSst, '4');
      expect(details.eventTypeDefault, 'Vorlesung');
      expect(details.eventTypeTag, 'VO');
      expect(details.semester, 'Wintersemester 2023/24');
      expect(details.semesterType, 'W');
      expect(details.semesterID, '23W');
      expect(details.semesterYear, '2023/24');
      expect(details.organisationNumber, 54321);
      expect(details.organisation, 'Informatik');
      expect(details.organisationTag, 'IN');
      expect(details.speaker, 'Prof. Dr. Müller');
      expect(details.courseContents, 'Fundamentals of CS');
      expect(details.courseObjective, 'Understand CS basics');
      expect(details.requirements, 'None');
      expect(details.teachingMethod, 'Lecture + Exercises');
      expect(details.examinationMode, 'Written exam');
      expect(details.note, 'Please register early');
      expect(details.curriculumURL, 'https://example.com/curriculum');
      expect(details.scheduledDatesURL, 'https://example.com/dates');
      expect(details.examDateURL, 'https://example.com/exam-dates');
    });

    test('decodes lecture details when row is a list (single-item list unwrap)', () {
      // xml2json may produce a list for row even when there's one element
      // in some edge cases. LectureDetailsElement handles both.
      const xml = '''
<rowset>
  <row>
    <stp_sp_nr>200002</stp_sp_nr>
    <stp_lv_nr>950000002</stp_lv_nr>
    <stp_sp_titel>Linear Algebra</stp_sp_titel>
    <dauer_info>2</dauer_info>
    <stp_sp_sst>2</stp_sp_sst>
    <stp_lv_art_name>Übung</stp_lv_art_name>
    <stp_lv_art_kurz>UE</stp_lv_art_kurz>
    <semester_name>Sommersemester 2024</semester_name>
    <semester>S</semester>
    <semester_id>24S</semester_id>
    <sj_name>2023/24</sj_name>
    <org_nr_betreut>12345</org_nr_betreut>
    <org_name_betreut>Mathematik</org_name_betreut>
    <org_kennung_betreut>MA</org_kennung_betreut>
  </row>
  <row>
    <stp_sp_nr>200003</stp_sp_nr>
    <stp_lv_nr>950000003</stp_lv_nr>
    <stp_sp_titel>Dummy Second Row</stp_sp_titel>
    <dauer_info>1</dauer_info>
    <stp_sp_sst>1</stp_sp_sst>
    <stp_lv_art_name>Seminar</stp_lv_art_name>
    <stp_lv_art_kurz>SE</stp_lv_art_kurz>
    <semester_name>Sommersemester 2024</semester_name>
    <semester>S</semester>
    <semester_id>24S</semester_id>
    <sj_name>2023/24</sj_name>
    <org_nr_betreut>12345</org_nr_betreut>
    <org_name_betreut>Mathematik</org_name_betreut>
    <org_kennung_betreut>MA</org_kennung_betreut>
  </row>
</rowset>
''';
      final json = tumXmlToJson(xml);
      // When multiple rows are present, json will have a List for "rowset"
      // LectureDetailsElement._lectureDetailsFromJson always takes the first
      final element = LectureDetailsElement.fromJson(json);

      expect(element.lectureDetails.id, 200002);
      expect(element.lectureDetails.title, 'Linear Algebra');
    });

    test('optional fields are null when absent', () {
      const xml = '''
<rowset>
  <row>
    <stp_sp_nr>300003</stp_sp_nr>
    <stp_lv_nr>950000003</stp_lv_nr>
    <stp_sp_titel>Minimal Lecture</stp_sp_titel>
    <dauer_info>2</dauer_info>
    <stp_sp_sst>2</stp_sp_sst>
    <stp_lv_art_name>Seminar</stp_lv_art_name>
    <stp_lv_art_kurz>SE</stp_lv_art_kurz>
    <semester_name>Sommersemester 2024</semester_name>
    <semester>S</semester>
    <semester_id>24S</semester_id>
    <sj_name>2023/24</sj_name>
    <org_nr_betreut>12345</org_nr_betreut>
    <org_name_betreut>Mathematik</org_name_betreut>
    <org_kennung_betreut>MA</org_kennung_betreut>
  </row>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final details = LectureDetailsElement.fromJson(json).lectureDetails;

      expect(details.speaker, isNull);
      expect(details.courseContents, isNull);
      expect(details.requirements, isNull);
      expect(details.courseObjective, isNull);
      expect(details.teachingMethod, isNull);
      expect(details.signUpLV, isNull);
      expect(details.firstScheduledDate, isNull);
      expect(details.examinationMode, isNull);
      expect(details.studienbehelfe, isNull);
      expect(details.note, isNull);
      expect(details.curriculumURL, isNull);
      expect(details.scheduledDatesURL, isNull);
      expect(details.examDateURL, isNull);
    });
  });
}
