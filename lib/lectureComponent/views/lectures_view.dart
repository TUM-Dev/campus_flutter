import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/util/last_updated_text.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/viewModels/lecture_viewmodel.dart';
import 'package:campus_flutter/lectureComponent/views/semester_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campus_flutter/base/extensions/context.dart';

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
    return StreamBuilder(
      stream: ref.watch(lectureViewModel).lectures,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                context.localizations.noEntriesFound(
                  context.localizations.lecture,
                ),
              ),
            );
          } else {
            final lastFetched = ref.read(lectureViewModel).lastFetched.value;
            return RefreshIndicator(
              onRefresh: () => ref.read(lectureViewModel).fetch(true),
              child: Scrollbar(
                controller: scrollController,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (lastFetched != null) LastUpdatedText(lastFetched),
                      _body(snapshot.data!.entries),
                    ],
                  ),
                ),
              ),
            );
          }
        } else if (snapshot.hasError) {
          return ErrorHandlingRouter(
            error: snapshot.error!,
            errorHandlingViewType: ErrorHandlingViewType.fullScreen,
            retry: ref.read(lectureViewModel).fetch,
          );
        } else {
          return DelayedLoadingIndicator(name: context.localizations.lectures);
        }
      },
    );
  }

  Widget _body(Iterable<MapEntry<String, List<Lecture>>> data) {
    if (MediaQuery.orientationOf(context) == Orientation.landscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                for (int i = 0; i < data.length; i += 2)
                  SemesterView(semester: data.elementAt(i)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                for (int i = 1; i < data.length; i += 2)
                  SemesterView(semester: data.elementAt(i)),
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var semester in data) SemesterView(semester: semester),
        ],
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
