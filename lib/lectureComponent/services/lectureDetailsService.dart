import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApi.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiError.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/lectureComponent/model/lectureDetails.dart';
import 'package:campus_flutter/providers_get_it.dart';

class LectureDetailsService {
  static Future<LectureDetails> fetchLectureDetails(String lvNumber) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequest<LectureDetailsData, TumOnlineApi, TumOnlineApiError>(
        TumOnlineApi(TumOnlineServiceLectureDetails(lvNr: lvNumber)),
        LectureDetailsData.fromJson,
        TumOnlineApiError.fromJson,
        false
    );

    return response.data.lectureDetailsAttribute.lectureDetails;
  }
}