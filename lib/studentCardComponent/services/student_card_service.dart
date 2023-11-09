import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_service.dart';
import 'package:campus_flutter/base/networking/protocols/main_api.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/studentCardComponent/model/student_card.dart';

class StudentCardService {
  static Future<(DateTime?, StudentCard)> fetchStudentCard(
    bool forcedRefresh,
  ) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequestWithException<StudentCardData,
        TumOnlineApi, TumOnlineApiException>(
      TumOnlineApi(TumOnlineServiceTumCard()),
      StudentCardData.fromJson,
      TumOnlineApiException.fromJson,
      forcedRefresh,
    );

    return (response.saved, response.data.studentCards.studentCard);
  }
}
