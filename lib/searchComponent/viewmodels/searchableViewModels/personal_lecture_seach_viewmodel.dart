import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/services/lecture_service.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:campus_flutter/searchComponent/protocols/global_search.dart';
import 'package:campus_flutter/searchComponent/protocols/search_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class PersonalLectureSearchViewModel implements SearchViewModel<Lecture> {
  @override
  BehaviorSubject<List<Lecture>?> searchResults = BehaviorSubject.seeded(null);

  List<Lecture> _personalLectureData = [];

  Future personalLectureSearch({
    bool forcedRefresh = false,
    required String query,
  }) async {
    if (_personalLectureData.isEmpty) {
      return LectureService.fetchLecture(forcedRefresh).then(
        (value) {
          _personalLectureData = value.$2;
          _search(query);
        },
        onError: (error) => searchResults.addError(error),
      );
    } else {
      _search(query);
    }
  }

  void _search(String query) {
    final results = GlobalSearch.tokenSearch(query, _personalLectureData);
    if (results == null) {
      searchResults.addError(SearchException.empty(searchQuery: query));
    } else {
      searchResults.add(results);
    }
  }
}
