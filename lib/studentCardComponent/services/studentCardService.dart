import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApi.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiError.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/studentCardComponent/model/studentCard.dart';
import 'package:get/get.dart';

class StudentCardService {
  static Future<StudentCard> fetchStudentCard() async {
    MainApi mainApi = Get.find();
    final response = await mainApi.makeRequest<StudentCardData, TumOnlineApi, TumOnlineApiError>(
        TumOnlineApi(TumOnlineServiceTumCard()),
        StudentCardData.fromJson,
        TumOnlineApiError.fromJson,
        false
    );

    return response.data.studentCards.studentCard;
  }
}