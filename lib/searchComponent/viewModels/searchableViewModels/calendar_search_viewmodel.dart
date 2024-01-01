import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_service.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:campus_flutter/searchComponent/protocols/global_search.dart';
import 'package:campus_flutter/searchComponent/protocols/search_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final calendarSearchViewModel = Provider((ref) => CalendarSearchViewModel());

class CalendarSearchViewModel implements SearchViewModel<CalendarEvent> {
  @override
  BehaviorSubject<List<CalendarEvent>?> searchResults =
      BehaviorSubject.seeded(null);

  List<CalendarEvent> calendarData = [];

  Future calendarSearch({
    bool forcedRefresh = false,
    required String query,
  }) async {
    if (calendarData.isEmpty) {
      return CalendarService.fetchCalendar(forcedRefresh).then(
        (value) {
          calendarData = _keepEarliestAfterToday(value.$2);
          _search(query);
        },
        onError: (error) => searchResults.addError(error),
      );
    } else {
      _search(query);
    }
  }

  List<CalendarEvent> _keepEarliestAfterToday(List<CalendarEvent> items) {
    DateTime today = DateTime.now().subtract(const Duration(days: 365));
    Map<String, CalendarEvent> earliestDates = {};

    for (var item in items) {
      if (item.startDate.isAfter(today)) {
        if (!earliestDates.containsKey(item.lvNr) ||
            item.startDate
                .isBefore(earliestDates[item.lvNr]?.startDate ?? today)) {
          if (item.lvNr != null) {
            earliestDates[item.lvNr!] = item;
          }
        }
      }
    }

    return earliestDates.values.toList();
  }

  void _search(String query) {
    final results = GlobalSearch.tokenSearch(query, calendarData);
    if (results == null) {
      searchResults.addError(SearchException.empty(searchQuery: query));
    } else {
      searchResults.add(results);
    }
  }
}
