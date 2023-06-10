import 'package:json_annotation/json_annotation.dart';

part 'studentCard.g.dart';

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
  final String libraryID;

  @JsonKey(name: "chip_id_prime")
  final String chipID;

  final String semester;

  @JsonKey(name: "gueltig_ab")
  final DateTime validFrom;

  @JsonKey(name: "gueltig_bis")
  final DateTime validUntil;

  @JsonKey(name: "studien")
  final Studies? studies;

  @JsonKey(name: "foto")
  final String image;

  StudentCard({
    required this.id,
    required this.name,
    required this.birthday,
    required this.studyID,
    required this.libraryID,
    required this.chipID,
    required this.semester,
    required this.validFrom,
    required this.validUntil,
    this.studies,
    required this.image,
  });

  factory StudentCard.fromJson(Map<String, dynamic> json) =>
      _$StudentCardFromJson(json);

  Map<String, dynamic> toJson() => _$StudentCardToJson(this);
}

@JsonSerializable()
class Studies {
  @JsonKey(name: "studium", fromJson: alwaysAsList)
  final List<Subject> study;

  Studies({required this.study});

  factory Studies.fromJson(Map<String, dynamic> json) =>
      _$StudiesFromJson(json);

  Map<String, dynamic> toJson() => _$StudiesToJson(this);
}

// TODO: try to make this generic?
List<Subject> alwaysAsList(dynamic data) {
  if (data is Map<String, dynamic>) {
    return [Subject.fromJson(data)];
  } else {
    return (data as List<dynamic>).map((e) => Subject.fromJson(e)).toList();
  }
}

@JsonSerializable()
class Subject {
  final String name;

  @JsonKey(name: "abschluss")
  final String degree;

  @JsonKey(name: "identifikator")
  final String id;

  Subject({required this.name, required this.degree, required this.id});

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

@JsonSerializable()
class StudentCards {
  @JsonKey(name: "card")
  final StudentCard studentCard;

  StudentCards({required this.studentCard});

  factory StudentCards.fromJson(Map<String, dynamic> json) =>
      _$StudentCardsFromJson(json);

  Map<String, dynamic> toJson() => _$StudentCardsToJson(this);
}

@JsonSerializable()
class StudentCardData {
  @JsonKey(name: "cards")
  final StudentCards studentCards;

  StudentCardData({required this.studentCards});

  factory StudentCardData.fromJson(Map<String, dynamic> json) =>
      _$StudentCardDataFromJson(json);

  Map<String, dynamic> toJson() => _$StudentCardDataToJson(this);
}
