import 'dart:core';

import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:campus_flutter/gradeComponent/model/grade.dart';
import 'package:campus_flutter/gradeComponent/viewModels/grade_viewmodel.dart';
import 'package:flutter/material.dart';

class GradeRow extends StatelessWidget {
  const GradeRow({super.key, required this.grade});

  final Grade grade;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: GradeRectangle(grade: grade.grade),
        title: Text(
          grade.title,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Expanded(
                  child: IconText(
                      iconData: Icons.edit,
                      label: grade.modusShort(context),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                      iconColor: Theme.of(context).primaryColor)),
              Expanded(
                  child: IconText(
                      iconData: Icons.numbers,
                      label: grade.lvNumber,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                      iconColor: Theme.of(context).primaryColor)),
            ]),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            IconText(
                iconData: Icons.person,
                label: grade.examiner,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                iconColor: Theme.of(context).primaryColor),
          ],
        ));
  }
}

class GradeRectangle extends StatelessWidget {
  const GradeRectangle({super.key, required this.grade});

  final String? grade;

  @override
  Widget build(BuildContext context) {
    final parsedGrade = grade != null
        ? StringParser.optStringToOptDouble(grade) ?? grade
        : "n/a";
    return AspectRatio(
        aspectRatio: 1.0,
        child: Container(
            decoration: BoxDecoration(
                color: GradeViewModel.getColor(parsedGrade),
                borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: Text(
                parsedGrade is double
                    ? parsedGrade.toStringAsFixed(1)
                    : parsedGrade.toString(),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    shadows: [
                      const Shadow(color: Colors.black, blurRadius: 10.0)
                    ]),
              ),
            )));
  }
}
