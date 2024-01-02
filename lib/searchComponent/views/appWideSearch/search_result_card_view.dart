import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/searchComponent/protocols/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:campus_flutter/searchComponent/viewModels/global_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_result_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultCardView<T extends SearchViewModel<S>, S extends Searchable>
    extends ConsumerWidget {
  const SearchResultCardView({
    super.key,
    required this.searchCategory,
    required this.viewModel,
    required this.body,
  });

  final Provider<SearchViewModel<S>> viewModel;
  final SearchCategory searchCategory;
  final Widget Function(S searchable) body;

  // TODO: implement "Show More" button
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
                    child: Text(
                      context.localizations.noEntriesFoundSearch(
                        SearchCategoryExtension.localizedEnumTitle(
                          searchCategory,
                          context,
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                final itemCount = _calculateItemLength(snapshot.data!, ref);
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index == itemCount - 1) {
                      return _showMoreButton(
                        snapshot.data! as List<S>,
                        context,
                      );
                    } else {
                      return body(snapshot.data![index] as S);
                    }
                  },
                  separatorBuilder: (context, index) => const PaddedDivider(
                    height: 0,
                  ),
                  itemCount: itemCount,
                );
              }
            } else if (snapshot.hasError) {
              return Padding(
                padding: EdgeInsets.all(context.padding),
                child: ErrorHandlingRouter(
                  error: snapshot.error!,
                  errorHandlingViewType: ErrorHandlingViewType.descriptionOnly,
                ),
              );
            } else {
              return DelayedLoadingIndicator(
                name: SearchCategoryExtension.localizedEnumTitle(
                  searchCategory,
                  context,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  int _calculateItemLength(List<Searchable>? data, WidgetRef ref) {
    final selectedCategories =
        ref.read(searchViewModel).selectedCategories.value;
    if (selectedCategories.contains(searchCategory) &&
        selectedCategories.length == 1) {
      return (data!.length >= 9 ? 9 : data.length) + 1;
    } else {
      return (data!.length >= 3 ? 3 : data.length) + 1;
    }
  }

  Widget _showMoreButton(List<S> data, BuildContext context) {
    return ListTile(
      dense: true,
      title: Center(
        child: Text(
          context.localizations.showMore,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultDetailsScaffold<S>(
            searchCategory: searchCategory,
            data: data,
            body: body,
          ),
        ),
      ),
    );
  }
}
