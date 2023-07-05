import 'package:campus_flutter/lectureComponent/model/lecture_details.dart';
import 'package:campus_flutter/lectureComponent/views/basic_lecture_info_row_view.dart';
import 'package:flutter/material.dart';

class BasicLectureInfoView extends StatelessWidget {
  const BasicLectureInfoView({super.key, required this.lectureDetails});

  final LectureDetails lectureDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BasicLectureInfoRowView(
            information: "${lectureDetails.stp_sp_sst} SWS",
            iconData: Icons.hourglass_top),
        const Divider(),
        BasicLectureInfoRowView(
            information: lectureDetails.semester, iconData: Icons.school),
        const Divider(),
        BasicLectureInfoRowView(
            information: lectureDetails.organisation,
            iconData: Icons.import_contacts),
        // TODO: person finder
        if (lectureDetails.speaker != null) ...[
          const Divider(),
          BasicLectureInfoRowView(
            information: lectureDetails.speaker!, iconData: Icons.person),
        ],
        if (lectureDetails.firstScheduledDate != null) ...[
          const Divider(),
          BasicLectureInfoRowView(information: lectureDetails.firstScheduledDate!, iconData: Icons.watch_later)
        ],
      ],
    );
  }
}