import 'package:campus_flutter/providers_get_it.dart';

import '../../base/networking/apis/tumdev/campus_backend.pbgrpc.dart';

class MovieService {
  static Future<(DateTime?, List<Movie>)> fetchMovies(bool forcedRefresh) async {
    final start = DateTime.now();
    CampusClient mainApi = getIt<CampusClient>();
    final response = await mainApi.getMovies(GetMoviesRequest());
    return (start, response.movies);
  }
}