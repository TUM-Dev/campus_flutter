import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/helpers/last_updated_text.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/lectureComponent/model/lecture_details.dart';
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
  const LectureDetailsView({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LectureDetailsViewState();
}

class _LectureDetailsViewState extends ConsumerState<LectureDetailsView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.watch(lectureDetailsViewModel).lectureDetails,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return lectureDetailsView(snapshot.data!);
        } else if (snapshot.hasError) {
          return ErrorHandlingView(
              error: snapshot.error!,
              errorHandlingViewType: ErrorHandlingViewType.fullScreen,
              retry: ref.read(lectureDetailsViewModel).fetch);
        } else {
          return DelayedLoadingIndicator(
              name: context.localizations.lectureDetails);
        }
      },
    );
    /*
    return GenericStreamBuilder<LectureDetails>(
        stream: ref.watch(lectureDetailsViewModel).lectureDetails,
        dataBuilder: (context, data) => lectureDetailsView(data),
        errorBuilder: (context, error) => ErrorHandlingView(
            error: error,
            errorHandlingViewType: ErrorHandlingViewType.fullScreen,
            retry: ref.read(lectureDetailsViewModel).fetch
        ),
        loadingBuilder: (context) => const DelayedLoadingIndicator(
            name: "Lecture Details"
        )
    );
    */
  }

  Widget lectureDetailsView(LectureDetails lectureDetails) {
    final lastFetched = ref.read(lectureDetailsViewModel).lastFetched.value;
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
      if (ref.read(lectureDetailsViewModel).event != null) ...[
        _infoCard(
            Icons.calendar_month,
            context.localizations.thisMeeting,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BasicLectureInfoRowView(
                    information:
                        ref.read(lectureDetailsViewModel).event!.timeDatePeriod,
                    iconData: Icons.hourglass_top),
                const Divider(),
                // TODO: roomfinder
                BasicLectureInfoRowView(
                    information:
                        ref.read(lectureDetailsViewModel).event!.location,
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
