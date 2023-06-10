import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApi.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiError.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/gradeComponent/model/grade.dart';
import 'package:get/get.dart';

class GradeService {
  static Future<List<Grade>> fetchGrades() async {
    MainApi mainApi = Get.find();
    final response = await mainApi.makeRequest<GradeData, TumOnlineApi, TumOnlineApiError>(
        TumOnlineApi(TumOnlineServicePersonalGrades()),
        GradeData.fromJson,
        TumOnlineApiError.fromJson,
        false
    );
    return response.data.gradesAttribute.personalGrades;
  }
}