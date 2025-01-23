import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/speaker.dart';
import 'package:campus_flutter/studiesComponent/model/lecture.dart';
import 'package:campus_flutter/studiesComponent/model/lecture_details.dart';
import 'package:campus_flutter/studiesComponent/view/lecture/lectureDetail/basic_lecture_info_row_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/studiesComponent/view/lecture/lectureDetail/lecture_info_card_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BasicLectureInfoView extends ConsumerWidget {
  const BasicLectureInfoView({
    super.key,
    required this.lectureDetails,
    this.lecture,
  });

  final LectureDetails lectureDetails;
  final Lecture? lecture;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LectureInfoCardView(
      icon: Icons.folder,
      title: context.tr("basicLectureInformation"),
      widgets: [
        BasicLectureInfoRowView(
          information: "${lectureDetails.stpSpSst} SWS",
          iconData: Icons.hourglass_top,
        ),
        BasicLectureInfoRowView(
          information: lecture?.semester ?? lectureDetails.semester,
          iconData: Icons.school,
        ),
        BasicLectureInfoRowView(
          information: lectureDetails.organisation,
          iconData: Icons.import_contacts,
        ),
        if (lecture?.speaker != null)
          BasicLectureInfoRowView(
            information: Speaker.getSpeakerName(lecture!.speaker!),
            iconData: Icons.person,
            trailingWidget: IconButton(
              onPressed: () => context.push(
                personSearch,
                extra: Speaker.getSpeakerName(lecture!.speaker!),
              ),
              icon: Icon(
                Icons.search,
                size: 20,
                color: context.theme.primaryColor,
              ),
            ),
          ),
        if (lecture?.speaker == null && lectureDetails.speaker != null)
          BasicLectureInfoRowView(
            information: Speaker.getSpeakerName(lectureDetails.speaker!),
            iconData: Icons.person,
            trailingWidget: IconButton(
              onPressed: () => context.push(
                personSearch,
                extra: Speaker.getSpeakerName(lectureDetails.speaker!),
              ),
              icon: Icon(
                Icons.search,
                size: 20,
                color: context.theme.primaryColor,
              ),
            ),
          ),
        if (lectureDetails.firstScheduledDate != null)
          BasicLectureInfoRowView(
            information: lectureDetails.firstScheduledDate!,
            iconData: Icons.watch_later,
          ),
      ],
    );
  }
}
