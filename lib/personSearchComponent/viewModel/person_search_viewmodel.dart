import 'package:campus_flutter/personSearchComponent/model/person.dart';
import 'package:campus_flutter/personSearchComponent/services/person_search_service.dart';
import 'package:campus_flutter/searchComponent/protocols/search_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class PersonSearchViewModel extends SearchViewModel<Person> {
  @override
  BehaviorSubject<List<Person>?> searchResults = BehaviorSubject.seeded(null);

  Future personSearch(
      {bool forcedRefresh = false, required String query}) async {
    return PersonSearchService.fetchPersons(query, forcedRefresh).then((value) {
      searchResults.add(value.$2);
    }, onError: (error) => searchResults.addError(error));
  }
}
