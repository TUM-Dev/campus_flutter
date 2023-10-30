import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_category_picker_view.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_result_view_builder.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_textfield_view.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchView extends ConsumerWidget {
  SearchView({super.key, required this.showContent});

  final TextEditingController textEditingController = TextEditingController();

  final bool showContent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Container(
      color: Theme.of(context).canvasColor,
      child: showContent
          ? Column(mainAxisSize: MainAxisSize.min, children: [
              SearchTextField(
                textEditingController: textEditingController,
              ),
              const SearchCategoryPickerView(),
              _search(ref)
            ]) //)
          : Container(),
    ));
  }

  Widget _search(WidgetRef ref) {
    return Expanded(
        child: StreamBuilder(
            stream: ref.watch(searchViewModel).result,
            builder: (context, snapshot) {
              if (!snapshot.hasData && textEditingController.text.isEmpty) {
                return Center(
                    child: Text(context.localizations.enterQueryStart));
              } else {
                final orientation = MediaQuery.orientationOf(context);
                if (orientation == Orientation.landscape) {
                  return MasonryGridView.count(
                      crossAxisCount: 2,
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) =>
                          SearchResultViewBuilder(snapshot.data![index]));
                } else {
                  return SingleChildScrollView(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                    for (var result in snapshot.data ??
                        const Iterable<SearchCategory>.empty())
                      SearchResultViewBuilder(result),
                  ]));
                }
              }
            }));
  }
}
