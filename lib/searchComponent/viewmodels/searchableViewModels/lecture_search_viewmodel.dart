import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/services/lecture_search_service.dart';
import 'package:campus_flutter/lectureComponent/services/lecture_service.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:campus_flutter/searchComponent/protocols/global_search.dart';
import 'package:rxdart/rxdart.dart';

class LectureSearchViewModel {
  BehaviorSubject<List<(Lecture, Distances)>?> searchResults =
      BehaviorSubject.seeded(null);

  Future lectureSearch(
      {bool forcedRefresh = false, required String query}) async {
    return LectureSearchService.fetchLectureSearch(forcedRefresh, query).then(
        (value) {
      final results = GlobalSearch.tokenSearch(query, value.$2);
      if (results == null) {
        searchResults.addError(SearchException.empty(searchQuery: query));
      } else {
        searchResults.add(results);
      }
    }, onError: (error) => searchResults.addError(error));
  }
}
