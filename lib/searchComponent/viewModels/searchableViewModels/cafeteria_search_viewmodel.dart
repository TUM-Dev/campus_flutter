import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/services/cafeterias_service.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:campus_flutter/searchComponent/protocols/global_search.dart';
import 'package:campus_flutter/searchComponent/protocols/search_category_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final cafeteriaSearchViewModel = Provider((ref) => CafeteriaSearchViewModel());

class CafeteriaSearchViewModel implements SearchCategoryViewModel<Cafeteria> {
  @override
  BehaviorSubject<List<Cafeteria>?> searchResults = BehaviorSubject.seeded(
    null,
  );

  List<Cafeteria> cafeteriaData = [];

  @override
  Future search({bool forcedRefresh = false, required String query}) async {
    if (cafeteriaData.isEmpty) {
      return CafeteriasService.fetchCafeterias(forcedRefresh).then((value) {
        cafeteriaData = value.$2;
        _search(query);
      }, onError: (error) => searchResults.addError(error));
    } else {
      _search(query);
    }
  }

  void _search(String query) {
    final results = GlobalSearch.tokenSearch(query, cafeteriaData);
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
