import 'package:campus_flutter/base/enums/gender.dart';
import 'package:campus_flutter/personComponent/model/personDetails/person_details.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/xml_decoder.dart';

void main() {
  group('PersonDetailsData XML decoding', () {
    test('decodes a full person details response', () {
      const xml = '''
<rowset>
  <person>
    <nr>100001</nr>
    <obfuscated_id>G*123456</obfuscated_id>
    <vorname>Max</vorname>
    <familienname>Mustermann</familienname>
    <titel>Prof. Dr.</titel>
    <email>max.mustermann@tum.de</email>
    <geschlecht>M</geschlecht>
    <sprechstunde>Mon 10:00-12:00</sprechstunde>
    <dienstlich>
      <telefon>+49 89 289-12345</telefon>
      <mobiltelefon>+49 172 9876543</mobiltelefon>
      <fax>+49 89 289-12346</fax>
      <www_homepage>https://www.example.tum.de</www_homepage>
    </dienstlich>
    <gruppe>
      <org>Chair of Computer Science</org>
      <kennung>CS01</kennung>
      <org_nr>54321</org_nr>
      <titel>Professor</titel>
      <beschreibung>Full professor</beschreibung>
    </gruppe>
    <raum>
      <nummer>MI 03.11.057</nummer>
      <gebaeudename>Informatik</gebaeudename>
      <gebaeudenummer>0503.03</gebaeudenummer>
      <stockwerkname>3. Obergeschoss</stockwerkname>
      <stockwerknummer>3</stockwerknummer>
      <architekt>0503.03.057</architekt>
      <ortsbeschreibung>Garching</ortsbeschreibung>
      <kurz>MI 3.057</kurz>
      <lang>Garching, Informatik (MI), 3. OG, Zimmer 057</lang>
    </raum>
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
      final data = PersonDetailsData.fromJson(json);
      final person = data.person;

      expect(person.nr, '100001');
      expect(person.obfuscatedID, 'G*123456');
      expect(person.personGroup, 'G');
      expect(person.id, '123456');
      expect(person.firstName, 'Max');
      expect(person.name, 'Mustermann');
      expect(person.title, 'Prof. Dr.');
      expect(person.email, 'max.mustermann@tum.de');
      expect(person.gender, Gender.male);
      expect(person.officeHours, 'Mon 10:00-12:00');
      expect(person.fullName, 'Max Mustermann');
      expect(person.fullNameWithTitle, 'Prof. Dr. Max Mustermann');

      // Official contact
      expect(person.officialContact, isNotNull);
      expect(person.officialContact!.phone, '+49 89 289-12345');
      expect(person.officialContact!.mobilePhone, '+49 172 9876543');
      expect(person.officialContact!.fax, '+49 89 289-12346');
      expect(person.officialContact!.homepage, 'https://www.example.tum.de');

      // Organisations (gruppe → gruppen plural key)
      expect(person.organisations.length, 1);
      expect(person.organisations.first.name, 'Chair of Computer Science');
      expect(person.organisations.first.id, 'CS01');

      // Rooms (raum → raeume plural key)
      expect(person.rooms.length, 1);
      expect(person.rooms.first.number, 'MI 03.11.057');
      expect(person.rooms.first.buildingName, 'Informatik');

      // Phone extensions (nebenstelle → telefon_nebenstellen plural key)
      expect(person.phoneExtensions.length, 1);
      expect(person.phoneExtensions.first.branchNumber, '12345');
    });

    test('decodes female gender', () {
      const xml = '''
<rowset>
  <person>
    <nr>200001</nr>
    <obfuscated_id>G*999999</obfuscated_id>
    <vorname>Maria</vorname>
    <familienname>Musterfrau</familienname>
    <email>maria@tum.de</email>
    <geschlecht>F</geschlecht>
  </person>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final person = PersonDetailsData.fromJson(json).person;

      expect(person.gender, Gender.female);
    });

    test('decodes unknown gender', () {
      const xml = '''
<rowset>
  <person>
    <nr>300001</nr>
    <obfuscated_id>G*000001</obfuscated_id>
    <vorname>Test</vorname>
    <familienname>Person</familienname>
    <email>test@tum.de</email>
    <geschlecht>X</geschlecht>
  </person>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final person = PersonDetailsData.fromJson(json).person;

      expect(person.gender, Gender.unknown);
    });

    test('person without optional fields has empty lists and null values', () {
      const xml = '''
<rowset>
  <person>
    <nr>400001</nr>
    <obfuscated_id>G*111111</obfuscated_id>
    <vorname>Minimal</vorname>
    <familienname>Person</familienname>
    <email>minimal@tum.de</email>
    <geschlecht>m</geschlecht>
  </person>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final person = PersonDetailsData.fromJson(json).person;

      expect(person.title, isNull);
      expect(person.officeHours, isNull);
      expect(person.officialContact, isNull);
      expect(person.privateContact, isNull);
      expect(person.imageData, isNull);
      expect(person.organisations, isEmpty);
      expect(person.rooms, isEmpty);
      expect(person.phoneExtensions, isEmpty);
      // lowercase "m" should still decode to male
      expect(person.gender, Gender.male);
    });
  });
}
