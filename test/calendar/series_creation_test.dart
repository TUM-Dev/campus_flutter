import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_endpoint.dart';
import 'package:campus_flutter/base/networking/base/api_response.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/networking/protocols/api_exception.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_editing.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_preference_service.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_addition_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/calendars_view.dart';
import 'package:campus_flutter/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _CreationClient implements RestClient {
  final created = <CalendarEvent>[];

  @override
  Future<ApiResponse<T>>
  getWithException<T, S extends Api, U extends ApiException>(
    S endpoint,
    dynamic Function(Map<String, dynamic>) createObject,
    dynamic Function(Map<String, dynamic>) createError,
    bool forcedRefresh,
  ) async {
    final request =
        (endpoint as TumOnlineApi).tumOnlineEndpoint
            as TumOnlineEndpointEventCreate;
    final id = 'event-${created.length}';
    created.add(
      CalendarEvent(
        id: id,
        status: 'FT',
        title: request.title,
        startDate: TumOnlineApi.dateFormat.parse(request.from),
        endDate: TumOnlineApi.dateFormat.parse(request.to),
        locations: [],
      ),
    );
    return ApiResponse(
      data: createObject({
        'termin': {'nr': id},
      }),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _PartialRefreshCalendar extends CalendarViewModel {
  _PartialRefreshCalendar(this.client, this.visibleIds);
  final _CreationClient client;
  final Set<String> visibleIds;

  @override
  Future<void> fetch(bool forcedRefresh) async {
    events.add(client.created.where((e) => visibleIds.contains(e.id)).toList());
  }

  @override
  Future<void> updateHomeWidget(List<CalendarEvent> calendarEvents) async {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  for (final visibleIds in <Set<String>>[
    {'event-0'},
    {'event-0', 'event-2'},
    {'event-0', 'event-1', 'event-2'},
    {},
  ]) {
    test(
      'series retains correct dates after refresh containing $visibleIds',
      () async {
        SharedPreferences.setMockInitialValues({});
        final preferences = CalendarPreferenceService(
          await SharedPreferences.getInstance(),
        );
        final client = _CreationClient();
        getIt.registerSingleton<CalendarPreferenceService>(preferences);
        getIt.registerSingleton<RestClient>(client);
        addTearDown(() async {
          await getIt.unregister<RestClient>();
          await getIt.unregister<CalendarPreferenceService>();
        });
        final calendar = _PartialRefreshCalendar(client, visibleIds);
        final container = ProviderContainer(
          overrides: [calendarViewModel.overrideWithValue(calendar)],
        );
        addTearDown(container.dispose);
        container.read(selectedDate.notifier).state = (
          DateTime(2026, 11, 4, 10),
          null,
        );
        final vm = container.read(calendarAdditionViewModel(null));
        vm.titleController.text = 'Weekly series';
        vm.setRecurrenceType(RecurrenceType.weekly);
        vm.setRecurrenceEndType(RecurrenceEndType.count);
        vm.setOccurrenceCount(3);

        await vm.saveEvent();

        // The server receives exactly one creation request for each date.
        expect(client.created.map((e) => e.startDate), [
          DateTime(2026, 11, 4, 10),
          DateTime(2026, 11, 11, 10),
          DateTime(2026, 11, 18, 10),
        ]);
        final displayed = [...calendar.events.value!]
          ..sort((a, b) => a.id.compareTo(b.id));
        expect(displayed.map((e) => e.id), ['event-0', 'event-1', 'event-2']);
        expect(
          displayed.map((e) => e.startDate),
          client.created.map((e) => e.startDate),
        );
        expect(
          displayed.map((e) => e.endDate),
          client.created.map((e) => e.endDate),
        );
        // BehaviorSubject subscribers receive the merged list, too.
        expect(await calendar.events.first, same(calendar.events.value));
      },
    );
  }
}
