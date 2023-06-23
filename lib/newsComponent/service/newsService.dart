import 'package:campus_flutter/base/networking/apis/tumCabeApi/tum_cabe_api.dart';
import 'package:campus_flutter/base/networking/apis/tumCabeApi/tum_cabe_api_service.dart';
import 'package:campus_flutter/base/networking/protocols/main_api.dart';
import 'package:campus_flutter/newsComponent/model/news.dart';
import 'package:campus_flutter/newsComponent/model/newsSource.dart';
import 'package:campus_flutter/providers_get_it.dart';

class NewsService {
  static Future<(DateTime?, List<NewsSource>)> fetchNews(bool forcedRefresh) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequest<NewsSources, TumCabeApi>(
        TumCabeApi(tumCabeService: TumCabeServiceNewsSources()),
            NewsSources.fromJson,
            forcedRefresh
    );

    List<NewsSource> newsSources = response.data.newsSources;

    for (var newsSource in newsSources.indexed) {
      try {
        final newsResponse = await mainApi.makeRequest<NewsData, TumCabeApi>(
            TumCabeApi(tumCabeService: TumCabeServiceNews(source: newsSource.$2.id.toString())),
            NewsData.fromJson,
            forcedRefresh
        );

        newsSources[newsSource.$2.id].news.addAll(newsResponse.data.news);
      } catch (_) {}
    }

    return (response.saved, newsSources);
  }
}