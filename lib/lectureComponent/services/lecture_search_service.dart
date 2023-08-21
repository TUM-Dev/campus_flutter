import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_service.dart';
import 'package:campus_flutter/base/networking/protocols/main_api.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/providers_get_it.dart';

class LectureSearchService {
  static Future<(DateTime?, List<Lecture>)> fetchLectureSearch(
      bool forcedRefresh, String query) async {
    final response = await getIt<MainApi>().makeRequestWithException<
            LectureData, TumOnlineApi, TumOnlineApiException>(
        TumOnlineApi(TumOnlineServiceLectureSearch(search: query)),
        LectureData.fromJson,
        TumOnlineApiException.fromJson,
        forcedRefresh);

    return (response.saved, response.data.lecturesAttribute.lectures);
  }
}
