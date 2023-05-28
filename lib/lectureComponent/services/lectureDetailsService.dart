import 'package:campus_flutter/base/networking/apis/tumOnlineAPI.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/lectureComponent/model/lectureDetails.dart';

class LectureDetailsService {
  static Future<LectureDetails> fetchLectureDetails(String lvNumber) async {
    final response = await MainAPI.makeRequest<LectureDetailsData, TUMOnlineAPI>(
        TUMOnlineAPI(TUMOnlineServices.lectureDetails, {
          TUMOnlineParameters.lvNr: lvNumber
        }),
        LectureDetailsData.fromJson,
        TUMOnlineAPI.token,
        false
    );

    return response.lectureDetailsAttribute.lectureDetails;
  }
}