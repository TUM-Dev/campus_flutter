import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:campus_flutter/searchComponent/protocols/category_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/search_result_details_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultCardView<T extends SearchCategoryViewModel<S>,
    S extends Searchable> extends ConsumerWidget {
  const SearchResultCardView({
    super.key,
    required this.searchVM,
    required this.searchCategoryVM,
    required this.searchCategory,
    required this.body,
  });

  final Provider<SearchViewModel> searchVM;
  final Provider<SearchCategoryViewModel<S>> searchCategoryVM;
  final SearchCategory searchCategory;
  final Widget Function(S searchable) body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
      title:
          SearchCategoryExtension.localizedEnumTitle(searchCategory, context),
      child: Card(
        child: StreamBuilder(
          stream: ref
              .watch<SearchCategoryViewModel<S>>(searchCategoryVM)
              .searchResults,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Padding(
                  padding: EdgeInsets.all(context.padding),
                  child: Center(
                    child: Text(
                      context.tr(
                        "noEntriesFound",
                        args: [
                          SearchCategoryExtension.localizedEnumTitle(
                            searchCategory,
                            context,
                          ),
                        ],
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: () {
                        if (index == itemCount - 1) {
                          return _showMoreButton(
                            snapshot.data!,
                            context,
                          );
                        } else {
                          return body(snapshot.data![index]);
                        }
                      }(),
                    );
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

  int _calculateItemLength(List<S>? data, WidgetRef ref) {
    final selectedCategories = ref.read(searchVM).selectedCategories.value;
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
          context.tr("showMore"),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      // TODO(@jakobkoerber): figure out for multiple attributes
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
