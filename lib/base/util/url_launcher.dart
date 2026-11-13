import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> urlString(String value, WidgetRef ref) async {
    final parsed = Uri.tryParse(value.trim());
    await _open(parsed, ref);
  }

  static Future<void> url(Uri url, WidgetRef ref) => _open(url, ref);

  static Future<void> _open(Uri? uri, WidgetRef ref) async {
    final context = ref.context;
    if (!context.mounted) return;
    final isWeb = uri?.scheme == 'http' || uri?.scheme == 'https';
    final valid =
        uri != null &&
        uri.hasScheme &&
        !{'javascript', 'data', 'file', 'about'}.contains(uri.scheme) &&
        (isWeb ? uri.host.isNotEmpty : uri.path.isNotEmpty);
    if (valid) {
      // Read preferences before awaiting: the originating screen may close.
      final inApp = isWeb && ref.read(useWebView);
      if (inApp && await _tryLaunch(uri, LaunchMode.inAppBrowserView)) return;
      if (await _tryLaunch(uri, LaunchMode.externalApplication)) return;
    }
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.tr('couldNotOpenLink'))));
    }
  }

  static Future<bool> _tryLaunch(Uri uri, LaunchMode mode) async {
    try {
      // Attempt the launch directly; canLaunchUrl can reject supported links
      // when a platform's scheme-query allowlist is incomplete.
      return await launchUrl(uri, mode: mode);
    } on PlatformException {
      return false;
    } on ArgumentError {
      return false;
    } on FormatException {
      return false;
    }
  }
}
