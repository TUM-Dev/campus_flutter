import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_service.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/profileComponent/model/profile.dart';
import 'package:campus_flutter/profileComponent/model/tuition.dart';

class ProfileService {
  static Future<(DateTime?, Profile)> fetchProfile(bool forcedRefresh) async {
    RESTClient mainApi = getIt<RESTClient>();
    final response = await mainApi.makeRequestWithException<ProfileData,
        TumOnlineApi, TumOnlineApiException>(
      TumOnlineApi(TumOnlineServiceIdentify()),
      ProfileData.fromJson,
      TumOnlineApiException.fromJson,
      forcedRefresh,
    );

    return (response.saved, response.data.profilesAttribute.profile);
  }

  static Future<(DateTime?, Tuition?)> fetchTuition(
    bool forcedRefresh,
    String personGroup,
    String id,
  ) async {
    RESTClient mainApi = getIt<RESTClient>();
    final response = await mainApi.makeRequestWithException<TuitionData,
        TumOnlineApi, TumOnlineApiException>(
      TumOnlineApi(TumOnlineServiceTuitionStatus()),
      TuitionData.fromJson,
      TumOnlineApiException.fromJson,
      forcedRefresh,
    );

    return (response.saved, response.data.profilesAttribute.tuition);
  }
}
