import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_service.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/lectureComponent/model/lecture_details.dart';
import 'package:campus_flutter/main.dart';

class LectureDetailsService {
  static Future<(DateTime?, LectureDetails)> fetchLectureDetails(
    String lvNumber,
    bool forcedRefresh,
  ) async {
    RESTClient restClient = getIt<RESTClient>();
    final response = await restClient.getWithException<LectureDetailsData,
        TumOnlineApi, TumOnlineApiException>(
      TumOnlineApi(TumOnlineServiceLectureDetails(lvNr: lvNumber)),
      LectureDetailsData.fromJson,
      TumOnlineApiException.fromJson,
      forcedRefresh,
    );

    return (
      response.saved,
      response.data.lectureDetailsAttribute.lectureDetails
    );
  }
}
