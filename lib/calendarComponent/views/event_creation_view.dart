import 'package:campus_flutter/base/errorHandling/error_snackbar.dart';
import 'package:campus_flutter/base/extensions/context.dart';

import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/util/color_picker_view.dart';
import 'package:campus_flutter/base/util/icon_text.dart';
import 'package:campus_flutter/base/util/seperated_list.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_editing.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_addition_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/event_creation_date_time_picker.dart';
import 'package:campus_flutter/calendarComponent/views/event_creation_form_field.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EventCreationScaffold extends ConsumerWidget {
  const EventCreationScaffold({super.key, required this.calendarEvent});

  final CalendarEvent? calendarEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(calendarAdditionViewModel(calendarEvent));

    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
          onPressed: () {
            ref.invalidate(calendarAdditionViewModel(calendarEvent));
            context.pop();
          },
        ),
        title: StreamBuilder<RecurrenceType>(
          stream: vm.recurrenceType,
          builder: (context, snapshot) {
            final hasRecurrence =
                (snapshot.data ?? RecurrenceType.none) != RecurrenceType.none;
            final title = vm.isEditing
                ? context.tr(
                    hasRecurrence ? "editCalendarSeries" : "editCalendarEvent",
                  )
                : context.tr(
                    hasRecurrence
                        ? "createCalendarSeries"
                        : "createCalendarEvent",
                  );

            return Text(title);
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.padding),
            child: StreamBuilder<Color>(
              stream: vm.selectedColor,
              builder: (context, snapshot) {
                return ColorPickerView(
                  color: snapshot.data ?? context.primaryColor,
                  onColorChanged: vm.setSelectedColor,
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: EventCreationView(calendarEvent: calendarEvent)),
          _SubmitBar(calendarEvent: calendarEvent),
        ],
      ),
    );
  }
}

class EventCreationView extends ConsumerWidget {
  const EventCreationView({super.key, required this.calendarEvent});

  final CalendarEvent? calendarEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(calendarAdditionViewModel(calendarEvent));

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: context.halfPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            WidgetFrameView(
              titleWidget: SymbolText.icon(
                iconData: Icons.edit_note_rounded,
                label: context.tr("details"),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              child: Card(
                child: SeparatedList.widgets(
                  widgets: [
                    EventCreationFormField(
                      title: context.tr("title"),
                      controller: vm.titleController,
                      maxLength: 255,
                      maxLines: 1,
                      calendarEvent: calendarEvent,
                    ),
                    EventCreationFormField(
                      title: context.tr("annotation"),
                      controller: vm.annotationController,
                      maxLength: 4000,
                      maxLines: 3,
                      calendarEvent: calendarEvent,
                    ),
                  ],
                ),
              ),
            ),
            _DateTimeCard(calendarEvent: calendarEvent),
            _RecurrenceSection(calendarEvent: calendarEvent),
          ],
        ),
      ),
    );
  }
}

class _SubmitBar extends ConsumerWidget {
  const _SubmitBar({required this.calendarEvent});

  final CalendarEvent? calendarEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(calendarAdditionViewModel(calendarEvent));

