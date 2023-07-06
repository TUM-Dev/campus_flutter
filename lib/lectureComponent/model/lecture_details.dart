import 'package:campus_flutter/base/helpers/string_parser.dart';
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
  final String stp_sp_sst;
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
  final String? anmeld_lv;
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

  String get eventType {
    switch (eventTypeDefault) {
      case "Vorlesung":
        return "Lecture";
      case "Tutorium":
        return "Exercise";
      case "Praktikum":
        return "Practice";
      case "Vorlesung mit integrierten Übungen":
        return "Lecture with integrated Exercises";
      default:
        return "";
    }
  }

  LectureDetails({
    required this.id,
    required this.lvNumber,
    required this.title,
    required this.duration,
    required this.stp_sp_sst,
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
    this.anmeld_lv,
    this.firstScheduledDate,
    this.examinationMode,
    this.studienbehelfe,
    this.note,
    this.curriculumURL,
    this.scheduledDatesURL,
    this.examDateURL
  });

  factory LectureDetails.fromJson(Map<String, dynamic> json) => _$LectureDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$LectureDetailsToJson(this);
}

@JsonSerializable()
class LectureDetailsData {
  @JsonKey(name: "rowset")
  LectureDetailsElement lectureDetailsAttribute;

  LectureDetailsData({required this.lectureDetailsAttribute});

  factory LectureDetailsData.fromJson(Map<String, dynamic> json) => _$LectureDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$LectureDetailsDataToJson(this);
}

@JsonSerializable()
class LectureDetailsElement {
  @JsonKey(name: "row")
  final LectureDetails lectureDetails;

  LectureDetailsElement({required this.lectureDetails});

  factory LectureDetailsElement.fromJson(Map<String, dynamic> json) => _$LectureDetailsElementFromJson(json);

  Map<String, dynamic> toJson() => _$LectureDetailsElementToJson(this);
}