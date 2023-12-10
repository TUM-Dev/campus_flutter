import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_service.dart';
import 'package:campus_flutter/base/networking/protocols/main_api.dart';
import 'package:campus_flutter/lectureComponent/model/lecture_details.dart';
import 'package:campus_flutter/providers_get_it.dart';

class LectureDetailsService {
  static Future<(DateTime?, LectureDetails)> fetchLectureDetails(
    String lvNumber,
    bool forcedRefresh,
  ) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequestWithException<LectureDetailsData,
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
