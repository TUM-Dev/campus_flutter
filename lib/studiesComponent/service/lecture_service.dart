import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_endpoint.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/studiesComponent/model/lecture.dart';
import 'package:campus_flutter/main.dart';

class LectureService {
  static Future<(DateTime?, List<Lecture>)> fetchLecture(
    bool forcedRefresh,
  ) async {
    RestClient restClient = getIt<RestClient>();
    final response = await restClient
        .getWithException<Lectures, TumOnlineApi, TumOnlineApiException>(
          TumOnlineApi(TumOnlineEndpointPersonalLectures()),
          Lectures.fromJson,
          TumOnlineApiException.fromJson,
          forcedRefresh,
        );
    return (response.saved, response.data.lectures);
  }
}
