import 'package:campus_flutter/base/helpers/last_updated_text.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/semester_calculator.dart';
import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/base/views/generic_stream_builder.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_details_view.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campus_flutter/theme.dart';

class LecturesView extends ConsumerStatefulWidget {
  const LecturesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LecturesViewState();
}

class _LecturesViewState extends ConsumerState<LecturesView>
    with AutomaticKeepAliveClientMixin<LecturesView> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    ref.read(lectureViewModel).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GenericStreamBuilder<Map<String, List<Lecture>>>(
        stream: ref.watch(lectureViewModel).lectures,
        dataBuilder: (context, data) {
          if (data.isEmpty) {
            return Center(child: Text(context.localizations.noLecturesFound));
          } else {
            Future(() {
              ref
                  .read(lectureSplitViewModel)
                  .selectedWidget
                  .add(LectureDetailsView(
                    key: Key(data.values.first.first.title),
                    lecture: data.values.first.first,
                  ));
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
        loadingBuilder: (context) =>
            const DelayedLoadingIndicator(name: "Lectures"));
  }

  Widget _twoColumnView(
      DateTime? lastFetched, Map<String, List<Lecture>> data) {
    return Column(
      children: [
        if (lastFetched != null) LastUpdatedText(lastFetched),
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2, child: _semesterListView(true, lastFetched, data)),
            Expanded(
                flex: 3,
                child: StreamBuilder(
                    stream: ref.read(lectureSplitViewModel).selectedWidget,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data!;
                      } else {
                        return DelayedLoadingIndicator(
                          name: context.localizations.lecture,
                          alternativeLoadingIndicator: Center(
                              child: Text(
                                  context.localizations.noLecturesSelected)),
                        );
                      }
                    }))
          ],
        ))
      ],
    );
  }

  Widget _semesterListView(
      bool landScape, DateTime? lastFetched, Map<String, List<Lecture>> data) {
    return RefreshIndicator(
      onRefresh: () => ref.read(lectureViewModel).fetch(true),
      child: Scrollbar(
          controller: scrollController,
          child: SingleChildScrollView(
              controller: scrollController,
              child: Column(children: [
                if (lastFetched != null && !landScape)
                  LastUpdatedText(lastFetched),
                for (var semester in data.entries)
                  SemesterView(semester: semester),
              ]))),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class SemesterView extends ConsumerWidget {
  const SemesterView({super.key, required this.semester});

  final MapEntry<String, List<Lecture>> semester;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        child: ExpansionTile(
      title: Text(StringParser.toFullSemesterName(context, semester.key)),
      initiallyExpanded:
          semester.key == SemesterCalculator.getCurrentSemester() ||
              semester.key == SemesterCalculator.getPriorSemester(),
      children: [
        for (var index = 0; index < semester.value.length; index++)
          Column(children: [
            LectureView(lecture: semester.value[index]),
            (index != semester.value.length - 1
                ? const PaddedDivider()
                : const SizedBox.shrink())
          ])
      ],
    ));
  }
}
