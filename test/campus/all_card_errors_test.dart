import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/base/enums/search_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/homeWidget/calendar_widget_view.dart';
import 'package:campus_flutter/homeComponent/view/contactCard/contact_card_error_view.dart';
import 'package:campus_flutter/homeComponent/view/contactCard/tuition_view.dart';
import 'package:campus_flutter/homeComponent/view/departure/departures_widget_view.dart';
import 'package:campus_flutter/homeComponent/viewmodel/departures_viewmodel.dart';
import 'package:campus_flutter/navigaTumComponent/viewModels/navigatum_campus_viewmodel.dart';
import 'package:campus_flutter/personComponent/model/personSearch/person.dart';
import 'package:campus_flutter/personComponent/viewModel/profile_viewmodel.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_data.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeterias_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/study_rooms_viewmodel.dart';
import 'package:campus_flutter/placesComponent/views/campuses/campus_most_searched_view.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/cafeteria_widget_view.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/study_room_widget_view.dart';
import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/person_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/search_result_card_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/localized_test_app.dart';

const failure = GrpcError.unavailable('original card failure');
final sourceStack = StackTrace.fromString('original card stack');

class _Calendar extends CalendarViewModel {
  int calls = 0;
  @override
  Future<void> fetch(bool forcedRefresh) async {
    calls++;
    events.addError(failure, sourceStack);
  }
}

class _Cafeterias extends CafeteriasViewModel {
  int calls = 0;
  bool empty = false;
  @override
  Future<void> fetchWidgetCafeteria(bool forcedRefresh) async {
    calls++;
    if (empty) {
      widgetCafeteriaLoaded = true;
      widgetCafeteria.add(null);
    } else {
      widgetCafeteria.addError(failure, sourceStack);
    }
  }
}

class _Rooms extends StudyRoomsViewModel {
  int calls = 0;
  bool empty = false;
  @override
  Future<void> fetchWidgetStudyRooms(
    bool forcedRefresh,
    BuildContext context,
  ) async {
    calls++;
    if (empty) {
      widgetStudyRoomLoaded = true;
      widgetStudyRoom.add(null);
    } else {
      widgetStudyRoom.addError(failure, sourceStack);
    }
  }
}

