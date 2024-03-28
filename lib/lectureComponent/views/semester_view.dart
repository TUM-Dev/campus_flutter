import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:campus_flutter/base/util/semester_calculator.dart';
import 'package:campus_flutter/base/util/string_parser.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SemesterView extends ConsumerWidget {
  const SemesterView({super.key, required this.semester});

  final MapEntry<String, List<Lecture>> semester;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ExpansionTile(
        title: Text(StringParser.toFullSemesterName(context, semester.key)),
        initiallyExpanded:
            semester.key == SemesterCalculator.getCurrentSemester() ||
                semester.key == SemesterCalculator.getPriorSemester(),
        children: [
          for (var index = 0; index < semester.value.length; index++)
            Column(
              children: [
                LectureView(lecture: semester.value[index]),
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
