import 'dart:developer';

import 'package:campus_flutter/calendarComponent/model/calendar_editing.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_preference_service.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_service.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/calendars_view.dart';
import 'package:campus_flutter/base/theme/constants.dart';
import 'package:campus_flutter/main.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

final calendarAdditionViewModel = Provider.autoDispose
    .family<CalendarAdditionViewModel, CalendarEvent?>((ref, calendarEvent) {
      if (calendarEvent != null) {
        return CalendarAdditionViewModel.edit(ref, calendarEvent);
      } else {
        return CalendarAdditionViewModel(ref);
      }
    });

class CalendarAdditionViewModel {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController annotationController = TextEditingController();
  final BehaviorSubject<bool> isValid = BehaviorSubject.seeded(false);
  late final BehaviorSubject<DateTime> from;
  late final BehaviorSubject<DateTime> to;
  final BehaviorSubject<RecurrenceType> recurrenceType = BehaviorSubject.seeded(
    RecurrenceType.none,
  );
  final BehaviorSubject<int> occurrenceCount = BehaviorSubject.seeded(2);
  final BehaviorSubject<RecurrenceEndType> recurrenceEndType =
      BehaviorSubject.seeded(RecurrenceEndType.untilDate);
  late final BehaviorSubject<DateTime> untilDate;
  final BehaviorSubject<Color> selectedColor = BehaviorSubject.seeded(
    primaryLightColor,
  );
  final BehaviorSubject<bool> isSaving = BehaviorSubject.seeded(false);

  static const int maxOccurrences = 20;
  static const _uuid = Uuid();

  String? id;
  String? seriesId;
  CalendarSeriesResolution? resolvedSeries;
  final Ref ref;
  bool _isSaving = false;
  bool get isEditing => id != null;
  bool get isEditingSeries => isEditing && (resolvedSeries?.isSeries ?? false);
  bool get hasRecurrenceEnabled => recurrenceType.value != RecurrenceType.none;
  bool get shouldShowSeriesBanner => isEditing && hasRecurrenceEnabled;
  bool get hasValidTimeFrame => to.value.isAfter(from.value);

  CalendarAdditionViewModel(this.ref) {
    final date = ref.read(selectedDate);
    from = BehaviorSubject.seeded(date.$1 ?? DateTime.now());
    to = BehaviorSubject.seeded(
      (date.$1 ?? DateTime.now()).add(const Duration(hours: 1)),
    );
    untilDate = BehaviorSubject.seeded(
      (date.$1 ?? DateTime.now()).add(const Duration(days: 30)),
    );
    checkValidity();
  }

  CalendarAdditionViewModel.edit(this.ref, CalendarEvent calendarEvent) {
    id = calendarEvent.id;
    resolvedSeries = ref.read(calendarViewModel).resolveSeries(calendarEvent);
    seriesId = resolvedSeries?.seriesId;

    final initialEvent = _resolveInitialEditingEvent(calendarEvent);
    titleController.text = initialEvent.title ?? "";
    annotationController.text = initialEvent.description ?? "";
    from = BehaviorSubject.seeded(initialEvent.startDate);
    to = BehaviorSubject.seeded(initialEvent.endDate);
    untilDate = BehaviorSubject.seeded(
      initialEvent.startDate.add(const Duration(days: 30)),
    );
    final colorPreference = getIt<CalendarPreferenceService>()
        .getColorPreference(calendarEvent.lvNr ?? calendarEvent.id);
    selectedColor.add(colorPreference ?? initialEvent.getColor());

    if (isEditingSeries) {
      _seedSeriesRecurrence();
    }

    checkValidity();
  }

  CalendarEvent _resolveInitialEditingEvent(CalendarEvent fallbackEvent) {
    return resolvedSeries?.siblings.firstOrNull ?? fallbackEvent;
  }

