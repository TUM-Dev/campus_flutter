import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/cafeteria_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/calendar_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/grade_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/lecture_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/movie_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/person_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/personal_lecture_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/study_room_search_result_view.dart';
import 'package:flutter/material.dart';

class SearchResultViewBuilder extends StatelessWidget {
  const SearchResultViewBuilder(this.searchCategory, {super.key});

  final SearchCategory searchCategory;

  @override
  Widget build(BuildContext context) {
    switch (searchCategory) {
      case SearchCategory.grade:
        return const GradeSearchResultView();
      case SearchCategory.cafeterias:
        return const CafeteriasSearchResultView();
      case SearchCategory.calendar:
        return const CalendarSearchResultView();
      case SearchCategory.movie:
        return const MovieSearchResultView();
      case SearchCategory.news:
        // TODO(Jakob): add news to search after move to gRPC finalised
        return Container();
      case SearchCategory.studyRoom:
        return const StudyRoomSearchResultView();
      case SearchCategory.lectures:
        return const LectureSearchResultView();
      case SearchCategory.personalLectures:
        return const PersonalLectureSearchResultView();
      case SearchCategory.persons:
        return const PersonSearchResultView();
      default:
        return Container();
    }
  }
}
