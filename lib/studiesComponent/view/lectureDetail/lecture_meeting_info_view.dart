import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/studiesComponent/view/lectureDetail/lecture_info_card_view.dart';
import 'package:campus_flutter/studiesComponent/viewModel/lecture_details_viewmodel.dart';
import 'package:campus_flutter/studiesComponent/view/lectureDetail/basic_lecture_info_row_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LectureMeetingInfoView extends ConsumerWidget {
  const LectureMeetingInfoView({super.key, required this.viewModel});

  final Provider<LectureDetailsViewModel> viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LectureInfoCardView(
      icon: Icons.calendar_month,
      title: context.tr("thisMeeting"),
      widgets: [
        BasicLectureInfoRowView(
          information: ref.read(viewModel).event!.timePeriodText(context),
          iconData: Icons.hourglass_top,
        ),
        BasicLectureInfoRowView(
          information:
              ref.read(viewModel).event!.location ?? context.tr("unknown"),
          iconData: Icons.location_on,
          trailingWidget: IconButton(
            onPressed: () => context.push(
              roomSearch,
              extra: ref.read(viewModel).event!.location,
            ),
            icon: Icon(
              Icons.search,
              size: 20,
              color: context.theme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
