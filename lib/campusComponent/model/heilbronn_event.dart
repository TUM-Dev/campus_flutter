import 'package:intl/intl.dart';
import 'package:xml/xml.dart';

class HeilbronnEvent {
  final String title;
  final String link;
  final String description;
  final DateTime? publishedAt;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? time;
  final String? location;

  const HeilbronnEvent({
    required this.title,
    required this.link,
    required this.description,
    this.publishedAt,
    this.startDate,
    this.endDate,
    this.time,
    this.location,
  });

  DateTime? get eventDate => startDate ?? publishedAt;

  static final _timeRegExp = RegExp(
    r'Time:\s*(.*?)(?=\s*(?:Date:|Time:|Location:|$))',
    caseSensitive: false,
  );
  static final _locationRegExp = RegExp(
    r'Location:\s*(.*?)(?=\s*(?:Date:|Time:|Location:|$))',
    caseSensitive: false,
  );

  static List<HeilbronnEvent> listFromRss(String rss) {
    try {
      final document = XmlDocument.parse(rss);
      final events = document
          .findAllElements('item')
          .map((item) {
            final description = _elementText(item, 'description');
            final pubDate = _parsePubDate(_elementText(item, 'pubDate'));

            return HeilbronnEvent(
              title: _elementText(item, 'title'),
              link: _elementText(item, 'link'),
              description: description,
              publishedAt: pubDate,
              startDate: DateTime.tryParse(_elementText(item, 'startDate')) ??
                  DateTime.tryParse(_elementText(item, 'start-date')),
              endDate: DateTime.tryParse(_elementText(item, 'endDate')) ??
                  DateTime.tryParse(_elementText(item, 'end-date')),
              time: _timeRegExp.firstMatch(description)?.group(1)?.trim(),
              location:
                  _locationRegExp.firstMatch(description)?.group(1)?.trim(),
            );
          })
          .where((event) => event.title.isNotEmpty)
          .toList();

      events.sort((a, b) {
        final firstDate = a.eventDate ?? DateTime(0);
        final secondDate = b.eventDate ?? DateTime(0);
        return firstDate.compareTo(secondDate);
      });
      return events;
    } catch (_) {
      return [];
    }
  }

  static String _elementText(XmlElement item, String name) {
    final elements = item.findElements(name);
    return elements.isEmpty ? '' : elements.first.innerText.trim();
  }

  static DateTime? _parsePubDate(String value) {
    try {
      return DateFormat('EEE, dd MMM yyyy HH:mm:ss Z', 'en_US').parse(value);
    } catch (_) {
      return null;
    }
  }
}
