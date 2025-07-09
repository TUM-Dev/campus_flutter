import 'package:campus_flutter/placesComponent/views/homeWidget/study_room_widget_view.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/study_room_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/search_result_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudyRoomSearchResultView extends ConsumerWidget {
  const StudyRoomSearchResultView({super.key, required this.searchVM});

  final Provider<SearchViewModel> searchVM;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<
      StudyRoomSearchViewModel,
      StudyRoomSearchResult
    >(
      searchCategory: SearchCategory.studyRoom,
      searchVM: searchVM,
      searchCategoryVM: studyRoomSearchViewModel,
      body: (studyRoomSearchResult) =>
          StudyRoomWidgetView(studyRoomSearchResult.studyRoomGroup),
    );
  }
}
