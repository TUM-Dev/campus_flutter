import 'package:campus_flutter/gradeComponent/model/grade.dart';
import 'package:campus_flutter/gradeComponent/services/grade_service.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:campus_flutter/searchComponent/protocols/global_search.dart';
import 'package:rxdart/rxdart.dart';

class GradesSearchViewModel {
  BehaviorSubject<List<(Grade, Distances)>?> searchResults =
      BehaviorSubject.seeded(null);

  List<Grade> gradesData = [];

  Future gradesSearch(
      {bool forcedRefresh = false, required String query}) async {
    if (gradesData.isEmpty) {
      return GradeService.fetchGrades(forcedRefresh).then((value) {
        gradesData = value.data;
        _search(query);
      }, onError: (error) => searchResults.addError(error));
    } else {
      return _search(query);
    }
  }

  void _search(String query) {
    final results = GlobalSearch.tokenSearch(query, gradesData);
    if (results == null) {
      searchResults.addError(SearchException.empty(searchQuery: query));
    } else {
      searchResults.add(results);
    }
  }
}
