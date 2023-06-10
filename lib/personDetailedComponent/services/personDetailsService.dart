import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApi.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiError.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/personDetailedComponent/model/personDetails.dart';
import 'package:get/get.dart';

class PersonDetailsService {
  static Future<PersonDetails> fetchPersonDetails(String identNumber) async {
    MainApi mainApi = Get.find();
    final response = await mainApi.makeRequest<PersonDetailsData, TumOnlineApi, TumOnlineApiError>(
        TumOnlineApi(TumOnlineServicePersonDetails(identNumber: identNumber)),
        PersonDetailsData.fromJson,
        TumOnlineApiError.fromJson,
        false
    );
    return response.data.person;
  }
}