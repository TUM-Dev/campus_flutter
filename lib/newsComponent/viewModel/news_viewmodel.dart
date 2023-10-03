import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/newsComponent/model/news.dart';
import 'package:campus_flutter/newsComponent/model/news_source.dart';
import 'package:campus_flutter/newsComponent/service/news_service.dart';
import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';

class NewsViewModel implements ViewModel {
  BehaviorSubject<List<NewsSource>?> newsSources = BehaviorSubject.seeded(null);

  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  @override
  Future fetch(bool forcedRefresh) async {
    NewsService.fetchNews(false).then((value) {
      lastFetched.add(value.$1);
      newsSources.add(value.$2);
    }, onError: (error) => newsSources.addError(error));
  }

  List<(String?, News)> latestFiveNews() {
    if (newsSources.value != null) {
      final news =
          newsSources.value!.expand((element) => element.news).toList();

      news.removeWhere((element) => (element.source == "2"));

      news.sort((news1, news2) => news2.created.compareTo(news1.created));

      List<News> fiveNews = news.sublist(0, 5);

      return fiveNews
          .map((e) => (
                newsSources.value!
                    .firstWhereOrNull(
                        (element) => e.source == element.id.toString())
                    ?.title,
                e
              ))
          .toList();
    } else {
      return [];
    }
  }
}
