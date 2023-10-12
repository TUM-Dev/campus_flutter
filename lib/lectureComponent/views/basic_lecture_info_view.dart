import 'package:campus_flutter/lectureComponent/model/lecture_details.dart';
import 'package:campus_flutter/lectureComponent/views/basic_lecture_info_row_view.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_info_card_view.dart';
import 'package:campus_flutter/searchComponent/views/otherSearch/search_view.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicLectureInfoView extends ConsumerWidget {
  const BasicLectureInfoView({super.key, required this.lectureDetails});

  final LectureDetails lectureDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LectureInfoCardView(
      icon: Icons.folder,
      title: context.localizations.basicLectureInformation,
      widgets: [
        BasicLectureInfoRowView(
            information: "${lectureDetails.stp_sp_sst} SWS",
            iconData: Icons.hourglass_top),
        BasicLectureInfoRowView(
            information: lectureDetails.semester, iconData: Icons.school),
        BasicLectureInfoRowView(
            information: lectureDetails.organisation,
            iconData: Icons.import_contacts),
        // TODO: person finder
        if (lectureDetails.speaker != null)
          BasicLectureInfoRowView(
            information: lectureDetails.speaker!,
            iconData: Icons.person,
            trailingWidget: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchScaffold(
                              isRoomSearch: false,
                              searchString:
                                  lectureDetails.speaker?.split(",").first,
                            ))),
                icon: Icon(
                  Icons.search,
                  size: 20,
                  color: context.theme.primaryColor,
                )),
          ),
        if (lectureDetails.firstScheduledDate != null)
          BasicLectureInfoRowView(
              information: lectureDetails.firstScheduledDate!,
              iconData: Icons.watch_later)
      ],
    );
  }
}
