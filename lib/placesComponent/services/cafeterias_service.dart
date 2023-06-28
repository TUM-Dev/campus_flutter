import 'package:campus_flutter/base/networking/apis/eatApi/eatApi.dart';
import 'package:campus_flutter/base/networking/apis/eatApi/eatApiError.dart';
import 'package:campus_flutter/base/networking/apis/eatApi/eatApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/providers_get_it.dart';

class CafeteriasService {
  static Future<List<Cafeteria>> fetchCafeterias() async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequest<Cafeterias, EatApi, EatApiError>(
        EatApi(EatApiServiceCanteens()),
        Cafeterias.fromJson,
        EatApiError.fromJson,
        false
    );

    // TODO: add fetching of queue status

    return response.data.cafeterias;
  }
}