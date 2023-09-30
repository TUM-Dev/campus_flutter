import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/services/lecture_search_service.dart';
import 'package:campus_flutter/lectureComponent/services/lecture_service.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:campus_flutter/searchComponent/protocols/global_search.dart';
import 'package:rxdart/rxdart.dart';

class PersonalLectureSearchViewModel {
  BehaviorSubject<List<(Lecture, Distances)>?> personalSearchResults =
      BehaviorSubject.seeded(null);

  List<Lecture> _personalLectureData = [];

  Future personalLectureSearch(
      {bool forcedRefresh = false, required String query}) async {
    if (_personalLectureData.isEmpty) {
      return LectureService.fetchLecture(forcedRefresh).then((value) {
        _personalLectureData = value.$2;
        _search(query);
      }, onError: (error) => personalSearchResults.addError(error));
    } else {
      _search(query);
    }
  }

  void _search(String query) {
    final results = GlobalSearch.tokenSearch(query, _personalLectureData);
    if (results == null) {
      personalSearchResults.addError(SearchException.empty(searchQuery: query));
    } else {
      personalSearchResults.add(results);
    }
  }
}
