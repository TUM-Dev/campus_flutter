import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/personDetailedComponent/model/person_details.dart';
import 'package:campus_flutter/personDetailedComponent/services/person_details_service.dart';
import 'package:rxdart/rxdart.dart';

class PersonDetailsViewModel implements ViewModel {
  final BehaviorSubject<PersonDetails?> personDetails =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  final String? obfuscatedId;

  PersonDetailsViewModel(this.obfuscatedId);

  @override
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