    return StreamBuilder(
      stream: vm.isSaving,
      builder: (context, savingSnapshot) {
        final saving = savingSnapshot.data ?? false;

        return StreamBuilder(
          stream: vm.isValid,
          builder: (context, snapshot) {
            return SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (saving)
                    const LinearProgressIndicator()
                  else
                    const Divider(height: 1),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      context.padding,
                      context.halfPadding,
                      context.padding,
                      context.padding,
                    ),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                      ),
                      onPressed: (!saving && (snapshot.data ?? false))
                          ? () => ref
                                .read(calendarAdditionViewModel(calendarEvent))
                                .saveEvent()
                                .then((_) {
                                  if (context.mounted) {
                                    ref.invalidate(calendarAdditionViewModel);
                                    context.canPop()
                                        ? context.pop(true)
                                        : context.go(calendar);
                                  }
                                })
                                .catchError((Object error, StackTrace stack) {
                                  if (context.mounted) {
                                    showErrorSnackBar(
                                      context,
                                      error,
                                      stackTrace: stack,
                                      isMutation: true,
                                    );
                                  }
                                })
                          : null,
                      icon: const Icon(Icons.check_rounded),
                      label: Text(context.tr("submit")),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _DateTimeCard extends ConsumerWidget {
  const _DateTimeCard({required this.calendarEvent});

  final CalendarEvent? calendarEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(calendarAdditionViewModel(calendarEvent));

    return StreamBuilder<RecurrenceType>(
      stream: vm.recurrenceType,
      builder: (context, snapshot) {
        final isRecurring =
            (snapshot.data ?? RecurrenceType.none) != RecurrenceType.none;
        final firstLabel = context.tr(isRecurring ? "start" : "from");
        final secondLabel = context.tr(isRecurring ? "end" : "to");

        return WidgetFrameView(
          titleWidget: SymbolText.icon(
            iconData: Icons.access_time_rounded,
            label: context.tr("timeFrame"),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.padding),
              child: SeparatedList.widgets(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                padded: false,
                widgets: [
                  EventCreationDateTimeRow(
                    title: firstLabel,
                    currentDate: vm.from,
                    onDateSet: vm.setFromDate,
                    onTimeOfDaySet: vm.setFromTimeOfDay,
                    showTime: true,
                  ),
                  EventCreationDateTimeRow(
                    title: secondLabel,
                    currentDate: vm.to,
                    onDateSet: vm.setToDate,
                    onTimeOfDaySet: vm.setToTimeOfDay,
                    showTime: true,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _RecurrenceSection extends ConsumerWidget {
  const _RecurrenceSection({required this.calendarEvent});

  final CalendarEvent? calendarEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(calendarAdditionViewModel(calendarEvent));

    return StreamBuilder<RecurrenceType>(
      stream: vm.recurrenceType,
      builder: (context, snapshot) {
        final type = snapshot.data ?? RecurrenceType.none;
        final isActive = type != RecurrenceType.none;

        return WidgetFrameView(
          titleWidget: SymbolText.icon(
            iconData: Icons.repeat_rounded,
            label: context.tr("recurrence"),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                SwitchListTile(
                  dense: true,
                  title: Text(
                    context.tr("recurrence"),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  value: isActive,
                  onChanged: (on) {
                    vm.setRecurrenceType(
                      on ? RecurrenceType.weekly : RecurrenceType.none,
                    );
                  },
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Padding(
                    padding: EdgeInsets.fromLTRB(
                      context.padding,
                      0,
                      context.padding,
                      context.padding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(height: 1),
                        SizedBox(height: context.padding),
                        _RecurrenceSentence(calendarEvent: calendarEvent),
                        StreamBuilder<bool>(
                          stream: vm.isValid,
                          builder: (context, _) => vm.exceedsOccurrenceLimit
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    context.tr(
                                      "recurrenceLimitExceeded",
                                      args: [
                                        CalendarAdditionViewModel.maxOccurrences
                                            .toString(),
                                      ],
                                    ),
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .error,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                  crossFadeState: isActive
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RecurrenceSentence extends ConsumerWidget {
  const _RecurrenceSentence({required this.calendarEvent});

  final CalendarEvent? calendarEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(calendarAdditionViewModel(calendarEvent));

    return StreamBuilder<RecurrenceType>(
      stream: vm.recurrenceType,
      builder: (context, typeSnapshot) {
        final type = typeSnapshot.data ?? RecurrenceType.weekly;

        String frequencyLabel(RecurrenceType value) => switch (value) {
          RecurrenceType.daily => context.tr("recurrenceDaily"),
          RecurrenceType.weekly => context.tr("recurrenceWeekly"),
          RecurrenceType.biweekly => context.tr("recurrenceBiweekly"),
          RecurrenceType.monthly => context.tr("recurrenceMonthly"),
          _ => "",
        };

        return StreamBuilder<RecurrenceEndType>(
          stream: vm.recurrenceEndType,
          builder: (context, endTypeSnapshot) {
            final endType = endTypeSnapshot.data ?? RecurrenceEndType.count;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      context.tr("repeatEvery"),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _selectorButton(
                        context: context,
                        label: frequencyLabel(type),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            showDragHandle: true,
                            builder: (_) => SafeArea(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  for (final option in [
                                    RecurrenceType.daily,
                                    RecurrenceType.weekly,
                                    RecurrenceType.biweekly,
                                    RecurrenceType.monthly,
                                  ])
                                    ListTile(
                                      title: Text(frequencyLabel(option)),
                                      trailing: option == type
                                          ? Icon(
                                              Icons.check_rounded,
                                              color: context.primaryColor,
                                            )
                                          : null,
                                      onTap: () {
                                        vm.setRecurrenceType(option);
                                        Navigator.pop(context);
                                      },
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: context.halfPadding,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _selectorButton(
                      context: context,
                      label: endType == RecurrenceEndType.count
                          ? context.tr("for")
                          : context.tr("endsOn"),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          showDragHandle: true,
                          builder: (_) => SafeArea(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text(context.tr("for")),
                                  trailing: endType == RecurrenceEndType.count
                                      ? Icon(
                                          Icons.check_rounded,
                                          color: context.primaryColor,
                                        )
                                      : null,
                                  onTap: () {
                                    vm.setRecurrenceEndType(
                                      RecurrenceEndType.count,
                                    );
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text(context.tr("endsOn")),
                                  trailing:
                                      endType == RecurrenceEndType.untilDate
                                      ? Icon(
                                          Icons.check_rounded,
                                          color: context.primaryColor,
                                        )
                                      : null,
                                  onTap: () {
                                    vm.setRecurrenceEndType(
                                      RecurrenceEndType.untilDate,
                                    );
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    if (endType == RecurrenceEndType.count)
                      StreamBuilder<int>(
                        stream: vm.occurrenceCount,
                        builder: (context, countSnapshot) {
                          final count = countSnapshot.data ?? 2;
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _occurrenceCount(
                                context: context,
                                count: count,
                                onDecrement: count > 2
                                    ? () => vm.setOccurrenceCount(count - 1)
                                    : null,
                                onIncrement:
                                    count <
                                        CalendarAdditionViewModel.maxOccurrences
                                    ? () => vm.setOccurrenceCount(count + 1)
                                    : null,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                context.tr("times"),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          );
                        },
                      ),
                    if (endType == RecurrenceEndType.untilDate)
                      StreamBuilder<DateTime>(
                        stream: vm.untilDate,
                        builder: (context, dateSnapshot) {
                          final date =
                              dateSnapshot.data ??
                              DateTime.now().add(const Duration(days: 30));
                          return _selectorButton(
                            context: context,
                            label: DateFormat.yMMMd(context.locale.languageCode)
                                .format(date),
                            onTap: () async {
                              final eventStartDate = DateUtils.dateOnly(
                                vm.from.value,
                              );
                              final initialPickerDate = DateUtils.dateOnly(
                                date.isBefore(eventStartDate)
                                    ? eventStartDate
                                    : date,
                              );
                              final defaultLastDate = DateUtils.dateOnly(
                                DateTime.now().add(const Duration(days: 730)),
                              );
                              final lastPickerDate =
                                  initialPickerDate.isAfter(defaultLastDate)
                                  ? initialPickerDate
                                  : defaultLastDate;
                              final picked = await showDatePicker(
                                context: context,
                                initialDate: initialPickerDate,
                                firstDate: eventStartDate,
                                lastDate: lastPickerDate,
                              );
                              vm.setUntilDate(picked);
                            },
                          );
                        },
                      ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _selectorButton({
    required BuildContext context,
    required String label,
    required VoidCallback onTap,
  }) {
    return TextButton.icon(
      onPressed: onTap,
      iconAlignment: IconAlignment.end,
      icon: const Icon(Icons.expand_more_rounded, size: 20),
      label: Text(label, textAlign: TextAlign.start),
    );
  }

  Widget _occurrenceCount({
    required BuildContext context,
    required int count,
    required VoidCallback? onDecrement,
    required VoidCallback? onIncrement,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onDecrement,
          icon: const Icon(Icons.remove_rounded, size: 20),
        ),
        SizedBox(
          width: 28,
          child: Text(
            "$count",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        IconButton(
          onPressed: onIncrement,
          icon: const Icon(Icons.add_rounded, size: 20),
        ),
      ],
    );
  }
}
