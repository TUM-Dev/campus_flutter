import 'package:campus_flutter/base/networking/protocols/apiResponse.dart';
import 'package:campus_flutter/personDetailedComponent/model/phoneExtension.dart';
import 'package:campus_flutter/personDetailedComponent/model/room.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../base/enums/gender.dart';
import 'organisation.dart';

part 'personDetails.g.dart';

@JsonSerializable()
class PersonDetails implements Serializable {
  final String nr;
  @JsonKey(name: "obfuscated_id")
  final String obfuscatedID;
  String? get personGroup {
    final split = obfuscatedID?.split("*");
    assert(split?.first != null && split?.length == 2);
    return split?.first;
  }
  String? get id {
    final split = obfuscatedID?.split("*");
    assert(split?.last != null && split?.length == 2);
    return split?.last;
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
  // TODO: find solution for Dart enums
  /*@JsonKey(name: "dienstlich")
  final List<ContactInfo> officialContact;
  @JsonKey(name: "privat")
  final List<ContactInfo>  privateContact;*/
  @JsonKey(name: "image_data")
  final String imageData;
  @JsonKey(name: "gruppen")
  final List<Organisation>? organisations;
  @JsonKey(name: "raeume")
  final List<Room>? rooms;
  @JsonKey(name: "telefon_nebenstellen")
  final List<PhoneExtension>? phoneExtensions;

  PersonDetails({
    required this.nr,
    required this.obfuscatedID,
    required this.firstName,
    required this.name,
    this.title,
    required this.email,
    required this.gender,
    this.officeHours,
    //required this.officialContact,
    //required this.privateContact,
    required this.imageData,
    required this.organisations,
    required this.rooms,
    required this.phoneExtensions
  });

  String get fullName {
    return "$firstName $name";
  }

  factory PersonDetails.fromJson(Map<String, dynamic> json) => _$PersonDetailsFromJson(json);

  @override
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
class PersonDetailsData implements Serializable {
  @JsonKey(name: "person")
  PersonDetails person;

  PersonDetailsData({required this.person});

  factory PersonDetailsData.fromJson(Map<String, dynamic> json) => _$PersonDetailsDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PersonDetailsDataToJson(this);
}