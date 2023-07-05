import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/helpers/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkView extends ConsumerWidget {
  const LinkView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
            child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.075,
                child: GestureDetector(
                    onTap: () => UrlLauncher.urlString("https://moodle.tum.de", ref),
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
                    onTap: () => UrlLauncher.urlString("https://campus.tum.de", ref),
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
