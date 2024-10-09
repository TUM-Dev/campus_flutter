import 'package:campus_flutter/base/enums/credentials.dart';
import 'package:campus_flutter/base/util/horizontal_slider.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchCategoryPickerView extends ConsumerWidget {
  const SearchCategoryPickerView({super.key, required this.viewModel});

  final Provider<SearchViewModel> viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.watch(viewModel).selectedCategories,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: HorizontalSlider.height(
            data: _getData(snapshot.data ?? [], ref),
            height: 40,
            child: (searchCategory) => InkWell(
              onLongPress: () {
                ref.read(viewModel).selectSingleCategory(searchCategory);
                ref.read(viewModel).triggerSearchAfterUpdate();
              },
              child: FilterChip(
                label: Text(
                  SearchCategoryExtension.localizedEnumTitle(
                    searchCategory,
                    context,
                  ),
                ),
                onSelected: (selected) {
                  ref.read(viewModel).updateCategory(searchCategory);
                  ref.read(viewModel).triggerSearchAfterUpdate();
                },
                selected: (snapshot.data ?? []).isNotEmpty
                    ? snapshot.data?.contains(searchCategory) ?? false
                    : true,
              ),
            ),
          ),
        );
      },
    );
  }

  List<SearchCategory> _getData(List<SearchCategory> data, WidgetRef ref) {
    List<SearchCategory> searchCategories = [];
    if (ref.read(onboardingViewModel).credentials.value == Credentials.tumId) {
      searchCategories = SearchCategory.values.toList();
    } else {
      searchCategories = SearchCategoryExtension.unAuthorizedSearch();
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
