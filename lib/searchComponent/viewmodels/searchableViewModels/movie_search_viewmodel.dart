import 'package:campus_flutter/movieComponent/model/movie.dart';
import 'package:campus_flutter/movieComponent/service/movie_service.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:campus_flutter/searchComponent/protocols/global_search.dart';
import 'package:rxdart/rxdart.dart';

class MovieSearchViewModel {
  BehaviorSubject<List<(Movie, Distances)>?> searchResults =
      BehaviorSubject.seeded(null);

  List<Movie> movieData = [];

  Future movieSearch(
      {bool forcedRefresh = false, required String query}) async {
    if (movieData.isEmpty) {
      return MovieService.fetchMovies(forcedRefresh).then((value) {
        movieData = value.$2
            //.where((element) => element.date.isAfter(DateTime.now()))
            .toList();
        _search(query);
      }, onError: (error) => searchResults.addError(error));
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
