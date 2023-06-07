import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApi.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiService.dart';
import '../../base/networking/protocols/mainApi.dart';
import '../model/lecture.dart';

class LectureService {
  static Future<List<Lecture>> fetchLecture() async {
    final data = await MainApi.makeRequest<LectureData, TUMOnlineApi>(
        TUMOnlineApi(TUMOnlineServicePersonalLectures()),
        LectureData.fromJson,
        TUMOnlineApi.token,
        false);
    return data.lecturesAttribute.lectures;
  }
}