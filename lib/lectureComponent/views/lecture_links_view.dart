import 'package:campus_flutter/base/helpers/hyperlink_text.dart';
import 'package:campus_flutter/lectureComponent/model/lecture_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LectureLinksView extends StatelessWidget {
  const LectureLinksView({super.key, required this.lectureDetails});

  final LectureDetails lectureDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (lectureDetails.curriculumURL != null) ...[
          HyperLinkText(link: lectureDetails.curriculumURL ?? "", label: AppLocalizations.of(context)!.lectureCurriculum)
        ],
        if (lectureDetails.scheduledDatesURL != null) ...[
          const Divider(),
          HyperLinkText(link: lectureDetails.scheduledDatesURL ?? "", label: AppLocalizations.of(context)!.scheduledLectureDates)
        ],
        if (lectureDetails.examDateURL != null) ...[
          const Divider(),
          HyperLinkText(link: lectureDetails.examDateURL ?? "", label: AppLocalizations.of(context)!.lectureExamDate)
        ],
      ],
    );
  }
}