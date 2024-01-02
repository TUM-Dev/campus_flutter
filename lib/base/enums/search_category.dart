import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/cupertino.dart';

// TODO: setup most logic pre-order of categories
enum SearchCategory {
  /// enums that exist in the Text Classification Model
  cafeterias,
  calendar,
  grade,
  movie,
  news,
  studyRoom,
  unknown,

  /// enums that are not classified but shown in searches
  lectures,
  personalLectures,
  persons,
  rooms;

  factory SearchCategory.fromString(String category) {
    switch (category) {
      case "cafeterias":
        return SearchCategory.cafeterias;
      case "calendar":
        return SearchCategory.calendar;
      case "grade":
        return SearchCategory.grade;
      case "movie":
        return SearchCategory.movie;
      case "news":
        return SearchCategory.news;
      case "studyroom":
        return SearchCategory.studyRoom;
      default:
        return SearchCategory.unknown;
    }
  }
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
