import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:campus_flutter/studiesComponent/model/lecture.dart';
import 'package:campus_flutter/studiesComponent/view/lecture/lecture_view.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/personal_lecture_seach_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/search_result_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalLectureSearchResultView extends ConsumerWidget {
  const PersonalLectureSearchResultView({super.key, required this.searchVM});

  final Provider<SearchViewModel> searchVM;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<PersonalLectureSearchViewModel, Lecture>(
      searchCategory: SearchCategory.personalLectures,
      searchVM: searchVM,
      searchCategoryVM: personalLectureSearchViewModel,
      body: (lecture) => LectureView(lecture: lecture, isSearch: true),
    );
  }
}
