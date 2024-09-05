import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_service.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/studiesComponent/model/lecture_details.dart';

class LectureDetailsService {
  static Future<(DateTime?, LectureDetails)> fetchLectureDetails(
    String lvNumber,
    bool forcedRefresh,
  ) async {
    RestClient restClient = getIt<RestClient>();
    final response = await restClient.getWithException<LectureDetailsElement,
        TumOnlineApi, TumOnlineApiException>(
      TumOnlineApi(TumOnlineServiceLectureDetails(lvNr: lvNumber)),
      LectureDetailsElement.fromJson,
      TumOnlineApiException.fromJson,
      forcedRefresh,
    );

    return (response.saved, response.data.lectureDetails);
  }
}
