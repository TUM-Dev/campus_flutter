import 'package:campus_flutter/movieComponent/model/movie.dart';
import 'package:campus_flutter/movieComponent/service/movieService.dart';
import 'package:rxdart/rxdart.dart';

class MovieViewModel {
  BehaviorSubject<MoviesData?> movies = BehaviorSubject.seeded(null);

  void getMovies() async {
    final movies = await MovieService.fetchMovies();

    if (movies.movies.isEmpty) {
      this.movies.add(MoviesData(movies: []));
    } else {
      movies.movies.removeWhere((element) => element.date.isBefore(DateTime.now()));
      movies.movies.sort((a,b) => a.date.compareTo(b.date));
      this.movies.add(movies);
    }
  }
}