import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/personComponent/model/personDetails/person_details.dart';
import 'package:campus_flutter/personComponent/services/person_details_service.dart';
import 'package:campus_flutter/personComponent/viewModel/profile_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final profileDetailsViewModel = Provider((ref) {
  final profile = ref.watch(profileViewModel).profile.value;
  return PersonDetailsViewModel(profile?.obfuscatedID);
});
final personDetailsViewModel =
    Provider.family<PersonDetailsViewModel, String>((ref, obfuscatedId) {
  return PersonDetailsViewModel(obfuscatedId);
});

class PersonDetailsViewModel {
  final BehaviorSubject<PersonDetails?> personDetails =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  final String? obfuscatedId;

  PersonDetailsViewModel(this.obfuscatedId);

  Future fetch(bool forcedRefresh) async {
    if (obfuscatedId != null) {
      PersonDetailsService.fetchPersonDetails(forcedRefresh, obfuscatedId ?? "")
          .then(
        (response) {
          lastFetched.add(response.$1);
          personDetails.add(response.$2);
        },
        onError: (error) => personDetails.addError(error),
      );
    } else {
      personDetails.addError(
        TumOnlineApiException(
          tumOnlineApiExceptionType: TumOnlineApiExceptionNoUserFound(),
        ),
      );
    }
  }
}
