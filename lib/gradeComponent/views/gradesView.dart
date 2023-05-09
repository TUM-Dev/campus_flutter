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
  late Future<Map<String, Map<String, List<Grade>>>> grades;

  @override
  void initState() {
    super.initState();
    grades = Provider.of<GradeViewModel>(context, listen: false)
        .gradesByDegreeAndSemester();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: grades,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Scrollbar(
                child: SingleChildScrollView(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(children: [
                    for (var degree in snapshot.data!.entries)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: DegreeView(degree: degree),
                      ),
                  ])),
            ));
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
        ChartView(
            studyID: degree.key,
            title: degree.value.values.first.first.studyDesignation),
        for (var semester in degree.value.entries)
          SemesterView(semester: semester)
      ],
    );
  }
}

class SemesterView extends StatelessWidget {
  const SemesterView({super.key, required this.semester});

  final MapEntry<String, List<Grade>> semester;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Text(semester.key),
          initiallyExpanded: true,
          children: [for (var grade in semester.value) GradeRow(grade: grade)],
        )
      ],
    );
  }
}
