import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApi.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/gradeComponent/model/grade.dart';

class GradeService {
  static Future<List<Grade>> fetchGrades() async {
    final data = await MainApi.makeRequest<GradeData, TUMOnlineApi>(
        TUMOnlineApi(TUMOnlineServicePersonalGrades()),
        GradeData.fromJson,
        TUMOnlineApi.token,
        false);
    return data.gradesAttribute.personalGrades;
  }
}