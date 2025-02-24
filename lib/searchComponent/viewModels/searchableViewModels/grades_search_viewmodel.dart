import 'package:campus_flutter/studiesComponent/model/grade.dart';
import 'package:campus_flutter/studiesComponent/service/grade_service.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:campus_flutter/searchComponent/protocols/global_search.dart';
import 'package:campus_flutter/searchComponent/protocols/search_category_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final gradesSearchViewModel = Provider((ref) => GradesSearchViewModel());

class GradesSearchViewModel implements SearchCategoryViewModel<Grade> {
  @override
  BehaviorSubject<List<Grade>?> searchResults = BehaviorSubject.seeded(null);

  List<Grade> gradesData = [];

  @override
  Future search({bool forcedRefresh = false, required String query}) async {
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

  @override
  void clearSearch() {
    searchResults.add(null);
  }
}
