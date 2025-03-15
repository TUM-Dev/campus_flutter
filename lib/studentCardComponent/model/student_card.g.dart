// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentCard _$StudentCardFromJson(Map<String, dynamic> json) => StudentCard(
  id: json['obfuscated_id'] as String,
  name: json['name'] as String,
  birthday: DateTime.parse(json['geburtsdatum'] as String),
  studyID: json['matrikelnummer'] as String,
  libraryID: json['bibliotheksnummer'] as String,
  chipID: json['chip_id_prime'] as String,
  semester: json['semester'] as String,
  validFrom: DateTime.parse(json['gueltig_ab'] as String),
  validUntil: DateTime.parse(json['gueltig_bis'] as String),
  studies:
      (json['studium'] as List<dynamic>?)
          ?.map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  image: json['foto'] as String,
);

Map<String, dynamic> _$StudentCardToJson(StudentCard instance) =>
    <String, dynamic>{
      'obfuscated_id': instance.id,
      'name': instance.name,
      'geburtsdatum': instance.birthday.toIso8601String(),
      'matrikelnummer': instance.studyID,
      'bibliotheksnummer': instance.libraryID,
      'chip_id_prime': instance.chipID,
      'semester': instance.semester,
      'gueltig_ab': instance.validFrom.toIso8601String(),
      'gueltig_bis': instance.validUntil.toIso8601String(),
      'studium': instance.studies,
      'foto': instance.image,
    };

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
  name: json['name'] as String,
  degree: json['abschluss'] as String,
  degreeShort: json['abschluss_kurz'] as String?,
  id: json['identifikator'] as String,
);

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
  'name': instance.name,
  'abschluss': instance.degree,
  'abschluss_kurz': instance.degreeShort,
  'identifikator': instance.id,
};

StudentCards _$StudentCardsFromJson(Map<String, dynamic> json) => StudentCards(
  studentCards:
      (json['card'] as List<dynamic>?)
          ?.map((e) => StudentCard.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$StudentCardsToJson(StudentCards instance) =>
    <String, dynamic>{'card': instance.studentCards};
