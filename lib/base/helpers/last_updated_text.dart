import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LastUpdatedText extends ConsumerWidget {
  const LastUpdatedText(this.dateTime, {super.key});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    timeago.setLocaleMessages("de", timeago.DeMessages());
    return Center(
        child: Text(AppLocalizations.of(context)!.lastUpdatedAt(timeago.format(dateTime, locale: ref.watch(locale).languageCode)),
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.grey.shade600)));
  }
}