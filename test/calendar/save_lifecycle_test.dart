import 'package:intl/date_symbol_data_local.dart';

import 'dart:async';

import 'package:campus_flutter/base/networking/base/api_response.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/networking/protocols/api_exception.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_editing.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_preference_service.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_addition_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client implements RestClient {
  final pending = Completer<CalendarCreationConfirmationData>();
  @override
  Future<ApiResponse<T>>
  getWithException<T, S extends Api, U extends ApiException>(
    S endpoint,
    dynamic Function(Map<String, dynamic>) createObject,
    dynamic Function(Map<String, dynamic>) createError,
    bool forcedRefresh,
  ) async => ApiResponse(data: await pending.future as T);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _Calendar extends CalendarViewModel {
  int refreshes = 0;
  @override
  Future<void> fetch(bool forcedRefresh) async {
    refreshes++;
  }

  @override
  void notifyEventChanges() {}
}

void main() {
  setUpAll(() => initializeDateFormatting('en'));
  TestWidgetsFlutterBinding.ensureInitialized();
  for (final fail in [false, true]) {
    test(
      'save ${fail ? 'failure' : 'success'} survives closing the form',
      () async {
        SharedPreferences.setMockInitialValues({});
        final preferences = CalendarPreferenceService(
          await SharedPreferences.getInstance(),
        );
        final client = _Client();
        getIt.registerSingleton<CalendarPreferenceService>(preferences);
        getIt.registerSingleton<RestClient>(client);
        addTearDown(() async {
          await getIt.unregister<RestClient>();
          await getIt.unregister<CalendarPreferenceService>();
        });
        final calendar = _Calendar();
        final container = ProviderContainer(
          overrides: [calendarViewModel.overrideWithValue(calendar)],
        );
        addTearDown(container.dispose);
        final provider = calendarAdditionViewModel(null);
        final subscription = container.listen(provider, (_, _) {});
        final model = subscription.read();
        model.titleController.text = 'Saved after closing';
        // Observe disposal separately from the network completion.
        final observer = container.listen(provider, (_, _) {});
        final save = model.saveEvent();
        subscription.close();
        observer.close();
        await container.pump();
        expect(container.read(provider.exists), isTrue);
        if (fail) {
          final assertion = expectLater(save, throwsException);
          client.pending.completeError(Exception('server unavailable'));
          await assertion;
        } else {
          client.pending.complete(
            CalendarCreationConfirmationData(
              calendarCreationConfirmation: CalendarCreationConfirmation(
                eventId: '123',
              ),
            ),
          );
          await save;
          expect(calendar.refreshes, 1);
          expect(
            preferences.getColorPreference('123'),
            model.selectedColor.value,
          );
        }
        await container.pump();
        expect(container.read(provider.exists), isFalse);
        expect(model.isSaving.value, isFalse);
      },
    );
  }
}
