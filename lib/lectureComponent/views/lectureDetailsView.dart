import 'package:campus_flutter/base/helpers/cardWithPadding.dart';
import 'package:campus_flutter/base/helpers/iconText.dart';
import 'package:campus_flutter/lectureComponent/model/lectureDetails.dart';
import 'package:campus_flutter/lectureComponent/views/basicLectureInfoRowView.dart';
import 'package:campus_flutter/lectureComponent/views/basicLectureInfoView.dart';
import 'package:campus_flutter/lectureComponent/views/detailedLectureInfoView.dart';
import 'package:campus_flutter/lectureComponent/views/lectureLinksView.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LectureDetailsView extends ConsumerStatefulWidget {
  const LectureDetailsView({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LectureDetailsViewState();
}

class _LectureDetailsViewState extends ConsumerState<LectureDetailsView> {
  @override
  void initState() {
    ref.read(lectureDetailsViewModel).fetchLectureDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.watch(lectureDetailsViewModel).lectureDetails,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return lectureDetailsView(snapshot.data!);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget lectureDetailsView(LectureDetails lectureDetails) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lectureDetails.title,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall,
                      textAlign: TextAlign.start),
                  Text(lectureDetails.eventType, textAlign: TextAlign.start),
                ])),
          const Padding(padding: EdgeInsets.symmetric(vertical: 3.0)),
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
        _infoCard(Icons.calendar_month, "This Meeting",
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BasicLectureInfoRow(
                  information: ref.read(lectureDetailsViewModel).event!.timeDatePeriod,
                  iconData: Icons.hourglass_top),
              const Divider(),
              // TODO: roomfinder
              BasicLectureInfoRow(
                  information: ref.read(lectureDetailsViewModel).event!.location,
                  iconData: Icons.location_on)
            ],
          )
        )
      ],
      _infoCard(Icons.info_outline_rounded, "Basic Lecture Information",
          BasicLectureInfo(lectureDetails: lectureDetails)),
      _infoCard(Icons.folder, "Detailed Lecture Information",
          DetailedLectureInfo(lectureDetails: lectureDetails)),
      _infoCard(Icons.link, "Lecture Links",
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
