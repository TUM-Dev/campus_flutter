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
    required this.viewModel,
    required this.searchCategory,
  });

  final Provider<SearchViewModel> viewModel;
  final SearchCategory searchCategory;

  @override
  Widget build(BuildContext context) {
    switch (searchCategory) {
      case SearchCategory.grade:
        return GradeSearchResultView(viewModel: viewModel);
      case SearchCategory.cafeterias:
        return CafeteriasSearchResultView(viewModel: viewModel);
      case SearchCategory.calendar:
        return CalendarSearchResultView(viewModel: viewModel);
      case SearchCategory.movie:
        return MovieSearchResultView(viewModel: viewModel);
      case SearchCategory.news:
        return NewsSearchResultView(viewModel: viewModel);
      case SearchCategory.studentClub:
        return StudentClubSearchResultView(viewModel: viewModel);
      case SearchCategory.studyRoom:
        return StudyRoomSearchResultView(viewModel: viewModel);
      case SearchCategory.lectures:
        return LectureSearchResultView(viewModel: viewModel);
      case SearchCategory.personalLectures:
        return PersonalLectureSearchResultView(viewModel: viewModel);
      case SearchCategory.persons:
        return PersonSearchResultView(viewModel: viewModel);
      case SearchCategory.rooms:
        return NavigaTumSearchResultView(viewModel: viewModel);
      default:
        return Container();
    }
  }
}
