import 'package:campus_flutter/personComponent/model/personDetails/person_details.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/xml_decoder.dart';

void main() {
  group('PersonDetails single nested element handling', () {
    test('decodes a single <raum> element as a list of one room', () {
      // When a professor has exactly one office room, xml2json may produce
      // a Map instead of a List for the "raeume" key. The @JsonKey defaultValue
      // together with toParkerWithAttrs plural mapping handles this correctly.
      const xml = '''
<rowset>
  <person>
    <nr>100001</nr>
    <obfuscated_id>G*123456</obfuscated_id>
    <vorname>Max</vorname>
    <familienname>Mustermann</familienname>
    <email>max@tum.de</email>
    <geschlecht>M</geschlecht>
    <raum>
      <nummer>MI 03.11.057</nummer>
      <gebaeudename>Informatik</gebaeudename>
      <gebaeudenummer>0503.03</gebaeudenummer>
      <stockwerkname>3. OG</stockwerkname>
      <stockwerknummer>3</stockwerknummer>
      <architekt>0503.03.057</architekt>
      <ortsbeschreibung>Garching</ortsbeschreibung>
      <kurz>MI 3.057</kurz>
      <lang>Garching, MI, 3. OG, Zimmer 057</lang>
    </raum>
  </person>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final person = PersonDetailsData.fromJson(json).person;

      // Must be a list of exactly one room — not zero, not an error
      expect(person.rooms.length, 1);
      expect(person.rooms.first.number, 'MI 03.11.057');
      expect(person.rooms.first.buildingName, 'Informatik');
    });

    test('decodes a single <gruppe> (organisation) element as a list of one', () {
      const xml = '''
<rowset>
  <person>
    <nr>200001</nr>
    <obfuscated_id>G*999999</obfuscated_id>
    <vorname>Anna</vorname>
    <familienname>Schmidt</familienname>
    <email>anna@tum.de</email>
    <geschlecht>F</geschlecht>
    <gruppe>
      <org>Chair of Computer Science</org>
      <kennung>CS01</kennung>
      <org_nr>54321</org_nr>
      <titel>Lecturer</titel>
      <beschreibung>Tenured faculty</beschreibung>
    </gruppe>
  </person>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final person = PersonDetailsData.fromJson(json).person;

      expect(person.organisations.length, 1);
      expect(person.organisations.first.name, 'Chair of Computer Science');
      expect(person.organisations.first.id, 'CS01');
    });

    test('decodes a single <nebenstelle> element as a list of one', () {
      const xml = '''
<rowset>
  <person>
    <nr>300001</nr>
    <obfuscated_id>G*111111</obfuscated_id>
    <vorname>Test</vorname>
    <familienname>Person</familienname>
    <email>test@tum.de</email>
    <geschlecht>M</geschlecht>
    <nebenstelle>
      <telefonnummer>+49 89 289-12345</telefonnummer>
      <tum_anlage_land>49</tum_anlage_land>
      <tum_anlage_ortsvorwahl>089</tum_anlage_ortsvorwahl>
      <tum_anlage_nummer>289</tum_anlage_nummer>
      <tum_nebenstelle>12345</tum_nebenstelle>
    </nebenstelle>
  </person>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final person = PersonDetailsData.fromJson(json).person;

      expect(person.phoneExtensions.length, 1);
      expect(person.phoneExtensions.first.branchNumber, '12345');
    });
  });
}
