import 'dart:io';

import 'package:campus_flutter/base/extensions/locale+fullname.dart';
import 'package:campus_flutter/base/helpers/hyperlink_text.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/loginComponent/viewModels/login_viewmodel.dart';
import 'package:campus_flutter/loginComponent/views/permission_check_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Settings"),
        ),
        body: ListView(children: [
          _generalSettings(context, ref),
          _contact(ref),
          _authentication(context, ref),
          _versionNumber()
        ]));
  }

  Widget _generalSettings(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
        title: "General Settings",
        child: Card(
            child: Column(children: [
          _tokenPermission(context),
          const PaddedDivider(height: 0),
          _localeSelection(context, ref),
          if (!kIsWeb && Platform.isIOS) const PaddedDivider(height: 0),
          if (!kIsWeb && Platform.isIOS) _useWebView(context, ref),
        ])));
  }

  Widget _tokenPermission(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                const PermissionCheckView(isSettingsView: true))),
        child: ListTile(
          dense: true,
          leading:
              Icon(Icons.key, size: 20, color: Theme.of(context).primaryColor),
          title: Text("Token Permissions",
              style: Theme.of(context).textTheme.bodyMedium),
          trailing: const Icon(Icons.arrow_forward_ios, size: 15),
        ));
  }

  Widget _localeSelection(BuildContext context, WidgetRef ref) {
    return ListTile(
        dense: true,
        leading: Icon(Icons.language,
            size: 20, color: Theme.of(context).primaryColor),
        title: Text(AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyMedium),
        trailing: DropdownButton(
          onChanged: (Locale? newLocale) {
            // TODO: set the global locale state
          },
          value: Localizations.localeOf(context),
          items: AppLocalizations.supportedLocales
              .map((e) => DropdownMenuItem(value: e, child: Text(e.fullName())))
              .toList(),
        ));
  }

  Widget _useWebView(BuildContext context, WidgetRef ref) {
    return Card(
        child: ListTile(
      dense: true,
      title:
          Text("Use Web View", style: Theme.of(context).textTheme.bodyMedium),
      trailing: Switch(
          value: ref.watch(useWebView),
          onChanged: (showWebView) {
            ref.read(useWebView.notifier).state = showWebView;
          }),
    ));
  }

  Widget _contact(WidgetRef ref) {
    return WidgetFrameView(
        title: "Contact Us",
        child: Card(
            child: Column(
          children: [
            const ListTile(
              dense: true,
              title: HyperLinkText(
                  link: "https://testflight.apple.com/join/4Ddi6f2f",
                  label: "Become a Beta Tester"),
            ),
            const PaddedDivider(height: 0),
            const ListTile(
              dense: true,
              title: HyperLinkText(
                  link: "https://github.com/TUM-Dev",
                  label: "TUM Dev on GitHub"),
            ),
            const PaddedDivider(height: 0),
            const ListTile(
              dense: true,
              title: HyperLinkText(
                  link: "https://app.tum.de", label: "TUM Dev Website"),
            ),
            const PaddedDivider(height: 0),
            ListTile(
              dense: true,
              title: HyperLinkText(uri: _feedbackEmail(), label: "Feedback"),
            ),
          ],
        )));
  }

  Uri _feedbackEmail() {
    final operatingSystem = kIsWeb ? "Web App" : Platform.operatingSystem;
    String email = Uri.encodeComponent("app@tum.de");
    String subject = Uri.encodeComponent("[$operatingSystem - Feedback]");
    return Uri.parse("mailto:$email?subject=$subject");
  }

  Widget _authentication(BuildContext context, WidgetRef ref) {
    final login = ref.read(loginViewModel).credentials.value;
    return WidgetFrameView(
        child: GestureDetector(
            onTap: () {
              if (login != Credentials.none) {
                ref.read(loginViewModel).logout(ref);
              }
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: Card(
                child: ListTile(
              dense: true,
              title: login != Credentials.tumId
                  ? Text("Login",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.green, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center)
                  : Text("Logout",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.red, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center),
            ))));
  }

  Widget _versionNumber() {
    return Center(
        child: FutureBuilder(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text("Version ${snapshot.data!.version}");
              } else {
                return const Text("Version -.-.-");
              }
            }));
  }
}
