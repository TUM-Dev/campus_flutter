import 'package:campus_flutter/base/networking/apis/mvvDeparturesApi/mvv_departures_api.dart';
import 'package:campus_flutter/base/networking/protocols/main_api.dart';
import 'package:campus_flutter/departuresComponent/model/mvv_response.dart';
import 'package:campus_flutter/providers_get_it.dart';

class DeparturesService {
  static Future<({DateTime? saved, MvvResponse data})> fetchDepartures(
    bool forcedRefresh,
    String station,
    int? walkingTime,
  ) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequest<MvvResponse, MvvDeparturesApi>(
      MvvDeparturesApi(station: station, walkingTime: walkingTime),
      MvvResponse.fromJson,
      forcedRefresh,
    );

    return (saved: response.saved, data: response.data);
  }
}
