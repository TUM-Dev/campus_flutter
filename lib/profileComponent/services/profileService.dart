import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiService.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApi.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/profileComponent/model/profile.dart';
import 'package:campus_flutter/profileComponent/model/tuition.dart';

class ProfileService {
  static Future<Profile> fetchProfile() async {
    final response = await MainApi.makeRequest<ProfileData, TUMOnlineApi>(
        TUMOnlineApi(TUMOnlineServiceIdentify()),
        ProfileData.fromJson,
        TUMOnlineApi.token,
        false
    );

    return response.profilesAttribute.profile;
  }

  static Future<Tuition?> fetchTuition(String personGroup, String id) async {
    final response = await MainApi.makeRequest<TuitionData, TUMOnlineApi>(
        TUMOnlineApi(TUMOnlineServiceTuitionStatus()),
        TuitionData.fromJson,
        TUMOnlineApi.token,
        false
    );

    return response.profilesAttribute.tuition;
  }
}