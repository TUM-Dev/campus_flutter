import 'package:campus_flutter/base/networking/apis/eatApi/eatApi.dart';
import 'package:campus_flutter/base/networking/apis/eatApi/eatApiError.dart';
import 'package:campus_flutter/base/networking/apis/eatApi/eatApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:get/get.dart';

class CafeteriasService {
  static Future<List<Cafeteria>> fetchCafeterias() async {
    MainApi mainApi = Get.find();
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