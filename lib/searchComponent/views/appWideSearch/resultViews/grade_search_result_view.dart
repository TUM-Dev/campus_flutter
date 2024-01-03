import 'package:campus_flutter/gradeComponent/model/grade.dart';
import 'package:campus_flutter/gradeComponent/views/grade_view.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/grades_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_result_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GradeSearchResultView extends ConsumerWidget {
  const GradeSearchResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<GradesSearchViewModel, Grade>(
      searchCategory: SearchCategory.grade,
      viewModel: gradesSearchViewModel,
      body: (grade) => GradeRow(grade: grade),
    );
  }
}
