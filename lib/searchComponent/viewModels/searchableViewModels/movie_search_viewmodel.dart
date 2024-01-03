import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/movieComponent/service/movie_service.dart';
import 'package:campus_flutter/searchComponent/model/comparison_token.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:campus_flutter/searchComponent/protocols/global_search.dart';
import 'package:campus_flutter/searchComponent/protocols/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final movieSearchViewModel = Provider((ref) => MovieSearchViewModel());

class MovieSearchViewModel implements SearchViewModel<MovieSearch> {
  @override
  BehaviorSubject<List<MovieSearch>?> searchResults =
      BehaviorSubject.seeded(null);

  List<MovieSearch> movieData = [];

  Future movieSearch({
    bool forcedRefresh = false,
    required String query,
  }) async {
    if (movieData.isEmpty) {
      return MovieService.fetchMovies(forcedRefresh).then(
        (value) {
          movieData = value.$2
              .where(
                (element) => element.date.toDateTime().isAfter(DateTime.now()),
              )
              .map((e) => MovieSearch(e))
              .toList();
          _search(query);
        },
        onError: (error) => searchResults.addError(error),
      );
    } else {
      _search(query);
    }
  }

  void _search(String query) {
    final results = GlobalSearch.tokenSearch(query, movieData);
    if (results == null) {
      searchResults.addError(SearchException.empty(searchQuery: query));
    } else {
      searchResults.add(results);
    }
  }
}

class MovieSearch extends Searchable {
  final Movie movie;

  MovieSearch(this.movie);

  @override
  List<ComparisonToken> get comparisonTokens => [
        ComparisonToken(value: movie.title),
        ComparisonToken(value: movie.genre),
      ];
}
