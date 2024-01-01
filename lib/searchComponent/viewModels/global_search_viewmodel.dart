import 'package:campus_flutter/base/enums/credentials.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/loginComponent/viewModels/login_viewmodel.dart';
import 'package:campus_flutter/navigaTumComponent/viewModels/navigatum_search_viewmodel.dart';
import 'package:campus_flutter/personSearchComponent/viewModel/person_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/cafeteria_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/calendar_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/grades_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/lecture_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/movie_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/news_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/personal_lecture_seach_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/study_room_search_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final searchViewModel = Provider((ref) => GlobalSearchViewModel(ref));

class GlobalSearchViewModel {
  BehaviorSubject<List<SearchCategory>?> result = BehaviorSubject.seeded(null);
  BehaviorSubject<List<SearchCategory>> selectedCategories =
      BehaviorSubject.seeded([]);

  String searchString = "";

  final Ref ref;

  GlobalSearchViewModel(this.ref);

  void search(String searchString) async {
    if (searchString.isEmpty) {
      clear();
      return;
    }
    this.searchString = searchString;
    if (selectedCategories.value.isEmpty) {
      if (ref.read(loginViewModel).credentials.value == Credentials.tumId) {
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
  }

  void clear() {
    searchString = "";
    result.add(null);
  }

  void triggerSearchAfterUpdate(String? searchString) {
    if (searchString != null) {
      this.searchString = searchString;
    }
    search(this.searchString);
    if (selectedCategories.value.isEmpty) {
      for (var category in SearchCategory.values) {
        _searchTriggerBuilder(searchString, category);
      }
    } else {
      for (var selectedCategory in selectedCategories.value) {
        _searchTriggerBuilder(searchString, selectedCategory);
      }
    }
  }

  void setSearchCategories(int index) {
    final authorized =
        ref.read(loginViewModel).credentials.value == Credentials.tumId;
    switch (index) {
      case 1:
        if (authorized) {
          selectedCategories.add([SearchCategory.grade]);
        } else {
          selectedCategories.add([]);
        }
      case 2:
        if (authorized) {
          selectedCategories
              .add([SearchCategory.personalLectures, SearchCategory.lectures]);
        } else {
          selectedCategories.add([]);
        }
      case 3:
        if (authorized) {
          selectedCategories.add([
            SearchCategory.calendar,
          ]);
        } else {
          selectedCategories.add([]);
        }
      case 4:
        selectedCategories.add([
          SearchCategory.studyRoom,
          SearchCategory.cafeterias,
          SearchCategory.rooms,
        ]);
      default:
        selectedCategories.add([]);
    }
  }

  void _searchTriggerBuilder(
    String? searchString,
    SearchCategory searchCategory,
  ) {
    switch (searchCategory) {
      case SearchCategory.grade:
        ref.read(gradesSearchViewModel).gradesSearch(query: this.searchString);
      case SearchCategory.cafeterias:
        ref
            .read(cafeteriaSearchViewModel)
            .cafeteriaSearch(query: this.searchString);
      case SearchCategory.calendar:
        ref
            .read(calendarSearchViewModel)
            .calendarSearch(query: this.searchString);
      case SearchCategory.movie:
        ref.read(movieSearchViewModel).movieSearch(query: this.searchString);
      case SearchCategory.news:
        ref.read(newsSearchViewModel).newsSearch(query: this.searchString);
      case SearchCategory.studyRoom:
        ref
            .read(studyRoomSearchViewModel)
            .studyRoomSearch(query: this.searchString);
      case SearchCategory.lectures:
        ref
            .read(lectureSearchViewModel)
            .lectureSearch(query: this.searchString);
      case SearchCategory.personalLectures:
        ref
            .read(personalLectureSearchViewModel)
            .personalLectureSearch(query: this.searchString);
      case SearchCategory.persons:
        ref.read(personSearchViewModel).personSearch(query: this.searchString);
      case SearchCategory.rooms:
        ref
            .read(navigaTumSearchViewModel)
            .navigaTumSearch(query: this.searchString);
      default:
        return;
    }
  }
}
