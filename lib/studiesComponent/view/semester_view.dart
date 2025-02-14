import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:campus_flutter/base/util/semester_calculator.dart';
import 'package:campus_flutter/base/util/string_parser.dart';
import 'package:campus_flutter/studiesComponent/model/grade.dart';
import 'package:campus_flutter/studiesComponent/model/lecture.dart';
import 'package:campus_flutter/studiesComponent/view/grade/grade_view.dart';
import 'package:campus_flutter/studiesComponent/view/lecture/lecture_view.dart';
import 'package:flutter/material.dart';

class SemesterView<T> extends StatelessWidget {
  const SemesterView({super.key, required this.semester});

  final MapEntry<String, List<T>> semester;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(StringParser.toFullSemesterName(context, semester.key)),
        initiallyExpanded:
            (semester.key == SemesterCalculator.getCurrentSemester() ||
                semester.key == SemesterCalculator.getPriorSemester()),
        children: [
          for (var index = 0; index < semester.value.length; index++)
            Column(
              children: [
                if (T == Grade) GradeRow(grade: semester.value[index] as Grade),
                if (T == Lecture)
                  LectureView(lecture: semester.value[index] as Lecture),
                (index != semester.value.length - 1
                    ? const PaddedDivider()
                    : const SizedBox.shrink()),
              ],
            ),
        ],
      ),
    );
  }
}
