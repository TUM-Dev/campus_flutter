import 'package:campus_flutter/base/networking/apis/eatApi/eat_api.dart';
import 'package:campus_flutter/base/networking/apis/eatApi/eat_api_endpoint.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/main.dart';

class CafeteriasService {
  static Future<(DateTime?, List<Cafeteria>)> fetchCafeterias(
    bool forcedRefresh,
  ) async {
    RestClient restClient = getIt<RestClient>();
    final response = await restClient.get<Cafeterias, EatApi>(
      EatApi(EatApiEndpointCanteens()),
      Cafeterias.fromJson,
      forcedRefresh,
    );

    // TODO(Jakob): add fetching of queue status?

    return (response.saved, response.data.cafeterias);
  }
}
