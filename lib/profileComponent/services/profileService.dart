import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiError.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiService.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApi.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/profileComponent/model/profile.dart';
import 'package:campus_flutter/profileComponent/model/tuition.dart';
import 'package:campus_flutter/providers_get_it.dart';

class ProfileService {
  static Future<Profile> fetchProfile() async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequest<ProfileData, TumOnlineApi, TumOnlineApiError>(
        TumOnlineApi(TumOnlineServiceIdentify()),
        ProfileData.fromJson,
        TumOnlineApiError.fromJson,
        false
    );

    return response.data.profilesAttribute.profile;
  }

  static Future<Tuition?> fetchTuition(String personGroup, String id) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi.makeRequest<TuitionData, TumOnlineApi, TumOnlineApiError>(
        TumOnlineApi(TumOnlineServiceTuitionStatus()),
        TuitionData.fromJson,
        TumOnlineApiError.fromJson,
        false
    );

    return response.data.profilesAttribute.tuition;
  }
}