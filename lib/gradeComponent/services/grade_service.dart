import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_service.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/gradeComponent/model/average_grade.dart';
import 'package:campus_flutter/gradeComponent/model/grade.dart';
import 'package:campus_flutter/main.dart';

class GradeService {
  static Future<({DateTime? saved, List<Grade> data})> fetchGrades(
    bool forcedRefresh,
  ) async {
    RESTClient restClient = getIt<RESTClient>();
    final response = await restClient
        .getWithException<GradeData, TumOnlineApi, TumOnlineApiException>(
      TumOnlineApi(TumOnlineServicePersonalGrades()),
      GradeData.fromJson,
      TumOnlineApiException.fromJson,
      forcedRefresh,
    );
    return (
      saved: response.saved,
      data: response.data.gradesAttribute?.personalGrades ?? []
    );
  }

  static Future<({DateTime? saved, List<AverageGrade> data})>
      fetchAverageGrades(bool forcedRefresh) async {
    RESTClient restClient = getIt<RESTClient>();
    final response = await restClient.getWithException<AverageGradeResponse,
        TumOnlineApi, TumOnlineApiException>(
      TumOnlineApi(TumOnlineServiceAverageGrades()),
      AverageGradeResponse.fromJson,
      TumOnlineApiException.fromJson,
      forcedRefresh,
    );
    return (
      saved: response.saved,
      data: response.data.averageGradeData?.averageGrades ?? []
    );
  }
}
