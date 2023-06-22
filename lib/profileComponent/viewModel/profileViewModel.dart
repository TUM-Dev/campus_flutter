import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/profileComponent/model/tuition.dart';
import 'package:rxdart/rxdart.dart';

import '../model/profile.dart';
import '../services/profileService.dart';

class ProfileViewModel implements ViewModel {
  BehaviorSubject<(DateTime?, Profile)?> profile = BehaviorSubject.seeded(null);
  BehaviorSubject<(DateTime?, Tuition?)?> tuition = BehaviorSubject.seeded(null);

  @override
  Future fetch(bool forcedRefresh) async {
    ProfileService.fetchProfile(forcedRefresh).then((response) {
      profile.add(response);
      ProfileService.fetchTuition(forcedRefresh, response.$2.personGroup ?? "", response.$2.id ?? "")
          .then((response) => tuition.add(response), onError: (error) => tuition.addError(error));
    }, onError: (error) => profile.addError(error));
  }
}