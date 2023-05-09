import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/viewModels/lectureViewModel.dart';
import 'package:flutter/material.dart';

class LectureView extends StatefulWidget {
  const LectureView({super.key});

  @override
  State<StatefulWidget> createState() => _GradeViewState();
}

class _GradeViewState extends State<LectureView> {
  late Future<Map<String, List<Lecture>>> lectures;

  @override
  void initState() {
    super.initState();
    lectures = LectureViewModel().lecturesBySemester();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: lectures,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Scrollbar(
                child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    for (var semester in snapshot.data!.entries)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: SemesterView(semester: semester),
                      )
                  ])),
            ));
          } else if (snapshot.hasError) {
            return const Center(child: Text("no lectures found"));
          }

          return const Center(child: CircularProgressIndicator());
        });
  }
}

class SemesterView extends StatelessWidget {
  const SemesterView({super.key, required this.semester});

  final MapEntry<String, List<Lecture>> semester;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Text(semester.key),
          initiallyExpanded: true,
          children: [
            for (var lecture in semester.value)
              ListTile(title: Text(lecture.title))
          ],
        )
      ],
    );
  }
}
