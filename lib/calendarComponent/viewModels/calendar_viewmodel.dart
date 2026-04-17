import 'dart:convert';
import 'dart:developer';

import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_editing.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_preference_service.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_service.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_sync_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/base/services/user_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';
import 'package:rxdart/rxdart.dart';

final calendarViewModel = Provider((ref) => CalendarViewModel());

class CalendarViewModel {
  final BehaviorSubject<List<CalendarEvent>?> events = BehaviorSubject.seeded(
    null,
  );
  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);
  final BehaviorSubject<(List<CalendarEvent>, List<CalendarEvent>)?>
  widgetEvents = BehaviorSubject.seeded(null);

  Future<void> fetch(bool forcedRefresh) async {
    try {
      final response = await CalendarService.fetchCalendar(forcedRefresh);
      lastFetched.add(response.$1);
      response.$2.removeWhere((element) => element.isCanceled);
      getIt<CalendarPreferenceService>().loadPreferences();
      for (var element in response.$2) {
        final eventColor = getIt<CalendarPreferenceService>()
            .getColorPreference(element.lvNr ?? element.id);
        if (eventColor != null) {
          element.setColor(eventColor);
        }

        final eventVisibility = getIt<CalendarPreferenceService>()
            .getVisibilityPreference(element.lvNr ?? element.id);
        if (eventVisibility != null) {
          element.isVisible = eventVisibility;
        }
      }
      events.add(response.$2);
      updateHomeWidget(response.$2);
      _syncToDeviceCalendar(response.$2);
    } catch (error) {
      events.addError(error);
      rethrow;
    }
  }

  Future<void> updateHomeWidget(List<CalendarEvent> calendarEvents) async {
    await HomeWidget.saveWidgetData(
      "calendar",
      jsonEncode(
        calendarEvents
            .where(
              (element) =>
                  (element.isVisible ?? true) &&
                  element.endDate.isAfter(DateTime.now()),
            )
            .toList(),
      ),
    );
    await HomeWidget.saveWidgetData(
      "calendar_save",
      DateTime.now().toIso8601String(),
    );
    await HomeWidget.updateWidget(
      iOSName: "CalendarWidget",
      androidName: "widgets.calendar.CalendarWidgetProvider",
    );
  }

  (CalendarEvent?, List<CalendarEvent>) getWidgetEvents() {
    CalendarEvent? leftColumn;
    List<CalendarEvent> rightColumn = [];

    final filteredEvents =
        events.value
            ?.where(
              (element) =>
                  element.startDate.isAfter(DateTime.now()) &&
                  (element.isVisible ?? true),
            )
            .toList() ??
        [];
    filteredEvents.sort((a, b) => a.startDate.compareTo(b.startDate));
    final currentDate = DateTime.now();
    final currentDay = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
    );

    for (CalendarEvent event in filteredEvents) {
      final dateToCheck = DateTime(
        event.startDate.year,
        event.startDate.month,
        event.startDate.day,
      );
      if (dateToCheck == currentDay && leftColumn == null) {
        leftColumn = event;
      } else if (rightColumn.length < 2 &&
          (rightColumn.firstOrNull == null ||
              rightColumn.first.startDate.isBefore(event.startDate))) {
        rightColumn.add(event);
      } else {
        continue;
      }
    }

    return (leftColumn, rightColumn);
  }

  List<CalendarEvent> getSeriesSiblings(String seriesId) {
    final siblingIds = getIt<CalendarPreferenceService>()
        .getSeriesEventIds(seriesId)
        .toSet();
    return (events.value ?? []).where((e) => siblingIds.contains(e.id)).toList()
      ..sort((a, b) => a.startDate.compareTo(b.startDate));
  }

  int getSeriesEventCount(CalendarEvent event) {
    final seriesId = getIt<CalendarPreferenceService>().getSeriesId(event.id);
    if (seriesId == null) return 1;

    return getIt<CalendarPreferenceService>()
        .getSeriesEventIds(seriesId)
        .length;
  }

  Future<void> deleteCustomCalendarEvent(CalendarEvent event) async {
    await CalendarService.deleteCalendarEvent(event.id);
    getIt<CalendarPreferenceService>().removeEventPreferences([event.id]);
    await fetch(true);
  }

  Future<void> deleteRecurringSeries(CalendarEvent event) async {
    final preferenceService = getIt<CalendarPreferenceService>();
    final seriesId = preferenceService.getSeriesId(event.id);
    if (seriesId == null) {
      await deleteCustomCalendarEvent(event);
      return;
    }

    final eventIdsToDelete = preferenceService.getSeriesEventIds(seriesId);
    final originalEvents = (events.value ?? [])
        .where((calendarEvent) => eventIdsToDelete.contains(calendarEvent.id))
        .toList();
    final snapshots = {
      for (final calendarEvent in originalEvents)
        calendarEvent.id: _capturePreferenceSnapshot(
          preferenceService,
          calendarEvent.id,
        ),
    };

    if (eventIdsToDelete.isEmpty) return;

    final deletedIds = <String>[];
    try {
      for (final eventId in eventIdsToDelete) {
        await CalendarService.deleteCalendarEvent(eventId);
        deletedIds.add(eventId);
      }
    } catch (_) {
      await _restoreDeletedSeriesEvents(
        preferenceService,
        originalEvents.where(
          (calendarEvent) => deletedIds.contains(calendarEvent.id),
        ),
        snapshots,
      );
      await fetch(true);
      rethrow;
    }

    preferenceService.removeEventPreferences(deletedIds);
    await fetch(true);
  }

  _EventPreferenceSnapshot _capturePreferenceSnapshot(
    CalendarPreferenceService preferenceService,
    String eventId,
  ) {
    return _EventPreferenceSnapshot(
      color: preferenceService.getColorPreference(eventId),
      isVisible: preferenceService.getVisibilityPreference(eventId),
      seriesId: preferenceService.getSeriesId(eventId),
    );
  }

  Future<void> _restoreDeletedSeriesEvents(
    CalendarPreferenceService preferenceService,
    Iterable<CalendarEvent> eventsToRestore,
    Map<String, _EventPreferenceSnapshot> snapshots,
  ) async {
    final restoredOriginalIds = <String>[];

    for (final calendarEvent in eventsToRestore) {
      try {
        final response = await CalendarService.createCalendarEvent(
          AddedCalendarEvent(
            title: calendarEvent.title ?? '-',
            annotation: calendarEvent.description,
            from: calendarEvent.startDate,
            to: calendarEvent.endDate,
          ),
        );

        final snapshot = snapshots[calendarEvent.id];
        if (snapshot != null) {
          if (snapshot.color != null) {
            preferenceService.saveColorPreference(
              response.eventId,
              snapshot.color!,
            );
          }
          if (snapshot.isVisible != null) {
            preferenceService.saveVisibilityPreference(
              response.eventId,
              snapshot.isVisible!,
            );
          }
          if (snapshot.seriesId != null) {
            preferenceService.saveSeriesId(
              response.eventId,
              snapshot.seriesId!,
            );
          }
        }
        restoredOriginalIds.add(calendarEvent.id);
      } catch (error) {
        log(
          'Failed to restore deleted series event ${calendarEvent.id}: $error',
        );
      }
    }

    if (restoredOriginalIds.isNotEmpty) {
      preferenceService.removeEventPreferences(restoredOriginalIds);
    }
  }

  void setEventColor(String key, Color color, {bool notifyListeners = true}) {
    getIt<CalendarPreferenceService>().saveColorPreference(key, color);
    final elements = events.value;
    elements?.forEach((element) {
      if (element.lvNr == key || element.id == key) {
        element.setColor(color);
      }
    });
    if (notifyListeners) {
      notifyEventChanges();
    }
  }

  void notifyEventChanges() {
    final elements = events.value;
    events.add(elements);
    updateHomeWidget(elements ?? []);
  }

  void toggleEventVisibility(String key) {
    var preference = getIt<CalendarPreferenceService>().getVisibilityPreference(
      key,
    );

    if (preference != null) {
      preference = !preference;
    } else {
      preference = false;
    }

    getIt<CalendarPreferenceService>().saveVisibilityPreference(
      key,
      preference,
    );

    final elements = events.value;
    elements?.forEach((element) {
      if (element.lvNr == key || element.id == key) {
        element.isVisible = preference;
      }
    });
    events.add(elements);
    updateHomeWidget(events.value ?? []);
  }

  int getTabPreference() {
    return (getIt<UserPreferencesService>().load(UserPreference.calendarTab)
            as int?) ??
        0;
  }

  void saveTabPreference(int currentTab) {
    getIt<UserPreferencesService>().save(
      UserPreference.calendarTab,
      currentTab,
    );
  }

  void resetPreferences() {
    _resetEventColors();
    _resetVisibility();
  }

  void _resetEventColors() {
    final elements = events.value;
    elements?.forEach((element) => element.setColor(null));
    events.add(elements);
    updateHomeWidget(events.value ?? []);
  }

  void _resetVisibility() {
    final elements = events.value;
    elements?.forEach((element) => element.setColor(null));
    events.add(elements);
    updateHomeWidget(events.value ?? []);
  }

  Future<void> _syncToDeviceCalendar(List<CalendarEvent> calendarEvents) async {
    final isSyncEnabled =
        getIt<UserPreferencesService>().load(UserPreference.calendarSync)
            as bool? ??
        false;
    if (!isSyncEnabled) return;

    final syncService = getIt<CalendarSyncService>();
    await syncService.syncEvents(calendarEvents);
  }

  Future<bool> enableCalendarSync() async {
    final syncService = getIt<CalendarSyncService>();
    final granted = await syncService.requestPermissions();
    if (!granted) return false;

    getIt<UserPreferencesService>().save(UserPreference.calendarSync, true);

    // Trigger an initial sync with current events
    final currentEvents = events.value;
    if (currentEvents != null) {
      await syncService.syncEvents(currentEvents);
    }
    return true;
  }

  Future<void> disableCalendarSync() async {
    getIt<UserPreferencesService>().save(UserPreference.calendarSync, false);
    final syncService = getIt<CalendarSyncService>();
    await syncService.removeSyncedCalendar();
  }
}

class _EventPreferenceSnapshot {
  final Color? color;
  final bool? isVisible;
  final String? seriesId;

  const _EventPreferenceSnapshot({
    required this.color,
    required this.isVisible,
    required this.seriesId,
  });
}
