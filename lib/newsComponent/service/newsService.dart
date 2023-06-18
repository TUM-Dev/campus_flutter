import 'package:campus_flutter/base/networking/apis/tumCabeApi/tumCabeApi.dart';
import 'package:campus_flutter/base/networking/apis/tumCabeApi/tumCabeApiError.dart';
import 'package:campus_flutter/base/networking/apis/tumCabeApi/tumCabeApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/newsComponent/model/news.dart';
import 'package:campus_flutter/newsComponent/model/newsSource.dart';
import 'package:campus_flutter/providers_get_it.dart';

class NewsService {
  static Future<List<NewsSource>> fetchNews(bool forcedRefresh) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequest<NewsSources, TumCabeApi, TumCabeApiError>(
        TumCabeApi(tumCabeService: TumCabeServiceNewsSources()),
            NewsSources.fromJson,
            TumCabeApiError.fromJson,
            forcedRefresh
    );

    List<NewsSource> newsSources = response.data.newsSources;

    for (var newsSource in newsSources.indexed) {
      try {
        final newsResponse = await mainApi.makeRequest<NewsData, TumCabeApi, TumCabeApiError>(
            TumCabeApi(tumCabeService: TumCabeServiceNews(source: newsSource.$2.id.toString())),
            NewsData.fromJson,
            TumCabeApiError.fromJson,
            forcedRefresh
        );

        newsSources[newsSource.$2.id].news.addAll(newsResponse.data.news);
      } catch (_) {}
    }

    return newsSources;
  }
}