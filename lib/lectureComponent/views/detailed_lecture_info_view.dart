import 'package:campus_flutter/lectureComponent/model/lecture_details.dart';
import 'package:campus_flutter/lectureComponent/views/detailed_lecture_info_row_view.dart';
import 'package:flutter/material.dart';

class DetailedLectureInfoView extends StatelessWidget {
  const DetailedLectureInfoView({super.key, required this.lectureDetails});

  final LectureDetails lectureDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (lectureDetails.courseContents != null) ...[
          DetailedLectureInfoRowView(title: "Course Contents",
              information: lectureDetails.courseContents!)
        ],
        if (lectureDetails.courseObjective != null) ...[
          const Divider(),
          DetailedLectureInfoRowView(title: "Course Objective",
              information: lectureDetails.courseObjective!)
        ],
        if (lectureDetails.note != null) ...[
          const Divider(),
          DetailedLectureInfoRowView(title: "Note",
              information: lectureDetails.note!)
        ],
      ],
    );
  }
}