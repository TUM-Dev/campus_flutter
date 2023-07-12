import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:json_annotation/json_annotation.dart';

part 'average_grade.g.dart';

@JsonSerializable()
class AverageGrade {
  @JsonKey(name: "studidf")
  final String id;
  @JsonKey(name: "studbez")
  final String studyDesignation;
  @JsonKey(
      name: "avg_grade_weighted_by_credits",
      fromJson: StringParser.stringToDouble)
  final double averageGrade;

  AverageGrade(
      {required this.id,
      required this.studyDesignation,
      required this.averageGrade});

  factory AverageGrade.fromJson(Map<String, dynamic> json) =>
      _$AverageGradeFromJson(json);

  Map<String, dynamic> toJson() => _$AverageGradeToJson(this);
}

@JsonSerializable()
class AverageGradeResponse {
  @JsonKey(name: "studien")
  final AverageGrades? averageGradeData;

  AverageGradeResponse({required this.averageGradeData});

  factory AverageGradeResponse.fromJson(Map<String, dynamic> json) =>
      _$AverageGradeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AverageGradeResponseToJson(this);
}

@JsonSerializable()
class AverageGrades {
  @JsonKey(name: "studium")
  final List<AverageGrade> averageGrades;

  AverageGrades({required this.averageGrades});

  factory AverageGrades.fromJson(Map<String, dynamic> json) =>
      _$AverageGradesFromJson(json);

  Map<String, dynamic> toJson() => _$AverageGradesToJson(this);
}
