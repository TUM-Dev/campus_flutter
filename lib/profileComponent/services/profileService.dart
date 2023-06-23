import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_service.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/protocols/main_api.dart';
import 'package:campus_flutter/profileComponent/model/profile.dart';
import 'package:campus_flutter/profileComponent/model/tuition.dart';
import 'package:campus_flutter/providers_get_it.dart';

class ProfileService {
  static Future<(DateTime?, Profile)> fetchProfile(bool forcedRefresh) async {
    MainApi mainApi = getIt<MainApi>();
    final response =
        await mainApi.makeRequestWithException<ProfileData, TumOnlineApi, TumOnlineApiException>(
            TumOnlineApi(TumOnlineServiceIdentify()),
            ProfileData.fromJson,
            TumOnlineApiException.fromJson,
            forcedRefresh);

    return (response.saved, response.data.profilesAttribute.profile);
  }

  static Future<(DateTime?, Tuition?)> fetchTuition(bool forcedRefresh, String personGroup, String id) async {
    MainApi mainApi = getIt<MainApi>();
    final response =
        await mainApi.makeRequestWithException<TuitionData, TumOnlineApi, TumOnlineApiException>(
            TumOnlineApi(TumOnlineServiceTuitionStatus()),
            TuitionData.fromJson,
            TumOnlineApiException.fromJson,
            forcedRefresh);

    return (response.saved, response.data.profilesAttribute.tuition);
  }
}