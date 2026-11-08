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

  Future<void> fetch(bool forcedRefresh) async {
    try {
      final response = await ProfileService.fetchProfile(forcedRefresh);
      lastFetched.add(response.$1);
      profile.add(response.$2);
      try {
        final tuitionResponse = await ProfileService.fetchTuition(
          forcedRefresh,
          response.$2.personGroup ?? "",
          response.$2.id ?? "",
        );
        tuition.add(tuitionResponse.$2);
      } catch (error, stack) {
        tuition.addError(error, stack);
      }
    } catch (error, stack) {
      profile.addError(error, stack);
      tuition.addError(error, stack);
    }
  }
}
