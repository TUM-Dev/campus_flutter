import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/searchComponent/protocols/search_category_viewmodel.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:campus_flutter/placesComponent/viewModels/study_rooms_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/study_room_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/student_club_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/personal_lecture_seach_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/news_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/movie_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/lecture_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/grades_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/calendar_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/cafeteria_search_viewmodel.dart';

import 'dart:async';

import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_preference_service.dart';
import 'package:easy_localization/easy_localization.dart';

import '../helpers/localized_test_app.dart';

import 'package:campus_flutter/base/networking/base/grpc_client.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/base/services/user_preferences_service.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_service.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/campusComponent/viewmodel/movies_viewmodel.dart';
import 'package:campus_flutter/campusComponent/viewmodel/news_viewmodel.dart';
import 'package:campus_flutter/campusComponent/viewmodel/student_club_viewmodel.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/personComponent/viewModel/person_details_viewmodel.dart';
import 'package:campus_flutter/personComponent/viewModel/profile_viewmodel.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeterias_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/navigatum_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/person_search_viewmodel.dart';
import 'package:campus_flutter/studentCardComponent/viewModel/student_card_viewmodel.dart';
import 'package:campus_flutter/studiesComponent/viewModel/grade_viewmodel.dart';
import 'package:campus_flutter/studiesComponent/viewModel/lecture_details_viewmodel.dart';
import 'package:campus_flutter/studiesComponent/viewModel/lecture_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/api_error_fakes.dart';

