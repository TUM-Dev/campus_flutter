import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_endpoint.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/studiesComponent/model/average_grade.dart';
import 'package:campus_flutter/studiesComponent/model/grade.dart';
import 'package:campus_flutter/main.dart';

class GradeService {
  static Future<({DateTime? saved, List<Grade> data})> fetchGrades(
    bool forcedRefresh,
  ) async {
    RestClient restClient = getIt<RestClient>();
    final response = await restClient
        .getWithException<Grades, TumOnlineApi, TumOnlineApiException>(
          TumOnlineApi(TumOnlineEndpointPersonalGrades()),
          Grades.fromJson,
          TumOnlineApiException.fromJson,
          forcedRefresh,
        );
    return (saved: response.saved, data: response.data.personalGrades);
  }

  static Future<({DateTime? saved, List<AverageGrade> data})>
  fetchAverageGrades(bool forcedRefresh) async {
    RestClient restClient = getIt<RestClient>();
    final response = await restClient
        .getWithException<AverageGrades, TumOnlineApi, TumOnlineApiException>(
          TumOnlineApi(TumOnlineEndpointAverageGrades()),
          AverageGrades.fromJson,
          TumOnlineApiException.fromJson,
          forcedRefresh,
        );
    return (saved: response.saved, data: response.data.averageGrades);
  }
}
