import 'package:campus_flutter/base/networking/protocols/api.dart';

/// Public course details endpoint of the TUMonline course catalogue (CAMPUSonline REST).
///
/// Used as a fallback when `wbservicesbasic.veranstaltungenDetails` is unavailable.
/// Requires no token.
class TumOnlineCourseApi extends Api {
  TumOnlineCourseApi(this.courseId) {
    if (!RegExp(r'^[0-9]+$').hasMatch(courseId)) {
      throw const FormatException('Invalid TUMonline course ID');
    }
  }

  final String courseId;

  @override
  String get domain => 'campus.tum.de';

  @override
  String get path => 'tumonline/ee/rest/slc.tm.cp/student/courses/';

  @override
  String get slug => courseId;

  @override
  Map<String, String> get parameters => {};

  @override
  Map<String, String> get baseHeaders => {'Accept': 'application/json'};

  @override
  bool get needsAuth => false;
}
