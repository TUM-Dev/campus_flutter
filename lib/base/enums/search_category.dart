import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/cupertino.dart';

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
  news;
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
        return context.localizations.cafeterias;
      case SearchCategory.calendar:
        return context.localizations.calendar;
      case SearchCategory.grade:
        return context.localizations.grades;
      case SearchCategory.movie:
        return context.localizations.movies;
      case SearchCategory.news:
        return context.localizations.news;
      case SearchCategory.studyRoom:
        return context.localizations.studyRooms;
      case SearchCategory.lectures:
        return context.localizations.lectures;
      case SearchCategory.personalLectures:
        return context.localizations.personalLectures;
      case SearchCategory.persons:
        return context.localizations.persons;
      case SearchCategory.rooms:
        return context.localizations.rooms;
      default:
        return context.localizations.unknown;
    }
  }

  static List<SearchCategory> unAuthorizedSearch() {
    return [
      SearchCategory.studyRoom,
      SearchCategory.rooms,
      SearchCategory.cafeterias,
      SearchCategory.movie,
      SearchCategory.news,
    ];
  }
}
