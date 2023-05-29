// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grade _$GradeFromJson(Map<String, dynamic> json) => Grade(
      date: DateTime.parse(json['datum'] as String),
      lvNumber: json['lv_nummer'] as String,
      semester: json['lv_semester'] as String,
      title: json['lv_titel'] as String,
      examiner: json['pruefer_nachname'] as String,
      grade: json['uninotenamekurz'] as String,
      examType: json['exam_typ_name'] as String,
      modus: json['modus'] as String,
      studyID: json['studienidentifikator'] as String,
      studyDesignation: json['studienbezeichnung'] as String,
      studyNumber: json['st_studium_nr'] as String,
    );

Map<String, dynamic> _$GradeToJson(Grade instance) => <String, dynamic>{
      'datum': instance.date.toIso8601String(),
      'lv_nummer': instance.lvNumber,
      'lv_semester': instance.semester,
      'lv_titel': instance.title,
      'pruefer_nachname': instance.examiner,
      'uninotenamekurz': instance.grade,
      'exam_typ_name': instance.examType,
      'modus': instance.modus,
      'studienidentifikator': instance.studyID,
      'studienbezeichnung': instance.studyDesignation,
      'st_studium_nr': instance.studyNumber,
    };

GradeData _$GradeDataFromJson(Map<String, dynamic> json) => GradeData(
      gradesAttribute: Grades.fromJson(json['rowset'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GradeDataToJson(GradeData instance) => <String, dynamic>{
      'rowset': instance.gradesAttribute,
    };

Grades _$GradesFromJson(Map<String, dynamic> json) => Grades(
      personalGrades: (json['row'] as List<dynamic>)
          .map((e) => Grade.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GradesToJson(Grades instance) => <String, dynamic>{
      'row': instance.personalGrades,
    };
