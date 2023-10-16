import 'package:campus_flutter/base/networking/apis/google/protobuf/timestamp.pb.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/cached_client.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/providers_get_it.dart';

class NewsService {
  static Future<(DateTime?, List<News>)> fetchNews(bool forcedRefresh) async {
    final start = DateTime.now();
    CachedCampusClient mainApi = getIt<CachedCampusClient>();
    final news = await mainApi.listNews(ListNewsRequest(
        oldestDateAt: Timestamp.fromDateTime(
            DateTime.now().subtract(const Duration(days: 30)))));

    return (start, news.news);
  }
}
