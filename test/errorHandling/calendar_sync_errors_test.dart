import 'dart:collection';

import 'package:campus_flutter/calendarComponent/services/calendar_sync_service.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _CalendarPlugin implements DeviceCalendarPlugin {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
  final permissionResult = Result<bool>()..data = true;
  final deleteResult = Result<bool>()..data = false;
  final createResult = Result<String>();
  Object? createError;
  bool existingCalendar = true;

  @override
  Future<Result<bool>> hasPermissions() async => permissionResult;
  @override
  Future<Result<UnmodifiableListView<Calendar>>> retrieveCalendars() async =>
      Result<UnmodifiableListView<Calendar>>()
        ..data = UnmodifiableListView(
          existingCalendar
              ? [Calendar(id: 'tum', name: 'TUM Campus')]
              : <Calendar>[],
        );
  @override
  Future<Result<String>> createCalendar(
    String? calendarName, {
    Color? calendarColor,
    String? localAccountName,
  }) async {
    if (createError != null) throw createError!;
    return createResult;
  }

  @override
  Future<Result<bool>> deleteEvent(String? calendarId, String? eventId) async =>
      deleteResult;
  @override
  Future<Result<bool>> deleteCalendar(String? calendarId) async => deleteResult;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SharedPreferences preferences;
  late _CalendarPlugin plugin;
  late CalendarSyncService service;
  setUp(() async {
    SharedPreferences.setMockInitialValues({
      'calendar_sync_calendar_id': 'tum',
      'calendar_sync_mapping': ['old=device-old'],
    });
    preferences = await SharedPreferences.getInstance();
    plugin = _CalendarPlugin();
    service = CalendarSyncService(preferences, deviceCalendar: plugin);
  });

  test('plugin permission errors remain the original result', () async {
    plugin.permissionResult.errors.add(
      const ResultError(1, 'original permission failure'),
    );
    await expectLater(
      service.requestPermissions(),
      throwsA(same(plugin.permissionResult)),
    );
  });
  test(
    'thrown calendar creation error is not replaced by a null result',
    () async {
      plugin.existingCalendar = false;
      final error = PlatformException(
        code: 'creation-failure',
        message: 'original',
      );
      plugin.createError = error;
      await expectLater(service.getOrCreateTumCalendar(), throwsA(same(error)));
    },
  );
  test(
    'failed deletion preserves its original error and mapping for a retry',
    () async {
      plugin.deleteResult.errors.add(
        const ResultError(2, 'original deletion failure'),
      );
      final result = await service.syncEvents([]);
      expect(result.failed, 1);
      expect(result.deleted, 0);
      expect(result.hasError, isTrue);
      expect(result.failures.single.error, same(plugin.deleteResult));
      expect(preferences.getStringList('calendar_sync_mapping'), [
        'old=device-old',
      ]);
      plugin.deleteResult.errors.clear();
      plugin.deleteResult.data = true;
      final retry = await service.syncEvents([]);
      expect(retry.deleted, 1);
      expect(retry.hasError, isFalse);
      expect(preferences.getStringList('calendar_sync_mapping'), isEmpty);
    },
  );
  test(
    'failed calendar removal retains cleanup information and actual failure',
    () async {
      await expectLater(
        service.removeSyncedCalendar(),
        throwsA(same(plugin.deleteResult)),
      );
      expect(preferences.getString('calendar_sync_calendar_id'), 'tum');
      expect(preferences.getStringList('calendar_sync_mapping'), [
        'old=device-old',
      ]);
    },
  );
}
