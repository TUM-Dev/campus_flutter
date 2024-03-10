// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lecture _$LectureFromJson(Map<String, dynamic> json) => Lecture(
      id: json['stp_sp_nr'] as String,
      lvNumber: json['stp_lv_nr'] as String,
      title: json['stp_sp_titel'] as String,
      duration: json['dauer_info'] as String,
      stpSpSst: json['stp_sp_sst'] as String,
      eventTypeDefault: json['stp_lv_art_name'] as String,
      eventTypeTag: json['stp_lv_art_kurz'] as String,
      semesterYear: json['sj_name'] as String,
      semesterType: json['semester'] as String,
      semester: json['semester_name'] as String,
      semesterID: json['semester_id'] as String,
      organisationNumber: json['org_nr_betreut'] as String,
      organisation: json['org_name_betreut'] as String,
      organisationTag: json['org_kennung_betreut'] as String,
      speaker: json['vortragende_mitwirkende'] as String?,
    );

Map<String, dynamic> _$LectureToJson(Lecture instance) => <String, dynamic>{
      'stp_sp_nr': instance.id,
      'stp_lv_nr': instance.lvNumber,
      'stp_sp_titel': instance.title,
      'dauer_info': instance.duration,
      'stp_sp_sst': instance.stpSpSst,
      'stp_lv_art_name': instance.eventTypeDefault,
      'stp_lv_art_kurz': instance.eventTypeTag,
      'sj_name': instance.semesterYear,
      'semester': instance.semesterType,
      'semester_name': instance.semester,
      'semester_id': instance.semesterID,
      'org_nr_betreut': instance.organisationNumber,
      'org_name_betreut': instance.organisation,
      'org_kennung_betreut': instance.organisationTag,
      'vortragende_mitwirkende': instance.speaker,
    };

Lectures _$LecturesFromJson(Map<String, dynamic> json) => Lectures(
      lectures: (json['row'] as List<dynamic>?)
              ?.map((e) => Lecture.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$LecturesToJson(Lectures instance) => <String, dynamic>{
      'row': instance.lectures,
    };
