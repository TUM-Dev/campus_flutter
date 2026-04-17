import 'package:campus_flutter/base/extensions/context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EventCreationDateTimeRow extends StatelessWidget {
  const EventCreationDateTimeRow({
    super.key,
    required this.title,
    required this.currentDate,
    required this.onDateSet,
    required this.onTimeOfDaySet,
    required this.showTime,
    this.titleWidth = 44,
  });

  final String title;
  final Stream<DateTime> currentDate;
  final Function(DateTime?) onDateSet;
  final Function(TimeOfDay?) onTimeOfDaySet;
  final bool showTime;
  final double titleWidth;

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  bool _isTomorrow(DateTime date) {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day;
  }

  String _dateLabel(DateTime date, BuildContext context) {
    if (_isToday(date)) return context.tr("today");
    if (_isTomorrow(date)) return context.tr("tomorrow");
    return DateFormat.MMMd(context.locale.languageCode).format(date);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: currentDate,
      builder: (context, snapshot) {
        final date = snapshot.data ?? DateTime.now();

        return Row(
          children: [
            SizedBox(
              width: titleWidth,
              child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
            ),
            Expanded(
              child: _chip(
                label: _dateLabel(date, context),
                onTap: () async => onDateSet(
                  await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: date.isBefore(DateTime.now())
                        ? date
                        : DateTime.now(),
                    lastDate: date.add(const Duration(days: 365)),
                  ),
                ),
                context: context,
              ),
            ),
            if (showTime) ...[
              const SizedBox(width: 8),
              SizedBox(
                width: 84,
                child: _chip(
                  label: DateFormat.Hm(
                    context.locale.languageCode,
                  ).format(date),
                  onTap: () async => onTimeOfDaySet(
                    await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(date),
                    ),
                  ),
                  context: context,
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _chip({
    required String label,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: context.primaryColor.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: context.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
