import 'package:campus_flutter/base/extensions/base64+decodeImageData.dart';
import 'package:campus_flutter/base/helpers/cardWithPadding.dart';
import 'package:campus_flutter/base/helpers/stringParser.dart';
import 'package:campus_flutter/studentCardComponent/model/studentCard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key, required this.studentCard});

  final StudentCard studentCard;

  @override
  Widget build(BuildContext context) {
    return CardWithPadding(
        child: Column(children: [
      const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
      _tumLogo(),
      const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileImage(),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
          Expanded(
              flex: 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _title(context),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                    _name(context),
                    _infoEntryRow("Birthday",
                        DateFormat.yMd().format(studentCard.birthday)),
                    _infoEntryRow("Study ID", studentCard.studyID),
                    _infoEntryRow("Semester",
                        StringParser.toShortSemesterName(studentCard.semester)),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                    if (studentCard.studies != null) ..._currentSubjects(),
                  ]))
        ],
      ),
      const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Spacer(),
        _validUntil(context),
        const Spacer(),
        _validBadge(),
      ])
    ]));
  }

  Widget _tumLogo() {
    return Image.asset('assets/images/logos/tum-logo-blue.png',
        fit: BoxFit.contain, height: 25);
  }

  Widget _profileImage() {
    return Expanded(
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          child: Image(
              image: Image.memory(base64DecodeImageData(studentCard.image))
                  .image)),
    );
  }

  Widget _title(BuildContext context) {
    return Text("Digital StudentCard",
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.apply(color: Theme.of(context).primaryColor));
  }

  Widget _name(BuildContext context) {
    return Text(studentCard.name,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold));
  }

  Widget _infoEntryRow(String title, String information) {
    return Row(children: [
      Expanded(
          flex: 2,
          child: Text("$title:",
              style: const TextStyle(fontWeight: FontWeight.w500))),
      Expanded(flex: 3, child: Text(information))
    ]);
  }

  List<Widget> _currentSubjects() {
    return [
      for (var subject in studentCard.studies!.study)
        Text("${StringParser.degreeShort(subject.degree)} ${subject.name}")
    ];
  }

  Widget _validUntil(BuildContext context) {
    return Text(
        "Valid until: ${DateFormat.yMd().format(studentCard.validUntil)}",
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontWeight: FontWeight.bold));
  }

  Widget _validBadge() {
    return SizedBox(
        height: 40,
        width: 80,
        child: Stack(alignment: AlignmentDirectional.center, children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Lottie.asset(
                  "assets/lottieFiles/gradient_background_blue_white_speedup.json")),
          const Center(
              child: Text("VALID",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0)))
        ]));
  }
}
