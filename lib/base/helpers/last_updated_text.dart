import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class LastUpdatedText extends StatelessWidget {
  const LastUpdatedText(this.dateTime, {super.key});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("last updated ${timeago.format(dateTime)}",
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.grey.shade600)));
  }
}