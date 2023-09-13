import 'package:campus_flutter/base/helpers/horizontal_slider.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/searchComponent/viewmodels/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/cafeteria_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/calendar_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/grade_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/lecture_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/movie_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/resultViews/study_room_search_result_view.dart';
import 'package:campus_flutter/searchComponent/views/search_textfield_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchView extends ConsumerWidget {
  SearchView({super.key, required this.index, required this.showContent});

  final TextEditingController textEditingController = TextEditingController();

  final bool showContent;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Container(
      color: Theme.of(context).canvasColor,
      child: showContent
          ? Column(mainAxisSize: MainAxisSize.min, children: [
              SearchTextField(
                textEditingController: textEditingController,
                index: index,
              ),
              if (index == 0) _categoryChooser(ref),
              _search(ref)
            ]) //)
          : Container(),
    ));
  }

  Widget _search(WidgetRef ref) {
    return Expanded(
        child: StreamBuilder(
            stream: ref.watch(searchViewModel).result,
            builder: (context, snapshot) {
              if (!snapshot.hasData && textEditingController.text.isEmpty) {
                return const Center(child: Text("Enter a Query to Start"));
              } else {
                return OrientationBuilder(builder: (context, orientation) {
                  if (orientation == Orientation.landscape) {
                    return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      children: [
                        for (var result in snapshot.data ??
                            const Iterable<SearchCategory>.empty())
                          _searchResultViewBuilder(result),
                      ],
                    );
                  } else {
                    return Scrollbar(
                        child: SingleChildScrollView(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                          for (var result in snapshot.data ??
                              const Iterable<SearchCategory>.empty())
                            _searchResultViewBuilder(result),
                        ])));
                  }
                });
              }
            }));
  }

  Widget _categoryChooser(WidgetRef ref) {
    return StreamBuilder(
        stream: ref.watch(searchViewModel).selectedCategories,
        builder: (context, snapshot) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: HorizontalSlider(
                  data: SearchCategory.values
                      .where((element) => element != SearchCategory.unknown)
                      .toList(),
                  height: 40,
                  child: (searchCategory) => FilterChip(
                        label: Text(searchCategory.title),
                        onSelected: (selected) {
                          if (snapshot.data?.contains(searchCategory) ??
                              false) {
                            ref
                                .read(searchViewModel)
                                .removeCategory(searchCategory);
                          } else {
                            ref
                                .read(searchViewModel)
                                .addCategory(searchCategory);
                          }
                          ref
                              .read(searchViewModel)
                              .triggerSearchAfterUpdate(null, null);
                        },
                        selected: (snapshot.data ?? []).isNotEmpty
                            ? snapshot.data?.contains(searchCategory) ?? false
                            : true,
                      )));
        });
  }
}

Widget _searchResultViewBuilder(SearchCategory searchCategory) {
  switch (searchCategory) {
    case SearchCategory.grade:
      return const GradeSearchResultView();
    case SearchCategory.cafeterias:
      return const CafeteriasSearchResultView();
    case SearchCategory.calendar:
      return const CalendarSearchResultView();
    case SearchCategory.movie:
      return const MovieSearchResultView();
    case SearchCategory.news:
      // TODO:
      return Container();
    case SearchCategory.studyRoom:
      return const StudyRoomSearchResultView();
    case SearchCategory.lectures:
      return const LectureSearchResultView();
    case SearchCategory.persons:
      // TODO:
      return Container();
    default:
      return Container();
  }
}
