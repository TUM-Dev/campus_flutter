import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/campusComponent/service/student_club_service.dart';
import 'package:campus_flutter/searchComponent/model/comparison_token.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:campus_flutter/searchComponent/protocols/global_search.dart';
import 'package:campus_flutter/searchComponent/protocols/category_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final studentClubSearchViewModel =
    Provider((ref) => StudentClubSearchViewModel());

class StudentClubSearchViewModel
    implements CategorySearchViewModel<StudentClubSearch> {
  @override
  BehaviorSubject<List<StudentClubSearch>?> searchResults =
      BehaviorSubject.seeded(null);

  List<StudentClubSearch> studentClubData = [];

  Future studentClubSearch({
    bool forcedRefresh = false,
    required String query,
  }) async {
    if (studentClubData.isEmpty) {
      return StudentClubService.fetchStudentClubs(null, forcedRefresh).then(
        (value) {
          studentClubData = value.$2
              .expand((e) => e.clubs)
              .map((e) => StudentClubSearch(e))
              .toList();
          _search(query);
        },
        onError: (error) => searchResults.addError(error),
      );
    } else {
      _search(query);
    }
  }

  void _search(String query) {
    final results = GlobalSearch.tokenSearch(query, studentClubData);
    if (results == null) {
      searchResults.addError(SearchException.empty(searchQuery: query));
    } else {
      searchResults.add(results);
    }
  }
}

class StudentClubSearch extends Searchable {
  final StudentClub studentClub;

  StudentClubSearch(this.studentClub);

  @override
  List<ComparisonToken> get comparisonTokens => [
        ComparisonToken(value: studentClub.name),
      ];
}
