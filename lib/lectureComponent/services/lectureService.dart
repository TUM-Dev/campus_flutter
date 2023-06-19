import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApi.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiError.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/providers_get_it.dart';

class LectureService {
  static Future<List<Lecture>> fetchLecture() async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequest<LectureData, TumOnlineApi, TumOnlineApiError>(
        TumOnlineApi(TumOnlineServicePersonalLectures()),
        LectureData.fromJson,
        TumOnlineApiError.fromJson,
        false
    );
    return response.data.lecturesAttribute.lectures;
  }
}