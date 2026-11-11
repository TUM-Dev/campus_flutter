import 'package:campus_flutter/calendarComponent/model/calendar_editing.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_recurrence.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_preference_service.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_addition_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/calendars_view.dart';
import 'package:campus_flutter/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('calendar arithmetic preserves wall time through DST and overnight', () {
    for (final type in [
      RecurrenceType.daily,
      RecurrenceType.weekly,
      RecurrenceType.biweekly,
      RecurrenceType.monthly,
    ]) {
      final start = DateTime(2026, 3, 22, 10);
      final end = DateTime(2026, 3, 23, 11);
      final occurrence = recurrenceOccurrence(start, end, type, 1);
      expect(occurrence.$1.hour, 10);
      expect(occurrence.$2.hour, 11);
      expect(calendarDayDifference(occurrence.$1, occurrence.$2), 1);
    }
    expect(
      recurrenceOccurrence(
        DateTime(2026, 3, 22, 10),
        DateTime(2026, 3, 22, 11),
        RecurrenceType.weekly,
        1,
      ).$1,
      DateTime(2026, 3, 29, 10),
    );
    expect(
      calendarDayDifference(DateTime(2026, 3, 22), DateTime(2026, 3, 30)),
      8,
    );
    expect(
      addCalendarDays(DateTime(2026, 10, 24, 10), 2),
      DateTime(2026, 10, 26, 10),
    );
  });

  test('until date rejects the 21st occurrence and revalidates changes', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    container.read(selectedDate.notifier).state = (
      DateTime(2026, 11, 4, 10),
      null,
    );
    final vm = container.read(calendarAdditionViewModel(null));
    vm.titleController.text = 'Test';
    vm.setRecurrenceType(RecurrenceType.daily);
    vm.setUntilDate(DateTime(2026, 11, 23));
    expect(vm.isValid.value, isTrue);
    expect(vm.generateOccurrences(), hasLength(20));
    vm.setUntilDate(DateTime(2026, 11, 24));
    expect(vm.exceedsOccurrenceLimit, isTrue);
    expect(vm.isValid.value, isFalse);
    vm.setRecurrenceType(RecurrenceType.weekly);
    expect(vm.isValid.value, isTrue);
    vm.setRecurrenceType(RecurrenceType.daily);
    vm.setRecurrenceEndType(RecurrenceEndType.count);
    expect(vm.isValid.value, isTrue);
  });

  test(
    'editing a series without schedule changes preserves gaps and times',
    () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = CalendarPreferenceService(
        await SharedPreferences.getInstance(),
      );
      getIt.registerSingleton<CalendarPreferenceService>(prefs);
      addTearDown(() => getIt.unregister<CalendarPreferenceService>());
      final events = [4, 18, 25]
          .map(
            (day) => CalendarEvent(
              id: '$day',
              status: 'FT',
              title: 'Original',
              startDate: DateTime(2026, 11, day, 10),
              endDate: DateTime(2026, 11, day, 11),
              locations: [],
            ),
          )
          .toList();
      for (final event in events) {
        prefs.saveSeriesId(event.id, 'series');
      }
      final calendar = CalendarViewModel()..events.add(events);
      final container = ProviderContainer(
        overrides: [calendarViewModel.overrideWithValue(calendar)],
      );
      addTearDown(container.dispose);
      final vm = container.read(calendarAdditionViewModel(events.first));
      vm.titleController.text = 'Updated';
      vm.setFromDate(DateTime(2026, 11, 4));
      expect(vm.generateOccurrences().map((date) => date.$1.day), [4, 18, 25]);
      vm.setUntilDate(DateTime(2026, 12, 10));
      expect(vm.generateOccurrences().map((date) => date.$1.day), [4, 18, 25]);
      vm.setRecurrenceType(RecurrenceType.weekly);
      expect(vm.generateOccurrences().map((date) => date.$1.day), [4, 11, 18]);
    },
  );
}
