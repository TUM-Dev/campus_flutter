import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieSearchResultView extends ConsumerWidget {
  const MovieSearchResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
        title: "Movies",
        child: Card(
            child: StreamBuilder(
          stream: ref.watch(movieSearchViewModel).searchResults,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                          title: Text(snapshot.data![index].$1.title),
                        ),
                    separatorBuilder: (context, index) => const PaddedDivider(
                          height: 0,
                        ),
                    itemCount:
                        snapshot.data!.length >= 3 ? 3 : snapshot.data!.length);
              } else {
                return Padding(
                    padding: EdgeInsets.all(context.padding),
                    child: const Center(
                      child: Text("No Movies Found"),
                    ));
              }
            } else if (snapshot.hasError) {
              return ErrorHandlingView(
                  error: snapshot.error!,
                  errorHandlingViewType: ErrorHandlingViewType.descriptionOnly);
            } else {
              return const DelayedLoadingIndicator(
                name: "Movies",
              );
            }
          },
        )));
  }
}
