import 'package:easy_localization/easy_localization.dart';
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
      default:
        return context.tr("unknown");
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
}
