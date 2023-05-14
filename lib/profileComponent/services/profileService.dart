import 'package:campus_flutter/profileComponent/model/profile.dart';
import 'package:campus_flutter/profileComponent/model/tuition.dart';
import '../../base/networking/protocols/mainApi.dart';
import '../../base/networking/apis/tumOnlineAPI.dart';

class ProfileService {
  static Future<Profile> fetchProfile() async {
    final response = await MainAPI.makeRequest<ProfileData, TUMOnlineAPI>(
        TUMOnlineAPI(TUMOnlineServices.identify, {}),
        ProfileData.fromJson,
        TUMOnlineAPI.token,
        false
    );

    return response.profilesAttribute.profile;
  }

  static Future<Tuition?> fetchTuition(String personGroup, String id) async {
    final response = await MainAPI.makeRequest<TuitionData, TUMOnlineAPI>(
        TUMOnlineAPI(TUMOnlineServices.profileImage,
            {TUMOnlineParameters.personGroup: personGroup, TUMOnlineParameters.id: id}
        ),
        TuitionData.fromJson,
        null,
        false
    );

    return response.profilesAttribute.tuition;
  }
}