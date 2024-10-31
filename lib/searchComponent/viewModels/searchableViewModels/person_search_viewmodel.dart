import 'package:campus_flutter/personComponent/model/personSearch/person.dart';
import 'package:campus_flutter/personComponent/services/person_search_service.dart';
import 'package:campus_flutter/searchComponent/protocols/search_category_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final personSearchViewModel = Provider((ref) => PersonSearchViewModel());

class PersonSearchViewModel implements SearchCategoryViewModel<Person> {
  @override
  BehaviorSubject<List<Person>?> searchResults = BehaviorSubject.seeded(null);

  Future personSearch({
    bool forcedRefresh = false,
    required String query,
  }) async {
    return PersonSearchService.fetchPersons(query, forcedRefresh).then(
      (value) {
        searchResults.add(value.$2);
      },
      onError: (error) => searchResults.addError(error),
    );
  }
}
