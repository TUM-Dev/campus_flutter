import 'dart:math';

import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:campus_flutter/gradeComponent/viewModels/grade_viewmodel.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartView extends ConsumerWidget {
  const ChartView({super.key, required this.studyID, required this.title});

  final String title;
  final String studyID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(gradeViewModel).chartDataForDegree(studyID);
    return Column(
      children: [
        PopupMenuButton<String>(
          itemBuilder: (context) => ref.read(gradeViewModel).getMenuEntries(),
          onSelected: (selected) {
            ref.read(gradeViewModel).setSelectedDegree(selected);
          },
          child: IconText(
              iconData: Icons.keyboard_arrow_down,
              label: "${StringParser.degreeShortFromID(studyID)} $title",
              style: Theme.of(context).textTheme.bodyLarge,
              mainAxisAlignment: MainAxisAlignment.center,
              leadingIcon: false),
        ),
        SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: data.values.reduce(max).toDouble(),
                interval: 1),
            series: <ChartSeries<MapEntry<double, int>, String>>[
              ColumnSeries<MapEntry<double, int>, String>(
                dataSource: data.entries.toList(),
                xValueMapper: (MapEntry<double, int> data, _) =>
                    data.key.toString(),
                yValueMapper: (MapEntry<double, int> data, _) => data.value,
                pointColorMapper: (MapEntry<double, int> data, _) =>
                    GradeViewModel.getColor(data.key),
              )
            ])
      ],
    );
  }
}
