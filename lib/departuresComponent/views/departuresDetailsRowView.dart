import 'package:campus_flutter/departuresComponent/model/departure.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DeparturesDetailsRowView extends StatelessWidget {
  const DeparturesDetailsRowView({super.key, required this.departure});

  final Departure departure;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _lineNumberRectangle(context),
        Expanded(child: Text(
            departure.servingLine.direction,
            maxLines: 1,
            overflow: TextOverflow.ellipsis
        )),
        //const Spacer(),
        _delayText,
        const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
        _timeText
      ],
    );
    // TODO: open URL of warning
  }

  Widget _lineNumberRectangle(BuildContext context) {
    return Stack(
          children: [
    Padding(
    padding: const EdgeInsets.only(right: 15),
    child:
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: departure.servingLine.color),
              width: 55,
              height: 35,
              child: Center(
                  child: Text(departure.servingLine.number,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold))),
            )),
            //Positioned(width: 55 * 2, bottom: 20, child: Icon(Icons.warning, color: Colors.yellow))
          ],
        );
  }

  // TODO:
  /*Widget get _warningOverlay {
  }*/

  Widget get _delayText {
    if (departure.servingLine.delay != null) {
      final delay = departure.servingLine.delay!;
      if (delay > 0) {
        return Text(
            "+${NumberFormat("00").format(delay)}",
            style: const TextStyle(color: Colors.red)
        );
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
      return Text("NOW", style: TextStyle(color: color, fontWeight: FontWeight.w500));
    } else {
      final hour = NumberFormat("00").format(dateTime.hour);
      final minute = NumberFormat("00").format(dateTime.minute);
      return Text("$hour:$minute", style: TextStyle(color: color, fontWeight: FontWeight.w500));
    }
  }
}