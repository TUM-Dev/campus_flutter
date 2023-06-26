import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/lectureComponent/services/lectureService.dart';
import 'package:rxdart/rxdart.dart';
import '../model/lecture.dart';

class LectureViewModel implements ViewModel {
  BehaviorSubject<Map<String, List<Lecture>>?> lectures =
      BehaviorSubject.seeded(null);

  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  @override
  Future fetch(bool forcedRefresh) async {
    LectureService.fetchLecture(forcedRefresh).then((response) {
      _lecturesBySemester(response);
    }, onError: (error) => lectures.addError(error));
  }

  _lecturesBySemester((DateTime?, List<Lecture>) response) async {
    lastFetched.add(response.$1);

    if (response.$2.isEmpty) {
      lectures.add({});
    }

    Map<String, List<Lecture>> lecturesBySemester = {};
    for (var element in response.$2) {
      if (lecturesBySemester[element.semesterID] == null) {
        lecturesBySemester[element.semesterID] = [element];
      } else {
        lecturesBySemester[element.semesterID]?.add(element);
      }
    }

    final sortedLecturesBySemester = Map.fromEntries(
        lecturesBySemester.entries.toList()
          ..sort((e1, e2) => e2.key.compareTo(e1.key)));

    lectures.add(sortedLecturesBySemester);
  }
}
