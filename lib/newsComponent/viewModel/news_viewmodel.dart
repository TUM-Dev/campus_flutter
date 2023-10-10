import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/newsComponent/service/news_service.dart';
import 'package:rxdart/rxdart.dart';

import '../../base/networking/apis/tumdev/campus_backend.pb.dart';

class NewsViewModel implements ViewModel {
  BehaviorSubject<List<News>?> news = BehaviorSubject.seeded(null);

  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  @override
  Future fetch(bool forcedRefresh) async {
    NewsService.fetchNews(forcedRefresh).then((value) {
      lastFetched.add(value.$1);
      news.add(value.$2);
    }, onError: (error) => news.addError(error));
  }

  List<News> latestFiveNews() {
    if (news.value == null) {
      return [];
    }
    final newsItems = news.value!.toList();
    newsItems.removeWhere((element) => (element.source == "2"));
    newsItems.sort((n1, n2) => n1.created.toDateTime().compareTo(n2.created.toDateTime()));
    return newsItems.sublist(0, 5);
  }
}
