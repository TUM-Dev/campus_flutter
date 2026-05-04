import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/xml_decoder.dart';

void main() {
  group('CalendarEvents XML decoding', () {
    test('decodes multiple events from XML', () {
      const xml = '''
<rowset>
  <event>
    <nr>12345</nr>
    <status>CONFIRMED</status>
    <url>https://campus.tum.de/tumonline/wbLv.wbShowLVDetail?pStpSpNr=123456789&amp;LvNr=950123456</url>
    <title>Introduction to Computer Science</title>
    <description>Lecture on CS fundamentals</description>
    <dtstart>2024-04-15 10:00:00</dtstart>
    <dtend>2024-04-15 12:00:00</dtend>
    <location>MI 00.08.038, Garching</location>
  </event>
  <event>
    <nr>67890</nr>
    <status>CONFIRMED</status>
    <title>Advanced Algorithms</title>
    <dtstart>2024-04-16 14:00:00</dtstart>
    <dtend>2024-04-16 16:00:00</dtend>
    <location>MI 02.08.011</location>
    <location>MI 02.08.012</location>
  </event>
</rowset>
''';
      final json = tumXmlToJson(xml);
      // After toParkerWithAttrs the "event" key is pluralised to "events"
      final events = CalendarEvents.fromJson(json);

      expect(events.events.length, 2);

      final first = events.events.first;
      expect(first.id, '12345');
      expect(first.status, 'CONFIRMED');
      expect(first.title, 'Introduction to Computer Science');
      expect(first.description, 'Lecture on CS fundamentals');
      expect(first.startDate, DateTime.parse('2024-04-15 10:00:00'));
      expect(first.endDate, DateTime.parse('2024-04-15 12:00:00'));
      expect(first.locations, ['MI 00.08.038, Garching']);
      expect(first.lvNr, '950123456');
      expect(first.isCanceled, isFalse);

      final second = events.events[1];
      expect(second.id, '67890');
      expect(second.locations.length, 2);
      expect(second.locations, containsAll(['MI 02.08.011', 'MI 02.08.012']));
    });

    test('decodes a single event (location as single value, not list)', () {
      const xml = '''
<rowset>
  <event>
    <nr>11111</nr>
    <status>CONFIRMED</status>
    <title>Single Location Event</title>
    <dtstart>2024-05-01 08:00:00</dtstart>
    <dtend>2024-05-01 10:00:00</dtend>
    <location>MI 01.06.020</location>
  </event>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final events = CalendarEvents.fromJson(json);

      expect(events.events.length, 1);
      // readListValue should wrap a single string in a list
      expect(events.events.first.locations, ['MI 01.06.020']);
    });

    test('returns empty events list when rowset has no events', () {
      const xml = '<rowset/>';
      final json = tumXmlToJson(xml);
      final events = CalendarEvents.fromJson(json);

      expect(events.events, isEmpty);
    });

    test('decodes a canceled event', () {
      const xml = '''
<rowset>
  <event>
    <nr>99999</nr>
    <status>CANCEL</status>
    <title>Canceled Lecture</title>
    <dtstart>2024-06-01 10:00:00</dtstart>
    <dtend>2024-06-01 12:00:00</dtend>
  </event>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final events = CalendarEvents.fromJson(json);

      expect(events.events.first.isCanceled, isTrue);
      // No location in XML → readListValue returns []
      expect(events.events.first.locations, isEmpty);
    });

    test('duration is calculated correctly', () {
      const xml = '''
<rowset>
  <event>
    <nr>55555</nr>
    <status>CONFIRMED</status>
    <title>Two Hour Lecture</title>
    <dtstart>2024-04-15 10:00:00</dtstart>
    <dtend>2024-04-15 12:00:00</dtend>
  </event>
</rowset>
''';
      final json = tumXmlToJson(xml);
      final events = CalendarEvents.fromJson(json);
      expect(events.events.first.duration, const Duration(hours: 2));
    });
  });
}
