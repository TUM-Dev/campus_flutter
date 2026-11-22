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
      mostSearchedResults.add([]);
      return;
    }

    return NavigaTumService.search(
      forcedRefresh,
      searchString,
      type: 'room',
    ).then(
      (value) {
        final allEntries = value.sections
            .expand((element) => element.entries)
            .where((element) => element.name.isNotEmpty)
            .toList();
        final numberedRooms = allEntries
            .where((element) => int.tryParse(element.name[0]) != null)
            .toList();
        mostSearchedResults.add(
          numberedRooms.isNotEmpty
              ? numberedRooms
              : allEntries.take(10).toList(),
        );
      },
      onError: (Object error, StackTrace stack) =>
          mostSearchedResults.addError(error, stack),
    );
  }
}
