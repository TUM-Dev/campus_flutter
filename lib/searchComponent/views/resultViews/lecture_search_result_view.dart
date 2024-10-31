import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:campus_flutter/studiesComponent/model/lecture.dart';
import 'package:campus_flutter/studiesComponent/view/lecture/lecture_view.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/lecture_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/search_result_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LectureSearchResultView extends ConsumerWidget {
  const LectureSearchResultView({super.key, required this.viewModel});

  final Provider<SearchViewModel> viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<LectureSearchViewModel, Lecture>(
      searchCategory: SearchCategory.lectures,
      searchVM: viewModel,
      searchCategoryVM: lectureSearchViewModel,
      body: (lecture) => LectureView(
        lecture: lecture,
        isSearch: true,
      ),
    );
  }
}
