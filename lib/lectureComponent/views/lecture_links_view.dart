import 'package:campus_flutter/base/util/hyperlink_text.dart';
import 'package:campus_flutter/lectureComponent/model/lecture_details.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_info_card_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
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
          HyperLinkListTile(
            dense: true,
            link: lectureDetails.curriculumURL,
            label: context.localizations.lectureCurriculum,
          ),
        if (lectureDetails.scheduledDatesURL != null)
          HyperLinkListTile(
            dense: true,
            link: lectureDetails.scheduledDatesURL,
            label: context.localizations.scheduledLectureDates,
          ),
        if (lectureDetails.examDateURL != null)
          HyperLinkListTile(
            dense: true,
            link: lectureDetails.examDateURL,
            label: context.localizations.lectureExamDate,
          ),
      ],
    );
  }
}
