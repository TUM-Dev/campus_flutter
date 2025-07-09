import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_entity.dart';
import 'package:campus_flutter/navigaTumComponent/services/navigatum_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final navigaTumCampusViewModel =
    Provider.family<NavigaTumCampusViewModel, Campus>(
      (ref, campus) => NavigaTumCampusViewModel(campus),
    );

class NavigaTumCampusViewModel {
  BehaviorSubject<List<NavigaTumNavigationEntity>?> mostSearchedResults =
      BehaviorSubject.seeded(null);

  final Campus campus;

  NavigaTumCampusViewModel(this.campus);

  Future mostSearched(bool forcedRefresh) async {
    final searchString = campus.searchStringRooms;
    if (searchString.isEmpty) {
      mostSearchedResults.addError("Empty Search String");
      return;
    }

    return NavigaTumService.search(forcedRefresh, searchString).then((value) {
      final mostSearchResults = value.sections
          .expand((element) => element.entries)
          .toList();
      mostSearchResults.removeWhere(
        (element) => int.tryParse(element.name[0]) == null,
      );
      mostSearchedResults.add(mostSearchResults);
    }, onError: (error) => mostSearchedResults.addError(error));
  }
}
