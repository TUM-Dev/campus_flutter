import 'package:campus_flutter/base/networking/apis/tumCabeApi/tumCabeApi.dart';
import 'package:campus_flutter/base/networking/apis/tumCabeApi/tumCabeApiError.dart';
import 'package:campus_flutter/base/networking/apis/tumCabeApi/tumCabeApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/movieComponent/model/movie.dart';
import 'package:get/get.dart';

class MovieService {
  static Future<MoviesData> fetchMovies() async {
    MainApi mainApi = Get.find();
    final response = await mainApi.makeRequest<MoviesData, TumCabeApi, TumCabeApiError>(
        TumCabeApi(tumCabeService: TumCabeServiceMovie()),
        MoviesData.fromJson,
        TumCabeApiError.fromJson,
        false
    );

    return response.data;
  }
}