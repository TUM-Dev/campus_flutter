import 'package:campus_flutter/lectureComponent/viewModels/lecture_details_viewmodel.dart';
import 'package:campus_flutter/lectureComponent/views/basic_lecture_info_row_view.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_info_card_view.dart';
import 'package:campus_flutter/searchComponent/views/otherSearch/search_view.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LectureMeetingInfoView extends ConsumerWidget {
  const LectureMeetingInfoView({super.key, required this.viewModel});

  final Provider<LectureDetailsViewModel> viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LectureInfoCardView(
      icon: Icons.calendar_month,
      title: context.localizations.thisMeeting,
      widgets: [
        BasicLectureInfoRowView(
            information: ref.read(viewModel).event!.timeDatePeriod(context),
            iconData: Icons.hourglass_top),
        BasicLectureInfoRowView(
          information: ref.read(viewModel).event!.location,
          iconData: Icons.location_on,
          trailingWidget: IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchScaffold(
                            searchString: ref.read(viewModel).event!.location,
                          ))),
              icon: Icon(
                Icons.search,
                size: 20,
                color: context.theme.primaryColor,
              )),
        )
      ],
    );
  }
}
