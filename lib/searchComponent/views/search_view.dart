import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/search_category_picker_view.dart';
import 'package:campus_flutter/searchComponent/views/search_result_view_builder.dart';
import 'package:campus_flutter/searchComponent/views/search_textfield_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchView extends ConsumerWidget {
  const SearchView({
    super.key,
    required this.searchVM,
    required this.showContent,
  });

  final Provider<SearchViewModel> searchVM;
  final bool showContent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).canvasColor,
        child: showContent
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SearchTextField(searchVM: searchVM),
                  SearchCategoryPickerView(
                    searchVM: searchVM,
                  ),
                  _search(ref),
                ],
              ) //)
            : Container(),
      ),
    );
  }

  Widget _search(WidgetRef ref) {
    return Expanded(
      child: StreamBuilder(
        stream: ref.watch(searchVM).result,
        builder: (context, snapshot) {
          if (!snapshot.hasData &&
              ref.read(searchVM).searchTextController.text.isEmpty) {
            return Center(
              child: Text(context.tr("enterQueryStart")),
            );
          } else {
            final orientation = MediaQuery.orientationOf(context);
            if (orientation == Orientation.landscape) {
              return MasonryGridView.count(
                crossAxisCount: 2,
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) => SearchResultViewBuilder(
                  searchVM: searchVM,
                  searchCategory: snapshot.data![index],
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var result in snapshot.data ??
                        const Iterable<SearchCategory>.empty())
                      SearchResultViewBuilder(
                        searchVM: searchVM,
                        searchCategory: result,
                      ),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
