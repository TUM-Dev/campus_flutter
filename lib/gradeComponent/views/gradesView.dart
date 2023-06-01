import 'package:campus_flutter/base/helpers/cardWithPadding.dart';
import 'package:campus_flutter/base/helpers/paddedDivider.dart';
import 'package:campus_flutter/gradeComponent/model/grade.dart';
import 'package:campus_flutter/gradeComponent/viewModels/gradeViewModel.dart';
import 'package:campus_flutter/gradeComponent/views/chartView.dart';
import 'package:campus_flutter/gradeComponent/views/gradeView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GradesView extends StatefulWidget {
  const GradesView({super.key});

  @override
  State<StatefulWidget> createState() => _GradesViewState();
}

class _GradesViewState extends State<GradesView> {

  @override
  void initState() {
    Provider.of<GradeViewModel>(context, listen: false).gradesByDegreeAndSemester();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<GradeViewModel>(context, listen: true).grades,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Text("no grades found");
            } else {
              return Scrollbar(
                child: SingleChildScrollView(
                    clipBehavior: Clip.antiAlias,
                    child: Column(children: [
                      for (var degree in snapshot.data!.entries)
                        DegreeView(degree: degree),
                    ])));
            }
          } else if (snapshot.hasError) {
            return const Center(child: Text("no grades found"));
          }

          return const Center(child: CircularProgressIndicator());
        });
  }
}

class DegreeView extends StatelessWidget {
  const DegreeView({super.key, required this.degree});

  final MapEntry<String, Map<String, List<Grade>>> degree;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardWithPadding(
            child: ChartView(
                studyID: degree.key,
                title: degree.value.values.first.first.studyDesignation)),
        for (var semester in degree.value.entries)
          SemesterView(semester: semester),
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
          title: Text(GradeViewModel.toFullSemesterName(semester.key)),
          initiallyExpanded: true,
          children: [
            for (var index = 0; index < semester.value.length; index++)
              Column(children: [
                GradeRowAlt(grade: semester.value[index]),
                (index != semester.value.length - 1 ? const PaddedDivider() : const SizedBox.shrink())
              ])
          ],
        ));
  }
}
