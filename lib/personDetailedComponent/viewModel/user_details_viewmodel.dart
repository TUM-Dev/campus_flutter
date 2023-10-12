import 'package:campus_flutter/base/enums/gender.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/personDetailedComponent/model/person_details.dart';
import 'package:campus_flutter/personDetailedComponent/services/person_details_service.dart';
import 'package:campus_flutter/profileComponent/model/profile.dart';
import 'package:rxdart/rxdart.dart';

class UserDetailsViewModel implements ViewModel {
  final Profile? profile;

  final BehaviorSubject<PersonDetails?> personDetails =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  UserDetailsViewModel(this.profile);

  static PersonDetails defaultPersonDetails = PersonDetails(
      nr: "",
      obfuscatedID: "",
      firstName: "TUM",
      name: "Student",
      email: "tum.student@tum.de",
      gender: Gender.unknown,
      organisations: [],
      rooms: [],
      phoneExtensions: [],
      imageData: "");

  @override
  Future fetch(bool forcedRefresh) async {
    if (profile != null) {
      PersonDetailsService.fetchPersonDetails(
              forcedRefresh, profile!.obfuscatedID ?? "")
          .then((response) {
        lastFetched.add(response.$1);
        personDetails.add(response.$2);
      }, onError: (error) => personDetails.addError(error));
    } else {
      personDetails.addError(TumOnlineApiException(
          tumOnlineApiExceptionType: TumOnlineApiExceptionNoUserFound()));
    }
  }
}
