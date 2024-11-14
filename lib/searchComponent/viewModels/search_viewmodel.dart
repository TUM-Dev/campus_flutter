import 'package:campus_flutter/base/enums/credentials.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/base/enums/search_type.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final searchViewModel = Provider.family<SearchViewModel, SearchType>(
  (ref, data) => SearchViewModel(ref, searchType: data),
);

class SearchViewModel {
  BehaviorSubject<List<SearchCategory>?> results = BehaviorSubject.seeded(null);
  BehaviorSubject<List<SearchCategory>> selectedCategories =
      BehaviorSubject.seeded([]);

  late final TextEditingController searchTextController;
  final SearchType searchType;
  final Ref ref;

  bool isAuthorized = false;

  SearchViewModel(
    this.ref, {
    required this.searchType,
  }) {
    searchTextController = TextEditingController();
    selectedCategories.add(_initialSearchCategories());
    _checkAuthorizationStatus();
  }

  void _checkAuthorizationStatus() {
    isAuthorized =
        ref.read(onboardingViewModel).credentials.value == Credentials.tumId;
  }

  List<SearchCategory> _initialSearchCategories() {
    switch (searchType) {
      case SearchType.general:
        return <SearchCategory>[];
      case SearchType.room:
        return [SearchCategory.rooms, SearchCategory.studyRoom];
      case SearchType.person:
        return [SearchCategory.persons];
    }
  }

  void _validateSearch() async {
    if (searchTextController.text.isEmpty) {
      clear();
      return;
    }
    if (selectedCategories.value.isEmpty) {
      if (ref.read(onboardingViewModel).credentials.value ==
          Credentials.tumId) {
        results.add(SearchCategory.values);
      } else {
        results.add(SearchCategoryExtension.unAuthorizedSearch());
      }
    } else {
      results.add(selectedCategories.value);
    }
  }

  void updateCategory(SearchCategory searchCategory) {
    final categories = selectedCategories.value;
    if (selectedCategories.value.contains(searchCategory)) {
      categories.remove(searchCategory);
    } else {
      categories.add(searchCategory);
    }
    selectedCategories.add(categories);
    search();
  }

  void selectSingleCategory(SearchCategory searchCategory) {
    selectedCategories.add([searchCategory]);
    search();
  }

  void clear() {
    _clearCategoryViewModels();
    searchTextController.clear();
    results.add(null);
  }

  void _clearCategoryViewModels() {
    for (var result in results.value ?? <SearchCategory>[]) {
      ref.read(result.viewModel).clearSearch();
    }
  }

  void search({String? searchString}) {
    if (searchString != null) {
      searchTextController.text = searchString;
    }
    _validateSearch();
    if (selectedCategories.value.isEmpty) {
      for (var category in SearchCategory.values) {
        _searchBuilder(category);
      }
    } else {
      for (var selectedCategory in selectedCategories.value) {
        _searchBuilder(selectedCategory);
      }
    }
  }

  void setSearchCategories(int index) {
    switch (index) {
      case 1:
        if (isAuthorized) {
          selectedCategories.add([
            SearchCategory.grade,
            SearchCategory.personalLectures,
            SearchCategory.lectures,
          ]);
        } else {
          selectedCategories.add([]);
        }
      case 2:
        if (isAuthorized) {
          selectedCategories.add([
            SearchCategory.calendar,
          ]);
        } else {
          selectedCategories.add([]);
        }
      case 3:
        selectedCategories.add([
          SearchCategory.news,
          SearchCategory.movie,
          SearchCategory.studentClub,
        ]);
      case 4:
        selectedCategories.add([
          SearchCategory.studyRoom,
          SearchCategory.cafeterias,
          SearchCategory.rooms,
        ]);
      default:
        break;
    }
  }

  void _searchBuilder(SearchCategory searchCategory) {
    final searchString = searchTextController.text;
    ref.read(searchCategory.viewModel).search(query: searchString);
  }
}
