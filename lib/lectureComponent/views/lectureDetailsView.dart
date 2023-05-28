import 'package:campus_flutter/base/helpers/iconText.dart';
import 'package:campus_flutter/lectureComponent/model/lectureDetails.dart';
import 'package:campus_flutter/lectureComponent/viewModels/lectureDetailsViewModel.dart';
import 'package:campus_flutter/lectureComponent/views/basicLectureInfoRowView.dart';
import 'package:campus_flutter/lectureComponent/views/basicLectureInfoView.dart';
import 'package:campus_flutter/lectureComponent/views/detailedLectureInfoView.dart';
import 'package:campus_flutter/lectureComponent/views/lectureLinksView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LectureDetailsView extends StatefulWidget {
  const LectureDetailsView({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  State<StatefulWidget> createState() => _LectureDetailsViewState();
}

class _LectureDetailsViewState extends State<LectureDetailsView> {
  @override
  void initState() {
    Provider.of<LectureDetailsViewModel>(context, listen: false)
        .fetchLectureDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider
          .of<LectureDetailsViewModel>(context, listen: true)
          .lectureDetails,
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
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(lectureDetails.title,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall,
              textAlign: TextAlign.start),
          Text(lectureDetails.eventType, textAlign: TextAlign.start),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Expanded(
              child: Scrollbar(
                  controller: widget.scrollController,
                  child: SingleChildScrollView(
                      controller: widget.scrollController,
                      child: SafeArea(
                          child: Column(
                            children: _infoCards(lectureDetails),
                          )))))
        ]));
  }

  List<Widget> _infoCards(LectureDetails lectureDetails) {
    return [
      if (Provider.of<LectureDetailsViewModel>(context, listen: false).event != null) ...[
        _infoCard(Icons.calendar_month, "This Meeting",
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BasicLectureInfoRow(
                  information: Provider.of<LectureDetailsViewModel>(context, listen: false).event!.timeDatePeriod,
                  iconData: Icons.hourglass_top),
              const Divider(),
              // TODO: roomfinder
              BasicLectureInfoRow(
                  information: Provider.of<LectureDetailsViewModel>(context, listen: false).event!.location,
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
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
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
            )));
  }
}
