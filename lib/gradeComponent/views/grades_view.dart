import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/last_updated_text.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/base/helpers/semester_calculator.dart';
import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:campus_flutter/base/views/generic_stream_builder.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/gradeComponent/model/grade.dart';
import 'package:campus_flutter/gradeComponent/viewModels/grade_viewmodel.dart';
import 'package:campus_flutter/gradeComponent/views/chart_view.dart';
import 'package:campus_flutter/gradeComponent/views/grade_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campus_flutter/theme.dart';

class GradesView extends ConsumerStatefulWidget {
  const GradesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GradesViewState();
}

class _GradesViewState extends ConsumerState<GradesView>
    with AutomaticKeepAliveClientMixin<GradesView> {
  late Provider<GradeViewModel> gradeVM;

  @override
  void initState() {
    gradeVM = gradeViewModel;
    ref.read(gradeVM).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GenericStreamBuilder<Map<String, List<Grade>>>(
        stream: ref.watch(gradeVM).studyProgramGrades,
        dataBuilder: (context, data) {
          if (data.isEmpty) {
            return Center(child: Text(context.localizations.noGradesFound));
          } else {
            final lastFetched = ref.read(gradeViewModel).lastFetched.value;
            return OrientationBuilder(builder: (context, constraints) {
              if (constraints == Orientation.portrait) {
                return _oneColumnView(data, lastFetched);
              } else {
                return _twoColumnView(data, lastFetched);
              }
            });
          }
        },
        errorBuilder: (context, error) => ErrorHandlingView(
              error: error,
              errorHandlingViewType: ErrorHandlingViewType.fullScreen,
              retry: ref.read(gradeViewModel).fetch,
            ),
        loadingBuilder: (context) =>
            DelayedLoadingIndicator(name: context.localizations.grades));
  }

  Widget _oneColumnView(Map<String, List<Grade>> data, DateTime? lastFetched) {
    return RefreshIndicator(
        child: Scrollbar(
            child: SingleChildScrollView(
                clipBehavior: Clip.antiAlias,
                child: Column(children: [
                  if (lastFetched != null) LastUpdatedText(lastFetched),
                  DegreeView(degree: data),
                ]))),
        onRefresh: () async {
          ref.read(gradeViewModel).fetch(true);
        });
  }

  Widget _twoColumnView(Map<String, List<Grade>> data, DateTime? lastFetched) {
    return Column(children: [
      if (lastFetched != null) LastUpdatedText(lastFetched),
      Expanded(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: ChartView(
                studyID: data.values.first.firstOrNull?.studyID ?? "Unknown",
                title: data.values.first.firstOrNull?.studyDesignation ??
                    "Unknown",
              )),
          Expanded(
              flex: 3,
              child: RefreshIndicator(
                  child: Scrollbar(
                      child: SingleChildScrollView(
                          child: Column(children: [
                    for (var semester in data.entries) ...[
                      SemesterView(semester: semester)
                    ]
                  ]))),
                  onRefresh: () async {
                    ref.read(gradeViewModel).fetch(true);
                  }))
        ],
      ))
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}

class DegreeView extends StatelessWidget {
  const DegreeView({super.key, required this.degree});

  final Map<String, List<Grade>> degree;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChartView(
            studyID: degree.values.first.firstOrNull?.studyID ?? "Unknown",
            title:
                degree.values.first.firstOrNull?.studyDesignation ?? "Unknown"),
        for (var semester in degree.entries) SemesterView(semester: semester),
      ],
    );
  }
}

class SemesterView extends StatelessWidget {
  const SemesterView({super.key, required this.semester});

  final MapEntry<String, List<Grade>> semester;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ExpansionTile(
      title: Text(StringParser.toFullSemesterName(context, semester.key)),
      initiallyExpanded:
          (semester.key == SemesterCalculator.getCurrentSemester() ||
              semester.key == SemesterCalculator.getPriorSemester()),
      children: [
        for (var index = 0; index < semester.value.length; index++)
          Column(children: [
            GradeRow(grade: semester.value[index]),
            (index != semester.value.length - 1
                ? const PaddedDivider()
                : const SizedBox.shrink())
          ])
      ],
    ));
  }
}
