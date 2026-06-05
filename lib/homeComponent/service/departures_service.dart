import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/networking/apis/hnvDeparturesApi/hnv_departures_api.dart';
import 'package:campus_flutter/base/networking/apis/mvvDeparturesApi/mvv_departures_api.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/homeComponent/model/mvv_response.dart';
import 'package:campus_flutter/main.dart';

class DeparturesService {
  static Future<({DateTime? saved, MvvResponse data})> fetchDepartures(
    bool forcedRefresh,
    String station,
    int? walkingTime, {
    Campus? campus,
  }) async {
    final restClient = getIt<RestClient>();
    if (campus != null && campus.usesHnvApi) {
      final response = await restClient.get<MvvResponse, HnvDeparturesApi>(
        HnvDeparturesApi(station: station, walkingTime: walkingTime),
        MvvResponse.fromJson,
        forcedRefresh,
      );
      return (saved: response.saved, data: response.data);
    }
    final response = await restClient.get<MvvResponse, MvvDeparturesApi>(
      MvvDeparturesApi(station: station, walkingTime: walkingTime),
      MvvResponse.fromJson,
      forcedRefresh,
    );
    return (saved: response.saved, data: response.data);
  }
}
