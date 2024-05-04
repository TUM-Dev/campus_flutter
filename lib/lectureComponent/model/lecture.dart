import 'package:campus_flutter/searchComponent/model/comparison_token.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lecture.g.dart';

@JsonSerializable()
class Lecture extends Searchable {
  @JsonKey(name: "stp_sp_nr")
  final String id;
  @JsonKey(name: "stp_lv_nr")
  final String lvNumber;
  @JsonKey(name: "stp_sp_titel")
  final String title;
  @JsonKey(name: "dauer_info")
  final String duration;
  @JsonKey(name: "stp_sp_sst")
  final String stpSpSst;
  @JsonKey(name: "stp_lv_art_name")
  final String eventTypeDefault;
  @JsonKey(name: "stp_lv_art_kurz")
  final String eventTypeTag;
  @JsonKey(name: "sj_name")
  final String semesterYear;
  @JsonKey(name: "semester")
  final String semesterType;
  @JsonKey(name: "semester_name")
  final String semester;
  @JsonKey(name: "semester_id")
  final String semesterID;
  @JsonKey(name: "org_nr_betreut")
  final String organisationNumber;
  @JsonKey(name: "org_name_betreut")
  final String organisation;
  @JsonKey(name: "org_kennung_betreut")
  final String? organisationTag;
  @JsonKey(name: "vortragende_mitwirkende")
  final String? speaker;

  String eventType(BuildContext context) {
    switch (eventTypeDefault) {
      case "Vorlesung":
        return context.tr("lecture");
      case "Tutorium":
        return context.tr("tutorial");
      case "Übung":
        return context.tr("exercise");
      case "Praktikum":
        return context.tr("practicalCourse");
      case "Seminar":
        return context.tr("seminar");
      case "Vorlesung mit integrierten Übungen":
        return context.tr("lectureWithIntegratedExcercises");
      default:
        return eventTypeDefault;
    }
  }

  String get sws {
    return "$duration SWS";
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ComparisonToken> get comparisonTokens => [
        ComparisonToken(value: title),
        ComparisonToken(value: semesterID, type: ComparisonTokenType.raw),
        ComparisonToken(value: organisation),
        ComparisonToken(value: speaker ?? ""),
        ComparisonToken(value: semester),
      ];

  Lecture({
    required this.id,
    required this.lvNumber,
    required this.title,
    required this.duration,
    required this.stpSpSst,
    required this.eventTypeDefault,
    required this.eventTypeTag,
    required this.semesterYear,
    required this.semesterType,
    required this.semester,
    required this.semesterID,
    required this.organisationNumber,
    required this.organisation,
    required this.organisationTag,
    required this.speaker,
  });

  factory Lecture.fromJson(Map<String, dynamic> json) =>
      _$LectureFromJson(json);

  Map<String, dynamic> toJson() => _$LectureToJson(this);
}

@JsonSerializable()
class Lectures {
  @JsonKey(name: "row", defaultValue: [])
  final List<Lecture> lectures;

  Lectures({required this.lectures});

  factory Lectures.fromJson(Map<String, dynamic> json) =>
      _$LecturesFromJson(json);

  Map<String, dynamic> toJson() => _$LecturesToJson(this);
}
