import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:rxdart/rxdart.dart';

abstract class SearchCategoryViewModel<T extends Searchable> {
  late BehaviorSubject<List<T>?> searchResults;
}
