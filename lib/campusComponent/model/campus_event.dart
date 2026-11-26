import 'package:xml/xml.dart';

enum CampusEventSource { studentCouncil, university }

class CampusEvent {
  final String title;
  final String link;
  final CampusEventSource source;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? time;
  final String? location;
  final String? coverUrl;
  final String? description;

  const CampusEvent({
    required this.title,
    required this.link,
    this.source = CampusEventSource.studentCouncil,
    this.startDate,
    this.endDate,
    this.time,
    this.location,
    this.coverUrl,
    this.description,
  });

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
