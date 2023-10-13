import 'package:campus_flutter/base/helpers/hyperlink_text.dart';
import 'package:campus_flutter/lectureComponent/model/lecture_details.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_info_card_view.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';

class LectureLinksView extends StatelessWidget {
  const LectureLinksView({super.key, required this.lectureDetails});

  final LectureDetails lectureDetails;

  @override
  Widget build(BuildContext context) {
    return LectureInfoCardView(
      icon: Icons.link,
      title: context.localizations.lectureLinks,
      widgets: [
        if (lectureDetails.curriculumURL != null)
          _entry(lectureDetails.curriculumURL,
              context.localizations.lectureCurriculum),
        if (lectureDetails.scheduledDatesURL != null)
          _entry(lectureDetails.scheduledDatesURL,
              context.localizations.scheduledLectureDates),
        if (lectureDetails.examDateURL != null)
          _entry(lectureDetails.examDateURL,
              context.localizations.lectureExamDate),
      ],
    );
  }

  Widget _entry(String? url, String label) {
    return ListTile(
      dense: true,
      title: HyperLinkText(link: url ?? "", label: label),
    );
  }
}
