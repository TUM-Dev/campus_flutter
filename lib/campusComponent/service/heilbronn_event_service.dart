import 'package:campus_flutter/campusComponent/model/heilbronn_event.dart';
import 'package:dio/dio.dart';

class HeilbronnEventService {
  static const feedUrl = 'https://hn.fs.tum.de/events/index.xml';

  static final _dio = Dio();

  static Future<List<HeilbronnEvent>> fetchEvents() async {
    final response = await _dio.get<String>(feedUrl);
    return HeilbronnEvent.listFromRss(response.data ?? '');
  }
}
