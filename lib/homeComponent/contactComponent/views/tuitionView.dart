import 'package:campus_flutter/base/helpers/delayedLoadingIndicator.dart';
import 'package:campus_flutter/base/helpers/iconText.dart';
import 'package:campus_flutter/profileComponent/model/tuition.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

// TODO: code cleanup
class TuitionView extends ConsumerWidget {
  const TuitionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
        stream: ref.watch(profileViewModel).tuition,
        builder: (context, snapshot) {
          return Card(
            child: TextButton(
                onPressed: () {
                  snapshot.hasData
                      ? showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(
                                  "Tuition Fees",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
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
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.0)),
                                      _infoRow(
                                          "Due Date:",
                                          DateFormat("dd.MM.yyyy")
                                              .format(snapshot.data!.deadline)),
                                      _infoRow(
                                          "Open Amount:",
                                          NumberFormat.currency(
                                                  locale: "de_DE", symbol: '€')
                                              .format(snapshot.data!.amount))
                                    ]),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text("OK"))
                                ],
                                actionsAlignment: MainAxisAlignment.center,
                              ))
                      : {};
                },
                style: FilledButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  foregroundColor:
                      Theme.of(context).textTheme.bodyMedium?.color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(children: [
                  const Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Icon(Icons.euro),
                  ),
                  const Text("Tuition fees"),
                  const Spacer(),
                  _tuitionStatus(context, snapshot)
                ])),
          );
        });
  }

  Widget _tuitionStatus(
      BuildContext context, AsyncSnapshot<Tuition?> snapshot) {
    if (snapshot.hasData) {
      if (snapshot.data?.amount == 0.0) {
        return const IconText(
          iconData: Icons.check,
          label: "Tuition Paid",
          style: TextStyle(color: Colors.green),
          leadingIcon: false,
        );
      } else {
        final numberFormat =
            NumberFormat.currency(locale: "de_DE", symbol: "€");
        return Text(numberFormat.format(snapshot.data?.amount),
            style: const TextStyle(color: Colors.red));
      }
    } else {
      return const DelayedLoadingIndicator(
          name: "Tuition",
          alternativeLoadingIndicator: Text("n/a", style: TextStyle(color: Colors.red))
      );
    }
  }

  Widget _infoRow(String title, String info) {
    return Row(children: [
      Expanded(
          child:
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500))),
      Expanded(child: Text(info))
    ]);
  }
}
