import 'package:campus_flutter/base/networking/apis/tumCabeApi/tum_cabe_api.dart';
import 'package:campus_flutter/base/networking/apis/tumCabeApi/tum_cabe_api_service.dart';
import 'package:campus_flutter/base/networking/protocols/main_api.dart';
import 'package:campus_flutter/movieComponent/model/movie.dart';
import 'package:campus_flutter/providers_get_it.dart';

class MovieService {
  static Future<(DateTime?, List<Movie>)> fetchMovies(
      bool forcedRefresh) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequest<MoviesData, TumCabeApi>(
        TumCabeApi(tumCabeApiService: TumCabeApiServiceMovie(DateTime.now())),
        MoviesData.fromJson,
        forcedRefresh);

    return (response.saved, response.data.movies);
  }
}
