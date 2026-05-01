import 'package:campus_flutter/base/enums/role.dart';
import 'package:campus_flutter/personComponent/model/profile/profile.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/xml_decoder.dart';

void main() {
  group('Profiles XML decoding', () {
    test('decodes a student profile — single row unwrap', () {
      const xml = '''
<rowset>
  <row>
    <vorname>Max</vorname>
    <familienname>Mustermann</familienname>
    <kennung>ga12abc</kennung>
    <obfuscated_id>G*123456</obfuscated_id>
    <obfuscated_id_studierende>S*654321</obfuscated_id_studierende>
  </row>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final profiles = Profiles.fromJson(json);
      final profile = profiles.profile;

      expect(profile.firstname, 'Max');
      expect(profile.surname, 'Mustermann');
      expect(profile.tumID, 'ga12abc');
      expect(profile.obfuscatedID, 'G*123456');
      expect(profile.obfuscatedIDStudent, 'S*654321');
      expect(profile.obfuscatedIDEmployee, isNull);
      expect(profile.role, Role.student);
    });

    test('decodes an employee profile', () {
      const xml = '''
<rowset>
  <row>
    <vorname>Anna</vorname>
    <familienname>Schmidt</familienname>
    <kennung>as99xyz</kennung>
    <obfuscated_id>G*111111</obfuscated_id>
    <obfuscated_id_bedienstete>E*222222</obfuscated_id_bedienstete>
  </row>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final profile = Profiles.fromJson(json).profile;

      expect(profile.role, Role.employee);
      expect(profile.obfuscatedIDEmployee, 'E*222222');
      expect(profile.obfuscatedIDStudent, isNull);
    });

    test('decodes an extern profile', () {
      const xml = '''
<rowset>
  <row>
    <vorname>Extern</vorname>
    <familienname>User</familienname>
    <kennung>ex00000</kennung>
    <obfuscated_id>G*000000</obfuscated_id>
    <obfuscated_id_extern>X*000000</obfuscated_id_extern>
  </row>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final profile = Profiles.fromJson(json).profile;

      expect(profile.role, Role.extern);
      expect(profile.obfuscatedIDExtern, 'X*000000');
    });

    test('single-row list unwrap: takes first row when multiple rows present', () {
      const xml = '''
<rowset>
  <row>
    <vorname>First</vorname>
    <familienname>Person</familienname>
    <kennung>fp00001</kennung>
    <obfuscated_id>G*100001</obfuscated_id>
    <obfuscated_id_studierende>S*100001</obfuscated_id_studierende>
  </row>
  <row>
    <vorname>Second</vorname>
    <familienname>Person</familienname>
    <kennung>sp00002</kennung>
    <obfuscated_id>G*100002</obfuscated_id>
    <obfuscated_id_studierende>S*100002</obfuscated_id_studierende>
  </row>
</rowset>
''';
      final json = tumXmlToJson(xml);
      // _profileFromJson takes data.first when it's a List
      final profile = Profiles.fromJson(json).profile;

      expect(profile.firstname, 'First');
    });
  });
}
