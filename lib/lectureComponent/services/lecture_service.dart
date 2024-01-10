import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_service.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/main.dart';

class LectureService {
  static Future<(DateTime?, List<Lecture>)> fetchLecture(
    bool forcedRefresh,
  ) async {
    RESTClient restClient = getIt<RESTClient>();
    final response = await restClient
        .getWithException<LectureData, TumOnlineApi, TumOnlineApiException>(
      TumOnlineApi(TumOnlineServicePersonalLectures()),
      LectureData.fromJson,
      TumOnlineApiException.fromJson,
      forcedRefresh,
    );
    return (response.saved, response.data.lecturesAttribute?.lectures ?? []);
  }
}
