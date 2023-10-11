import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/searchComponent/protocols/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultCardView<T extends SearchViewModel<S>, S extends Searchable>
    extends ConsumerWidget {
  const SearchResultCardView(
      {super.key,
      required this.searchCategory,
      required this.viewModel,
      required this.body});

  final Provider<SearchViewModel<S>> viewModel;
  final SearchCategory searchCategory;
  final Widget Function(S searchable) body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
        title:
            SearchCategoryExtension.localizedEnumTitle(searchCategory, context),
        child: Card(
            child: StreamBuilder(
          stream: ref.watch<SearchViewModel>(viewModel).searchResults,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Padding(
                    padding: EdgeInsets.all(context.padding),
                    child: Center(
                      child: Text(context.localizations.noEntriesFoundSearch(
                          SearchCategoryExtension.localizedEnumTitle(
                              searchCategory, context))),
                    ));
              } else {
                return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        body(snapshot.data![index] as S),
                    separatorBuilder: (context, index) => const PaddedDivider(
                          height: 0,
                        ),
                    itemCount:
                        snapshot.data!.length >= 3 ? 3 : snapshot.data!.length);
              }
            } else if (snapshot.hasError) {
              return Padding(
                  padding: EdgeInsets.all(context.padding),
                  child: ErrorHandlingView(
                      error: snapshot.error!,
                      errorHandlingViewType:
                          ErrorHandlingViewType.descriptionOnly));
            } else {
              return DelayedLoadingIndicator(
                name: SearchCategoryExtension.localizedEnumTitle(
                    searchCategory, context),
              );
            }
          },
        )));
  }
}
