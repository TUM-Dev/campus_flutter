import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:campus_flutter/studiesComponent/model/grade.dart';
import 'package:campus_flutter/studiesComponent/view/grade/grade_view.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/grades_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/search_result_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GradeSearchResultView extends ConsumerWidget {
  const GradeSearchResultView({super.key, required this.viewModel});

  final Provider<SearchViewModel> viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<GradesSearchViewModel, Grade>(
      searchCategory: SearchCategory.grade,
      searchVM: viewModel,
      searchCategoryVM: gradesSearchViewModel,
      body: (grade) => GradeRow(grade: grade),
    );
  }
}
