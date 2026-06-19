import 'package:campus_flutter/campusComponent/model/heilbronn_event.dart';
import 'package:dio/dio.dart';

class HeilbronnEventService {
  static String feedUrl(String languageCode) => languageCode == 'de'
      ? 'https://hn.fs.tum.de/de/events/index.xml'
      : 'https://hn.fs.tum.de/events/index.xml';

  static final _dio = Dio();

  static Future<List<HeilbronnEvent>> fetchEvents(String languageCode) async {
    final response = await _dio.get<String>(feedUrl(languageCode));
    return HeilbronnEvent.listFromRss(response.data ?? '');
  }
}
