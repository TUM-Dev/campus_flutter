import 'package:campus_flutter/base/networking/apis/tumCabeApi/tum_cabe_api.dart';
import 'package:campus_flutter/base/networking/apis/tumCabeApi/tum_cabe_api_service.dart';
import 'package:campus_flutter/base/networking/protocols/main_api.dart';
import 'package:campus_flutter/newsComponent/model/news.dart';
import 'package:campus_flutter/providers_get_it.dart';

class NewsService {
  static Future<(DateTime?, List<News>)> fetchNews(bool forcedRefresh) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequest<NewsData, TumCabeApi>(
        TumCabeApi(
            tumCabeApiService: TumCabeApiServiceNews(
                DateTime.now().subtract(const Duration(days: 30)))),
        NewsData.fromJson,
        forcedRefresh);

    return (response.saved, response.data.news);
  }
}
