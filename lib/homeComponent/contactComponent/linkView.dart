import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkView extends StatelessWidget {
  const LinkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Card(
          margin: const EdgeInsets.only(
              right: 6.0, top: 6.0, bottom: 6.0, left: 12.0),
          child: TextButton.icon(
            onPressed: () async {
              final url = Uri.parse("https://moodle.tum.de");
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            style: FilledButton.styleFrom(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              foregroundColor: Theme.of(context).textTheme.bodyMedium?.color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: const Padding(
              padding: EdgeInsets.all(7.0),
              child: Icon(Icons.school_outlined),
            ),
            label: const Text("Moodle"),
          ),
        )),
        Expanded(
            child: Card(
          margin: const EdgeInsets.only(
              left: 6.0, top: 6.0, bottom: 6.0, right: 12.0),
          child: TextButton.icon(
            onPressed: () async {
              final url = Uri.parse("https://campus.tum.de");
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            style: FilledButton.styleFrom(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              foregroundColor: Theme.of(context).textTheme.bodyMedium?.color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: const Padding(
              padding: EdgeInsets.all(7.0),
              child: Icon(Icons.language_outlined),
            ),
            label: const Text("TUMOnline"),
          ),
        )),
      ],
    );
  }
}
