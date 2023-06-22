import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/gradeComponent/model/grade.dart';
import 'package:campus_flutter/base/helpers/stringToDouble.dart';
import 'package:campus_flutter/gradeComponent/services/grade_service.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class GradeViewModel implements ViewModel {

  final BehaviorSubject<
          ({DateTime? saved, Map<String, Map<String, List<Grade>>> data})?>
      grades = BehaviorSubject.seeded(null);

  @override
  Future fetch(bool forcedRefresh) async {
    GradeService.fetchGrades(forcedRefresh).then((response) {
      _gradesByDegreeAndSemester(response);
    }, onError: (error) => grades.addError(error));
  }

  _gradesByDegreeAndSemester(({DateTime? saved, List<Grade> data}) response) async {
      if (response.data.isEmpty) {
        grades.add((saved: response.saved, data: {}));
      }

      Map<String, List<Grade>> gradesByDegree = {};
      for (var grade in response.data) {
        gradesByDegree.putIfAbsent(grade.studyID, () => []).add(grade);
      }

      Map<String, Map<String, List<Grade>>> gradesByDegreeAndSemester = {};
      for (var entry in gradesByDegree.entries) {
        for (var grade in entry.value) {
          gradesByDegreeAndSemester
              .putIfAbsent(entry.key, () => {})
              .putIfAbsent(grade.semester, () => [])
              .add(grade);
        }
      }

      grades.add((saved: response.saved, data: gradesByDegreeAndSemester));
  }

  Map<double, int> chartDataForDegree(String studyID) {
    final degreeGrades = grades.value?.data[studyID];
    if (degreeGrades == null) {
      return {};
    }

    Map<double, int> chartData = {};
    for (var semester in degreeGrades.values) {
      for (var grade in semester) {
        chartData.update(
          stringToDouble(grade.grade),
              (value) => ++value,
          ifAbsent: () => 1,
        );
      }
    }

    return Map.fromEntries(
        chartData.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
  }

  static Color getColor(double? grade) {
    if (grade != null) {
      if (grade >= 1.0 && grade < 1.4) {
        return const Color.fromRGBO(87, 159, 43, 1.0);
      } else if (grade >= 1.4 && grade < 1.8) {
        return const Color.fromRGBO(119, 195, 68, 1.0);
      } else if (grade >= 1.8 && grade < 2.1) {
        return const Color.fromRGBO(149, 210, 107, 1.0);
      } else if (grade >= 2.1 && grade < 2.4) {
        return const Color.fromRGBO(255, 247, 125, 1.0);
      } else if (grade >= 2.4 && grade < 2.8) {
        return const Color.fromRGBO(255, 238, 117, 1.0);
      } else if (grade >= 2.8 && grade < 3.0) {
        return const Color.fromRGBO(255, 223, 0, 1.0);
      } else if (grade >= 3.0 && grade < 3.4) {
        return const Color.fromRGBO(247, 199, 88, 1.0);
      } else if (grade >= 3.4 && grade < 3.8) {
        return const Color.fromRGBO(245, 180, 51, 1.0);
      } else if (grade >= 3.8 && grade < 4.0) {
        return const Color.fromRGBO(243, 175, 34, 1.0);
      } else if (grade == 4.0) {
        return const Color.fromRGBO(248, 137, 0, 1.0);
      } else if (grade >= 4.1 && grade <= 5.0) {
        return const Color.fromRGBO(236, 60, 26, 1.0);
      } else {
        return const Color.fromRGBO(205, 205, 205, 1.0);
      }
    } else {
      return const Color.fromRGBO(205, 205, 205, 1.0);
    }
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
