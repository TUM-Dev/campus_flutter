import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/cafeteria_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CafeteriasSearchResultView extends ConsumerWidget {
  const CafeteriasSearchResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
        title: "Cafeterias",
        child: Card(
            child: StreamBuilder(
          stream: ref.watch(cafeteriaSearchViewModel).searchResults,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(snapshot.data![index].$1.name),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => CafeteriaView(
                                    cafeteria: snapshot.data![index].$1))),
                      ),
                  separatorBuilder: (context, index) => const PaddedDivider(
                        height: 0,
                      ),
                  itemCount:
                      snapshot.data!.length >= 3 ? 3 : snapshot.data!.length);
            } else if (snapshot.hasError) {
              return ErrorHandlingView(
                  error: snapshot.error!,
                  errorHandlingViewType: ErrorHandlingViewType.descriptionOnly);
            } else {
              return const DelayedLoadingIndicator(
                name: "Cafeterias",
              );
            }
          },
        )));
  }
}
