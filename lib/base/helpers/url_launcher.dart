import 'dart:io';

import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UrlLauncher {
  static urlString(String urlString, WidgetRef ref) async {
    if (kIsWeb) {
      launchUrlString(urlString, mode: LaunchMode.platformDefault);
    } else {
      if (await canLaunchUrlString(urlString)) {
        if (ref.read(useWebView) && Platform.isIOS) {
          launchUrlString(urlString, mode: LaunchMode.inAppWebView).onError(
            (error, stackTrace) => launchUrlString(
              urlString,
              mode: LaunchMode.externalApplication,
            ),
          );
        } else {
          launchUrlString(urlString, mode: LaunchMode.externalApplication);
        }
      }
    }
  }

  static url(Uri url, WidgetRef ref) async {
    if (kIsWeb) {
      launchUrl(url, mode: LaunchMode.platformDefault);
    } else {
      if (await canLaunchUrl(url)) {
        if (ref.read(useWebView) && Platform.isIOS) {
          launchUrl(url, mode: LaunchMode.inAppWebView).onError(
            (error, stackTrace) =>
                launchUrl(url, mode: LaunchMode.externalApplication),
          );
        } else {
          launchUrl(url, mode: LaunchMode.externalApplication);
        }
      }
    }
  }
}
