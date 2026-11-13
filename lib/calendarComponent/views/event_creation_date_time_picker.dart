import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

class EventCreationDateTimeRow extends StatelessWidget {
  const EventCreationDateTimeRow({
    super.key,
    required this.title,
    required this.currentDate,
    required this.onDateSet,
    required this.onTimeOfDaySet,
    required this.showTime,
  });

  final String title;
  final Stream<DateTime> currentDate;
  final Function(DateTime?) onDateSet;
  final Function(TimeOfDay?) onTimeOfDaySet;
  final bool showTime;

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
    return DateFormat.yMMMd(context.locale.languageCode).format(date);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: currentDate,
      builder: (context, snapshot) {
        final date = snapshot.data ?? DateTime.now();

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyMedium),
              Wrap(
                spacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.calendar_today_outlined, size: 18),
                    label: Text(_dateLabel(date, context)),
                    onPressed: () async => onDateSet(
                      await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: date.isBefore(DateTime.now())
                            ? date
                            : DateTime.now(),
                        lastDate: date.add(const Duration(days: 365)),
                      ),
                    ),
                  ),
                  if (showTime)
                    TextButton.icon(
                      icon: const Icon(Icons.access_time_rounded, size: 18),
                      label: Text(
                        DateFormat.Hm(context.locale.languageCode).format(date),
                      ),
                      onPressed: () async => onTimeOfDaySet(
                        await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(date),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
