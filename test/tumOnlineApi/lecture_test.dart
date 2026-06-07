import 'package:campus_flutter/studiesComponent/model/lecture.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/xml_decoder.dart';

void main() {
  group('Lectures XML decoding', () {
    test('decodes multiple lectures from XML', () {
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
    <sj_name>2023/24</sj_name>
    <semester>W</semester>
    <semester_name>Wintersemester 2023/24</semester_name>
    <semester_id>23W</semester_id>
    <org_nr_betreut>54321</org_nr_betreut>
    <org_name_betreut>Informatik</org_name_betreut>
    <org_kennung_betreut>IN</org_kennung_betreut>
    <vortragende_mitwirkende>Prof. Dr. Müller</vortragende_mitwirkende>
  </row>
  <row>
    <stp_sp_nr>100002</stp_sp_nr>
    <stp_lv_nr>950000002</stp_lv_nr>
    <stp_sp_titel>Linear Algebra</stp_sp_titel>
    <dauer_info>2</dauer_info>
    <stp_sp_sst>2</stp_sp_sst>
    <stp_lv_art_name>Übung</stp_lv_art_name>
    <stp_lv_art_kurz>UE</stp_lv_art_kurz>
    <sj_name>2023/24</sj_name>
    <semester>W</semester>
    <semester_name>Wintersemester 2023/24</semester_name>
    <semester_id>23W</semester_id>
    <org_nr_betreut>54322</org_nr_betreut>
    <org_name_betreut>Mathematik</org_name_betreut>
  </row>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final lectures = Lectures.fromJson(json);

      expect(lectures.lectures.length, 2);

      final first = lectures.lectures.first;
      expect(first.id, '100001');
      expect(first.lvNumber, '950000001');
      expect(first.title, 'Introduction to Computer Science');
      expect(first.duration, '4');
      expect(first.stpSpSst, '4');
      expect(first.eventTypeDefault, 'Vorlesung');
      expect(first.eventTypeTag, 'VO');
      expect(first.semesterYear, '2023/24');
      expect(first.semesterType, 'W');
      expect(first.semester, 'Wintersemester 2023/24');
      expect(first.semesterID, '23W');
      expect(first.organisationNumber, '54321');
      expect(first.organisation, 'Informatik');
      expect(first.organisationTag, 'IN');
      expect(first.speaker, 'Prof. Dr. Müller');
      expect(first.sws, '4 SWS');

      final second = lectures.lectures[1];
      expect(second.id, '100002');
      expect(second.eventTypeDefault, 'Übung');
      expect(second.organisationTag, isNull);
      expect(second.speaker, isNull);
    });

    test('returns empty lectures list when rowset has no rows', () {
      const xml = '<rowset/>';
      final json = tumXmlToJson(xml);
      final lectures = Lectures.fromJson(json);

      expect(lectures.lectures, isEmpty);
    });
  });
}
