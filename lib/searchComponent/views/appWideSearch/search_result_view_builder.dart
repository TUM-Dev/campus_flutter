import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/resultViews/cafeteria_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/resultViews/calendar_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/resultViews/grade_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/resultViews/lecture_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/resultViews/movie_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/resultViews/navigatum_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/resultViews/news_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/resultViews/person_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/resultViews/personal_lecture_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/resultViews/student_club_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/resultViews/study_room_search_result_view.dart';
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
        return const NewsSearchResultView();
      case SearchCategory.studentClub:
        return const StudentClubSearchResultView();
      case SearchCategory.studyRoom:
        return const StudyRoomSearchResultView();
      case SearchCategory.lectures:
        return const LectureSearchResultView();
      case SearchCategory.personalLectures:
        return const PersonalLectureSearchResultView();
      case SearchCategory.persons:
        return const PersonSearchResultView();
      case SearchCategory.rooms:
        return const NavigaTumSearchResultView();
      default:
        return Container();
    }
  }
}
