import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCreationDateTimePicker extends StatelessWidget {
  const EventCreationDateTimePicker({
    super.key,
    required this.title,
    required this.currentDate,
    required this.onDateSet,
    required this.onTimeOfDaySet,
  });

  final String title;
  final Stream<DateTime> currentDate;
  final Function(DateTime?) onDateSet;
  final Function(TimeOfDay?) onTimeOfDaySet;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: currentDate,
      builder: (context, snapshot) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: context.padding),
            child: Text(title, style: Theme.of(context).textTheme.titleMedium),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: context.padding),
            child: Card(
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _pickerItem(
                      () async => onDateSet(
                        await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: (snapshot.data ?? DateTime.now()).add(
                            const Duration(days: 365),
                          ),
                        ),
                      ),
                      DateFormat.yMd(
                        "de",
                      ).format(snapshot.data ?? DateTime.now()),
                      context,
                    ),
                    _pickerItem(
                      () async => onTimeOfDaySet(
                        await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                            snapshot.data ?? DateTime.now(),
                          ),
                        ),
                      ),
                      DateFormat.Hm(
                        "de",
                      ).format(snapshot.data ?? DateTime.now()),
                      context,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pickerItem(
    Function() onTap,
    String currentData,
    BuildContext context,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: context.primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(context.halfPadding),
            child: Text(
              currentData,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
