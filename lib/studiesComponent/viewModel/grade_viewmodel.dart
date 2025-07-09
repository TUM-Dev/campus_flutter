import 'package:campus_flutter/base/util/icon_text.dart';
import 'package:campus_flutter/base/util/string_parser.dart';
import 'package:campus_flutter/studiesComponent/model/average_grade.dart';
import 'package:campus_flutter/studiesComponent/model/grade.dart';
import 'package:campus_flutter/studiesComponent/service/grade_service.dart';
import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final gradeViewModel = Provider((ref) => GradeViewModel(ref));

class GradeViewModel {
  final BehaviorSubject<Map<String, List<Grade>>?> studyProgramGrades =
      BehaviorSubject.seeded(null);

  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  Map<String, Map<String, List<Grade>>>? _allGrades;
  List<AverageGrade> _averageGrades = [];
  final Ref ref;

  void setSelectedDegree(String studyID) {
    studyProgramGrades.add(_allGrades?[studyID] ?? {});
  }

  GradeViewModel(this.ref);

  Future fetch(bool forcedRefresh) async {
    GradeService.fetchAverageGrades(forcedRefresh).then((response) {
      _averageGrades = response.data;
      return _fetchGrades(forcedRefresh);
    }, onError: (error) => _fetchGrades(forcedRefresh));
  }

  Future _fetchGrades(bool forcedRefresh) async {
    return GradeService.fetchGrades(forcedRefresh).then((response) {
      lastFetched.add(response.saved);
      _gradesByDegreeAndSemester(response.data);
    }, onError: (error) => studyProgramGrades.addError(error));
  }

  AverageGrade? getAverageGrade() {
    if (studyProgramGrades.hasValue) {
      return _averageGrades.firstWhereOrNull(
        (element) =>
            element.id == studyProgramGrades.value?.values.first.first.studyID,
      );
    }
    return null;
  }

  Future<void> _gradesByDegreeAndSemester(List<Grade> response) async {
    if (response.isEmpty) {
      studyProgramGrades.add({});
    }

    response.removeWhere(
      (element) => element.lvNumber.toLowerCase().contains("mid"),
    );

    if (ref.read(hideFailedGrades)) {
      response.removeWhere((element) {
        final parsedGrade = StringParser.optStringToOptDouble(element.grade);
        if (parsedGrade != null) {
          return parsedGrade > 4.0;
        } else {
          return element.grade != "B";
        }
      });
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
    _allGrades = gradesByDegreeAndSemester;
  }

  List<PopupMenuEntry<String>> getMenuEntries(BuildContext context) {
    if (_allGrades?.values != null) {
      return _allGrades!.values.map((e) {
        final selectedStudyId =
            studyProgramGrades.value?.values.first.first.studyID;
        final studyId = e.values.first.first.studyID;
        final studyDesignation = e.values.first.first.studyDesignation;
        final degreeShort = e.values.first.first.degreeShort;
        return PopupMenuItem(
          value: studyId,
          child: selectedStudyId == studyId
              ? IconText(
                  iconData: Icons.check,
                  label: "$studyDesignation ($degreeShort)",
                  leadingIcon: false,
                )
              : Text("$studyDesignation ($degreeShort)"),
        );
      }).toList();
    } else {
      return [];
    }
  }

  Map<dynamic, int> chartDataForDegree(String studyID) {
    final degreeGrades = studyProgramGrades.value;
    if (degreeGrades == null) {
      return {};
    }

    Map<dynamic, int> chartData = {};
    for (var semester in degreeGrades.values) {
      for (var grade in semester) {
        chartData.update(
          grade.grade != null
              ? StringParser.optStringToOptDouble(grade.grade) ?? grade.grade
              : "n/a",
          (value) => ++value,
          ifAbsent: () => 1,
        );
      }
    }

    return Map.fromEntries(
      chartData.entries.toList()..sort((a, b) {
        if (a.key is double && b.key is double) {
          final aKey = a.key as double;
          final bKey = b.key as double;
          return aKey.compareTo(bKey);
        } else if (a.key == "n/a") {
          return 1;
        } else if (b.key == "n/a") {
          return -1;
        } else if (a.key is double) {
          return a.key > 4 ? 1 : -1;
        } else if (b.key is double) {
          return b.key > 4 ? -1 : 1;
        } else {
          final aKey = a.key as String;
          final bKey = b.key as String;
          return aKey.compareTo(bKey);
        }
      }),
    );
  }

  static Color getColor(dynamic grade) {
    if (grade is double) {
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