  void _seedSeriesRecurrence() {
    final siblings = resolvedSeries?.siblings ?? const <CalendarEvent>[];
    if (siblings.length < 2) {
      recurrenceType.add(RecurrenceType.none);
      occurrenceCount.add(2);
      recurrenceEndType.add(RecurrenceEndType.count);
      untilDate.add(from.value);
      return;
    }

    recurrenceType.add(_inferRecurrenceType(siblings));
    occurrenceCount.add(siblings.length.clamp(2, maxOccurrences));
    recurrenceEndType.add(RecurrenceEndType.count);
    untilDate.add(siblings.last.startDate);
  }

  RecurrenceType _inferRecurrenceType(List<CalendarEvent> siblings) {
    if (siblings.length < 2) return RecurrenceType.none;

    final first = siblings[0].startDate;
    final second = siblings[1].startDate;
    final dayDelta = DateUtils.dateOnly(
      second,
    ).difference(DateUtils.dateOnly(first)).inDays;

    if (dayDelta == 1) return RecurrenceType.daily;
    if (dayDelta == 7) return RecurrenceType.weekly;
    if (dayDelta == 14) return RecurrenceType.biweekly;

    final nextMonth = _addMonths(first, 1);
    if (nextMonth == second) return RecurrenceType.monthly;

    return RecurrenceType.weekly;
  }

  void setSelectedColor(Color color) {
    selectedColor.add(color);
  }

  void setRecurrenceType(RecurrenceType type) {
    recurrenceType.add(type);
  }

  void setOccurrenceCount(int count) {
    occurrenceCount.add(count.clamp(2, maxOccurrences));
  }

  void setRecurrenceEndType(RecurrenceEndType type) {
    recurrenceEndType.add(type);
  }

  void setUntilDate(DateTime? date) {
    if (date != null) {
      untilDate.add(date);
      checkValidity();
    }
  }

