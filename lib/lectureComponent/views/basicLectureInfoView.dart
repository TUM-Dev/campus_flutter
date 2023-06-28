import 'package:campus_flutter/lectureComponent/model/lectureDetails.dart';
import 'package:campus_flutter/lectureComponent/views/basicLectureInfoRowView.dart';
import 'package:flutter/material.dart';

class BasicLectureInfo extends StatelessWidget {
  const BasicLectureInfo({super.key, required this.lectureDetails});

  final LectureDetails lectureDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BasicLectureInfoRow(
            information: "${lectureDetails.stp_sp_sst} SWS",
            iconData: Icons.hourglass_top),
        const Divider(),
        BasicLectureInfoRow(
            information: lectureDetails.semester, iconData: Icons.school),
        const Divider(),
        BasicLectureInfoRow(
            information: lectureDetails.organisation,
            iconData: Icons.import_contacts),
        // TODO: person finder
        if (lectureDetails.speaker != null) ...[
          const Divider(),
          BasicLectureInfoRow(
            information: lectureDetails.speaker!, iconData: Icons.person),
        ],
        if (lectureDetails.firstScheduledDate != null) ...[
          const Divider(),
          BasicLectureInfoRow(information: lectureDetails.firstScheduledDate!, iconData: Icons.watch_later)
        ],
      ],
    );
  }
}