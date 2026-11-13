import 'package:campus_flutter/homeComponent/model/departure.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeparturesDetailsRowView extends ConsumerWidget {
  const DeparturesDetailsRowView({super.key, required this.departure});

  final Departure departure;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        _lineNumberRectangle(context, ref),
        Expanded(
          child: Text(
            departure.servingLine.direction,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        _delayText,
        const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
        _timeText(context),
      ],
    );
  }

  Widget _lineNumberRectangle(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: departure.servingLine.color,
        ),
        width: 55,
        height: 35,
        child: Center(
          child: Text(
            departure.servingLine.number,
            style: Theme.of(context).textTheme.bodyLarge
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget get _delayText {
    if (departure.servingLine.delay != null) {
      final delay = departure.servingLine.delay!;
      if (delay > 0) {
        return Text(
          "+${delay.toString().padLeft(2, '0')}",
          style: const TextStyle(color: Colors.red),
        );
      }
    }
    return const SizedBox.shrink();
  }

  Widget _timeText(BuildContext context) {
    if (departure.realDateTime != null) {
      final realDateTime = departure.realDateTime!;
      if ((departure.servingLine.delay ?? 0) > 0) {
        return timeBuilder(context, realDateTime, Colors.red);
      } else {
        return timeBuilder(context, realDateTime, Colors.green);
      }
    } else {
      return timeBuilder(context, departure.dateTime, null);
    }
  }

  Widget timeBuilder(BuildContext context, DateTime? dateTime, Color? color) {
    if (departure.countdown < 1) {
      return Text(
        context.tr("now"),
        style: TextStyle(color: color, fontWeight: FontWeight.w500),
      );
    } else {
      final hour = (dateTime?.hour ?? 0).toString().padLeft(2, '0');
      final minute = (dateTime?.minute ?? 0).toString().padLeft(2, '0');
      return Text(
        "$hour:$minute",
        style: TextStyle(color: color, fontWeight: FontWeight.w500),
      );
    }
  }
}
