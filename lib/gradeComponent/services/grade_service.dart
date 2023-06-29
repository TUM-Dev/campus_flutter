import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_service.dart';
import 'package:campus_flutter/base/networking/protocols/main_api.dart';
import 'package:campus_flutter/gradeComponent/model/averageGrade.dart';
import 'package:campus_flutter/gradeComponent/model/grade.dart';
import 'package:campus_flutter/providers_get_it.dart';

class GradeService {
  static Future<({DateTime? saved, List<Grade> data})> fetchGrades(
      bool forcedRefresh) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequestWithException<GradeData,
            TumOnlineApi, TumOnlineApiException>(
        TumOnlineApi(TumOnlineServicePersonalGrades()),
        GradeData.fromJson,
        TumOnlineApiException.fromJson,
        forcedRefresh);
    return (
      saved: response.saved,
      data: response.data.gradesAttribute.personalGrades
    );
  }

  static Future<({DateTime? saved, List<AverageGrade> data})> fetchAverageGrades(
      bool forcedRefresh) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequestWithException<AverageGradeResponse,
        TumOnlineApi, TumOnlineApiException>(
        TumOnlineApi(TumOnlineServiceAverageGrades()),
        AverageGradeResponse.fromJson,
        TumOnlineApiException.fromJson,
        forcedRefresh);
    return (
    saved: response.saved,
    data: response.data.averageGradeData.averageGrades
    );
  }
}