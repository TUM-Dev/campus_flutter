import 'package:campus_flutter/placesComponent/views/homeWidget/study_room_widget_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/study_room_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_result_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudyRoomSearchResultView extends ConsumerWidget {
  const StudyRoomSearchResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<StudyRoomSearchViewModel,
        StudyRoomSearchResult>(
      searchCategory: SearchCategory.studyRoom,
      viewModel: studyRoomSearchViewModel,
      body: (studyRoomSearchResult) =>
          StudyRoomWidgetView(studyRoomSearchResult.studyRoomGroup),
    );
  }
}
