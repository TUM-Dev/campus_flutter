import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/base/helpers/url_launcher.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
              onTap: () => _launchUrl("https://moodle.tum.de", context, ref),
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
              onTap: () => _launchUrl("https://campus.tum.de", context, ref),
            ),
          ),
        ),
      ],
    );
  }

  void _launchUrl(String url, BuildContext context, WidgetRef ref) {
    if (MediaQuery.orientationOf(context) == Orientation.portrait || kIsWeb) {
      UrlLauncher.urlString(url, ref);
    } else {
      final controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onNavigationRequest: (request) => NavigationDecision.navigate,
          ),
        )
        ..loadRequest(Uri.parse(url));
      ref
          .read(homeSplitViewModel)
          .selectedWidget
          .add(WebViewWidget(controller: controller));
    }
  }
}
