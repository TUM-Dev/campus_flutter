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

AverageGrades _$AverageGradesFromJson(Map<String, dynamic> json) =>
    AverageGrades(
      averageGrades: (json['studium'] as List<dynamic>?)
              ?.map((e) => AverageGrade.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$AverageGradesToJson(AverageGrades instance) =>
    <String, dynamic>{
      'studium': instance.averageGrades,
    };
