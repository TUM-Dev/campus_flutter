import 'package:campus_flutter/studentCardComponent/model/student_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/xml_decoder.dart';

void main() {
  group('StudentCards XML decoding', () {
    test('decodes multiple student cards using the "cards" plural key', () {
      const xml = '''
<rowset>
  <card>
    <obfuscated_id>S*123456</obfuscated_id>
    <name>Max Mustermann</name>
    <geburtsdatum>2000-01-15 00:00:00</geburtsdatum>
    <matrikelnummer>03000001</matrikelnummer>
    <bibliotheksnummer>LIB001</bibliotheksnummer>
    <bibliothekskennung>A12B</bibliothekskennung>
    <chip_id_prime>CHIP-ABCDEF</chip_id_prime>
    <semester>Sommersemester 2024</semester>
    <gueltig_ab>2024-04-01 00:00:00</gueltig_ab>
    <gueltig_bis>2024-09-30 23:59:59</gueltig_bis>
    <studium>
      <name>Informatik</name>
      <abschluss>Bachelor of Science</abschluss>
      <abschluss_kurz>B.Sc.</abschluss_kurz>
      <identifikator>IN20200001</identifikator>
    </studium>
    <studium>
      <name>Mathematik</name>
      <abschluss>Bachelor of Science</abschluss>
      <identifikator>MA20200002</identifikator>
    </studium>
    <foto>BASE64ENCODEDIMAGE==</foto>
  </card>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final studentCards = StudentCards.fromJson(json);

      expect(studentCards.studentCards.length, 1);

      final card = studentCards.studentCards.first;
      expect(card.id, 'S*123456');
      expect(card.name, 'Max Mustermann');
      expect(card.birthday, DateTime.parse('2000-01-15 00:00:00'));
      expect(card.studyID, '03000001');
      expect(card.libraryID, 'LIB001');
      expect(card.libraryCode, 'A12B');
      expect(card.chipID, 'CHIP-ABCDEF');
      expect(card.semester, 'Sommersemester 2024');
      expect(card.validFrom, DateTime.parse('2024-04-01 00:00:00'));
      expect(card.validUntil, DateTime.parse('2024-09-30 23:59:59'));
      expect(card.image, 'BASE64ENCODEDIMAGE==');

      expect(card.studies.length, 2);

      final firstStudy = card.studies.first;
      expect(firstStudy.name, 'Informatik');
      expect(firstStudy.degree, 'Bachelor of Science');
      expect(firstStudy.degreeShort, 'B.Sc.');
      expect(firstStudy.id, 'IN20200001');

      final secondStudy = card.studies[1];
      expect(secondStudy.name, 'Mathematik');
      expect(secondStudy.degreeShort, isNull);
    });

    test('decodes multiple cards', () {
      const xml = '''
<rowset>
  <card>
    <obfuscated_id>S*111111</obfuscated_id>
    <name>Person One</name>
    <geburtsdatum>1999-05-20 00:00:00</geburtsdatum>
    <matrikelnummer>03111111</matrikelnummer>
    <chip_id_prime>CHIP-111</chip_id_prime>
    <semester>Sommersemester 2024</semester>
    <gueltig_ab>2024-04-01 00:00:00</gueltig_ab>
    <gueltig_bis>2024-09-30 23:59:59</gueltig_bis>
    <foto>IMAGE1==</foto>
  </card>
  <card>
    <obfuscated_id>S*222222</obfuscated_id>
    <name>Person Two</name>
    <geburtsdatum>2001-08-10 00:00:00</geburtsdatum>
    <matrikelnummer>03222222</matrikelnummer>
    <chip_id_prime>CHIP-222</chip_id_prime>
    <semester>Sommersemester 2024</semester>
    <gueltig_ab>2024-04-01 00:00:00</gueltig_ab>
    <gueltig_bis>2024-09-30 23:59:59</gueltig_bis>
    <foto>IMAGE2==</foto>
  </card>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final studentCards = StudentCards.fromJson(json);

      expect(studentCards.studentCards.length, 2);
      expect(studentCards.studentCards[0].id, 'S*111111');
      expect(studentCards.studentCards[1].id, 'S*222222');
    });

    test('returns empty list when rowset has no cards', () {
      const xml = '<rowset/>';
      final json = tumXmlToJson(xml);
      final studentCards = StudentCards.fromJson(json);

      expect(studentCards.studentCards, isEmpty);
    });

    test('card without library fields has null libraryID and libraryCode', () {
      const xml = '''
<rowset>
  <card>
    <obfuscated_id>S*333333</obfuscated_id>
    <name>No Library</name>
    <geburtsdatum>2002-03-01 00:00:00</geburtsdatum>
    <matrikelnummer>03333333</matrikelnummer>
    <chip_id_prime>CHIP-333</chip_id_prime>
    <semester>Wintersemester 2024/25</semester>
    <gueltig_ab>2024-10-01 00:00:00</gueltig_ab>
    <gueltig_bis>2025-03-31 23:59:59</gueltig_bis>
    <foto>IMAGE3==</foto>
  </card>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final card = StudentCards.fromJson(json).studentCards.first;

      expect(card.libraryID, isNull);
      expect(card.libraryCode, isNull);
      expect(card.studies, isEmpty);
    });

    test('card with exactly one studium element decodes as list of one', () {
      // A student enrolled in a single programme — xml2json may produce a Map
      // rather than a List for the studium key when there is only one element.
      // The @JsonKey(name: "studium", defaultValue: []) annotation must handle this.
      const xml = '''
<rowset>
  <card>
    <obfuscated_id>S*444444</obfuscated_id>
    <name>Single Study Student</name>
    <geburtsdatum>2003-06-15 00:00:00</geburtsdatum>
    <matrikelnummer>03444444</matrikelnummer>
    <chip_id_prime>CHIP-444</chip_id_prime>
    <semester>Sommersemester 2024</semester>
    <gueltig_ab>2024-04-01 00:00:00</gueltig_ab>
    <gueltig_bis>2024-09-30 23:59:59</gueltig_bis>
    <foto>IMAGE4==</foto>
    <studium>
      <name>Physik</name>
      <abschluss>Bachelor of Science</abschluss>
      <abschluss_kurz>B.Sc.</abschluss_kurz>
      <identifikator>PH20230001</identifikator>
    </studium>
  </card>
</rowset>
''';
      final card = StudentCards.fromJson(tumXmlToJson(xml)).studentCards.first;

      expect(card.studies.length, 1);
      expect(card.studies.first.name, 'Physik');
      expect(card.studies.first.id, 'PH20230001');
    });
  });
}
