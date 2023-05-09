import 'package:campus_flutter/base/Networking/APIs/TUMOnlineAPI.dart';
import 'package:campus_flutter/base/Networking/Protocols/mainApi.dart';
import 'package:campus_flutter/gradeComponent/model/grade.dart';

class GradeService {
  static Future<List<Grade>> fetchGrades() async {
    final data = await MainAPI.makeRequest<GradeData, TUMOnlineAPI>(
        TUMOnlineAPI(TUMOnlineServices.personalGrades, {}),
        GradeData.fromJson,
        TUMOnlineAPI.token,
        false);
    return data.gradesAttribute.personalGrades;
  }
}