// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureDetails _$LectureDetailsFromJson(Map<String, dynamic> json) =>
    LectureDetails(
      id: StringParser.stringToInt(json['stp_sp_nr'] as String?),
      lvNumber: StringParser.stringToInt(json['stp_lv_nr'] as String?),
      title: json['stp_sp_titel'] as String,
      duration: json['dauer_info'] as String,
      stp_sp_sst: json['stp_sp_sst'] as String,
      eventTypeDefault: json['stp_lv_art_name'] as String,
      eventTypeTag: json['stp_lv_art_kurz'] as String,
      semester: json['semester_name'] as String,
      semesterType: json['semester'] as String,
      semesterID: json['semester_id'] as String,
      semesterYear: json['sj_name'] as String,
      organisationNumber:
          StringParser.stringToInt(json['org_nr_betreut'] as String?),
      organisation: json['org_name_betreut'] as String,
      organisationTag: json['org_kennung_betreut'] as String,
      speaker: json['vortragende_mitwirkende'] as String?,
      courseContents: json['lehrinhalt'] as String?,
      requirements: json['voraussetzung_lv'] as String?,
      courseObjective: json['lehrziel'] as String?,
      teachingMethod: json['lehrmethode'] as String?,
      anmeld_lv: json['anmeld_lv'] as String?,
      firstScheduledDate: json['ersttermin'] as String?,
      examinationMode: json['pruefmodus'] as String?,
      studienbehelfe: json['studienbehelfe'] as String?,
      note: json['anmerkung'] as String?,
      curriculumURL: json['stellung_im_stp_url'] as String?,
      scheduledDatesURL: json['termine_url'] as String?,
      examDateURL: json['pruef_termine_url'] as String?,
    );

Map<String, dynamic> _$LectureDetailsToJson(LectureDetails instance) =>
    <String, dynamic>{
      'stp_sp_nr': instance.id,
      'stp_lv_nr': instance.lvNumber,
      'stp_sp_titel': instance.title,
      'dauer_info': instance.duration,
      'stp_sp_sst': instance.stp_sp_sst,
      'stp_lv_art_name': instance.eventTypeDefault,
      'stp_lv_art_kurz': instance.eventTypeTag,
      'semester_name': instance.semester,
      'semester': instance.semesterType,
      'semester_id': instance.semesterID,
      'sj_name': instance.semesterYear,
      'org_nr_betreut': instance.organisationNumber,
      'org_name_betreut': instance.organisation,
      'org_kennung_betreut': instance.organisationTag,
      'vortragende_mitwirkende': instance.speaker,
      'lehrinhalt': instance.courseContents,
      'voraussetzung_lv': instance.requirements,
      'lehrziel': instance.courseObjective,
      'lehrmethode': instance.teachingMethod,
      'anmeld_lv': instance.anmeld_lv,
      'ersttermin': instance.firstScheduledDate,
      'pruefmodus': instance.examinationMode,
      'studienbehelfe': instance.studienbehelfe,
      'anmerkung': instance.note,
      'stellung_im_stp_url': instance.curriculumURL,
      'termine_url': instance.scheduledDatesURL,
      'pruef_termine_url': instance.examDateURL,
    };

LectureDetailsData _$LectureDetailsDataFromJson(Map<String, dynamic> json) =>
    LectureDetailsData(
      lectureDetailsAttribute: LectureDetailsElement.fromJson(
        json['rowset'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$LectureDetailsDataToJson(LectureDetailsData instance) =>
    <String, dynamic>{
      'rowset': instance.lectureDetailsAttribute,
    };

LectureDetailsElement _$LectureDetailsElementFromJson(
  Map<String, dynamic> json,
) =>
    LectureDetailsElement(
      lectureDetails:
          LectureDetailsElement._lectureDetailsFromJson(json['row']),
    );

Map<String, dynamic> _$LectureDetailsElementToJson(
  LectureDetailsElement instance,
) =>
    <String, dynamic>{
      'row': instance.lectureDetails,
    };