class _CalendarIntegrationFailure extends CalendarViewModel {
  _CalendarIntegrationFailure(this.failure, this.stack);
  final Object failure;
  final StackTrace stack;
  @override
  Future<void> updateHomeWidget(List<CalendarEvent> events) async =>
      Error.throwWithStackTrace(failure, stack);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const failure = GrpcError.unavailable('original failure');
  final stack = StackTrace.fromString('original network stack');
  late ErrorRestClient rest;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
    getIt.registerSingleton(
      UserPreferencesService(await SharedPreferences.getInstance()),
    );
    rest = ErrorRestClient(failure, stack);
    getIt.registerSingleton<RestClient>(rest);
    getIt.registerSingleton<GrpcClient>(ErrorGrpcClient(failure, stack));
  });
  tearDown(() => getIt.reset());

  void preserved(BehaviorSubject<dynamic> subject) {
    expect(subject.error, same(failure));
    expect(subject.stackTrace.toString(), stack.toString());
    addTearDown(subject.close);
  }

  test(
    'News forwards the original failure to both home and full-screen streams',
    () async {
      final model = NewsViewModel();
      await model.fetch(true);
      preserved(model.news);
      preserved(model.newsBySource);
      addTearDown(model.lastFetched.close);
    },
  );
  test('movies preserve the original exception and stack', () async {
    final model = MovieViewModel();
    await model.fetch(true);
    preserved(model.movies);
    addTearDown(model.lastFetched.close);
  });
  testWidgets('clubs preserve both error channels', (tester) async {
    late BuildContext context;
    await pumpCard(
      tester,
      Builder(
        builder: (value) {
          context = value;
          return const SizedBox();
        },
      ),
    );
    final model = StudentClubViewModel();
    await model.fetchStudentClubs(true, context);
    preserved(model.suggestions);
    preserved(model.collections);
  });
  test('calendar preserves the network failure and stops loading', () async {
    final model = CalendarViewModel();
    await model.fetch(true);
    preserved(model.events);
    expect(model.isLoading.value, isFalse);
    addTearDown(model.isLoading.close);
    addTearDown(model.lastFetched.close);
    addTearDown(model.widgetEvents.close);
    addTearDown(model.integrationErrors.close);
  });
  test(
    'calendar deletion awaits and propagates the exact request failure',
    () async {
      try {
        await CalendarService.deleteCalendarEvent('123');
        fail('Deletion must not report success');
      } catch (error, caughtStack) {
        expect(error, same(failure));
        expect(caughtStack.toString(), contains(stack.toString()));
      }
    },
  );
  test(
    'profile failure also reaches tuition instead of leaving it loading',
    () async {
      final model = ProfileViewModel();
      await model.fetch(true);
      preserved(model.profile);
      preserved(model.tuition);
      addTearDown(model.lastFetched.close);
    },
  );
  test(
    'person details complete their future with the original stream failure',
    () async {
      final model = PersonDetailsViewModel('student*123');
      await model.fetch(true);
      preserved(model.personDetails);
      addTearDown(model.lastFetched.close);
    },
  );
  test(
    'student card preserves the request failure and clears loading',
    () async {
      final model = StudentCardViewModel();
      await model.fetch(true);
      preserved(model.studentCard);
      expect(model.isLoading.value, isFalse);
      addTearDown(model.isLoading.close);
      addTearDown(model.lastFetched.close);
    },
  );
  test('lecture details and lecture lists preserve original errors', () async {
    final detail = LectureDetailsViewModel();
    await detail.fetch(true);
    preserved(detail.lectureDetails);
    addTearDown(detail.lastFetched.close);
    final model = LectureViewModel();
    await model.fetch(true);
    preserved(model.lectures);
    addTearDown(model.lastFetched.close);
  });
  test(
    'grades preserve errors after the optional average-grade fallback',
    () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final model = container.read(gradeViewModel);
      await model.fetch(true);
      preserved(model.studyProgramGrades);
      addTearDown(model.lastFetched.close);
    },
  );
  test('search categories preserve the source exception and stack', () async {
    final rooms = NavigaTumSearchViewModel();
    await rooms.search(query: 'room');
    preserved(rooms.searchResults);
    final people = PersonSearchViewModel();
    await people.search(query: 'person');
    preserved(people.searchResults);
  });
  test(
    'cafeteria menu failure is not returned as data or replaced by TypeError',
    () async {
      final model = CafeteriasViewModel();
      final cafeteria = Cafeteria(
        location: Location(latitude: 48, longitude: 11, address: ''),
        name: 'Mensa',
        id: 'mensa',
        queueStatusApi: null,
        queue: null,
      );
      await expectLater(
        model.fetchCafeteriaMenu(true, cafeteria),
        throwsA(same(failure)),
      );
      await model.widgetCafeteria.close();
      await model.campusCafeterias.close();
    },
  );
  test(
    'empty canteen list produces an empty state without location/menu requests',
    () async {
      rest.response = {'data': []};
      final model = CafeteriasViewModel();
      await model.fetchWidgetCafeteria(true);
      expect(model.widgetCafeteriaLoaded, isTrue);
      expect(model.widgetCafeteria.value, isNull);
      expect(model.widgetCafeteria.hasError, isFalse);
      expect(rest.forcedRefreshValues, [true]);
      await model.widgetCafeteria.close();
      await model.campusCafeterias.close();
    },
  );
  test('optional integration failure retains its cause without replacing calendar data', () async {
    final preferences = await SharedPreferences.getInstance();
    getIt.registerSingleton(CalendarPreferenceService(preferences));
    rest.response = {'event': []};
    final model = _CalendarIntegrationFailure(failure, stack);
    final captured = Completer<(Object, StackTrace)>();
    final subscription = model.integrationErrors.listen(
      (_) {},
      onError: (Object error, StackTrace source) {
        if (!captured.isCompleted) captured.complete((error, source));
      },
    );
    await model.fetch(true);
    final original = await captured.future;
    expect(original.$1, same(failure));
    expect(original.$2.toString(), stack.toString());
    expect(model.events.value, isEmpty);
    expect(model.events.hasError, isFalse);
    await subscription.cancel();
    await model.events.close();
    await model.lastFetched.close();
    await model.widgetEvents.close();
    await model.isLoading.close();
    await model.integrationErrors.close();
  });
  test(
    'every search category preserves its API failure and source stack',
    () async {
      final models = <SearchCategoryViewModel<Searchable>>[
        CafeteriaSearchViewModel(),
        CalendarSearchViewModel(),
        GradesSearchViewModel(),
        LectureSearchViewModel(),
        MovieSearchViewModel(),
        NewsSearchViewModel(),
        PersonalLectureSearchViewModel(),
        StudentClubSearchViewModel(),
        StudyRoomSearchViewModel(),
      ];
      for (final model in models) {
        await model.search(query: 'test');
        preserved(model.searchResults);
      }
    },
  );

  testWidgets(
    'an empty study-room response settles without inventing an error',
    (tester) async {
      late BuildContext context;
      await pumpCard(
        tester,
        Builder(
          builder: (value) {
            context = value;
            return const SizedBox();
          },
        ),
      );
      rest.response = {'raeume': [], 'gruppen': []};
      final model = StudyRoomsViewModel();
      await model.fetchWidgetStudyRooms(true, context);
      expect(model.widgetStudyRoomLoaded, isTrue);
      expect(model.widgetStudyRoom.value, isNull);
      expect(model.widgetStudyRoom.hasError, isFalse);
      await model.widgetStudyRoom.close();
      await model.studyRooms.close();
      await model.campusStudyRooms.close();
    },
  );

  test('empty grade data has no average rather than throwing a new error', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final model = container.read(gradeViewModel);
    model.studyProgramGrades.add({});
    expect(model.getAverageGrade(), isNull);
    addTearDown(model.studyProgramGrades.close);
    addTearDown(model.lastFetched.close);
  });
  test(
    'rendering the news preview does not alter the full-screen news data',
    () async {
      final model = NewsViewModel();
      final all = [
        News(title: 'same'),
        News(title: 'same'),
        News(title: 'other'),
      ];
      model.news.add(all);
      expect(model.latestFiveNews().length, 2);
      expect(all.length, 3);
      expect(model.news.value!.length, 3);
      await model.news.close();
      await model.newsBySource.close();
      await model.lastFetched.close();
    },
  );
}
