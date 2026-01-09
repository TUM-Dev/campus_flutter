import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/util/icon_text.dart';
import 'package:campus_flutter/base/util/info_row.dart';
import 'package:campus_flutter/personComponent/model/profile/tuition.dart';
import 'package:campus_flutter/personComponent/viewModel/profile_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
            title: Text(context.tr("tuitionFees")),
            trailing: _tuitionStatus(context, snapshot),
            onTap: () => _alertDialog(context, snapshot),
          ),
        );
      },
    );
  }

  void _alertDialog(BuildContext context, AsyncSnapshot<Tuition?> snapshot) {
    if (snapshot.data != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            context.tr("tuitionFees"),
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                snapshot.data!.semester,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
              InfoRow(
                title: context.tr("tuitionDueDate"),
                info: DateFormat.yMd("de").format(snapshot.data!.deadline),
              ),
              InfoRow(
                title: context.tr("tuitionOpenAmount"),
                info: NumberFormat.currency(
                  locale: "de",
                  symbol: '€',
                ).format(snapshot.data!.amount),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () => context.pop(),
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
    if (snapshot.hasData && snapshot.data!.amount != null) {
      if (snapshot.data!.amount! <= 0.0) {
        return SymbolText.icon(
          iconData: Icons.check,
          label: context.tr("tuitionPaid"),
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.green),
          leadingIcon: false,
        );
      } else {
        final numberFormat = NumberFormat.currency(
          locale: "de_DE",
          symbol: "€",
        );
        return Text(
          numberFormat.format(snapshot.data?.amount),
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.red),
        );
      }
    } else {
      return DelayedLoadingIndicator(
        name: context.tr("tuition"),
        alternativeLoadingIndicator: Text(
          context.tr("notAvailableAbbrev"),
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.red),
        ),
      );
    }
  }
}
