import 'package:json_annotation/json_annotation.dart';

part 'student_card.g.dart';

@JsonSerializable()
class StudentCard {
  @JsonKey(name: "obfuscated_id")
  final String id;

  final String name;

  @JsonKey(name: "geburtsdatum")
  final DateTime birthday;

  @JsonKey(name: "matrikelnummer")
  final String studyID;

  @JsonKey(name: "bibliotheksnummer")
  final String? libraryID;

  @JsonKey(name: "bibliothekskennung")
  final String? libraryCode;

  @JsonKey(name: "chip_id_prime")
  final String chipID;

  final String semester;

  @JsonKey(name: "gueltig_ab")
  final DateTime validFrom;

  @JsonKey(name: "gueltig_bis")
  final DateTime validUntil;

  @JsonKey(name: "studium", defaultValue: [])
  final List<Subject> studies;

  @JsonKey(name: "foto")
  final String image;

  StudentCard({
    required this.id,
    required this.name,
    required this.birthday,
    required this.studyID,
    this.libraryID,
    this.libraryCode,
    required this.chipID,
    required this.semester,
    required this.validFrom,
    required this.validUntil,
    required this.studies,
    required this.image,
  });

  factory StudentCard.fromJson(Map<String, dynamic> json) =>
      _$StudentCardFromJson(json);

  Map<String, dynamic> toJson() => _$StudentCardToJson(this);
}

@JsonSerializable()
class Subject {
  final String name;
  @JsonKey(name: "abschluss")
  final String degree;
  @JsonKey(name: "abschluss_kurz")
  final String? degreeShort;
  @JsonKey(name: "identifikator")
  final String id;

  Subject({
    required this.name,
    required this.degree,
    this.degreeShort,
    required this.id,
  });

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

@JsonSerializable()
class StudentCards {
  @JsonKey(name: "card", defaultValue: [])
  final List<StudentCard> studentCards;

  StudentCards({required this.studentCards});

  factory StudentCards.fromJson(Map<String, dynamic> json) =>
      _$StudentCardsFromJson(json);

  Map<String, dynamic> toJson() => _$StudentCardsToJson(this);
}
