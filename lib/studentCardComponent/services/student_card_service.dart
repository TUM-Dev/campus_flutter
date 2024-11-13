import 'dart:developer';

import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_endpoint.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/studentCardComponent/model/student_card.dart';

class StudentCardService {
  static Future<(DateTime?, List<StudentCard>)> fetchStudentCard(
    bool forcedRefresh,
  ) async {
    try {
      RestClient restClient = getIt<RestClient>();
      final response = await restClient
          .getWithException<StudentCards, TumOnlineApi, TumOnlineApiException>(
        TumOnlineApi(TumOnlineEndpointTumCard()),
        StudentCards.fromJson,
        TumOnlineApiException.fromJson,
        forcedRefresh,
      );

      return (response.saved, response.data.studentCards);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
