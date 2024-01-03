import 'package:campus_flutter/base/helpers/url_launcher.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LinkView extends ConsumerWidget {
  const LinkView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: Card(
            margin: EdgeInsets.only(
              right: context.halfPadding,
              top: context.halfPadding,
              bottom: context.halfPadding,
              left: context.padding,
            ),
            child: ListTile(
              leading: const Icon(Icons.school),
              title: const Center(child: Text("Moodle")),
              onTap: () => UrlLauncher.urlString("https://moodle.tum.de", ref),
            ),
          ),
        ),
        Expanded(
          child: Card(
            margin: EdgeInsets.only(
              right: context.padding,
              top: context.halfPadding,
              bottom: context.halfPadding,
              left: context.halfPadding,
            ),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Center(child: Text("TUMonline")),
              onTap: () => UrlLauncher.urlString("https://campus.tum.de", ref),
            ),
          ),
        ),
      ],
    );
  }
}
