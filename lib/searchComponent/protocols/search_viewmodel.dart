import 'package:campus_flutter/searchComponent/protocols/global_search.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:rxdart/rxdart.dart';

abstract class SearchViewModel<T extends Searchable> {
  late BehaviorSubject<List<(T, Distances)>?> results;

  Future search({bool forcedRefresh = false, required String query});
}
