import 'package:campus_flutter/searchComponent/protocols/search_category_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/cafeteria_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/calendar_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/grades_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/lecture_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/movie_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/navigatum_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/news_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/person_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/personal_lecture_seach_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/student_club_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/study_room_search_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SearchCategory {
  cafeterias,
  studyRoom,
  persons,
  rooms,
  calendar,
  lectures,
  personalLectures,
  grade,
  movie,
  news,
  studentClub;
}

extension SearchCategoryExtension on SearchCategory {
  static List<SearchCategory> lectureSearch() {
    return [SearchCategory.personalLectures, SearchCategory.lectures];
  }

  static String localizedEnumTitle(
    SearchCategory searchCategory,
    BuildContext context,
  ) {
    switch (searchCategory) {
      case SearchCategory.cafeterias:
        return context.tr("cafeterias");
      case SearchCategory.calendar:
        return context.tr("calendar");
      case SearchCategory.grade:
        return context.tr("grades");
      case SearchCategory.movie:
        return context.tr("movies");
      case SearchCategory.news:
        return context.tr("news");
      case SearchCategory.studyRoom:
        return context.tr("studyRooms");
      case SearchCategory.lectures:
        return context.tr("lectures");
      case SearchCategory.personalLectures:
        return context.tr("personalLectures");
      case SearchCategory.persons:
        return context.tr("persons");
      case SearchCategory.rooms:
        return context.tr("rooms");
      case SearchCategory.studentClub:
        return "Student Clubs";
    }
  }

  static List<SearchCategory> unAuthorizedSearch() {
    return [
      SearchCategory.studyRoom,
      SearchCategory.rooms,
      SearchCategory.cafeterias,
      SearchCategory.movie,
      SearchCategory.news,
      SearchCategory.studentClub,
    ];
  }

  Provider<SearchCategoryViewModel> get viewModel {
    switch (this) {
      case SearchCategory.cafeterias:
        return cafeteriaSearchViewModel;
      case SearchCategory.calendar:
        return calendarSearchViewModel;
      case SearchCategory.grade:
        return gradesSearchViewModel;
      case SearchCategory.movie:
        return movieSearchViewModel;
      case SearchCategory.news:
        return newsSearchViewModel;
      case SearchCategory.studyRoom:
        return studyRoomSearchViewModel;
      case SearchCategory.lectures:
        return lectureSearchViewModel;
      case SearchCategory.personalLectures:
        return personalLectureSearchViewModel;
      case SearchCategory.persons:
        return personSearchViewModel;
      case SearchCategory.rooms:
        return navigaTumSearchViewModel;
      case SearchCategory.studentClub:
        return studentClubSearchViewModel;
    }
  }
}
