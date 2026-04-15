import 'package:campus_flutter/personComponent/model/personSearch/person.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/xml_decoder.dart';

void main() {
  group('Persons XML decoding', () {
    test('decodes multiple persons from XML', () {
      const xml = '''
<rowset>
  <row>
    <vorname>Max</vorname>
    <familienname>Mustermann</familienname>
    <titel>Dr.</titel>
    <nr>100001</nr>
    <obfuscated_id>G*123456</obfuscated_id>
  </row>
  <row>
    <vorname>Maria</vorname>
    <familienname>Musterfrau</familienname>
    <nr>100002</nr>
    <obfuscated_id>G*789012</obfuscated_id>
  </row>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final persons = Persons.fromJson(json);

      expect(persons.persons.length, 2);

      final first = persons.persons.first;
      expect(first.firstname, 'Max');
      expect(first.surname, 'Mustermann');
      expect(first.title, 'Dr.');
      expect(first.nr, '100001');
      expect(first.obfuscatedID, 'G*123456');
      expect(first.personGroup, 'G');
      expect(first.id, '123456');
      expect(first.fullName, 'Max Mustermann');
      expect(first.fullNameWithTitle, 'Dr. Max Mustermann');

      final second = persons.persons[1];
      expect(second.firstname, 'Maria');
      expect(second.surname, 'Musterfrau');
      expect(second.title, isNull);
      expect(second.fullNameWithTitle, 'Maria Musterfrau');
    });

    test('returns empty persons list when rowset has no rows', () {
      const xml = '<rowset/>';
      final json = tumXmlToJson(xml);
      final persons = Persons.fromJson(json);

      expect(persons.persons, isEmpty);
    });

    test('decodes person without optional title', () {
      const xml = '''
<rowset>
  <row>
    <vorname>Anna</vorname>
    <familienname>Beispiel</familienname>
    <nr>200001</nr>
    <obfuscated_id>S*654321</obfuscated_id>
  </row>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final person = Persons.fromJson(json).persons.first;

      expect(person.title, isNull);
      expect(person.fullNameWithTitle, 'Anna Beispiel');
    });
  });
}
