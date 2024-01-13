import 'package:campus_flutter/base/extensions/base_64_decode_image_data.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:campus_flutter/studentCardComponent/model/student_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key, required this.studentCard});

  final StudentCard studentCard;

  @override
  Widget build(BuildContext context) {
    return CardWithPadding(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          _titleLogo(context),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _profileImage(),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _name(context),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                    _infoEntryRow(
                      context.localizations.birthday,
                      DateFormat("dd.MM.yyyy", "de")
                          .format(studentCard.birthday),
                    ),
                    _infoEntryRow(
                      context.localizations.studyId,
                      studentCard.studyID,
                    ),
                    _infoEntryRow(
                      "Semester",
                      StringParser.toShortSemesterName(
                        context,
                        studentCard.semester,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                    if (studentCard.studies != null)
                      ..._currentSubjects(context),
                  ],
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              _validUntil(context),
              const Spacer(),
              _validBadge(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _titleLogo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        _tumLogo(),
        const Spacer(),
        _title(context),
        const Spacer(flex: 2),
      ],
    );
  }

  Widget _tumLogo() {
    return Image.asset(
      'assets/images/logos/tum-logo-blue.png',
      fit: BoxFit.contain,
      height: 25,
    );
  }

  Widget _profileImage() {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        child: Image(
          image: Image.memory(base64DecodeImageData(studentCard.image)).image,
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      context.localizations.digitalStudentCard,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.apply(color: Theme.of(context).primaryColor),
    );
  }

  Widget _name(BuildContext context) {
    return Text(
      studentCard.name,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(color: Theme.of(context).primaryColor),
    );
  }

  Widget _infoEntryRow(String title, String information) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            "$title:",
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(flex: 3, child: Text(information)),
      ],
    );
  }

  List<Widget> _currentSubjects(BuildContext context) {
    final studies = studentCard.studies?.study;
    return [
      for (var studyProgram
          in studies?.sublist(0, studies.length >= 2 ? 2 : studies.length) ??
              [])
        Text(
          "${studyProgram.name} (${StringParser.degreeShort(studyProgram.degree, context)})",
        ),
    ];
  }

  Widget _validUntil(BuildContext context) {
    return Text(
      "${context.localizations.validUntil}: ${DateFormat("dd.MM.yyyy", "de").format(studentCard.validUntil)}",
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _validBadge(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 80,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Lottie.asset(
              "assets/lottieFiles/gradient_background_blue_white_speedup.json",
            ),
          ),
          const Center(
            child: Text(
              "VALID",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
