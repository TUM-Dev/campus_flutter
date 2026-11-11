import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarSyncService {
  static const _calendarName = "TUM Campus";
  static const _syncMappingKey = "calendar_sync_mapping";
  static const _syncCalendarIdKey = "calendar_sync_calendar_id";

  final DeviceCalendarPlugin _deviceCalendar;
  final SharedPreferences _sharedPreferences;

  CalendarSyncService(
    this._sharedPreferences, {
    DeviceCalendarPlugin? deviceCalendar,
  }) : _deviceCalendar = deviceCalendar ?? DeviceCalendarPlugin();

  /// Requests calendar permissions from the user.
  /// Returns true if permissions were granted.
  Future<bool> requestPermissions() async {
    var permissionsGranted = await _deviceCalendar.hasPermissions();
    if (permissionsGranted.isSuccess && !(permissionsGranted.data ?? false)) {
      permissionsGranted = await _deviceCalendar.requestPermissions();
    }
    if (permissionsGranted.hasErrors) throw permissionsGranted;
    return permissionsGranted.isSuccess && (permissionsGranted.data ?? false);
  }

  /// Checks if calendar permissions are currently granted.
  Future<bool> hasPermissions() async {
    final result = await _deviceCalendar.hasPermissions();
    if (result.hasErrors) throw result;
    return result.isSuccess && (result.data ?? false);
  }

  /// Gets or creates the TUM calendar on the device.
  /// Propagates plugin failures with their original result or exception.
  Future<String?> getOrCreateTumCalendar() async {
    final calendars = await _deviceCalendar.retrieveCalendars();
    if (!calendars.isSuccess) throw calendars;
    final storedId = _sharedPreferences.getString(_syncCalendarIdKey);
    if (storedId != null) {
      for (final calendar in calendars.data!) {
        if (calendar.id == storedId) return storedId;
      }
    }
    for (final calendar in calendars.data!) {
      if (calendar.name == _calendarName) {
        if (calendar.id != null) {
          await _sharedPreferences.setString(_syncCalendarIdKey, calendar.id!);
          return calendar.id;
        }
      }
    }
    final result = await _deviceCalendar.createCalendar(
      _calendarName,
      localAccountName: _calendarName,
    );
    if (!result.isSuccess) throw result;
    await _sharedPreferences.setString(_syncCalendarIdKey, result.data!);
    return result.data;
  }

  /// Syncs the provided TUM calendar events to the device calendar.
  /// Only syncs visible, non-canceled events.
  Future<SyncResult> syncEvents(List<CalendarEvent> events) async {
    final hasPerms = await hasPermissions();
    if (!hasPerms) {
      return SyncResult(
        synced: 0,
        failed: 0,
        deleted: 0,
        error: "No calendar permissions",
      );
    }

    final calendarId = await getOrCreateTumCalendar();
    if (calendarId == null) {
      return SyncResult(
        synced: 0,
        failed: 0,
        deleted: 0,
        error: "Could not create TUM calendar",
      );
    }

    final mapping = _loadSyncMapping();
    final visibleEvents = events
        .where((e) => (e.isVisible ?? true) && !e.isCanceled)
        .toList();
    final currentTumEventIds = visibleEvents.map((e) => e.id).toSet();

    int synced = 0;
    int failed = 0;
    int deleted = 0;
    final failures = <({Object error, StackTrace stack})>[];

    // Add or update events
    for (final tumEvent in visibleEvents) {
      try {
        final deviceEventId = mapping[tumEvent.id];
        final event = _mapToDeviceEvent(calendarId, tumEvent, deviceEventId);

        final result = await _deviceCalendar.createOrUpdateEvent(event);
        if (result?.isSuccess == true && result?.data != null) {
          mapping[tumEvent.id] = result!.data!;
          synced++;
        } else {
          throw result ?? StateError('Calendar plugin returned no result');
        }
      } catch (error, stack) {
        failed++;
        failures.add((error: error, stack: stack));
      }
    }

    // Delete events that are no longer in the TUM calendar
    final idsToRemove = <String>[];
    for (final entry in mapping.entries) {
      if (!currentTumEventIds.contains(entry.key)) {
        try {
          final result = await _deviceCalendar.deleteEvent(
            calendarId,
            entry.value,
          );
          if (!result.isSuccess || result.data != true) throw result;
          deleted++;
          idsToRemove.add(entry.key);
        } catch (error, stack) {
          failed++;
          failures.add((error: error, stack: stack));
        }
      }
    }
    for (final id in idsToRemove) {
      mapping.remove(id);
    }

    _saveSyncMapping(mapping);

    return SyncResult(
      synced: synced,
      failed: failed,
      deleted: deleted,
      failures: failures,
    );
  }

  /// Removes the TUM calendar and all synced events from the device.
  Future<void> removeSyncedCalendar() async {
    final calendarId = _sharedPreferences.getString(_syncCalendarIdKey);
    if (calendarId != null) {
      final result = await _deviceCalendar.deleteCalendar(calendarId);
      if (!result.isSuccess || result.data != true) throw result;
    }
    await _sharedPreferences.remove(_syncCalendarIdKey);
    await _sharedPreferences.remove(_syncMappingKey);
  }

  Event _mapToDeviceEvent(
    String calendarId,
    CalendarEvent tumEvent,
    String? existingDeviceEventId,
  ) {
    final local = getLocation('Europe/Berlin');
    final event = Event(
      calendarId,
      eventId: existingDeviceEventId,
      title: tumEvent.title ?? "",
      start: TZDateTime.from(tumEvent.startDate, local),
      end: TZDateTime.from(tumEvent.endDate, local),
      description: tumEvent.description,
      location: tumEvent.locations.isNotEmpty
          ? tumEvent.locations.join(", ")
          : null,
    );
    return event;
  }

  /// Loads the TUM event ID → device calendar event ID mapping.
  Map<String, String> _loadSyncMapping() {
    final raw = _sharedPreferences.getStringList(_syncMappingKey);
    if (raw == null) return {};
    final map = <String, String>{};
    for (final entry in raw) {
      final parts = entry.split("=");
      if (parts.length == 2) {
        map[parts[0]] = parts[1];
      }
    }
    return map;
  }

  /// Saves the mapping as a list of "tumId=deviceId" strings.
  void _saveSyncMapping(Map<String, String> mapping) {
    final list = mapping.entries.map((e) => "${e.key}=${e.value}").toList();
    _sharedPreferences.setStringList(_syncMappingKey, list);
  }
}

class SyncResult {
  final int synced;
  final int failed;
  final int deleted;
  final String? error;
  final List<({Object error, StackTrace stack})> failures;

  SyncResult({
    required this.synced,
    required this.failed,
    required this.deleted,
    this.error,
    this.failures = const [],
  });

  bool get hasError => error != null || failed > 0 || failures.isNotEmpty;
}
