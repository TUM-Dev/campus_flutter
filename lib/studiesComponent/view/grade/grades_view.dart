import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/util/last_updated_text.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/studiesComponent/model/grade.dart';
import 'package:campus_flutter/studiesComponent/view/semester_view.dart';
import 'package:campus_flutter/studiesComponent/viewModel/grade_viewmodel.dart';
import 'package:campus_flutter/studiesComponent/view/grade/chart_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GradesView extends ConsumerStatefulWidget {
  const GradesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GradesViewState();
}

class _GradesViewState extends ConsumerState<GradesView> {
  late Provider<GradeViewModel> gradeVM;

  @override
  void initState() {
    gradeVM = gradeViewModel;
    ref.read(gradeVM).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.watch(gradeVM).studyProgramGrades,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                context.tr("noEntriesFound", args: [context.tr("grades")]),
              ),
            );
          } else {
            final lastFetched = ref.read(gradeViewModel).lastFetched.value;
            return OrientationBuilder(
              builder: (context, constraints) {
                if (constraints == Orientation.portrait) {
                  return _oneColumnView(snapshot.data!, lastFetched);
                } else {
                  return _twoColumnView(snapshot.data!, lastFetched);
                }
              },
            );
          }
        } else if (snapshot.hasError) {
          return ErrorHandlingRouter(
            error: snapshot.error!,
            errorHandlingViewType: ErrorHandlingViewType.fullScreen,
            retry: (() => ref.read(gradeViewModel).fetch(true)),
          );
        } else {
          return DelayedLoadingIndicator(name: context.tr("grades"));
        }
      },
    );
  }

  Widget _oneColumnView(Map<String, List<Grade>> data, DateTime? lastFetched) {
    return RefreshIndicator(
      child: Scrollbar(
        child: SingleChildScrollView(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              if (lastFetched != null) LastUpdatedText(lastFetched),
              DegreeView(degree: data),
            ],
          ),
        ),
      ),
      onRefresh: () async {
        ref.read(gradeViewModel).fetch(true);
      },
    );
  }

  Widget _twoColumnView(Map<String, List<Grade>> data, DateTime? lastFetched) {
    return Column(
      children: [
        if (lastFetched != null) LastUpdatedText(lastFetched),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: ChartView(
                  title:
                      data.values.first.firstOrNull?.studyDesignation ??
                      "Unknown",
                  studyId: data.values.first.firstOrNull?.studyID ?? "Unknown",
                  degreeShort:
                      data.values.first.firstOrNull?.degreeShort ?? "Unknown",
                ),
              ),
              Expanded(
                flex: 3,
                child: RefreshIndicator(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var semester in data.entries) ...[
                            SemesterView(semester: semester),
                          ],
                        ],
                      ),
                    ),
                  ),
                  onRefresh: () async {
                    ref.read(gradeViewModel).fetch(true);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DegreeView extends StatelessWidget {
  const DegreeView({super.key, required this.degree});

  final Map<String, List<Grade>> degree;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChartView(
          title: degree.values.first.firstOrNull?.studyDesignation ?? "Unknown",
          studyId: degree.values.first.firstOrNull?.studyID ?? "Unknown",
          degreeShort:
              degree.values.first.firstOrNull?.degreeShort ?? "Unknown",
        ),
        for (var semester in degree.entries) SemesterView(semester: semester),
      ],
    );
  }
}
