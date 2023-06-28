import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApi.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiError.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiService.dart';
import 'package:get/get.dart';
import '../../base/networking/protocols/mainApi.dart';
import '../model/lecture.dart';

class LectureService {
  static Future<List<Lecture>> fetchLecture() async {
    MainApi mainApi = Get.find();
    final response = await mainApi.makeRequest<LectureData, TumOnlineApi, TumOnlineApiError>(
        TumOnlineApi(TumOnlineServicePersonalLectures()),
        LectureData.fromJson,
        TumOnlineApiError.fromJson,
        false
    );
    return response.data.lecturesAttribute.lectures;
  }
}