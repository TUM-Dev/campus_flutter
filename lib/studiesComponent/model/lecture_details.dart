import 'package:campus_flutter/base/util/string_parser.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:html/parser.dart' show parseFragment;
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

  /// Builds [LectureDetails] from the CAMPUSonline REST course resource
  /// (`ee/rest/slc.tm.cp/student/courses/<id>`), so the existing lecture
  /// detail UI can be reused when the legacy endpoint is unavailable.
  factory LectureDetails.fromCourseJson(Map<String, dynamic> json) {
    final resources = json['resource'] as List<dynamic>? ?? [];
    final details = resources
        .map((resource) => resource['content']?['cpCourseDetailDto'])
        .whereType<Map<String, dynamic>>()
        .firstOrNull;
    if (details == null) {
      throw const FormatException('Missing TUMonline course details');
    }
    final course = details['cpCourseDto'] as Map<String, dynamic>;
    final id = (course['id'] as num).toInt();
    final title = _courseText(course['courseTitle']);
    if (title == null) {
      throw const FormatException('Missing TUMonline course title');
    }
    final semester = course['semesterDto'] as Map<String, dynamic>? ?? {};
    final organisation =
        course['organisationResponsibleDto'] as Map<String, dynamic>? ?? {};
    final type = course['courseTypeDto'] as Map<String, dynamic>? ?? {};
    final description =
        details['cpCourseDescriptionDto'] as Map<String, dynamic>? ?? {};
    final additional =
        description['additionalInformation'] as Map<String, dynamic>? ?? {};
    final norms = course['courseNormConfigs'] as List<dynamic>? ?? [];
    final hours = norms
        .where((norm) => norm['key'] == 'SST')
        .map((norm) => norm['value']?.toString())
        .firstOrNull;
    final lecturers = course['lectureships'] as List<dynamic>? ?? [];
    // Keep the lead lecturer first, as the UI displays/searches the first name.
    final orderedLecturers = [
      ...lecturers.where((l) => l['teachingFunction']?['key'] == 'L'),
      ...lecturers.where((l) => l['teachingFunction']?['key'] != 'L'),
    ];
    final names = orderedLecturers
        .map((lecturer) {
          final person =
              lecturer['identityLibDto'] as Map<String, dynamic>? ?? {};
          return [
            person['firstName'],
            person['lastName'],
          ].whereType<String>().where((name) => name.isNotEmpty).join(' ');
        })
        .where((name) => name.isNotEmpty)
        .toSet();
    final start = DateTime.tryParse(
      semester['startOfAcademicSemester']?['value'] as String? ?? '',
    );
    final year = start == null
        ? ''
        : semester['semesterType'] == 'W'
        ? '${start.year}/${start.year + 1}'
        : '${start.year - 1}/${start.year}';

    return LectureDetails(
      id: id,
      lvNumber: id,
      title: title,
      duration: hours ?? '',
      stpSpSst: hours ?? '',
      eventTypeDefault: _courseText(type['courseTypeName']) ?? '',
      eventTypeTag: type['key'] as String? ?? '',
      semester: _courseText(semester['semesterDesignation']) ?? '',
      semesterType: semester['semesterType'] as String? ?? '',
      semesterID: semester['key'] as String? ?? '',
      semesterYear: year,
      organisationNumber: (organisation['id'] as num?)?.toInt() ?? 0,
      organisation: _courseText(organisation['name']) ?? '',
      organisationTag: organisation['identificationName'] as String? ?? '',
      speaker: names.isEmpty ? null : names.join(', '),
      courseContents: _courseText(description['courseContent']),
      requirements: _courseText(description['previousKnowledge']),
      courseObjective: _courseText(description['courseObjective']),
      teachingMethod: _courseText(description['teachingMethod']),
      signUpLV: _courseText(description['courseRegistrationInfo']),
      examinationMode:
          _courseText(description['assessmentScheme']) ??
          _courseText(course['examinationMethodName']),
      studienbehelfe: _courseText(additional['recommendedLiterature']),
      note: _courseText(additional['comments']),
    );
  }

  static String? _courseText(dynamic data) {
    final value = data is String ? data : data?['value'] as String?;
    if (value == null || value.trim().isEmpty) return null;
    // REST descriptions contain HTML entities and occasionally HTML line breaks.
    return parseFragment(
      value.replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false), '\n'),
    ).text?.trim();
  }

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
