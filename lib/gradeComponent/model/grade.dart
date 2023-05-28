import 'package:campus_flutter/base/networking/protocols/apiResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grade.g.dart';

@JsonSerializable()
class Grade implements Serializable {
  String get id {
    return "${date.toIso8601String()}-$lvNumber";
  }

  @JsonKey(name: "datum")
  final DateTime date;
  @JsonKey(name: "lv_nummer")
  final String lvNumber;
  @JsonKey(name: "lv_semester")
  final String semester;
  @JsonKey(name: "lv_titel")
  String title;
  @JsonKey(name: "pruefer_nachname")
  final String examiner;
  @JsonKey(name: "uninotenamekurz")
  final String grade;
  @JsonKey(name: "exam_typ_name")
  final String examType;
  @JsonKey(name: "modus")
  final String modus;
  @JsonKey(name: "studienidentifikator")
  String studyID;
  @JsonKey(name: "studienbezeichnung")
  final String studyDesignation;
  @JsonKey(name: "st_studium_nr")
  final String studyNumber;

  String get modusShort {
    switch (modus) {
      case "Schriftlich":
        return "Written";
      case "Beurteilt/immanenter Prüfungscharakter":
        return "Graded";
      case "Schriftlich und Mündlich":
        return "Written/Oral";
      case "Mündlich":
        return "Oral";
      default:
        return "Unknown";
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
    required this.modus,
    required this.studyID,
    required this.studyDesignation,
    required this.studyNumber
  });

  factory Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GradeToJson(this);
}

@JsonSerializable()
class GradeData implements Serializable {
  @JsonKey(name: "rowset")
  Grades gradesAttribute;

  GradeData({required this.gradesAttribute});

  factory GradeData.fromJson(Map<String, dynamic> json) => _$GradeDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GradeDataToJson(this);
}

@JsonSerializable()
class Grades implements Serializable {
  @JsonKey(name: "row")
  final List<Grade> personalGrades;

  Grades({required this.personalGrades});

  factory Grades.fromJson(Map<String, dynamic> json) => _$GradesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GradesToJson(this);
}