import 'package:campus_flutter/profileComponent/model/tuition.dart';
import 'package:rxdart/rxdart.dart';

import '../model/profile.dart';
import '../services/profileService.dart';

class ProfileViewModel {
  BehaviorSubject<Profile?> profile = BehaviorSubject();
  BehaviorSubject<Tuition?> tuition = BehaviorSubject();

  fetchProfile() async {
    profile.add(await ProfileService.fetchProfile());
  }

  fetchTuition() async {
    if (profile.value != null) {
      tuition.add(await ProfileService.fetchTuition(
          profile.value?.personGroup ?? "", profile.value?.id ?? ""
      ));
    }
  }
}