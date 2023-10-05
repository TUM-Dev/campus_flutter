import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/helpers/last_updated_text.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/model/lecture_details.dart';
import 'package:campus_flutter/lectureComponent/viewModels/lecture_details_viewmodel.dart';
import 'package:campus_flutter/lectureComponent/views/basic_lecture_info_row_view.dart';
import 'package:campus_flutter/lectureComponent/views/basic_lecture_info_view.dart';
import 'package:campus_flutter/lectureComponent/views/detailed_lecture_info_view.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_links_view.dart';
import 'package:campus_flutter/theme.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: stateless?
class LectureDetailsView extends ConsumerStatefulWidget {
  const LectureDetailsView(
      {super.key, this.scrollController, this.event, this.lecture});

  final CalendarEvent? event;
  final Lecture? lecture;
  final ScrollController? scrollController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LectureDetailsViewState();
}

class _LectureDetailsViewState extends ConsumerState<LectureDetailsView> {
  late Provider<LectureDetailsViewModel> viewModel;

  @override
  void initState() {
    viewModel = lectureDetailsViewModel((widget.event, widget.lecture));
    ref.read(viewModel).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.watch(viewModel).lectureDetails,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return lectureDetailsView(snapshot.data!);
        } else if (snapshot.hasError) {
          return ErrorHandlingView(
              error: snapshot.error!,
              errorHandlingViewType: ErrorHandlingViewType.fullScreen,
              retry: ref.read(viewModel).fetch);
        } else {
          return DelayedLoadingIndicator(
              name: context.localizations.lectureDetails);
        }
      },
    );
  }

  Widget lectureDetailsView(LectureDetails lectureDetails) {
    final lastFetched = ref.read(viewModel).lastFetched.value;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(lectureDetails.title,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.start),
            Text(lectureDetails.eventType(context), textAlign: TextAlign.start),
          ])),
      const Padding(padding: EdgeInsets.symmetric(vertical: 3.0)),
      if (lastFetched != null) LastUpdatedText(lastFetched),
      Expanded(
          child: Scrollbar(
              controller: widget.scrollController,
              child: SingleChildScrollView(
                  controller: widget.scrollController,
                  child: SafeArea(
                      child: Column(
                    children: _infoCards(lectureDetails),
                  )))))
    ]);
  }

  List<Widget> _infoCards(LectureDetails lectureDetails) {
    return [
      if (ref.read(viewModel).event != null) ...[
        _infoCard(
            Icons.calendar_month,
            context.localizations.thisMeeting,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BasicLectureInfoRowView(
                    information:
                        ref.read(viewModel).event!.timeDatePeriod(context),
                    iconData: Icons.hourglass_top),
                const Divider(),
                // TODO: NavigaTUM Integration
                BasicLectureInfoRowView(
                    information: ref.read(viewModel).event!.location,
                    iconData: Icons.location_on)
              ],
            ))
      ],
      _infoCard(
          Icons.info_outline_rounded,
          context.localizations.basicLectureInformation,
          BasicLectureInfoView(lectureDetails: lectureDetails)),
      _infoCard(Icons.folder, context.localizations.detailedLectureInformation,
          DetailedLectureInfoView(lectureDetails: lectureDetails)),
      _infoCard(Icons.link, context.localizations.lectureLinks,
          LectureLinksView(lectureDetails: lectureDetails))
    ];
  }

  Widget _infoCard(IconData icon, String title, Widget child) {
    return CardWithPadding(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        IconText(
            iconData: icon,
            label: title,
            style: Theme.of(context).textTheme.titleMedium),
        const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
        child
      ],
    ));
  }
}
