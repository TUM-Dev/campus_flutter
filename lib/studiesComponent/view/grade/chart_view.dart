import 'dart:math';

import 'package:campus_flutter/base/util/card_with_padding.dart';
import 'package:campus_flutter/base/util/icon_text.dart';
import 'package:campus_flutter/studiesComponent/viewModel/grade_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartView extends ConsumerWidget {
  const ChartView({
    super.key,
    required this.title,
    required this.studyId,
    required this.degreeShort,
  });

  final String title;
  final String studyId;
  final String degreeShort;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(gradeViewModel).chartDataForDegree(studyId);
    final averageGrade = ref.read(gradeViewModel).getAverageGrade();
    return CardWithPadding(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PopupMenuButton<String>(
            itemBuilder: (context) =>
                ref.read(gradeViewModel).getMenuEntries(context),
            onSelected: (selected) {
              ref.read(gradeViewModel).setSelectedDegree(selected);
            },
            child: IconText(
              iconData: Icons.keyboard_arrow_down,
              label: "$title ($degreeShort)",
              style: Theme.of(context).textTheme.bodyLarge,
              mainAxisAlignment: MainAxisAlignment.center,
              leadingIcon: false,
            ),
          ),
          SfCartesianChart(
            primaryXAxis: const CategoryAxis(),
            primaryYAxis: NumericAxis(
              minimum: 0,
              maximum: data.values.reduce(max).toDouble(),
              interval: 1,
            ),
            series: <CartesianSeries<MapEntry<dynamic, int>, String>>[
              ColumnSeries<MapEntry<dynamic, int>, String>(
                dataSource: data.entries.toList(),
                xValueMapper: (MapEntry<dynamic, int> data, _) =>
                    data.key.toString(),
                yValueMapper: (MapEntry<dynamic, int> data, _) => data.value,
                pointColorMapper: (MapEntry<dynamic, int> data, _) =>
                    GradeViewModel.getColor(data.key),
              ),
            ],
          ),
          if (averageGrade != null) ...[
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    context.tr("averageGrade"),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Text(
                  averageGrade.averageGrade.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
