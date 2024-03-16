import 'package:campus_flutter/base/util/string_parser.dart';
import 'package:flutter/widgets.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lecture_details.g.dart';

@JsonSerializable()
class LectureDetails {
  @JsonKey(name: "stp_sp_nr", fromJson: StringParser.stringToInt)
  final int id;
  @JsonKey(name: "stp_lv_nr", fromJson: StringParser.stringToInt)
  final int lvNumber;
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
  @JsonKey(name: "semester_name")
  final String semester;
  @JsonKey(name: "semester")
  final String semesterType;
  @JsonKey(name: "semester_id")
  final String semesterID;
  @JsonKey(name: "sj_name")
  final String semesterYear;
  @JsonKey(name: "org_nr_betreut", fromJson: StringParser.stringToInt)
  final int organisationNumber;
  @JsonKey(name: "org_name_betreut")
  final String organisation;
  @JsonKey(name: "org_kennung_betreut")
  final String organisationTag;
  @JsonKey(name: "vortragende_mitwirkende")
  final String? speaker;
  @JsonKey(name: "lehrinhalt")
  final String? courseContents;
  @JsonKey(name: "voraussetzung_lv")
  final String? requirements;
  @JsonKey(name: "lehrziel")
  final String? courseObjective;
  @JsonKey(name: "lehrmethode")
  final String? teachingMethod;
  @JsonKey(name: "anmeld_lv")
  final String? signUpLV;
  @JsonKey(name: "ersttermin")
  final String? firstScheduledDate;
  @JsonKey(name: "pruefmodus")
  final String? examinationMode;
  final String? studienbehelfe;
  @JsonKey(name: "anmerkung")
  final String? note;
  @JsonKey(name: "stellung_im_stp_url")
  final String? curriculumURL;
  @JsonKey(name: "termine_url")
  final String? scheduledDatesURL;
  @JsonKey(name: "pruef_termine_url")
  final String? examDateURL;

  String eventType(BuildContext context) {
    switch (eventTypeDefault) {
      case "Vorlesung":
        return context.localizations.lecture;
      case "Tutorium":
        return context.localizations.tutorial;
      case "Übung":
        return context.localizations.exercise;
      case "Praktikum":
        return context.localizations.practicalCourse;
      case "Seminar":
        return context.localizations.seminar;
      case "Vorlesung mit integrierten Übungen":
        return context.localizations.lectureWithIntegratedExcercises;
      default:
        return eventTypeDefault;
    }
  }

  LectureDetails({
    required this.id,
    required this.lvNumber,
    required this.title,
    required this.duration,
    required this.stpSpSst,
    required this.eventTypeDefault,
    required this.eventTypeTag,
    required this.semester,
    required this.semesterType,
    required this.semesterID,
    required this.semesterYear,
    required this.organisationNumber,
    required this.organisation,
    required this.organisationTag,
    required this.speaker,
    this.courseContents,
    this.requirements,
    this.courseObjective,
    this.teachingMethod,
    this.signUpLV,
    this.firstScheduledDate,
    this.examinationMode,
    this.studienbehelfe,
    this.note,
    this.curriculumURL,
    this.scheduledDatesURL,
    this.examDateURL,
  });

  factory LectureDetails.fromJson(Map<String, dynamic> json) =>
      _$LectureDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$LectureDetailsToJson(this);
}

@JsonSerializable()
class LectureDetailsElement {
  @JsonKey(name: "row", fromJson: _lectureDetailsFromJson)
  final LectureDetails lectureDetails;

  LectureDetailsElement({required this.lectureDetails});

  factory LectureDetailsElement.fromJson(Map<String, dynamic> json) =>
      _$LectureDetailsElementFromJson(json);

  Map<String, dynamic> toJson() => _$LectureDetailsElementToJson(this);

  static LectureDetails _lectureDetailsFromJson(dynamic data) {
    if (data is List<dynamic>) {
      return LectureDetails.fromJson(data.first);
    } else {
      return LectureDetails.fromJson(data);
    }
  }
}
