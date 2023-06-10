import 'package:campus_flutter/lectureComponent/model/lectureDetails.dart';
import 'package:campus_flutter/lectureComponent/views/detailedLectureInfoRowView.dart';
import 'package:flutter/material.dart';

class DetailedLectureInfo extends StatelessWidget {
  const DetailedLectureInfo({super.key, required this.lectureDetails});

  final LectureDetails lectureDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (lectureDetails.courseContents != null) ...[
          DetailedLectureInfoRow(title: "Course Contents",
              information: lectureDetails.courseContents!)
        ],
        if (lectureDetails.courseObjective != null) ...[
          const Divider(),
          DetailedLectureInfoRow(title: "Course Objective",
              information: lectureDetails.courseObjective!)
        ],
        if (lectureDetails.note != null) ...[
          const Divider(),
          DetailedLectureInfoRow(title: "Note",
              information: lectureDetails.note!)
        ],
      ],
    );
  }
}