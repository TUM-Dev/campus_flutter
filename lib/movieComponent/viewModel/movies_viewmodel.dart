import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/movieComponent/model/movie.dart';
import 'package:campus_flutter/movieComponent/service/movie_service.dart';
import 'package:rxdart/rxdart.dart';

class MovieViewModel implements ViewModel {
  BehaviorSubject<List<Movie>?> movies = BehaviorSubject.seeded(null);

  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  @override
  Future fetch(bool forcedRefresh) async {
    MovieService.fetchMovies(forcedRefresh).then(
        (response) => _sortMovies(response),
        onError: (error) => movies.addError(error));
  }

  _sortMovies((DateTime?, List<Movie>) movies) {
    lastFetched.add(movies.$1);
    if (movies.$2.isEmpty) {
      this.movies.add(movies.$2);
    } else {
      movies.$2.removeWhere((element) => element.date.isBefore(DateTime.now()));
      movies.$2.sort((a, b) => a.date.compareTo(b.date));
      this.movies.add(movies.$2);
    }
  }
}
