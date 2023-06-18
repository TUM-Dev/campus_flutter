import 'package:campus_flutter/newsComponent/model/news.dart';
import 'package:campus_flutter/newsComponent/model/newsSource.dart';
import 'package:campus_flutter/newsComponent/service/newsService.dart';
import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';

class NewsViewModel {
  BehaviorSubject<List<NewsSource>?> newsSources = BehaviorSubject.seeded(null);

  getNewsSources() async {
    NewsService.fetchNews(false).then((value) {
      newsSources.add(value);
    }, onError: (error) => newsSources.addError(error));
  }

  List<(String?, News)> latestFiveNews() {
    if (newsSources.value != null) {
     final news = newsSources.value!.expand((element) => element.news).toList();

      news.removeWhere((element) => (element.created == null && element.source == "2"));

      news.sort((news1, news2) => news2.created.compareTo(news1.created));

      List<News> fiveNews = news.sublist(0, 5);

      return fiveNews
          .map((e) => (newsSources.value?.firstWhereOrNull((element) => e.source == element.id.toString())?.title, e))
          .toList();
    } else {
      return [];
    }
  }
}
