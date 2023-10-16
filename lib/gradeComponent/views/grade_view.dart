import 'dart:core';

import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/gradeComponent/model/grade.dart';
import 'package:campus_flutter/gradeComponent/views/grade_rectangle.dart';
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
                child:
                    _subtitle(grade.modusShort(context), Icons.edit, context),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
              Expanded(
                child: _subtitle(grade.lvNumber, Icons.numbers, context),
              ),
            ]),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            _subtitle(grade.examiner, Icons.person, context),
          ],
        ));
  }

  Widget _subtitle(String text, IconData iconData, BuildContext context) {
    return IconText(
      iconData: iconData,
      label: text,
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      iconColor: Theme.of(context).primaryColor,
      multipleLines: false,
    );
  }
}
