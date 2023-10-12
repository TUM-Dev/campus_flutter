import 'package:campus_flutter/lectureComponent/model/lecture_details.dart';
import 'package:campus_flutter/lectureComponent/views/detailed_lecture_info_row_view.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_info_card_view.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';

class DetailedLectureInfoView extends StatelessWidget {
  const DetailedLectureInfoView({super.key, required this.lectureDetails});

  final LectureDetails lectureDetails;

  @override
  Widget build(BuildContext context) {
    return LectureInfoCardView(
      icon: Icons.info_outline_rounded,
      title: context.localizations.detailedLectureInformation,
      widgets: [
        if (lectureDetails.courseContents != null) ...[
          DetailedLectureInfoRowView(
              title: context.localizations.courseContents,
              information: lectureDetails.courseContents!)
        ],
        if (lectureDetails.courseObjective != null) ...[
          const Divider(),
          DetailedLectureInfoRowView(
              title: context.localizations.courseObjective,
              information: lectureDetails.courseObjective!)
        ],
        if (lectureDetails.note != null) ...[
          const Divider(),
          DetailedLectureInfoRowView(
              title: context.localizations.note,
              information: lectureDetails.note!)
        ],
      ],
    );
  }
}
