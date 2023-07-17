import 'package:campus_flutter/navigatumComponent/model/navigatum_navigation_entity.dart';
import 'package:campus_flutter/navigatumComponent/services/navigatum_service.dart';
import 'package:rxdart/rxdart.dart';

class NavigaTumViewModel {
  BehaviorSubject<List<NavigaTumNavigationEntity>?> searchResults =
      BehaviorSubject.seeded(null);

  Future search(String searchString, bool forcedRefresh) async {
    if (searchString.isEmpty) {
      searchResults.addError("Empty Search String");
      return;
    }

    return NavigaTumService.search(forcedRefresh, searchString).then((value) {
      searchResults
          .add(value.sections.expand((element) => element.entries).toList());
    }, onError: (error) => searchResults.addError(error));
  }
}
