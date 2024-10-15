import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_endpoint.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/studiesComponent/model/lecture.dart';
import 'package:campus_flutter/main.dart';

class LectureSearchService {
  static Future<(DateTime?, List<Lecture>)> fetchLectureSearch(
    bool forcedRefresh,
    String query,
  ) async {
    final response = await getIt<RestClient>()
        .getWithException<Lectures, TumOnlineApi, TumOnlineApiException>(
      TumOnlineApi(TumOnlineEndpointLectureSearch(search: query)),
      Lectures.fromJson,
      TumOnlineApiException.fromJson,
      forcedRefresh,
    );

    return (response.saved, response.data.lectures);
  }
}
