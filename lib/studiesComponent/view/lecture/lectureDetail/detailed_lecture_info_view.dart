import 'package:campus_flutter/studiesComponent/model/lecture_details.dart';
import 'package:campus_flutter/studiesComponent/view/lecture/lectureDetail/detailed_lecture_info_row_view.dart';
import 'package:campus_flutter/studiesComponent/view/lecture/lectureDetail/lecture_info_card_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DetailedLectureInfoView extends StatelessWidget {
  const DetailedLectureInfoView({
    super.key,
    required this.lectureDetails,
  });

  final LectureDetails lectureDetails;

  @override
  Widget build(BuildContext context) {
    return LectureInfoCardView(
      icon: Icons.info_outline_rounded,
      title: context.tr("detailedLectureInformation"),
      widgets: [
        if (lectureDetails.courseContents != null)
          DetailedLectureInfoRowView(
            title: context.tr("courseContents"),
            information: lectureDetails.courseContents!,
          ),
        if (lectureDetails.courseObjective != null)
          DetailedLectureInfoRowView(
            title: context.tr("courseObjective"),
            information: lectureDetails.courseObjective!,
          ),
        if (lectureDetails.note != null)
          DetailedLectureInfoRowView(
            title: context.tr("note"),
            information: lectureDetails.note!,
          ),
      ],
    );
  }
}
