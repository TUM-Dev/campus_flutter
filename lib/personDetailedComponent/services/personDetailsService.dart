import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_service.dart';
import 'package:campus_flutter/base/networking/protocols/main_api.dart';
import 'package:campus_flutter/personDetailedComponent/model/personDetails.dart';
import 'package:campus_flutter/providers_get_it.dart';

class PersonDetailsService {
  static Future<(DateTime?, PersonDetails)> fetchPersonDetails(bool forcedRefresh, String identNumber) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi
        .makeRequestWithException<PersonDetailsData, TumOnlineApi, TumOnlineApiException>(
            TumOnlineApi(TumOnlineServicePersonDetails(identNumber: identNumber)),
            PersonDetailsData.fromJson,
            TumOnlineApiException.fromJson,
            forcedRefresh);
    return (response.saved, response.data.person);
  }
}