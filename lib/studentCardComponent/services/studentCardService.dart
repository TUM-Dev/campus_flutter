import 'package:campus_flutter/base/networking/apis/tumOnlineAPI.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/studentCardComponent/model/studentCard.dart';

class StudentCardService {
  static Future<StudentCard> fetchStudentCard() async {
    final response = await MainAPI.makeRequest<StudentCardData, TUMOnlineAPI>(
        TUMOnlineAPI(TUMOnlineServices.tumCard, {}),
        StudentCardData.fromJson,
        TUMOnlineAPI.token,
        false
    );

    return response.studentCards.studentCard;
  }
}