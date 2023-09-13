import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'lecture.g.dart';

@JsonSerializable()
class Lecture {
  @JsonKey(name: "stp_sp_nr")
  final String id;
  @JsonKey(name: "stp_lv_nr")
  final String lvNumber;
  @JsonKey(name: "stp_sp_titel")
  final String title;
  @JsonKey(name: "dauer_info")
  final String duration;
  @JsonKey(name: "stp_sp_sst")
  final String stp_sp_sst;
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
  final String organisationTag;
  @JsonKey(name: "vortragende_mitwirkende")
  final String speaker;

  String eventType(BuildContext context) {
    switch (eventTypeDefault) {
      case "Vorlesung":
        return AppLocalizations.of(context)!.lecture;
      case "Tutorium":
        return AppLocalizations.of(context)!.tutorial;
      case "Übung":
        return AppLocalizations.of(context)!.exercise;
      case "Praktikum":
        return AppLocalizations.of(context)!.practicalCourse;
      case "Seminar":
        return AppLocalizations.of(context)!.seminar;
      case "Vorlesung mit integrierten Übungen":
        return AppLocalizations.of(context)!.lectureWithIntegratedExcercises;
      default:
        return eventTypeDefault;
    }
  }

  String get sws {
    return "$duration SWS";
  }

  Lecture(
      {required this.id,
      required this.lvNumber,
      required this.title,
      required this.duration,
      required this.stp_sp_sst,
      required this.eventTypeDefault,
      required this.eventTypeTag,
      required this.semesterYear,
      required this.semesterType,
      required this.semester,
      required this.semesterID,
      required this.organisationNumber,
      required this.organisation,
      required this.organisationTag,
      required this.speaker});

  factory Lecture.fromJson(Map<String, dynamic> json) =>
      _$LectureFromJson(json);

  Map<String, dynamic> toJson() => _$LectureToJson(this);
}

@JsonSerializable()
class LectureData {
  @JsonKey(name: "rowset")
  Lectures? lecturesAttribute;

  LectureData({required this.lecturesAttribute});

  factory LectureData.fromJson(Map<String, dynamic> json) =>
      _$LectureDataFromJson(json);

  Map<String, dynamic> toJson() => _$LectureDataToJson(this);
}

@JsonSerializable()
class Lectures {
  @JsonKey(name: "row")
  final List<Lecture> lectures;

  Lectures({required this.lectures});

  factory Lectures.fromJson(Map<String, dynamic> json) =>
      _$LecturesFromJson(json);

  Map<String, dynamic> toJson() => _$LecturesToJson(this);
}
