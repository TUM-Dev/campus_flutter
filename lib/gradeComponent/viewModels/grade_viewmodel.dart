import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/gradeComponent/model/grade.dart';
import 'package:campus_flutter/gradeComponent/services/grade_service.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class GradeViewModel implements ViewModel {
  final BehaviorSubject<Map<String, List<Grade>>?> studyProgramGrades =
      BehaviorSubject.seeded(null);

  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  Map<String, Map<String, List<Grade>>>? allGrades;

  setSelectedDegree(String studyID) {
    studyProgramGrades.add(allGrades?[studyID] ?? {});
  }

  @override
  Future fetch(bool forcedRefresh) async {
    GradeService.fetchGrades(forcedRefresh).then((response) {
      lastFetched.add(response.saved);
      _gradesByDegreeAndSemester(response.data);
    }, onError: (error) => studyProgramGrades.addError(error));
  }

  _gradesByDegreeAndSemester(List<Grade> response) async {
    if (response.isEmpty) {
      studyProgramGrades.add({});
    }

    Map<String, List<Grade>> gradesByDegree = {};
    for (var grade in response) {
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

    final firstDegree = gradesByDegreeAndSemester.values.firstOrNull ?? {};
    studyProgramGrades.add(firstDegree);
    allGrades = gradesByDegreeAndSemester;
  }

  List<PopupMenuEntry<String>> getMenuEntries() {
    if (allGrades?.values != null) {
      return allGrades!.values
          .map((e) => PopupMenuItem(
              value: e.values.first.first.studyID,
              child: studyProgramGrades.value?.values.first.first.studyID ==
                      e.values.first.first.studyID
                  ? IconText(
                      iconData: Icons.check,
                      label: e.values.first.first.studyDesignation,
                      leadingIcon: false)
                  : Text(e.values.first.first.studyDesignation)))
          .toList();
    } else {
      return [];
    }
  }

  Map<double, int> chartDataForDegree(String studyID) {
    final degreeGrades = studyProgramGrades.value;
    if (degreeGrades == null) {
      return {};
    }

    Map<double, int> chartData = {};
    for (var semester in degreeGrades.values) {
      for (var grade in semester) {
        chartData.update(
          StringParser.stringToDouble(grade.grade),
          (value) => ++value,
          ifAbsent: () => 1,
        );
      }
    }

    return Map.fromEntries(chartData.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
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
}
