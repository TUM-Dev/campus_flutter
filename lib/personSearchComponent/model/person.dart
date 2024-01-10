import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person extends Searchable {
  @JsonKey(name: "vorname")
  final String firstname;
  @JsonKey(name: "familienname")
  final String surname;
  @JsonKey(name: "titel")
  final String? title;
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

  String get fullName {
    return "$firstname $surname";
  }

  String get fullNameWithTitle {
    if (title != null) {
      return "$title $fullName";
    } else {
      return fullName;
    }
  }

  Person({
    required this.firstname,
    required this.surname,
    this.title,
    required this.nr,
    required this.obfuscatedID,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

@JsonSerializable()
class PersonData {
  @JsonKey(name: "rowset")
  Persons? personAttribute;

  PersonData({required this.personAttribute});

  factory PersonData.fromJson(Map<String, dynamic> json) =>
      _$PersonDataFromJson(json);

  Map<String, dynamic> toJson() => _$PersonDataToJson(this);
}

@JsonSerializable()
class Persons {
  @JsonKey(name: "row")
  final List<Person> persons;

  Persons({required this.persons});

  factory Persons.fromJson(Map<String, dynamic> json) =>
      _$PersonsFromJson(json);

  Map<String, dynamic> toJson() => _$PersonsToJson(this);
}