  void setFromDate(DateTime? dateTime) {
    if (dateTime != null) {
      final duration = to.value.difference(from.value);
      final newFrom = DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
        from.value.hour,
        from.value.minute,
      );
      from.add(newFrom);
      to.add(newFrom.add(duration));
      checkValidity();
    }
  }

  void setFromTimeOfDay(TimeOfDay? timeOfDay) {
    if (timeOfDay != null) {
      final duration = to.value.difference(from.value);
      final newFrom = DateTime(
        from.value.year,
        from.value.month,
        from.value.day,
        timeOfDay.hour,
        timeOfDay.minute,
        0,
      );
      from.add(newFrom);
      to.add(newFrom.add(duration));
      checkValidity();
    }
  }

  void setToDate(DateTime? dateTime) {
    if (dateTime != null) {
      final candidate = DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
        to.value.hour,
        to.value.minute,
        0,
      );
      to.add(
        candidate.isAfter(from.value)
            ? candidate
            : from.value.add(const Duration(hours: 1)),
      );
      checkValidity();
    }
  }

  void setToTimeOfDay(TimeOfDay? timeOfDay) {
    if (timeOfDay != null) {
      final candidate = DateTime(
        to.value.year,
        to.value.month,
        to.value.day,
        timeOfDay.hour,
        timeOfDay.minute,
        0,
      );
      to.add(
        candidate.isAfter(from.value)
            ? candidate
            : from.value.add(const Duration(hours: 1)),
      );
      checkValidity();
    }
  }

  List<(DateTime, DateTime)> _generateOccurrences() {
    final type = recurrenceType.value;
    if (type == RecurrenceType.none) {
      return [(from.value, to.value)];
    }

    final endType = recurrenceEndType.value;
    final limit = endType == RecurrenceEndType.untilDate
        ? maxOccurrences
        : occurrenceCount.value;
    final deadline = endType == RecurrenceEndType.untilDate
        ? untilDate.value
        : null;
    final List<(DateTime, DateTime)> dates = [];

    for (int i = 0; i < limit; i++) {
      final DateTime startOffset;
      final DateTime endOffset;

      switch (type) {
        case RecurrenceType.daily:
          startOffset = from.value.add(Duration(days: i));
          endOffset = to.value.add(Duration(days: i));
        case RecurrenceType.weekly:
          startOffset = from.value.add(Duration(days: 7 * i));
          endOffset = to.value.add(Duration(days: 7 * i));
        case RecurrenceType.biweekly:
          startOffset = from.value.add(Duration(days: 14 * i));
          endOffset = to.value.add(Duration(days: 14 * i));
        case RecurrenceType.monthly:
          startOffset = _addMonths(from.value, i);
          endOffset = startOffset.add(to.value.difference(from.value));
        case RecurrenceType.none:
          startOffset = from.value;
          endOffset = to.value;
      }

      if (deadline != null && startOffset.isAfter(deadline)) break;

      dates.add((startOffset, endOffset));
    }

    return dates;
  }

  static DateTime _addMonths(DateTime date, int months) {
    final targetMonth = date.month + months;
    final year = date.year + (targetMonth - 1) ~/ 12;
    final month = (targetMonth - 1) % 12 + 1;
    final lastDay = DateUtils.getDaysInMonth(year, month);
    return DateTime(
      year,
      month,
      date.day.clamp(1, lastDay),
      date.hour,
      date.minute,
    );
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

  void _applyPreferenceSnapshot(
    CalendarPreferenceService preferenceService,
    String eventId,
    _EventPreferenceSnapshot snapshot,
  ) {
    if (snapshot.color != null) {
      preferenceService.saveColorPreference(eventId, snapshot.color!);
    }
    if (snapshot.isVisible != null) {
      preferenceService.saveVisibilityPreference(eventId, snapshot.isVisible!);
    }
    if (snapshot.seriesId != null) {
      preferenceService.saveSeriesId(eventId, snapshot.seriesId!);
    }
  }

  Future<void> _deleteCreatedEvents(
    CalendarPreferenceService preferenceService,
    Iterable<String> eventIds,
  ) async {
    final deletedIds = <String>[];
    for (final eventId in eventIds) {
      try {
        await CalendarService.deleteCalendarEvent(eventId);
        deletedIds.add(eventId);
      } catch (e) {
        log('Failed to clean up created event $eventId: $e');
      }
    }
    if (deletedIds.isNotEmpty) {
      preferenceService.removeEventPreferences(deletedIds);
    }
  }

  Future<void> _restoreOriginalEvents(
    CalendarPreferenceService preferenceService,
    Iterable<CalendarEvent> eventsToRestore,
    Map<String, _EventPreferenceSnapshot> snapshots,
  ) async {
    final restoredOriginalIds = <String>[];

    for (final event in eventsToRestore) {
      try {
        final response = await CalendarService.createCalendarEvent(
          AddedCalendarEvent(
            title: event.title ?? '-',
            annotation: event.description,
            from: event.startDate,
            to: event.endDate,
          ),
        );
        final snapshot = snapshots[event.id];
        if (snapshot != null) {
          _applyPreferenceSnapshot(
            preferenceService,
            response.eventId,
            snapshot,
          );
        }
        restoredOriginalIds.add(event.id);
      } catch (e) {
        log('Failed to restore original event ${event.id}: $e');
      }
    }

    if (restoredOriginalIds.isNotEmpty) {
      preferenceService.removeEventPreferences(restoredOriginalIds);
    }

    if (restoredOriginalIds.length != eventsToRestore.length) {
      throw Exception('Failed to restore the original calendar events.');
    }
  }

  Future<void> saveEvent() async {
    if (_isSaving) return;
    _isSaving = true;
    isSaving.add(true);
    try {
      final preferenceService = getIt<CalendarPreferenceService>();
      final createdEventIds = <String>[];

      if (isEditingSeries) {
        // ── Series edit: update all siblings ──────────────────────────────
        final siblings = resolvedSeries?.siblings ?? const <CalendarEvent>[];
        final occurrences = _generateOccurrences();
        final activeSeriesId = occurrences.length > 1
            ? (seriesId ?? _uuid.v4())
            : null;
        final snapshots = {
          for (final sibling in siblings)
            sibling.id: _capturePreferenceSnapshot(
              preferenceService,
              sibling.id,
            ),
        };
        final deletedIds = <String>[];

        for (final sibling in siblings) {
          try {
            await CalendarService.deleteCalendarEvent(sibling.id);
            deletedIds.add(sibling.id);
          } catch (_) {
            await _restoreOriginalEvents(
              preferenceService,
              siblings.where((sibling) => deletedIds.contains(sibling.id)),
              snapshots,
            );
            throw Exception(
              'Failed to delete ${siblings.length - deletedIds.length} of '
              '${siblings.length} series events. Original events were restored.',
            );
          }
        }

        try {
          for (final (start, end) in occurrences) {
            final response = await CalendarService.createCalendarEvent(
              AddedCalendarEvent(
                title: titleController.text,
                annotation: annotationController.text.isEmpty
                    ? null
                    : annotationController.text,
                from: start,
                to: end,
              ),
            );
            createdEventIds.add(response.eventId);
            if (activeSeriesId != null) {
              preferenceService.saveSeriesId(response.eventId, activeSeriesId);
            }
          }
        } catch (_) {
          await _deleteCreatedEvents(preferenceService, createdEventIds);
          await _restoreOriginalEvents(preferenceService, siblings, snapshots);
          throw Exception(
            'Failed to update the series. Original events were restored.',
          );
        }

        for (
          int index = 0;
          index < createdEventIds.length && index < siblings.length;
          index++
        ) {
          final snapshot = snapshots[siblings[index].id];
          if (snapshot?.isVisible != null) {
            preferenceService.saveVisibilityPreference(
              createdEventIds[index],
              snapshot!.isVisible!,
            );
          }
        }

        preferenceService.removeEventPreferences(
          siblings.map((sibling) => sibling.id),
        );
      } else {
        // ── Single / new event ────────────────────────────────────────────
        final occurrences = _generateOccurrences();
        final newSeriesId = occurrences.length > 1 ? _uuid.v4() : null;
        final originalSnapshot = id != null
            ? _capturePreferenceSnapshot(preferenceService, id!)
            : null;

        try {
          for (final (start, end) in occurrences) {
            final response = await CalendarService.createCalendarEvent(
              AddedCalendarEvent(
                title: titleController.text,
                annotation: annotationController.text.isEmpty
                    ? null
                    : annotationController.text,
                from: start,
                to: end,
              ),
            );
            createdEventIds.add(response.eventId);
            if (newSeriesId != null) {
              preferenceService.saveSeriesId(response.eventId, newSeriesId);
            }
          }
        } catch (_) {
          await _deleteCreatedEvents(preferenceService, createdEventIds);
          throw Exception(
            'Failed to create the event. No changes were applied.',
          );
        }

        if (id != null) {
          try {
            await CalendarService.deleteCalendarEvent(id!);
          } catch (_) {
            await _deleteCreatedEvents(preferenceService, createdEventIds);
            throw Exception(
              'Failed to replace the event. The original event was kept.',
            );
          }

          preferenceService.removeEventPreferences([id!]);
          if (originalSnapshot?.isVisible != null) {
            for (final eventId in createdEventIds) {
              preferenceService.saveVisibilityPreference(
                eventId,
                originalSnapshot!.isVisible!,
              );
            }
          }
        }
      }

      final calendarVm = ref.read(calendarViewModel);
      for (final eventId in createdEventIds) {
        calendarVm.setEventColor(
          eventId,
          selectedColor.value,
          notifyListeners: false,
        );
      }
      if (createdEventIds.isNotEmpty) {
        calendarVm.notifyEventChanges();
      }

      await calendarVm.fetch(true);

      if (createdEventIds.isNotEmpty &&
          calendarVm.events.value?.firstWhereOrNull(
                (e) => e.id == createdEventIds.last,
              ) ==
              null) {
        // Add the first occurrence as a placeholder if not yet fetched
        calendarVm.events.value?.add(
          CalendarEvent(
            id: createdEventIds.last,
            status: "FT",
            title: titleController.text,
            startDate: from.value,
            endDate: to.value,
            locations: [],
            color: selectedColor.value.toARGB32(),
          ),
        );
      }
    } finally {
      _isSaving = false;
      isSaving.add(false);
    }
  }

  void checkValidity() {
    isValid.add(titleController.text.trim().isNotEmpty && hasValidTimeFrame);
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
