import 'package:campus_flutter/base/helpers/iconText.dart';
import 'package:campus_flutter/base/helpers/paddedDivider.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/viewModels/lectureDetailsViewModel.dart';
import 'package:campus_flutter/lectureComponent/viewModels/lectureViewModel.dart';
import 'package:campus_flutter/lectureComponent/views/lectureDetailsView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LectureView extends StatefulWidget {
  const LectureView({super.key});

  @override
  State<StatefulWidget> createState() => _GradeViewState();
}

class _GradeViewState extends State<LectureView> {
  @override
  void initState() {
    Provider.of<LectureViewModel>(context, listen: false).lecturesBySemester();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<LectureViewModel>(context, listen: true).lectures.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(child: Text("no lectures found"));
            } else {
              return Scrollbar(
                  child: SingleChildScrollView(
                      child: Column(children: [
                        for (var semester in snapshot.data!.entries)
                          SemesterView(semester: semester),
                      ])));
            }
          } else if (snapshot.hasError) {
            return const Center(child: Text("no lectures found"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class SemesterView extends StatelessWidget {
  const SemesterView({super.key, required this.semester});

  final MapEntry<String, List<Lecture>> semester;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ExpansionTile(
      title: Text(semester.key),
      initiallyExpanded: true,
      children: [
        for (var index = 0; index < semester.value.length; index++)
          Column(children: [
            ListTile(
              title: Text(semester.value[index].title),
              //titleTextStyle: Theme.of(context).textTheme.bodyMedium,
              trailing: const Icon(Icons.arrow_forward_ios, size: 15),
              subtitle: Column(
                children: [
                  Row(children: [
                    Expanded(
                        child: IconText(
                      iconData: Icons.edit,
                      label: semester.value[index].eventType,
                      textColor: Theme.of(context).colorScheme.secondary,
                      multipleLines: true,
                    )),
                    Expanded(
                        child: IconText(
                            iconData: Icons.access_time,
                            label: semester.value[index].sws,
                            textColor:
                                Theme.of(context).colorScheme.secondary)),
                  ]),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                  IconText(
                    iconData: Icons.person,
                    label: semester.value[index].speaker,
                    textColor: Theme.of(context).colorScheme.secondary,
                    multipleLines: true,
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Provider(
                            create: (context) => LectureDetailsViewModel(
                                lecture: semester.value[index]),
                            child: Scaffold(
                                appBar: AppBar(leading: const BackButton()),
                                body: const LectureDetailsView()))));
              },
            ),
            (index != semester.value.length - 1
                ? const PaddedDivider()
                : const SizedBox.shrink())
          ])
      ],
    ));
  }
}
