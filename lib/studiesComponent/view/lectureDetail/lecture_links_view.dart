import 'package:campus_flutter/base/util/hyperlink_text.dart';
import 'package:campus_flutter/studiesComponent/model/lecture_details.dart';
import 'package:campus_flutter/studiesComponent/view/lectureDetail/lecture_info_card_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LectureLinksView extends StatelessWidget {
  const LectureLinksView({super.key, required this.lectureDetails});

  final LectureDetails lectureDetails;

  @override
  Widget build(BuildContext context) {
    return LectureInfoCardView(
      icon: Icons.link,
      title: context.tr("lectureLinks"),
      widgets: [
        if (lectureDetails.curriculumURL != null)
          HyperLinkListTile(
            dense: true,
            link: lectureDetails.curriculumURL,
            label: context.tr("lectureCurriculum"),
          ),
        if (lectureDetails.scheduledDatesURL != null)
          HyperLinkListTile(
            dense: true,
            link: lectureDetails.scheduledDatesURL,
            label: context.tr("scheduledLectureDates"),
          ),
        if (lectureDetails.examDateURL != null)
          HyperLinkListTile(
            dense: true,
            link: lectureDetails.examDateURL,
            label: context.tr("lectureExamDate"),
          ),
      ],
    );
  }
}
