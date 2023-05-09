import 'package:campus_flutter/base/Networking/APIs/TUMOnlineAPI.dart';
import 'package:campus_flutter/base/Networking/Protocols/mainApi.dart';
import 'package:campus_flutter/profileComponent/model/profile.dart';
import 'package:campus_flutter/profileComponent/model/tuition.dart';

class ProfileService {
  static Future<Profile> fetchProfile() async {
    return await MainAPI.makeRequest<Profile, TUMOnlineAPI>(
        TUMOnlineAPI(TUMOnlineServices.identify, {}),
        Profile.fromJson,
        TUMOnlineAPI.token,
        false
    );
  }

  static Future<Tuition?> fetchTuition(String personGroup, String id) async {
    return await MainAPI.makeRequest<Tuition, TUMOnlineAPI>(
      TUMOnlineAPI(TUMOnlineServices.profileImage,
          {TUMOnlineParameters.personGroup: personGroup, TUMOnlineParameters.id: id}
      ),
      Tuition.fromJson,
      null,
      false
    );
  }
}