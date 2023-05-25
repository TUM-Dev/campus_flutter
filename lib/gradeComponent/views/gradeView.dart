import 'package:campus_flutter/gradeComponent/viewModels/gradeViewModel.dart';
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
        subtitle: Column(children: [
          Row(children: [
            Expanded(
                child: IconText(text: grade.modusShort, icon: Icons.edit)),
            Expanded(
                child: IconText(text: grade.lvNumber, icon: Icons.numbers)),
          ]),
          IconText(text: grade.examiner, icon: Icons.person),
        ],)
    );
  }
}

class GradeRow extends StatelessWidget {
  const GradeRow({super.key, required this.grade});

  final Grade grade;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GradeRectangle(grade: grade.grade),
        ),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  grade.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),

              ],
            ))
      ],
    );
  }
}

class GradeRectangle extends StatelessWidget {
  const GradeRectangle({super.key, required this.grade});

  final double? grade;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
          color: GradeViewModel.getColor(grade),
          borderRadius: BorderRadius.circular(4)),
      child: Center(
        child: Text(
          grade.toString(),
          style: Theme.of(context).textTheme.headlineSmall?.apply(
              color: Colors.white,
              shadows: [const Shadow(color: Colors.black, blurRadius: 10.0)]),
        ),
      ),
    );
  }
}

class IconText extends StatelessWidget {
  const IconText({super.key, required this.text, required this.icon, this.maxLines = 1});

  final String text;
  final IconData icon;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
        Expanded(child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          maxLines: maxLines,
        ))
      ],
    );
  }
}
