import 'package:campus_flutter/base/helpers/iconText.dart';
import 'package:campus_flutter/base/helpers/last_updated_text.dart';
import 'package:campus_flutter/base/helpers/paddedDivider.dart';
import 'package:campus_flutter/base/helpers/delayedLoadingIndicator.dart';
import 'package:campus_flutter/base/helpers/semester_calculator.dart';
import 'package:campus_flutter/base/helpers/stringParser.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/base/views/generic_stream_builder.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/views/lectureDetailsView.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LectureView extends ConsumerStatefulWidget {
  const LectureView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GradeViewState();
}

class _GradeViewState extends ConsumerState<LectureView> {
  @override
  void initState() {
    ref.read(lectureViewModel).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GenericStreamBuilder<Map<String, List<Lecture>>>(
        stream: ref.watch(lectureViewModel).lectures,
        dataBuilder: (context, data) {
          if (data.isEmpty) {
            return const Center(child: Text("no lectures found"));
          } else {
            final lastFetched = ref.read(lectureViewModel).lastFetched.value;
            return RefreshIndicator(
                onRefresh: () => ref.read(lectureViewModel).fetch(true),
                child: Scrollbar(
                    child: SingleChildScrollView(
                        child: Column(children: [
                          if (lastFetched != null) LastUpdatedText(lastFetched),
                          for (var semester in data.entries)
                            SemesterView(semester: semester),
                        ]))),
            );
          }
        },
        errorBuilder: (context, error) => ErrorHandlingView(
            error: error,
            errorHandlingViewType: ErrorHandlingViewType.fullScreen,
            retry: ref.read(lectureViewModel).fetch
        ),
        loadingBuilder: (context) => const DelayedLoadingIndicator(
            name: "Lectures"
        )
    );
    /*
    return StreamBuilder(
        stream: ref.watch(lectureViewModel).lectures,
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
          }

          return const DelayedLoadingIndicator(name: "Lectures");
        });
     */
  }
}

class SemesterView extends ConsumerWidget {
  const SemesterView({super.key, required this.semester});

  final MapEntry<String, List<Lecture>> semester;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        child: ExpansionTile(
      title: Text(StringParser.toFullSemesterName(semester.key)),
      initiallyExpanded: semester.key == SemesterCalculator.getCurrentSemester(),
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
                ref.read(selectedLecture.notifier).state = semester.value[index];
                ref.read(selectedEvent.notifier).state = null;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                                appBar: AppBar(leading: const BackButton()),
                                body: const LectureDetailsView())));
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
