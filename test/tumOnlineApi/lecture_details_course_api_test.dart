import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/studiesComponent/model/lecture_details.dart';
import 'package:campus_flutter/studiesComponent/service/lecture_details_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/xml_decoder.dart';

/// Wraps a `cpCourseDetailDto` in the CAMPUSonline REST resource envelope.
Map<String, dynamic> courseResponse(Map<String, dynamic> detail) => {
  'resource': [
    {
      'content': {'cpCourseDetailDto': detail},
    },
  ],
};

Map<String, dynamic> langData(String? value) => {
  'coType': 'model-core.lib.model.langdata',
  'value': ?value,
};

/// Trimmed from a real response of
/// `ee/rest/slc.tm.cp/student/courses/950940213` (WiSe 2026/27).
Map<String, dynamic> fullCourseDetail() => {
  'cpCourseDto': {
    'id': 950940213,
    'courseTitle': langData(
      'Grundlagen der waldbaulichen Einzelplanung/Jahresbetriebsplanung',
    ),
    'semesterDto': {
      'key': '26W',
      'semesterType': 'W',
      'semesterDesignation': langData('Wintersemester 2026/27'),
      'startOfAcademicSemester': {'coType': 'date', 'value': '2026-10-01'},
    },
    'organisationResponsibleDto': {
      'id': 50241,
      'name': langData('Lehrstuhl für Ökosystemdynamik und Waldmanagement'),
      'identificationName': 'TUWZG3B',
    },
    'courseTypeDto': {'key': 'VO', 'courseTypeName': langData('Vorlesung')},
    'courseNormConfigs': [
      {'key': 'SST', 'value': '1'},
    ],
    'lectureships': [
      {
        'teachingFunction': {'key': 'V'},
        'identityLibDto': {'firstName': 'Bernhard', 'lastName': 'Felbermeier'},
      },
      {
        'teachingFunction': {'key': 'L'},
        'identityLibDto': {'firstName': 'Thomas', 'lastName': 'Knoke'},
      },
    ],
    'examinationMethodName': langData(null),
  },
  'cpCourseDescriptionDto': {
    'courseContent': langData('Bestandesanalyse &amp; Planung<br/>Zeile 2'),
    'courseObjective': langData('Operative Planung'),
    'previousKnowledge': langData('   '),
    'additionalInformation': {
      'recommendedLiterature': langData('Lehrbuch Waldbau'),
    },
  },
};

void main() {
  group('LectureDetails.fromCourseJson', () {
    test('maps the core course fields', () {
      final details = LectureDetails.fromCourseJson(
        courseResponse(fullCourseDetail()),
      );

      expect(details.id, 950940213);
      expect(details.lvNumber, 950940213);
      expect(
        details.title,
        'Grundlagen der waldbaulichen Einzelplanung/Jahresbetriebsplanung',
      );
      expect(details.eventTypeDefault, 'Vorlesung');
      expect(details.eventTypeTag, 'VO');
      expect(details.semester, 'Wintersemester 2026/27');
      expect(details.semesterType, 'W');
      expect(details.semesterID, '26W');
      expect(details.semesterYear, '2026/2027');
      expect(details.organisationNumber, 50241);
      expect(details.organisationTag, 'TUWZG3B');
      expect(details.stpSpSst, '1');
      expect(details.studienbehelfe, 'Lehrbuch Waldbau');
    });

    test('lists the lead lecturer first', () {
      final details = LectureDetails.fromCourseJson(
        courseResponse(fullCourseDetail()),
      );

      expect(details.speaker, 'Thomas Knoke, Bernhard Felbermeier');
    });

    test('decodes HTML entities and line breaks', () {
      final details = LectureDetails.fromCourseJson(
        courseResponse(fullCourseDetail()),
      );

      expect(details.courseContents, 'Bestandesanalyse & Planung\nZeile 2');
    });

    test('treats blank and missing texts as null', () {
      final details = LectureDetails.fromCourseJson(
        courseResponse(fullCourseDetail()),
      );

      expect(details.requirements, isNull);
      expect(details.examinationMode, isNull);
      expect(details.teachingMethod, isNull);
    });

    test('tolerates a minimal course without optional sections', () {
      final details = LectureDetails.fromCourseJson(
        courseResponse({
          'cpCourseDto': {'id': 1, 'courseTitle': langData('Minimal')},
        }),
      );

      expect(details.title, 'Minimal');
      expect(details.speaker, isNull);
      expect(details.semesterYear, '');
      expect(details.organisationNumber, 0);
    });

    test('throws when the detail resource is missing', () {
      expect(
        () => LectureDetails.fromCourseJson({'resource': []}),
        throwsFormatException,
      );
    });
  });

  group('LectureDetailsService.shouldUseCourseApiFallback', () {
    TumOnlineApiException decode(String message) =>
        TumOnlineApiException.fromJson(
          tumXmlToJson('<error><message>$message</message></error>'),
        );

    test('falls back when TUMonline disables the lecture endpoint', () {
      final exception = decode(
        'Veranstaltungsabruf temporär nicht möglich! Bitte TUMonline nutzen! '
        'Techniker ist informiert!',
      );

      expect(LectureDetailsService.shouldUseCourseApiFallback(exception), true);
    });

    test('does not hide token errors behind the fallback', () {
      expect(
        LectureDetailsService.shouldUseCourseApiFallback(
          decode('Token ist ungültig!'),
        ),
        false,
      );
      expect(
        LectureDetailsService.shouldUseCourseApiFallback(
          decode('Token ist nicht bestätigt!'),
        ),
        false,
      );
    });

    test('does not hide permission errors behind the fallback', () {
      expect(
        LectureDetailsService.shouldUseCourseApiFallback(
          decode(
            'Keine Rechte für Funktion wbservicesbasic.veranstaltungenDetails',
          ),
        ),
        false,
      );
    });
  });
}
