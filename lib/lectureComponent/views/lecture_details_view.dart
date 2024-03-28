import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/util/last_updated_text.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/model/lecture_details.dart';
import 'package:campus_flutter/lectureComponent/viewModels/lecture_details_viewmodel.dart';
import 'package:campus_flutter/lectureComponent/views/basic_lecture_info_view.dart';
import 'package:campus_flutter/lectureComponent/views/detailed_lecture_info_view.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_links_view.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_meeting_info_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class LectureDetailsScaffold extends StatelessWidget {
  const LectureDetailsScaffold({
    super.key,
    this.scrollController,
    this.event,
    this.lecture,
  });

  final CalendarEvent? event;
  final Lecture? lecture;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const CustomBackButton()),
      body: LectureDetailsView(
        event: event,
        lecture: lecture,
        scrollController: scrollController,
      ),
    );
  }
}

class LectureDetailsView extends ConsumerStatefulWidget {
  const LectureDetailsView({
    super.key,
    this.scrollController,
    this.event,
    this.lecture,
  });

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
          return ErrorHandlingRouter(
            error: snapshot.error!,
            errorHandlingViewType: ErrorHandlingViewType.fullScreen,
            retry: ref.read(viewModel).fetch,
          );
        } else {
          return DelayedLoadingIndicator(
            name: context.localizations.lectureDetails,
          );
        }
      },
    );
  }

  Widget lectureDetailsView(LectureDetails lectureDetails) {
    final lastFetched = ref.read(viewModel).lastFetched.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lectureDetails.title,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.start,
              ),
              Text(
                lectureDetails.eventType(context),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 3.0)),
        if (lastFetched != null) LastUpdatedText(lastFetched),
        Expanded(child: body(lectureDetails)),
      ],
    );
  }

  Widget body(LectureDetails lectureDetails) {
    if (MediaQuery.orientationOf(context) == Orientation.landscape) {
      final infoCards = _infoCards(lectureDetails);
      return MasonryGridView.count(
        crossAxisCount: 2,
        itemCount: infoCards.length,
        itemBuilder: (context, index) => infoCards[index],
      );
    } else {
      return Scrollbar(
        controller: widget.scrollController,
        child: SingleChildScrollView(
          controller: widget.scrollController,
          child: SafeArea(
            child: Column(
              children: _infoCards(lectureDetails),
            ),
          ),
        ),
      );
    }
  }

  List<Widget> _infoCards(LectureDetails lectureDetails) {
    return [
      if (ref.read(viewModel).event != null)
        LectureMeetingInfoView(viewModel: viewModel),
      BasicLectureInfoView(
        lectureDetails: lectureDetails,
        lecture: widget.lecture,
      ),
      if (lectureDetails.courseContents != null ||
          lectureDetails.courseObjective != null ||
          lectureDetails.note != null)
        DetailedLectureInfoView(lectureDetails: lectureDetails),
      if (lectureDetails.curriculumURL != null ||
          lectureDetails.scheduledDatesURL != null ||
          lectureDetails.examDateURL != null)
        LectureLinksView(lectureDetails: lectureDetails),
    ];
  }
}
