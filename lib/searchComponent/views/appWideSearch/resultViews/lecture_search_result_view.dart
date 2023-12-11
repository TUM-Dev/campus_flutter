import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_view.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/lecture_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_result_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LectureSearchResultView extends ConsumerWidget {
  const LectureSearchResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<LectureSearchViewModel, Lecture>(
      searchCategory: SearchCategory.lectures,
      viewModel: lectureSearchViewModel,
      body: (lecture) => LectureView(
        lecture: lecture,
        isSearch: true,
      ),
    );
  }
}
