import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:campus_flutter/gradeComponent/viewModels/grade_viewmodel.dart';
import 'package:flutter/material.dart';

import '../model/grade.dart';

class GradeRowAlt extends StatelessWidget {
  const GradeRowAlt({super.key, required this.grade});

  final Grade grade;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: GradeRectangle(grade: grade.grade),
        title: Text(grade.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Expanded(
                  child: IconText(
                      iconData: Icons.edit,
                      label: grade.modusShort,
                      iconColor: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).colorScheme.secondary)),
              Expanded(
                  child: IconText(
                      iconData: Icons.numbers,
                      label: grade.lvNumber,
                      iconColor: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).colorScheme.secondary)),
            ]),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            IconText(
                iconData: Icons.person,
                label: grade.examiner,
                iconColor: Theme.of(context).primaryColor,
                textColor: Theme.of(context).colorScheme.secondary),
          ],
        ));
  }
}

class GradeRectangle extends StatelessWidget {
  const GradeRectangle({super.key, required this.grade});

  final String grade;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.0,
        child: Container(
            decoration: BoxDecoration(
                color: GradeViewModel.getColor(StringParser.stringToDouble(grade)),
                borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: Text(
                grade,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    shadows: [
                      const Shadow(color: Colors.black, blurRadius: 10.0)
                    ]),
              ),
            )));
  }
}
