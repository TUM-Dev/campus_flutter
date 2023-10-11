import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/providers_get_it.dart';

class NewsService {
  static Future<(DateTime?, List<News>)> fetchNews(bool forcedRefresh) async {
    final start = DateTime.now();
    CampusClient mainApi = getIt<CampusClient>();
    final news = await mainApi.listNews(ListNewsRequest());
    return (start, news.news);
  }
}