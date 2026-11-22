import 'package:campus_flutter/campusComponent/model/campus_event.dart';
import 'package:dio/dio.dart';

class CampusEventService {
  static String _feedUrl(String languageCode) => languageCode == 'de'
      ? 'https://hn.fs.tum.de/de/events/index.xml'
      : 'https://hn.fs.tum.de/events/index.xml';

  static final _dio = Dio();

  static Future<(DateTime, List<CampusEvent>)> fetchEvents(
    String languageCode,
  ) async {
    final now = DateTime.now();
    final response = await _dio.get<String>(_feedUrl(languageCode));
    final events = CampusEvent.listFromRss(response.data ?? '').where((e) {
      // Use endDate when available so an ongoing event isn't hidden early.
      final cutoff = e.endDate ?? e.startDate;
      return cutoff == null || cutoff.isAfter(now);
    }).toList();
    return (now, events);
  }
}
