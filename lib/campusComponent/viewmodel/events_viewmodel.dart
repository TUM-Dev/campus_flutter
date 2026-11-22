import 'package:campus_flutter/campusComponent/model/campus_event.dart';
import 'package:campus_flutter/campusComponent/service/campus_event_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final eventsViewModel = Provider((ref) => EventsViewModel());

const campusHeilbronnName = 'Campus Heilbronn';
const campusHeilbronnUrl = 'https://hn.fs.tum.de/events/';

class EventsViewModel {
  final BehaviorSubject<List<CampusEvent>?> events = BehaviorSubject.seeded(
    null,
  );

  String _languageCode = 'en';

  Future<void> fetch(bool forcedRefresh, {String? languageCode}) async {
    if (languageCode != null) _languageCode = languageCode;
    return CampusEventService.fetchEvents(_languageCode).then(
      (response) => events.add(response),
      onError: (Object error, StackTrace stack) =>
          events.addError(error, stack),
    );
  }
}
