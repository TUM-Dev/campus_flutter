import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkView extends StatelessWidget {
  const LinkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.075,
                child: GestureDetector(
                    onTap: () async {
                      final url = Uri.parse("https://moodle.tum.de");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: const Card(
                        margin: EdgeInsets.only(right: 5.0, top: 5.0, bottom: 5.0, left: 10.0),
                        child: Center(
                            child: IconText(
                          iconData: Icons.school_outlined,
                          label: "Moodle",
                          iconSize: 24,
                        )))))),
        Expanded(
            child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.075,
                child: GestureDetector(
                    onTap: () async {
                      final url = Uri.parse("https://campus.tum.de");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: const Card(
                        margin: EdgeInsets.only(right: 10.0, top: 5.0, bottom: 5.0, left: 5.0),
                        child: Center(
                            child: IconText(
                          iconData: Icons.language_outlined,
                          label: "TUMOnline",
                          iconSize: 24,
                        ))))))
      ],
    );
  }
}
