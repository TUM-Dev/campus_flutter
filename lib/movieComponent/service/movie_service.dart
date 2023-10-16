import 'package:campus_flutter/base/networking/apis/campusBackend/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/providers_get_it.dart';

class MovieService {
  static Future<(DateTime?, List<Movie>)> fetchMovies(bool forcedRefresh) async {
    final start = DateTime.now();
    CampusClient mainApi = getIt<CampusClient>();
    final response = await mainApi.listMovies(ListMoviesRequest());
    return (start, response.movies);
  }
}
