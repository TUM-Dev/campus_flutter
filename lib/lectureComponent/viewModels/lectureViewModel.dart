import 'package:campus_flutter/base/Networking/Protocols/API.dart';
import 'package:campus_flutter/gradeComponent/model/grade.dart';
import 'package:campus_flutter/lectureComponent/services/lectureService.dart';
import 'package:flutter/material.dart';
import '../model/lecture.dart';

class LectureViewModel extends ChangeNotifier {
  APIState<List<Grade>> state = const APIState.na();
  bool hasError = false;
  final List<Lecture> _lectures = [];

  Future<Map<String, List<Lecture>>> lecturesBySemester() async {
    List<Lecture> lectures = await LectureService.fetchLecture();

    if (lectures.isEmpty) {
      return {};
    }

    Map<String, List<Lecture>> lecturesBySemester = {};
    for (var element in lectures) {
      if (lecturesBySemester[element.semesterID] == null) {
        lecturesBySemester[element.semesterID] = [element];
      } else {
        lecturesBySemester[element.semesterID]?.add(element);
      }
    }

    final sortedLecturesBySemester = Map.fromEntries(
        lecturesBySemester.entries.toList()
          ..sort((e1, e2) => e2.key.compareTo(e1.key)));

    return sortedLecturesBySemester.map((key, value) =>
        MapEntry(LectureViewModel.toFullSemesterName(key), value));
  }

  static String toFullSemesterName(String semester) {
    final year = "20${semester.substring(0, 2)}";
    final nextYearShort = (int.parse(year) + 1).toString().substring(2, 4);


    switch (semester.substring(2)) {
      case "W":
        return "Wintersemester" " $year/$nextYearShort";
      case "S":
        return "Summersemester" " $year";
      default:
        return "Unknown";
    }
  }
}
