import 'package:campus_flutter/base/enums/credentials.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/base/enums/search_type.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/navigaTumComponent/viewModels/navigatum_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/person_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/cafeteria_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/calendar_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/grades_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/lecture_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/movie_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/news_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/personal_lecture_seach_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/student_club_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/study_room_search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final searchViewModel = Provider.family<SearchViewModel, (SearchType, String?)>(
  (ref, data) => data.$2 != null
      ? SearchViewModel(ref, searchType: data.$1, searchString: data.$2!)
      : SearchViewModel(ref, searchType: data.$1),
);

class SearchViewModel {
  BehaviorSubject<List<SearchCategory>?> result = BehaviorSubject.seeded(null);
  BehaviorSubject<List<SearchCategory>> selectedCategories =
      BehaviorSubject.seeded([]);

  late final TextEditingController searchTextController;
  final SearchType searchType;
  final Ref ref;

  bool isAuthorized = false;

  SearchViewModel(
    this.ref, {
    required this.searchType,
    String? searchString,
  }) {
    searchTextController = TextEditingController(text: searchString);
    selectedCategories.add(_initialSearchCategories());
    _checkAuthorizationStatus();
    _resetSearchResult();
    triggerSearchAfterUpdate();
  }

  void _checkAuthorizationStatus() {
    isAuthorized =
        ref.read(onboardingViewModel).credentials.value == Credentials.tumId;
  }

  void _resetSearchResult() {
    result.add(null);
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

  void _search() async {
    final searchString = searchTextController.text;
    if (searchString.isEmpty) {
      clear();
      return;
    }
    searchTextController.text = searchString;
    if (selectedCategories.value.isEmpty) {
      if (ref.read(onboardingViewModel).credentials.value ==
          Credentials.tumId) {
        result.add(SearchCategory.values);
      } else {
        result.add(SearchCategoryExtension.unAuthorizedSearch());
      }
    } else {
      result.add(selectedCategories.value);
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
    triggerSearchAfterUpdate();
  }

  void selectSingleCategory(SearchCategory searchCategory) {
    selectedCategories.add([searchCategory]);
    triggerSearchAfterUpdate();
  }

  void clear() {
    searchTextController.clear();
    result.add(null);
  }

  void triggerSearchAfterUpdate() {
    _search();
    if (selectedCategories.value.isEmpty) {
      for (var category in SearchCategory.values) {
        if (isAuthorized) {
          _authorizedSearchTriggerBuilder(category);
        } else {
          _unauthorizedSearchTriggerBuilder(category);
        }
      }
    } else {
      for (var selectedCategory in selectedCategories.value) {
        if (isAuthorized) {
          _authorizedSearchTriggerBuilder(selectedCategory);
        } else {
          _unauthorizedSearchTriggerBuilder(selectedCategory);
        }
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

  void _authorizedSearchTriggerBuilder(SearchCategory searchCategory) {
    final searchString = searchTextController.text;
    switch (searchCategory) {
      case SearchCategory.grade:
        ref.read(gradesSearchViewModel).gradesSearch(query: searchString);
      case SearchCategory.calendar:
        ref.read(calendarSearchViewModel).calendarSearch(query: searchString);
      case SearchCategory.lectures:
        ref.read(lectureSearchViewModel).lectureSearch(query: searchString);
      case SearchCategory.personalLectures:
        ref
            .read(personalLectureSearchViewModel)
            .personalLectureSearch(query: searchString);
      case SearchCategory.persons:
        ref.read(personSearchViewModel).personSearch(query: searchString);
      default:
        _unauthorizedSearchTriggerBuilder(searchCategory);
    }
  }

  void _unauthorizedSearchTriggerBuilder(SearchCategory searchCategory) {
    final searchString = searchTextController.text;
    switch (searchCategory) {
      case SearchCategory.cafeterias:
        ref.read(cafeteriaSearchViewModel).cafeteriaSearch(query: searchString);
      case SearchCategory.movie:
        ref.read(movieSearchViewModel).movieSearch(query: searchString);
      case SearchCategory.news:
        ref.read(newsSearchViewModel).newsSearch(query: searchString);
      case SearchCategory.studentClub:
        ref
            .read(studentClubSearchViewModel)
            .studentClubSearch(query: searchString);
      case SearchCategory.studyRoom:
        ref.read(studyRoomSearchViewModel).studyRoomSearch(query: searchString);
      case SearchCategory.rooms:
        ref.read(navigaTumSearchViewModel).navigaTumSearch(query: searchString);
      default:
        return;
    }
  }
}
