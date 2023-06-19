import 'package:campus_flutter/base/helpers/stringParser.dart';
import 'package:campus_flutter/lectureComponent/services/lectureService.dart';
import 'package:rxdart/rxdart.dart';
import '../model/lecture.dart';

class LectureViewModel {
  BehaviorSubject<Map<String, List<Lecture>>?> lectures =
      BehaviorSubject.seeded(null);

  lecturesBySemester() async {
    List<Lecture> lectures = await LectureService.fetchLecture();

    if (lectures.isEmpty) {
      this.lectures.add({});
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

    this.lectures.add(sortedLecturesBySemester.map(
        (key, value) => MapEntry(StringParser.toFullSemesterName(key), value)));
  }
}
