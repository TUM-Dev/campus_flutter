import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/helpers/info_row.dart';
import 'package:campus_flutter/profileComponent/model/tuition.dart';
import 'package:campus_flutter/profileComponent/viewModel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:campus_flutter/base/extensions/context.dart';

class TuitionView extends ConsumerWidget {
  const TuitionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.watch(profileViewModel).tuition,
      builder: (context, snapshot) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.euro),
            title: Text(context.localizations.tuitionFees),
            trailing: _tuitionStatus(context, snapshot),
            onTap: () => _alertDialog(context, snapshot),
          ),
        );
      },
    );
  }

  _alertDialog(BuildContext context, AsyncSnapshot<Tuition?> snapshot) {
    if (snapshot.data != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            context.localizations.tuitionFees,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                snapshot.data!.semester,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
              InfoRow(
                title: context.localizations.tuitionDueDate,
                info: DateFormat.yMd(context.localizations.localeName)
                    .format(snapshot.data!.deadline),
              ),
              InfoRow(
                title: context.localizations.tuitionOpenAmount,
                info: NumberFormat.currency(locale: "de_DE", symbol: '€')
                    .format(snapshot.data!.amount),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Okay"),
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
        ),
      );
    }
  }

  Widget _tuitionStatus(
    BuildContext context,
    AsyncSnapshot<Tuition?> snapshot,
  ) {
    if (snapshot.hasData) {
      if (snapshot.data?.amount == 0.0) {
        return IconText(
          iconData: Icons.check,
          label: context.localizations.tuitionPaid,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.green),
          leadingIcon: false,
        );
      } else {
        final numberFormat =
            NumberFormat.currency(locale: "de_DE", symbol: "€");
        return Text(
          numberFormat.format(snapshot.data?.amount),
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.red),
        );
      }
    } else {
      return DelayedLoadingIndicator(
        name: context.localizations.tuition,
        alternativeLoadingIndicator: Text(
          context.localizations.notAvailableAbbrev,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.red),
        ),
      );
    }
  }
}
