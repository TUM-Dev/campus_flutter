import 'package:campus_flutter/base/enums/gender.dart';
import 'package:campus_flutter/personComponent/model/personDetails/contact_info.dart';
import 'package:campus_flutter/personComponent/model/personDetails/organisation.dart';
import 'package:campus_flutter/personComponent/model/personDetails/phone_extension.dart';
import 'package:campus_flutter/personComponent/model/personDetails/room.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_details.g.dart';

@JsonSerializable()
class PersonDetails {
  final String nr;
  @JsonKey(name: "obfuscated_id")
  final String obfuscatedID;

  String? get personGroup {
    final split = obfuscatedID.split("*");
    assert(split.length == 2);
    return split.first;
  }

  String? get id {
    final split = obfuscatedID.split("*");
    assert(split.length == 2);
    return split.last;
  }

  @JsonKey(name: "vorname")
  final String firstName;
  @JsonKey(name: "familienname")
  final String name;
  @JsonKey(name: "titel")
  final String? title;
  final String email;
  @JsonKey(name: "geschlecht", fromJson: _stringToGender)
  final Gender gender;
  @JsonKey(name: "sprechstunde")
  final String? officeHours;
  @JsonKey(name: "dienstlich")
  final ContactInfo? officialContact;
  @JsonKey(name: "privat")
  final ContactInfo? privateContact;
  @JsonKey(name: "image_data")
  final String? imageData;
  @JsonKey(name: "gruppe", defaultValue: [])
  final List<Organisation> organisations;
  @JsonKey(name: "raum", defaultValue: [])
  final List<Room> rooms;
  @JsonKey(name: "nebenstelle", defaultValue: [])
  final List<PhoneExtension> phoneExtensions;

  PersonDetails({
    required this.nr,
    required this.obfuscatedID,
    required this.firstName,
    required this.name,
    this.title,
    required this.email,
    required this.gender,
    this.officeHours,
    this.officialContact,
    this.privateContact,
    this.imageData,
    required this.organisations,
    required this.rooms,
    required this.phoneExtensions,
  });

  String get fullName {
    return "$firstName $name";
  }

  String get fullNameWithTitle {
    if (title != null) {
      return "$title $firstName $name";
    } else {
      return fullName;
    }
  }

  factory PersonDetails.fromJson(Map<String, dynamic> json) =>
      _$PersonDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PersonDetailsToJson(this);

  static Gender _stringToGender(String gender) {
    switch (gender) {
      case "M":
      case "m":
        return Gender.male;
      case "F":
      case "f":
        return Gender.female;
      default:
        return Gender.unknown;
    }
  }
}

@JsonSerializable()
class PersonDetailsData {
  @JsonKey(name: "person")
  PersonDetails person;

  PersonDetailsData({required this.person});

  factory PersonDetailsData.fromJson(Map<String, dynamic> json) =>
      _$PersonDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$PersonDetailsDataToJson(this);
}
