import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/profileComponent/model/tuition.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class TuitionView extends ConsumerWidget {
  const TuitionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
        stream: ref.watch(profileViewModel).tuition,
        builder: (context, snapshot) {
          return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.075,
              child: GestureDetector(
                onTap: () {
                  (snapshot.hasData && snapshot.data != null)
                      ? _alertDialog(context, snapshot)
                      : {};
                },
                child: CardWithPadding(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: FaIcon(FontAwesomeIcons.euroSign),
                  ),
                  const Text("Tuition fees"),
                  const Spacer(),
                  _tuitionStatus(context, snapshot)
                ])),
              ));
        });
  }

  _alertDialog(BuildContext context, AsyncSnapshot<Tuition?> snapshot) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Tuition Fees",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              content: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  snapshot.data!.semester,
                  style:
                      Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                _infoRow("Due Date:", DateFormat("dd.MM.yyyy").format(snapshot.data!.deadline)),
                _infoRow(
                    "Open Amount:",
                    NumberFormat.currency(locale: "de_DE", symbol: '€')
                        .format(snapshot.data!.amount))
              ]),
              actions: [
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(), child: const Text("OK"))
              ],
              actionsAlignment: MainAxisAlignment.center,
            ));
  }

  Widget _tuitionStatus(BuildContext context, AsyncSnapshot<Tuition?> snapshot) {
    if (snapshot.hasData) {
      if (snapshot.data?.amount == 0.0) {
        return const IconText(
          iconData: Icons.check,
          label: "Tuition Paid",
          style: TextStyle(color: Colors.green),
          leadingIcon: false,
        );
      } else {
        final numberFormat = NumberFormat.currency(locale: "de_DE", symbol: "€");
        return Text(numberFormat.format(snapshot.data?.amount),
            style: const TextStyle(color: Colors.red));
      }
    } else {
      return const DelayedLoadingIndicator(
          name: "Tuition",
          alternativeLoadingIndicator: Text("n/a", style: TextStyle(color: Colors.red)));
    }
  }

  Widget _infoRow(String title, String info) {
    return Row(children: [
      Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w500))),
      Expanded(child: Text(info))
    ]);
  }
}
