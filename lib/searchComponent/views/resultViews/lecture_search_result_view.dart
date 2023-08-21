import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LectureSearchResultView extends ConsumerWidget {
  const LectureSearchResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
        title: "Lectures",
        child: Card(
            child: StreamBuilder(
          stream: ref.watch(lectureSearchViewModel).personalSearchResults,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final length = snapshot.data!.length >= 3
                  ? 3 //+ 1
                  : snapshot.data!.length; // + 1;
              return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => //index == length - 1
                      //? const Text("Show More")
                      /*:*/ LectureView(lecture: snapshot.data![index].$1),
                  separatorBuilder: (context, index) => const PaddedDivider(
                        height: 0,
                      ),
                  itemCount: snapshot.data!.length >= 3
                      ? 3 // + 1
                      : snapshot.data!.length /* + 1*/);
            } else if (snapshot.hasError) {
              return ErrorHandlingView(
                  error: snapshot.error!,
                  errorHandlingViewType: ErrorHandlingViewType.descriptionOnly);
            } else {
              return const DelayedLoadingIndicator(
                name: "Lectures",
              );
            }
          },
        )));
  }
}
