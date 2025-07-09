import 'package:campus_flutter/base/util/string_parser.dart';
import 'package:campus_flutter/studiesComponent/viewModel/grade_viewmodel.dart';
import 'package:flutter/material.dart';

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
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            parsedGrade is double
                ? parsedGrade.toStringAsFixed(1)
                : parsedGrade.toString(),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [Shadow(color: Colors.grey.shade600, blurRadius: 3)],
            ),
          ),
        ),
      ),
    );
  }
}
