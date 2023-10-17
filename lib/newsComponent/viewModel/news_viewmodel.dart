import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/newsComponent/service/news_service.dart';
import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';

class NewsViewModel implements ViewModel {
  BehaviorSubject<List<News>?> news = BehaviorSubject.seeded(null);

  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  @override
  Future fetch(bool forcedRefresh) async {
    return NewsService.fetchNews(forcedRefresh).then((value) {
      lastFetched.add(value.$1);
      news.add(value.$2);
    }, onError: (error) => news.addError(error));
  }

  List<News> latestFiveNews() {
    if (news.value != null) {
      final news = this.news.value!;
      Set<String> seenTitles = {};
      news.retainWhere((element) {
        if (seenTitles.contains(element.title)) {
          return false;
        } else {
          seenTitles.add(element.title);
          return true;
        }
      });
      news.sort((news1, news2) =>
          news2.date.toDateTime().compareTo(news1.date.toDateTime()));
      return news.sublist(0, 5).toList();
    } else {
      return [];
    }
  }
}
