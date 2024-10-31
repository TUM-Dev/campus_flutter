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
        return GradeSearchResultView(viewModel: searchVM);
      case SearchCategory.cafeterias:
        return CafeteriasSearchResultView(viewModel: searchVM);
      case SearchCategory.calendar:
        return CalendarSearchResultView(viewModel: searchVM);
      case SearchCategory.movie:
        return MovieSearchResultView(viewModel: searchVM);
      case SearchCategory.news:
        return NewsSearchResultView(viewModel: searchVM);
      case SearchCategory.studentClub:
        return StudentClubSearchResultView(viewModel: searchVM);
      case SearchCategory.studyRoom:
        return StudyRoomSearchResultView(viewModel: searchVM);
      case SearchCategory.lectures:
        return LectureSearchResultView(viewModel: searchVM);
      case SearchCategory.personalLectures:
        return PersonalLectureSearchResultView(viewModel: searchVM);
      case SearchCategory.persons:
        return PersonSearchResultView(viewModel: searchVM);
      case SearchCategory.rooms:
        return NavigaTumSearchResultView(viewModel: searchVM);
      default:
        return Container();
    }
  }
}
