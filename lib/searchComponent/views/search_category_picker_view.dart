import 'package:campus_flutter/base/helpers/horizontal_slider.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchCategoryPickerView extends ConsumerWidget {
  const SearchCategoryPickerView({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
        stream: ref.watch(searchViewModel).selectedCategories,
        builder: (context, snapshot) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: HorizontalSlider(
                  data: _getData(snapshot.data ?? []),
                  height: 40,
                  child: (searchCategory) => FilterChip(
                        label: Text(searchCategory.title),
                        onSelected: (selected) {
                          /*if (snapshot.data?.contains(searchCategory) ??
                              false) {
                            ref
                                .read(searchViewModel)
                                .removeCategory(searchCategory);
                          } else {
                            ref
                                .read(searchViewModel)
                                .addCategory(searchCategory);
                          }*/
                          ref
                              .read(searchViewModel)
                              .updateCategory(searchCategory);
                          ref
                              .read(searchViewModel)
                              .triggerSearchAfterUpdate(null, null);
                        },
                        selected: (snapshot.data ?? []).isNotEmpty
                            ? snapshot.data?.contains(searchCategory) ?? false
                            : true,
                      )));
        });
  }

  List<SearchCategory> _getData(List<SearchCategory> data) {
    List<SearchCategory> searchCategories = [];
    if (index == 2) {
      searchCategories = SearchCategoryExtension.lectureSearch();
    } else {
      searchCategories = SearchCategory.values
          .where((element) => element != SearchCategory.unknown)
          .toList();
    }
    searchCategories.sort((a, b) {
      return data.contains(a) && data.contains(b)
          ? 0
          : data.contains(a)
              ? -1
              : data.contains(b)
                  ? 1
                  : 0;
    });
    return searchCategories;
  }
}
