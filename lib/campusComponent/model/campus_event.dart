import 'package:xml/xml.dart';

class CampusEvent {
  final String title;
  final String link;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? time;
  final String? location;

  const CampusEvent({
    required this.title,
    required this.link,
    this.startDate,
    this.endDate,
    this.time,
    this.location,
  });

  /// The date to display and sort by.
  DateTime? get eventDate => startDate;

  static List<CampusEvent> listFromRss(String rss) {
    try {
      final document = XmlDocument.parse(rss);
      final events =
          document
              .findAllElements('item')
              .map(_parseItem)
              .whereType<CampusEvent>()
              .toList()
            ..sort((a, b) {
              final aDate = a.eventDate ?? DateTime(0);
              final bDate = b.eventDate ?? DateTime(0);
              return aDate.compareTo(bDate);
            });
      return events;
    } catch (_) {
      return [];
    }
  }

  static CampusEvent? _parseItem(XmlElement item) {
    final title = _text(item, 'title');
    if (title.isEmpty) return null;
    return CampusEvent(
      title: title,
      link: _text(item, 'link'),
      startDate: DateTime.tryParse(_text(item, 'startDate')),
      endDate: DateTime.tryParse(_text(item, 'endDate')),
      time: _nullable(item, 'time'),
      location: _nullable(item, 'location'),
    );
  }

  static String _text(XmlElement item, String name) {
    final el = item.findElements(name);
    return el.isEmpty ? '' : el.first.innerText.trim();
  }

  static String? _nullable(XmlElement item, String name) {
    final text = _text(item, name);
    return text.isEmpty ? null : text;
  }
}
