import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:rxdart/rxdart.dart';

abstract class SearchCategoryViewModel<T extends Searchable> {
  BehaviorSubject<List<T>?> searchResults = BehaviorSubject.seeded(null);

  Future search({bool forcedRefresh = false, required String query});

  void clearSearch();
}
