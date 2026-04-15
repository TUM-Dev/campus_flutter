import 'package:campus_flutter/calendarComponent/model/calendar_editing.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/xml_decoder.dart';

void main() {
  group('CalendarCreationConfirmationData XML decoding', () {
    test('decodes a creation confirmation response', () {
      const xml = '''
<rowset>
  <termin>
    <nr>987654</nr>
  </termin>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final data = CalendarCreationConfirmationData.fromJson(json);

      expect(data.calendarCreationConfirmation.eventId, '987654');
    });
  });

  group('CalendarDeletionConfirmationData XML decoding', () {
    test('decodes a deletion confirmation response', () {
      const xml = '''
<rowset>
  <termin>
    <delete>OK</delete>
  </termin>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final data = CalendarDeletionConfirmationData.fromJson(json);

      expect(data.calendarDeletionConfirmation.status, 'OK');
    });
  });
}
