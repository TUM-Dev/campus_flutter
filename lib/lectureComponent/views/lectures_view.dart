import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/helpers/last_updated_text.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/semester_calculator.dart';
import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/base/views/generic_stream_builder.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_details_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LecturesView extends ConsumerStatefulWidget {
  const LecturesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GradeViewState();
}

class _GradeViewState extends ConsumerState<LecturesView> {
  final ScrollController scrollController = ScrollController();

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
            return Center(child: Text(AppLocalizations.of(context)!.noLecturesFound));
          } else {
            Future(() {
              ref.read(selectedLecture.notifier).state = data.values.first.first;
              ref.read(selectedEvent.notifier).state = null;
              ref.read(lectureSplitViewModel).selectedWidget.add(const LectureDetailsView());
            });
            final lastFetched = ref.read(lectureViewModel).lastFetched.value;
            return OrientationBuilder(builder: (context, constraints) {
              if (constraints == Orientation.portrait) {
                return _semesterListView(false, lastFetched, data);
              } else {
                return _twoColumnView(lastFetched, data);
              }
            });
          }
        },
        errorBuilder: (context, error) => ErrorHandlingView(
            error: error,
            errorHandlingViewType: ErrorHandlingViewType.fullScreen,
            retry: ref.read(lectureViewModel).fetch),
        loadingBuilder: (context) => const DelayedLoadingIndicator(name: "Lectures"));
  }

  Widget _twoColumnView(DateTime? lastFetched, Map<String, List<Lecture>> data) {
    return Column(
      children: [
        if (lastFetched != null) LastUpdatedText(lastFetched),
        Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: _semesterListView(true, lastFetched, data)),
                Expanded(flex: 3, child: StreamBuilder(
                    stream: ref.read(lectureSplitViewModel).selectedWidget,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data!;
                      } else {
                        return DelayedLoadingIndicator(
                            name: AppLocalizations.of(context)!.lecture,
                            alternativeLoadingIndicator: Center(child: Text(AppLocalizations.of(context)!.noLecturesSelected)),
                        );
                      }
                    }))
              ],
            ))
      ],
    );
  }

  Widget _semesterListView(bool landScape, DateTime? lastFetched, Map<String, List<Lecture>> data) {
    return RefreshIndicator(
      onRefresh: () => ref.read(lectureViewModel).fetch(true),
      child: Scrollbar(
          controller: scrollController,
          child: SingleChildScrollView(
              controller: scrollController,
              child: Column(children: [
                if (lastFetched != null && !landScape) LastUpdatedText(lastFetched),
                for (var semester in data.entries) SemesterView(semester: semester),
              ]))),
    );
  }
}

class SemesterView extends ConsumerWidget {
  const SemesterView({super.key, required this.semester});

  final MapEntry<String, List<Lecture>> semester;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        child: ExpansionTile(
      title: Text(StringParser.toFullSemesterName(context,semester.key)),
      initiallyExpanded: semester.key == SemesterCalculator.getCurrentSemester(),
      children: [
        for (var index = 0; index < semester.value.length; index++)
          Column(children: [
            ListTile(
              title: Text(semester.value[index].title),
              //titleTextStyle: Theme.of(context).textTheme.bodyMedium,
              trailing: const Icon(Icons.arrow_forward_ios, size: 15),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Expanded(
                        child: IconText(
                      iconData: Icons.edit,
                      label: semester.value[index].eventType(context),
                      iconColor: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).colorScheme.secondary,
                      multipleLines: true,
                    )),
                    Expanded(
                        child: IconText(
                            iconData: Icons.access_time,
                            label: semester.value[index].sws,
                            iconColor: Theme.of(context).primaryColor,
                            textColor: Theme.of(context).colorScheme.secondary)),
                  ]),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                  IconText(
                    iconData: Icons.person,
                    label: semester.value[index].speaker,
                    iconColor: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).colorScheme.secondary,
                    multipleLines: true,
                  ),
                ],
              ),
              onTap: () {
                ref.read(selectedLecture.notifier).state = semester.value[index];
                ref.read(selectedEvent.notifier).state = null;
                if (MediaQuery.orientationOf(context) == Orientation.portrait) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Scaffold(
                              appBar: AppBar(leading: const BackButton()),
                              body: const LectureDetailsView())));
                } else {
                  ref.read(lectureSplitViewModel).selectedWidget.add(const LectureDetailsView());
                }
              },
            ),
            (index != semester.value.length - 1 ? const PaddedDivider() : const SizedBox.shrink())
          ])
      ],
    ));
  }
}
