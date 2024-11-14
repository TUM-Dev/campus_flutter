import 'package:campus_flutter/studiesComponent/model/lecture.dart';
import 'package:campus_flutter/studiesComponent/service/lecture_search_service.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:campus_flutter/searchComponent/protocols/global_search.dart';
import 'package:campus_flutter/searchComponent/protocols/search_category_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final lectureSearchViewModel = Provider((ref) => LectureSearchViewModel());

class LectureSearchViewModel implements SearchCategoryViewModel<Lecture> {
  @override
  BehaviorSubject<List<Lecture>?> searchResults = BehaviorSubject.seeded(null);

  @override
  Future search({
    bool forcedRefresh = false,
    required String query,
  }) async {
    return LectureSearchService.fetchLectureSearch(forcedRefresh, query).then(
      (value) {
        final results = GlobalSearch.tokenSearch(query, value.$2);
        if (results == null) {
          searchResults.addError(SearchException.empty(searchQuery: query));
        } else {
          searchResults.add(results);
        }
      },
      onError: (error) => searchResults.addError(error),
    );
  }

  @override
  void clearSearch() {
    searchResults.add(null);
  }
}
