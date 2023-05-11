import 'package:campus_flutter/base/networking/apis/tumOnlineAPI.dart';
import '../../base/networking/protocols/mainApi.dart';
import '../model/lecture.dart';

class LectureService {
  static Future<List<Lecture>> fetchLecture() async {
    final data = await MainAPI.makeRequest<LectureData, TUMOnlineAPI>(
        TUMOnlineAPI(TUMOnlineServices.personalLectures, {}),
        LectureData.fromJson,
        TUMOnlineAPI.token,
        false);
    return data.lecturesAttribute.lectures;
  }
}