import 'package:campus_flutter/base/networking/apis/campusBackend/campus_backend.pb.dart';
import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/movieComponent/service/movie_service.dart';
import 'package:rxdart/rxdart.dart';

class MovieViewModel implements ViewModel {
  BehaviorSubject<List<Movie>?> movies = BehaviorSubject.seeded(null);

  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  @override
  Future fetch(bool forcedRefresh) async {
    MovieService.fetchMovies(forcedRefresh).then((response) {
      lastFetched.add(response.$1);
      movies.add(response.$2);
    }, onError: (error) => movies.addError(error));
  }
}
