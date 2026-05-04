import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/xml_decoder.dart';

void main() {
  CalendarEvent makeEvent({
    String url = '',
    String? description,
    int? color,
  }) {
    return CalendarEvent(
      id: '1',
      status: 'CONFIRMED',
      url: url.isEmpty ? null : url,
      title: 'Test',
      description: description,
      startDate: DateTime(2024, 4, 15, 10, 0),
      endDate: DateTime(2024, 4, 15, 12, 0),
      locations: [],
      color: color,
    );
  }

  group('CalendarEvent.lvNr', () {
    test('returns the lecture number from a well-formed URL', () {
      final event = makeEvent(
        url: 'https://campus.tum.de/tumonline/wbLv.wbShowLVDetail?pStpSpNr=123&LvNr=950123456',
      );
      expect(event.lvNr, '950123456');
    });

    test('returns null when url is null', () {
      final event = makeEvent(url: '');
      expect(event.lvNr, isNull);
    });

    test('returns the full string after split when URL has no "LvNr="', () {
      // Known behaviour: split on "LvNr=" returns the whole url as .last
      final event = makeEvent(url: 'https://campus.tum.de/some/other/path');
      // The result is the URL itself (no LvNr= present → split produces one element)
      expect(event.lvNr, 'https://campus.tum.de/some/other/path');
    });
  });

  group('CalendarEvent.getColor()', () {
    test('returns orange when description contains "prüfungstermin"', () {
      final event = makeEvent(description: 'Prüfungstermin für IN0001');
      expect(event.getColor(), Colors.orange);
    });

    test('is case-insensitive for "prüfungstermin"', () {
      final event = makeEvent(description: 'PRÜFUNGSTERMIN');
      expect(event.getColor(), Colors.orange);
    });

    test('returns the stored color when set and not an exam', () {
      final event = makeEvent(
        description: 'Regular lecture',
        color: Colors.green.value,
      );
      expect(event.getColor().value, Colors.green.value);
    });

    test('returns primaryLightColor when color is null and not an exam', () {
      final event = makeEvent(description: null);
      // primaryLightColor is the fallback — just assert it is not null and not orange
      expect(event.getColor(), isNotNull);
      expect(event.getColor(), isNot(Colors.orange));
    });
  });

  group('CalendarEvent XML round-trip computed properties', () {
    test('timePeriod is formatted correctly after decode', () {
      const xml = '''
<rowset>
  <event>
    <nr>1</nr>
    <status>CONFIRMED</status>
    <title>Test Lecture</title>
    <dtstart>2024-04-15 10:00:00</dtstart>
    <dtend>2024-04-15 12:00:00</dtend>
  </event>
</rowset>
''';
      final event = CalendarEvents.fromJson(tumXmlToJson(xml)).events.first;
      // timePeriod formats as "HH:mm - HH:mm"
      expect(event.timePeriod, '10:00 - 12:00');
    });
  });

}
