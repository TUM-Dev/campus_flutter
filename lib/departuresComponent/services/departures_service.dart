import 'package:campus_flutter/base/networking/apis/mvvDeparturesApi/mvv_departures_api.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/departuresComponent/model/mvv_response.dart';
import 'package:campus_flutter/main.dart';

class DeparturesService {
  static Future<({DateTime? saved, MvvResponse data})> fetchDepartures(
    bool forcedRefresh,
    String station,
    int? walkingTime,
  ) async {
    RESTClient restClient = getIt<RESTClient>();
    final response = await restClient.post<MvvResponse, MvvDeparturesApi>(
      MvvDeparturesApi(station: station, walkingTime: walkingTime),
      MvvResponse.fromJson,
      forcedRefresh,
    );

    return (saved: response.saved, data: response.data);
  }
}
