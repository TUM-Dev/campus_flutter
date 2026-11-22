import 'package:campus_flutter/campusComponent/model/campus_event.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' as html_parser;

class CampusEventService {
  static String _feedUrl(String languageCode) => languageCode == 'de'
      ? 'https://hn.fs.tum.de/de/events/index.xml'
      : 'https://hn.fs.tum.de/events/index.xml';

  static final _dio = Dio();

  static Future<(DateTime, List<CampusEvent>)> fetchEvents(
    String languageCode,
  ) async {
    final now = DateTime.now();
    final results = await Future.wait([
      _fetchStudentCouncil(languageCode),
      _fetchUniversity(languageCode),
    ]);
    final events =
        [...results[0], ...results[1]].where((e) {
          final cutoff = e.endDate ?? e.startDate;
          return cutoff == null || cutoff.isAfter(now);
        }).toList()..sort((a, b) {
          final aDate = a.eventDate ?? DateTime(9999);
          final bDate = b.eventDate ?? DateTime(9999);
          return aDate.compareTo(bDate);
        });
    return (now, events);
  }

  static Future<List<CampusEvent>> _fetchStudentCouncil(
    String languageCode,
  ) async {
    try {
      final response = await _dio.get<String>(_feedUrl(languageCode));
      return CampusEvent.listFromRss(response.data ?? '');
    } catch (_) {
      return [];
    }
  }

  static Future<List<CampusEvent>> _fetchUniversity(String languageCode) async {
    try {
      final url = languageCode == 'de'
          ? 'https://chn.tum.de/de/news-events/events'
          : 'https://chn.tum.de/news-events/events';
      final response = await _dio.get<String>(url);
      final document = html_parser.parse(response.data ?? '');
      return document
          .querySelectorAll('article.c-events-solr-list__item')
          .map((item) {
            final titleAnchor = item.querySelector(
              '.c-events-solr-list__item-title a',
            );
            final title = titleAnchor?.text.trim() ?? '';
            if (title.isEmpty) return null;
            final link = titleAnchor?.attributes['href'] ?? '';
            final dateText =
                item.querySelector('time')?.attributes['datetime'] ?? '';
            final rawImg =
                item.querySelector('picture source')?.attributes['srcset'] ??
                item.querySelector('img')?.attributes['src'] ??
                '';
            final coverUrl = rawImg.isEmpty
                ? null
                : (rawImg.startsWith('http')
                      ? rawImg
                      : 'https://chn.tum.de$rawImg');
            final description = item
                .querySelector('.c-events-solr-list__item-teaser')
                ?.text
                .trim();
            return CampusEvent(
              title: title,
              link: link,
              source: CampusEventSource.university,
              startDate: DateTime.tryParse(dateText),
              coverUrl: coverUrl,
              description: description,
            );
          })
          .whereType<CampusEvent>()
          .toList();
    } catch (_) {
      return [];
    }
  }
}
