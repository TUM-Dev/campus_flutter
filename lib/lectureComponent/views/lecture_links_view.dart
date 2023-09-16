import 'package:campus_flutter/base/helpers/hyperlink_text.dart';
import 'package:campus_flutter/lectureComponent/model/lecture_details.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';

class LectureLinksView extends StatelessWidget {
  const LectureLinksView({super.key, required this.lectureDetails});

  final LectureDetails lectureDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (lectureDetails.curriculumURL != null) ...[
          HyperLinkText(
              link: lectureDetails.curriculumURL ?? "",
              label: context.localizations.lectureCurriculum)
        ],
        if (lectureDetails.scheduledDatesURL != null) ...[
          const Divider(),
          HyperLinkText(
              link: lectureDetails.scheduledDatesURL ?? "",
              label: context.localizations.scheduledLectureDates)
        ],
        if (lectureDetails.examDateURL != null) ...[
          const Divider(),
          HyperLinkText(
              link: lectureDetails.examDateURL ?? "",
              label: context.localizations.lectureExamDate)
        ],
      ],
    );
  }
}
