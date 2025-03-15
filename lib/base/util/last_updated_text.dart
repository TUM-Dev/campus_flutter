import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

class LastUpdatedText extends ConsumerWidget {
  const LastUpdatedText(this.dateTime, {super.key});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    timeago.setLocaleMessages("de", timeago.DeMessages());
    return Center(
      child: Text(
        context.tr(
          "lastUpdatedAt",
          args: [
            timeago.format(
              dateTime,
              locale: Localizations.localeOf(context).languageCode,
            ),
          ],
        ),
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
