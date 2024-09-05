import 'package:campus_flutter/base/networking/apis/mvvDeparturesApi/mvv_departures_api.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/homeComponent/model/mvv_response.dart';
import 'package:campus_flutter/main.dart';

class DeparturesService {
  static Future<({DateTime? saved, MvvResponse data})> fetchDepartures(
    bool forcedRefresh,
    String station,
    int? walkingTime,
  ) async {
    RestClient restClient = getIt<RestClient>();
    final response = await restClient.get<MvvResponse, MvvDeparturesApi>(
      MvvDeparturesApi(station: station, walkingTime: walkingTime),
      MvvResponse.fromJson,
      forcedRefresh,
    );

    return (saved: response.saved, data: response.data);
  }
}
