import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/newsComponent/service/news_service.dart';
import 'package:campus_flutter/searchComponent/model/comparison_token.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:campus_flutter/searchComponent/protocols/global_search.dart';
import 'package:campus_flutter/searchComponent/protocols/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final newsSearchViewModel = Provider((ref) => NewsSearchViewModel());

class NewsSearchViewModel implements SearchViewModel<NewsSearch> {
  @override
  BehaviorSubject<List<NewsSearch>?> searchResults =
      BehaviorSubject.seeded(null);

  List<NewsSearch> newsData = [];

  Future newsSearch({bool forcedRefresh = false, required String query}) async {
    if (newsData.isEmpty) {
      return NewsService.fetchNews(forcedRefresh).then(
        (value) {
          newsData = value.$2.map((e) => NewsSearch(e)).toList();
          _search(query);
        },
        onError: (error) => searchResults.addError(error),
      );
    } else {
      _search(query);
    }
  }

  void _search(String query) {
    final results = GlobalSearch.tokenSearch(query, newsData);
    if (results == null) {
      searchResults.addError(SearchException.empty(searchQuery: query));
    } else {
      searchResults.add(results);
    }
  }
}

class NewsSearch extends Searchable {
  final News news;

  NewsSearch(this.news);

  @override
  List<ComparisonToken> get comparisonTokens => [
        ComparisonToken(value: news.title),
        // TODO: add source
      ];
}
