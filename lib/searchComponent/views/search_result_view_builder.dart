import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/cafeteria_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/calendar_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/grade_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/lecture_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/movie_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/navigatum_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/news_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/person_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/personal_lecture_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/student_club_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/study_room_search_result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultViewBuilder extends StatelessWidget {
  const SearchResultViewBuilder({
    super.key,
    required this.searchVM,
    required this.searchCategory,
  });

  final Provider<SearchViewModel> searchVM;
  final SearchCategory searchCategory;

  @override
  Widget build(BuildContext context) {
    switch (searchCategory) {
      case SearchCategory.grade:
        return GradeSearchResultView(searchVM: searchVM);
      case SearchCategory.cafeterias:
        return CafeteriasSearchResultView(searchVM: searchVM);
      case SearchCategory.calendar:
        return CalendarSearchResultView(searchVM: searchVM);
      case SearchCategory.movie:
        return MovieSearchResultView(searchVM: searchVM);
      case SearchCategory.news:
        return NewsSearchResultView(searchVM: searchVM);
      case SearchCategory.studentClub:
        return StudentClubSearchResultView(searchVM: searchVM);
      case SearchCategory.studyRoom:
        return StudyRoomSearchResultView(searchVM: searchVM);
      case SearchCategory.lectures:
        return LectureSearchResultView(searchVM: searchVM);
      case SearchCategory.personalLectures:
        return PersonalLectureSearchResultView(searchVM: searchVM);
      case SearchCategory.persons:
        return PersonSearchResultView(searchVM: searchVM);
      case SearchCategory.rooms:
        return NavigaTumSearchResultView(searchVM: searchVM);
      default:
        return Container();
    }
  }
}
