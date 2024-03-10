import 'package:campus_flutter/base/enums/role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: "vorname")
  final String? firstname;
  @JsonKey(name: "obfuscated_id")
  final String? obfuscatedID;
  @JsonKey(name: "obfuscated_id_bedienstete")
  final String? obfuscatedIDEmployee;
  @JsonKey(name: "obfuscated_id_extern")
  final String? obfuscatedIDExtern;
  @JsonKey(name: "obfuscated_id_studierende")
  final String? obfuscatedIDStudent;
  @JsonKey(name: "familienname")
  final String? surname;
  @JsonKey(name: "kennung")
  final String? tumID;

  Role get role {
    if (obfuscatedIDStudent != null) {
      return Role.student;
    } else if (obfuscatedIDEmployee != null) {
      return Role.employee;
    } else {
      return Role.extern;
    }
  }

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

  String get fullName {
    return "$firstname $surname";
  }

  Profile({
    this.firstname,
    this.obfuscatedID,
    this.obfuscatedIDEmployee,
    this.obfuscatedIDExtern,
    this.obfuscatedIDStudent,
    this.surname,
    this.tumID,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable()
class Profiles {
  @JsonKey(name: "row", fromJson: _profileFromJson)
  final Profile profile;

  Profiles({required this.profile});

  factory Profiles.fromJson(Map<String, dynamic> json) =>
      _$ProfilesFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilesToJson(this);

  static Profile _profileFromJson(dynamic data) {
    if (data is List<dynamic>) {
      return Profile.fromJson(data.first);
    } else {
      return Profile.fromJson(data);
    }
  }
}