class _Departures extends DeparturesViewModel {
  int calls = 0;
  @override
  void findWidgetCampus(bool fetchClosest) {}
  @override
  Future<void> fetch(bool forcedRefresh) async {
    calls++;
    departures.addError(failure, sourceStack);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  void original(WidgetTester tester) {
    final router = tester.widget<ErrorHandlingRouter>(
      find.byType(ErrorHandlingRouter),
    );
    expect(router.error, same(failure));
    expect(router.stackTrace, same(sourceStack));
    expect(find.text('Service temporarily unavailable'), findsOneWidget);
    expect(tester.takeException(), isNull);
  }

  testWidgets('calendar card preserves failure, stack and retry', (
    tester,
  ) async {
    final model = _Calendar();
    addTearDown(() async {
      await model.events.close();
      await model.isLoading.close();
      await model.widgetEvents.close();
      await model.lastFetched.close();
      await model.integrationErrors.close();
    });
    await pumpCard(
      tester,
      ProviderScope(
        overrides: [calendarViewModel.overrideWithValue(model)],
        child: const CalendarHomeWidgetView(),
      ),
    );
    original(tester);
    final before = model.calls;
    await tester.tap(find.byType(TextButton));
    await tester.pump();
    expect(model.calls, before + 1);
  });
  testWidgets('cafeteria card preserves failure, stack and retry', (
    tester,
  ) async {
    final model = _Cafeterias();
    addTearDown(() async {
      await model.widgetCafeteria.close();
      await model.campusCafeterias.close();
    });
    await pumpCard(
      tester,
      ProviderScope(
        overrides: [cafeteriasViewModel.overrideWithValue(model)],
        child: const CafeteriaWidgetView(),
      ),
    );
    original(tester);
    final before = model.calls;
    await tester.tap(find.byType(TextButton));
    await tester.pump();
    expect(model.calls, before + 1);
  });
  testWidgets('study-room card preserves failure, stack and retry', (
    tester,
  ) async {
    final model = _Rooms();
    addTearDown(() async {
      await model.widgetStudyRoom.close();
      await model.studyRooms.close();
      await model.campusStudyRooms.close();
    });
    await pumpCard(
      tester,
      ProviderScope(
        overrides: [studyRoomsViewModel.overrideWithValue(model)],
        child: const StudyRoomWidgetView.closest(),
      ),
    );
    original(tester);
    final before = model.calls;
    await tester.tap(find.byType(TextButton));
    await tester.pump();
    expect(model.calls, before + 1);
  });
  testWidgets('departures card preserves failure, stack and retry', (
    tester,
  ) async {
    final model = _Departures();
    model.departures.addError(failure, sourceStack);
    addTearDown(() async {
      await model.departures.close();
      await model.widgetCampus.close();
      await model.selectedStation.close();
      await model.walkingDistance.close();
      await model.lastFetched.close();
    });
    await pumpCard(
      tester,
      ProviderScope(
        overrides: [departureViewModel.overrideWithValue(model)],
        child: const DeparturesHomeWidget(),
      ),
    );
    original(tester);
    await tester.tap(find.byType(TextButton));
    await tester.pump();
    expect(model.calls, 1);
  });
  testWidgets('contact-card error retains the actual failure and stack', (
    tester,
  ) async {
    await pumpCard(
      tester,
      ContactCardErrorView(
        error: failure,
        stackTrace: sourceStack,
        retry: () {},
      ),
    );
    original(tester);
  });
  testWidgets('tuition failure stops loading and opens the original error', (
    tester,
  ) async {
    final model = ProfileViewModel();
    model.tuition.addError(failure, sourceStack);
    addTearDown(() async {
      await model.tuition.close();
      await model.profile.close();
      await model.lastFetched.close();
    });
    await pumpCard(
      tester,
      ProviderScope(
        overrides: [profileViewModel.overrideWithValue(model)],
        child: const TuitionView(),
      ),
    );
    expect(find.byType(CircularProgressIndicator), findsNothing);
    await tester.tap(find.byType(ListTile));
    await tester.pumpAndSettle();
    original(tester);
  });
  testWidgets('search cards preserve actual errors', (tester) async {
    final model = PersonSearchViewModel();
    model.searchResults.addError(failure, sourceStack);
    addTearDown(model.searchResults.close);
    await pumpCard(
      tester,
      ProviderScope(
        overrides: [personSearchViewModel.overrideWithValue(model)],
        child: SearchResultCardView<PersonSearchViewModel, Person>(
          searchVM: searchViewModel(SearchType.person),
          searchCategoryVM: personSearchViewModel,
          searchCategory: SearchCategory.persons,
          body: (person) => Text(person.firstname),
        ),
      ),
    );
    original(tester);
  });
  testWidgets('most-searched room cards preserve actual errors', (
    tester,
  ) async {
    final model = NavigaTumCampusViewModel(Campus.garching);
    model.mostSearchedResults.addError(failure, sourceStack);
    addTearDown(model.mostSearchedResults.close);
    await pumpCard(
      tester,
      ProviderScope(
        overrides: [
          navigaTumCampusViewModel(Campus.garching).overrideWithValue(model),
        ],
        child: const CampusMostSearchedView(campus: Campus.garching),
      ),
    );
    original(tester);
  });
  testWidgets('empty cafeteria data becomes a settled empty state', (
    tester,
  ) async {
    final model = _Cafeterias()..empty = true;
    addTearDown(() async {
      await model.widgetCafeteria.close();
      await model.campusCafeterias.close();
    });
    await pumpCard(
      tester,
      ProviderScope(
        overrides: [cafeteriasViewModel.overrideWithValue(model)],
        child: const CafeteriaWidgetView(),
      ),
    );
    expect(find.byType(ErrorHandlingRouter), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('noEntriesFound'), findsOneWidget);
  });
  testWidgets('empty study-room data becomes a settled empty state', (
    tester,
  ) async {
    final model = _Rooms()..empty = true;
    addTearDown(() async {
      await model.widgetStudyRoom.close();
      await model.studyRooms.close();
      await model.campusStudyRooms.close();
    });
    await pumpCard(
      tester,
      ProviderScope(
        overrides: [studyRoomsViewModel.overrideWithValue(model)],
        child: const StudyRoomWidgetView.closest(),
      ),
    );
    expect(find.byType(ErrorHandlingRouter), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('noNearFreeStudyRoomsFound'), findsOneWidget);
  });
  testWidgets('a removed saved study-room group does not throw', (
    tester,
  ) async {
    final model = _Rooms()
      ..studyRoomData = StudyRoomData(groups: [], rooms: []);
    model.studyRooms.add({});
    addTearDown(() async {
      await model.widgetStudyRoom.close();
      await model.studyRooms.close();
      await model.campusStudyRooms.close();
    });
    final group = StudyRoomGroup.fromJson({
      'nr': 97,
      'name': 'Removed',
      'sortierung': 0,
      'opening_hours': [],
    });
    await pumpCard(
      tester,
      ProviderScope(
        overrides: [studyRoomsViewModel.overrideWithValue(model)],
        child: StudyRoomWidgetView.group(studyRoomGroup: group),
      ),
    );
    expect(find.text('noNearFreeStudyRoomsFound'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
