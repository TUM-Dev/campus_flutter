import 'package:campus_flutter/personComponent/model/profile/profile.dart';
import 'package:campus_flutter/personComponent/model/profile/tuition.dart';
import 'package:campus_flutter/personComponent/services/profile_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final profileViewModel = Provider((ref) => ProfileViewModel());

class ProfileViewModel {
  BehaviorSubject<Profile?> profile = BehaviorSubject.seeded(null);
  BehaviorSubject<Tuition?> tuition = BehaviorSubject.seeded(null);
  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  Future fetch(bool forcedRefresh) async {
    ProfileService.fetchProfile(forcedRefresh).then((response) {
      lastFetched.add(response.$1);
      profile.add(response.$2);
      ProfileService.fetchTuition(
        forcedRefresh,
        response.$2.personGroup ?? "",
        response.$2.id ?? "",
      ).then(
        (response) => tuition.add(response.$2),
        onError: (error) => tuition.addError(error),
      );
    }, onError: (error) => profile.addError(error));
  }
}
