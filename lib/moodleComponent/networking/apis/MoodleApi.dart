import 'dart:convert';

import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/moodleComponent/model/moodle_course.dart';
import 'package:campus_flutter/moodleComponent/model/moodle_section.dart';
import 'package:campus_flutter/moodleComponent/model/moodle_user.dart';
import 'package:campus_flutter/moodleComponent/service/shibboleth_session_generator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class MoodleApi extends Api{

  ShibbolethSession session;


  MoodleApi(this.session);

  @override
  // TODO: implement domain
  String get domain => "moodle.tum.de/lib/ajax/service.php";

  @override
  bool get needsAuth => true;

  @override
  Map<String, String> get parameters => {
    "sesskey": session.sessionId,
  };

  @override
  String get path => "";

  @override
  String get slug => "XML_DM_REQUEST";

  Future<List<MoodleCourse>> getCourses(MoodleUser user) async {
    //new dio instance is needed to avoid cookie conflicts
    Dio dio = Dio();
    dio.options.headers.addAll({
      "Cookie": session.cookies.entries.map((e) => "${e.key}=${e.value}").toList().join("; "),
      "Content-Type": "application/json",
      "Accept": "application/json, text/javascript, *; q=0.01",
      "X-Requested-With": "XMLHttpRequest",
    });
    var data = await dio.post("https://www.moodle.tum.de/lib/ajax/service.php?sesskey=${session.sessionId.toString()}&info=core_course_get_recent_courses", data:
    jsonEncode([
      {
        "index": 0,
        "methodname": "core_course_get_recent_courses",
        "args": {"limit": 10, "userid": user.id}
      }
    ]));
    var coursesList = (data.data as List).first.entries.last.value as List<dynamic>;
    return coursesList.map((e) => MoodleCourse.fromJson(e)).toList();
        }

        //userName is the username of tum online access
Future<MoodleUser> getMoodleUser(String userName) async{
  Dio dio = Dio();
  dio.options.headers.addAll({
    "Cookie": session.cookies.entries.map((e) => "${e.key}=${e.value}").toList().join("; "),
    "Content-Type": "application/json",
    "Accept": "application/json, text/javascript, *; q=0.01",
    "X-Requested-With": "XMLHttpRequest",
  });
  var data = await dio.post("https://www.moodle.tum.de/lib/ajax/service.php?sesskey=${session.sessionId.toString()}&info=core_course_get_recent_courses", data:
  jsonEncode([
    {
      "index": 0,
      "methodname": "core_user_get_users_by_field",
      "args": {"field": "username", "values": [
        userName
      ]}
    }
  ]));
  var userMap = (data.data as List).first as Map<String, dynamic>;
  return MoodleUser.fromJson(userMap);
}

Future<MoodleCourseState> getCourseStateForCourse(MoodleCourse course) async {
  Dio dio = Dio();
  dio.options.headers.addAll({
    "Cookie": session.cookies.entries
        .map((e) => "${e.key}=${e.value}")
        .toList()
        .join("; "),
    "Content-Type": "application/json",
    "Accept": "application/json, text/javascript, *; q=0.01",
    "X-Requested-With": "XMLHttpRequest",
  });
  var data = await dio.post(
      "https://www.moodle.tum.de/lib/ajax/service.php?sesskey=${session
          .sessionId.toString()}&info=core_courseformat_get_state", data:
  jsonEncode([
    {
      "index": 0,
      "methodname": "core_courseformat_get_state",
      "args": {"courseid": course.id}
    }
  ]));
  var courseStateMap = (data.data as List).first as Map<String, dynamic>;
  var jsonData = courseStateMap["data"];
  
  return MoodleCourseState.fromJson(jsonDecode(jsonData));
}

Future<String> loadHtmlDataForMoodleModule(String cmId) async{
  Dio dio = Dio();
  dio.options.headers.addAll({
    "Cookie": session.cookies.entries
        .map((e) => "${e.key}=${e.value}")
        .toList()
        .join("; "),
    "Content-Type": "application/json",
    "Accept": "application/json, text/javascript, *; q=0.01",
    "X-Requested-With": "XMLHttpRequest",
  });
  var data = await dio.post(
      "https://www.moodle.tum.de/lib/ajax/service.php?sesskey=${session
          .sessionId.toString()}&info=core_course_get_module", data:
  jsonEncode([
    {
      "index": 0,
      "methodname": "core_course_get_module",
      "args": {"id": cmId}
    }
  ]));
  var courseStateMap = (data.data as List).first as Map<String, dynamic>;
  var jsonData = courseStateMap["data"];
  
  return jsonData;
}

}