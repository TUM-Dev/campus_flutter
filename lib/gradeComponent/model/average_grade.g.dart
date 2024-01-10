// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'average_grade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AverageGrade _$AverageGradeFromJson(Map<String, dynamic> json) => AverageGrade(
      id: json['studidf'] as String,
      studyDesignation: json['studbez'] as String,
      averageGrade: StringParser.stringToDouble(
          json['avg_grade_weighted_by_credits'] as String?),
    );

Map<String, dynamic> _$AverageGradeToJson(AverageGrade instance) =>
    <String, dynamic>{
      'studidf': instance.id,
      'studbez': instance.studyDesignation,
      'avg_grade_weighted_by_credits': instance.averageGrade,
    };

AverageGradeResponse _$AverageGradeResponseFromJson(
        Map<String, dynamic> json) =>
    AverageGradeResponse(
      averageGradeData: json['studien'] == null
          ? null
          : AverageGrades.fromJson(json['studien'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AverageGradeResponseToJson(
        AverageGradeResponse instance) =>
    <String, dynamic>{
      'studien': instance.averageGradeData,
    };

AverageGrades _$AverageGradesFromJson(Map<String, dynamic> json) =>
    AverageGrades(
      averageGrades: (json['studium'] as List<dynamic>)
          .map((e) => AverageGrade.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AverageGradesToJson(AverageGrades instance) =>
    <String, dynamic>{
      'studium': instance.averageGrades,
    };
