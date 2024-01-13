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
      studies: json['studien'] == null
          ? null
          : Studies.fromJson(json['studien'] as Map<String, dynamic>),
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
      'studien': instance.studies,
      'foto': instance.image,
    };

Studies _$StudiesFromJson(Map<String, dynamic> json) => Studies(
      study: alwaysAsList(json['studium']),
    );

Map<String, dynamic> _$StudiesToJson(Studies instance) => <String, dynamic>{
      'studium': instance.study,
    };

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      name: json['name'] as String,
      degree: json['abschluss'] as String,
      id: json['identifikator'] as String,
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'name': instance.name,
      'abschluss': instance.degree,
      'identifikator': instance.id,
    };

StudentCards _$StudentCardsFromJson(Map<String, dynamic> json) => StudentCards(
      studentCard: StudentCard.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentCardsToJson(StudentCards instance) =>
    <String, dynamic>{
      'card': instance.studentCard,
    };

StudentCardData _$StudentCardDataFromJson(Map<String, dynamic> json) =>
    StudentCardData(
      studentCards:
          StudentCards.fromJson(json['cards'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentCardDataToJson(StudentCardData instance) =>
    <String, dynamic>{
      'cards': instance.studentCards,
    };
