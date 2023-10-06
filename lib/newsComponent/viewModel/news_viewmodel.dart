import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/newsComponent/model/news.dart';
import 'package:campus_flutter/newsComponent/service/news_service.dart';
import 'package:rxdart/rxdart.dart';

class NewsViewModel implements ViewModel {
  BehaviorSubject<List<News>?> news = BehaviorSubject.seeded(null);

  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  @override
  Future fetch(bool forcedRefresh) async {
    NewsService.fetchNews(false).then((value) {
      lastFetched.add(value.$1);
      news.add(value.$2);
    }, onError: (error) => news.addError(error));
  }

  List<News> latestFiveNews() {
    if (news.value != null) {
      final news = this.news.value!;
      news.sort((news1, news2) => news2.date.compareTo(news1.date));
      return news.sublist(0, 5).toList();
    } else {
      return [];
    }
  }
}
