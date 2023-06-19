import 'package:campus_flutter/base/networking/apis/mvvDeparturesApi/mvvDeparturesApi.dart';
import 'package:campus_flutter/base/networking/apis/mvvDeparturesApi/mvvDeparturesApiError.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/departuresComponent/model/mvvResponse.dart';
import 'package:campus_flutter/providers_get_it.dart';

class DeparturesService {
  static Future<MvvResponse> fetchDepartures(String station, int? walkingTime, bool forcedRefresh) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequest<MvvResponse, MvvDeparturesApi, MvvDeparturesApiError>(
        MvvDeparturesApi(station: station, walkingTime: walkingTime),
        MvvResponse.fromJson,
        MvvDeparturesApiError.fromJson,
        forcedRefresh
    );

    return response.data;
  }
}