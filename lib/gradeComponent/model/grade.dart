import 'package:campus_flutter/searchComponent/model/comparison_token.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:campus_flutter/base/extensions/context.dart';

part 'grade.g.dart';

@JsonSerializable()
class Grade extends Searchable {
  String get id {
    return "${date?.toIso8601String()}-$lvNumber";
  }

  @JsonKey(name: "datum")
  final DateTime? date;
  @JsonKey(name: "lv_nummer")
  final String lvNumber;
  @JsonKey(name: "lv_semester")
  final String semester;
  @JsonKey(name: "lv_titel")
  String title;
  @JsonKey(name: "pruefer_nachname")
  final String examiner;
  @JsonKey(name: "uninotenamekurz")
  final String? grade;
  @JsonKey(name: "exam_typ_name")
  final String examType;
  @JsonKey(name: "modus")
  final String mode;
  @JsonKey(name: "studienidentifikator")
  String studyID;
  @JsonKey(name: "studienbezeichnung")
  final String studyDesignation;
  @JsonKey(name: "st_studium_nr")
  final String studyNumber;
  @JsonKey(name: "abschluss_name")
  final String? degree;
  @JsonKey(name: "abschluss_name_kurz")
  final String? degreeShort;

  String modeShort(BuildContext context) {
    switch (mode) {
      case "Schriftlich":
        return context.localizations.written;
      case "Beurteilt/immanenter Prüfungscharakter":
        return context.localizations.graded;
      case "Schriftlich und Mündlich":
        return context.localizations.writtenAndOral;
      case "Mündlich":
        return context.localizations.oral;
      default:
        return mode;
    }
  }

  Grade({
    required this.date,
    required this.lvNumber,
    required this.semester,
    required this.title,
    required this.examiner,
    required this.grade,
    required this.examType,
    required this.mode,
    required this.studyID,
    required this.studyDesignation,
    required this.studyNumber,
    this.degree,
    this.degreeShort,
  });

  factory Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson(json);

  Map<String, dynamic> toJson() => _$GradeToJson(this);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ComparisonToken> get comparisonTokens => [
        ComparisonToken(value: title),
        ComparisonToken(value: examiner),
        ComparisonToken(value: grade ?? "", type: ComparisonTokenType.raw),
        ComparisonToken(value: lvNumber),
        ComparisonToken(value: mode),
        ComparisonToken(value: semester),
        ComparisonToken(value: studyDesignation),
      ];
}

@JsonSerializable()
class Grades {
  @JsonKey(name: "row", defaultValue: [])
  final List<Grade> personalGrades;

  Grades({required this.personalGrades});

  factory Grades.fromJson(Map<String, dynamic> json) => _$GradesFromJson(json);

  Map<String, dynamic> toJson() => _$GradesToJson(this);
}
