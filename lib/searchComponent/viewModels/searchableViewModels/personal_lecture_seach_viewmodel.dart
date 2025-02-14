import 'package:campus_flutter/studiesComponent/model/lecture.dart';
import 'package:campus_flutter/studiesComponent/service/lecture_service.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:campus_flutter/searchComponent/protocols/global_search.dart';
import 'package:campus_flutter/searchComponent/protocols/search_category_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final personalLectureSearchViewModel = Provider(
  (ref) => PersonalLectureSearchViewModel(),
);

class PersonalLectureSearchViewModel
    implements SearchCategoryViewModel<Lecture> {
  @override
  BehaviorSubject<List<Lecture>?> searchResults = BehaviorSubject.seeded(null);

  List<Lecture> _personalLectureData = [];

  @override
  Future search({bool forcedRefresh = false, required String query}) async {
    if (_personalLectureData.isEmpty) {
      return LectureService.fetchLecture(forcedRefresh).then((value) {
        _personalLectureData = value.$2;
        _search(query);
      }, onError: (error) => searchResults.addError(error));
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

  @override
  void clearSearch() {
    searchResults.add(null);
  }
}
