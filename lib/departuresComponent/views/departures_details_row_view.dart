import 'package:campus_flutter/base/helpers/url_launcher.dart';
import 'package:campus_flutter/departuresComponent/model/departure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DeparturesDetailsRowView extends ConsumerWidget {
  const DeparturesDetailsRowView({super.key, required this.departure});

  final Departure departure;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        _lineNumberRectangle(context, ref),
        Expanded(
            child: Text(departure.servingLine.direction,
                maxLines: 1, overflow: TextOverflow.ellipsis)),
        _delayText,
        const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
        _timeText
      ],
    );
  }

  Widget _lineNumberRectangle(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: () async {
          if (departure.lineInfos != null) {
            if (departure.lineInfos?.element != null) {
              final link = departure.lineInfos?.element?.lineInfo
                      .additionalLinks?[0].linkURL ??
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
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: departure.servingLine.color),
                  width: 55,
                  height: 35,
                  child: Center(
                      child: Text(departure.servingLine.number,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                )),
            if (departure.lineInfos != null) _warningOverlay
          ],
        ));
  }

  Widget get _warningOverlay {
    return const Positioned(
        width: 53 * 2,
        bottom: 22,
        child:
            Icon(Icons.warning_outlined, color: Color(0xffFFCC01), size: 20));
  }

  Widget get _delayText {
    if (departure.servingLine.delay != null) {
      final delay = departure.servingLine.delay!;
      if (delay > 0) {
        return Text("+${NumberFormat("00").format(delay)}",
            style: const TextStyle(color: Colors.red));
      }
    }
    return const SizedBox.shrink();
  }

  Widget get _timeText {
    if (departure.realDateTime != null) {
      final realDateTime = departure.realDateTime!;
      if ((departure.servingLine.delay ?? 0) > 0) {
        return timeBuilder(realDateTime, Colors.red);
      } else {
        return timeBuilder(realDateTime, Colors.green);
      }
    } else {
      return timeBuilder(departure.dateTime, null);
    }
  }

  Widget timeBuilder(DateTime dateTime, Color? color) {
    // TODO: walking distance
    if (departure.countdown < 1) {
      return Text("NOW",
          style: TextStyle(color: color, fontWeight: FontWeight.w500));
    } else {
      final hour = NumberFormat("00").format(dateTime.hour);
      final minute = NumberFormat("00").format(dateTime.minute);
      return Text("$hour:$minute",
          style: TextStyle(color: color, fontWeight: FontWeight.w500));
    }
  }
}
