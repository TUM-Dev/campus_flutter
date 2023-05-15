import 'package:campus_flutter/base/enums/gender.dart';
import 'package:campus_flutter/personDetailedComponent/model/personDetails.dart';
import 'package:campus_flutter/personDetailedComponent/services/personDetailsService.dart';
import 'package:campus_flutter/profileComponent/model/profile.dart';
import 'package:rxdart/rxdart.dart';

class PersonDetailsViewModel {
  final Profile? profile;

  BehaviorSubject<PersonDetails?> personDetails = BehaviorSubject.seeded(null);

  PersonDetailsViewModel(this.profile);

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
      imageData: ""
  );

  fetchPersonDetails() async {
    if (profile != null) {
      personDetails
          .add(await PersonDetailsService.fetchPersonDetails(profile!.obfuscatedID ?? ""));
    }
  }
}