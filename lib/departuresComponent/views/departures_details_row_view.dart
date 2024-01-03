import 'package:campus_flutter/base/helpers/url_launcher.dart';
import 'package:campus_flutter/departuresComponent/model/departure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:campus_flutter/base/extensions/context.dart';

class DeparturesDetailsRowView extends ConsumerWidget {
  const DeparturesDetailsRowView({super.key, required this.departure});

  final Departure departure;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        _lineNumberRectangle(context, ref),
        if (departure.lineInfos != null) _warningButton(context, ref),
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
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }

  Widget _warningButton(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        if (departure.lineInfos != null) {
          if (departure.lineInfos?.element != null) {
            final link = departure
                    .lineInfos?.element?.lineInfo.additionalLinks?[0].linkURL ??
                "";
            UrlLauncher.urlString(link, ref);
          } else if (departure.lineInfos?.array != null) {
            final link =
                departure.lineInfos?.array?[0].additionalLinks?[0].linkURL ??
                    "";
            UrlLauncher.urlString(link, ref);
          }
        }
      },
      child: Row(
        children: [
          const Icon(
            Icons.warning_outlined,
            color: Color(0xffFFCC01),
            size: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.halfPadding),
          ),
        ],
      ),
    );
  }

  Widget get _delayText {
    if (departure.servingLine.delay != null) {
      final delay = departure.servingLine.delay!;
      if (delay > 0) {
        return Text(
          "+${NumberFormat("00").format(delay)}",
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

  Widget timeBuilder(BuildContext context, DateTime dateTime, Color? color) {
    // TODO: walking distance
    if (departure.countdown < 1) {
      return Text(
        context.localizations.now,
        style: TextStyle(color: color, fontWeight: FontWeight.w500),
      );
    } else {
      final hour = NumberFormat("00").format(dateTime.hour);
      final minute = NumberFormat("00").format(dateTime.minute);
      return Text(
        "$hour:$minute",
        style: TextStyle(color: color, fontWeight: FontWeight.w500),
      );
    }
  }
}
