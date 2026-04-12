import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarSyncService {
  static const _calendarName = "TUM Campus";
  static const _syncMappingKey = "calendar_sync_mapping";
  static const _syncCalendarIdKey = "calendar_sync_calendar_id";

  final DeviceCalendarPlugin _deviceCalendar;
  final SharedPreferences _sharedPreferences;

  CalendarSyncService(this._sharedPreferences)
      : _deviceCalendar = DeviceCalendarPlugin();

  /// Requests calendar permissions from the user.
  /// Returns true if permissions were granted.
  Future<bool> requestPermissions() async {
    var permissionsGranted = await _deviceCalendar.hasPermissions();
    if (permissionsGranted.isSuccess && !(permissionsGranted.data ?? false)) {
      permissionsGranted = await _deviceCalendar.requestPermissions();
    }
    return permissionsGranted.isSuccess && (permissionsGranted.data ?? false);
  }

  /// Checks if calendar permissions are currently granted.
  Future<bool> hasPermissions() async {
    final result = await _deviceCalendar.hasPermissions();
    return result.isSuccess && (result.data ?? false);
  }

  /// Gets or creates the TUM calendar on the device.
  /// Returns the calendar ID or null if it could not be created.
  Future<String?> getOrCreateTumCalendar() async {
    // Check if we have a stored calendar ID that still exists
    final storedId = _sharedPreferences.getString(_syncCalendarIdKey);
    if (storedId != null) {
      final calendarsResult = await _deviceCalendar.retrieveCalendars();
      if (calendarsResult.isSuccess && calendarsResult.data != null) {
        final exists = calendarsResult.data!.any((c) => c.id == storedId);
        if (exists) return storedId;
      }
    }

    // Try to find an existing TUM calendar
    final calendarsResult = await _deviceCalendar.retrieveCalendars();
    if (calendarsResult.isSuccess && calendarsResult.data != null) {
      for (final calendar in calendarsResult.data!) {
        if (calendar.name == _calendarName) {
          _sharedPreferences.setString(_syncCalendarIdKey, calendar.id!);
          return calendar.id;
        }
      }
    }

    // Create a new calendar
    // Note: device_calendar createCalendar may not be available on all platforms
    // On iOS, it creates a local calendar. On Android, it creates under the default account.
    try {
      final result = await _deviceCalendar.createCalendar(
        _calendarName,
        localAccountName: _calendarName,
      );
      if (result.isSuccess && result.data != null) {
        _sharedPreferences.setString(_syncCalendarIdKey, result.data!);
        return result.data;
      }
    } catch (_) {}

    return null;
  }

  /// Syncs the provided TUM calendar events to the device calendar.
  /// Only syncs visible, non-canceled events.
  Future<SyncResult> syncEvents(List<CalendarEvent> events) async {
    final hasPerms = await hasPermissions();
    if (!hasPerms) {
      return SyncResult(synced: 0, failed: 0, deleted: 0, error: "No calendar permissions");
    }

    final calendarId = await getOrCreateTumCalendar();
    if (calendarId == null) {
      return SyncResult(synced: 0, failed: 0, deleted: 0, error: "Could not create TUM calendar");
    }

    final mapping = _loadSyncMapping();
    final visibleEvents = events.where((e) => e.isVisible ?? true).toList();
    final currentTumEventIds = visibleEvents.map((e) => e.id).toSet();

    int synced = 0;
    int failed = 0;
    int deleted = 0;

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
          failed++;
        }
      } catch (_) {
        failed++;
      }
    }

    // Delete events that are no longer in the TUM calendar
    final idsToRemove = <String>[];
    for (final entry in mapping.entries) {
      if (!currentTumEventIds.contains(entry.key)) {
        try {
          await _deviceCalendar.deleteEvent(calendarId, entry.value);
          deleted++;
        } catch (_) {}
        idsToRemove.add(entry.key);
      }
    }
    for (final id in idsToRemove) {
      mapping.remove(id);
    }

    _saveSyncMapping(mapping);

    return SyncResult(synced: synced, failed: failed, deleted: deleted);
  }

  /// Removes the TUM calendar and all synced events from the device.
  Future<void> removeSyncedCalendar() async {
    final calendarId = _sharedPreferences.getString(_syncCalendarIdKey);
    if (calendarId != null) {
      try {
        await _deviceCalendar.deleteCalendar(calendarId);
      } catch (_) {}
    }
    _sharedPreferences.remove(_syncCalendarIdKey);
    _sharedPreferences.remove(_syncMappingKey);
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

  SyncResult({
    required this.synced,
    required this.failed,
    required this.deleted,
    this.error,
  });

  bool get hasError => error != null;
}
