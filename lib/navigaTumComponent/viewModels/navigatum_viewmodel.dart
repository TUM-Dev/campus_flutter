import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_entity.dart';
import 'package:campus_flutter/navigaTumComponent/services/navigatum_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final navigaTumViewModel = Provider((ref) => NavigaTumViewModel());

class NavigaTumViewModel {
  BehaviorSubject<List<NavigaTumNavigationEntity>?> searchResults =
      BehaviorSubject.seeded(null);

  BehaviorSubject<List<NavigaTumNavigationEntity>?> mostSearchedResults =
      BehaviorSubject.seeded(null);

  Future search(String searchString, bool forcedRefresh) async {
    if (searchString.isEmpty) {
      searchResults.addError("Empty Search String");
      return;
    }

    return NavigaTumService.search(forcedRefresh, searchString).then(
      (value) {
        searchResults
            .add(value.sections.expand((element) => element.entries).toList());
      },
      onError: (error) => searchResults.addError(error),
    );
  }

  Future mostSearched(String searchString, bool forcedRefresh) async {
    if (searchString.isEmpty) {
      searchResults.addError("Empty Search String");
      return;
    }

    return NavigaTumService.search(forcedRefresh, searchString).then(
      (value) {
        final mostSearchResults =
            value.sections.expand((element) => element.entries).toList();
        mostSearchResults
            .removeWhere((element) => int.tryParse(element.name[0]) == null);
        mostSearchedResults.add(mostSearchResults);
      },
      onError: (error) => searchResults.addError(error),
    );
  }
}
