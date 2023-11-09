import 'package:campus_flutter/base/networking/apis/eatApi/eat_api.dart';
import 'package:campus_flutter/base/networking/apis/eatApi/eat_api_service.dart';
import 'package:campus_flutter/base/networking/protocols/main_api.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/providers_get_it.dart';

class CafeteriasService {
  static Future<(DateTime?, List<Cafeteria>)> fetchCafeterias(
    bool forcedRefresh,
  ) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequest<Cafeterias, EatApi>(
      EatApi(EatApiServiceCanteens()),
      Cafeterias.fromJson,
      forcedRefresh,
    );

    // TODO(Jakob): add fetching of queue status

    return (response.saved, response.data.cafeterias);
  }
}
