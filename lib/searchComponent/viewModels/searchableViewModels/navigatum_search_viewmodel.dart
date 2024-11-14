import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_entity.dart';
import 'package:campus_flutter/navigaTumComponent/services/navigatum_search_service.dart';
import 'package:campus_flutter/searchComponent/protocols/search_category_viewmodel.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final navigaTumSearchViewModel = Provider((ref) => NavigaTumSearchViewModel());

class NavigaTumSearchViewModel
    implements SearchCategoryViewModel<NavigaTumNavigationEntity> {
  @override
  BehaviorSubject<List<NavigaTumNavigationEntity>?> searchResults =
      BehaviorSubject.seeded(null);

  @override
  Future search({
    bool forcedRefresh = false,
    required String query,
  }) async {
    if (query.isEmpty) {
      searchResults.add(null);
    } else {
      return NavigaTumSearchService.fetchNavigaTumEntities(query, forcedRefresh)
          .then(
        (value) {
          final rooms = value.$2.sections
                  .firstWhereOrNull((element) => element.type == "rooms")
                  ?.entries ??
              [];
          searchResults.add(rooms);
        },
        onError: (error) => searchResults.addError(error),
      );
    }
  }

  @override
  void clearSearch() {
    searchResults.add(null);
  }
}
