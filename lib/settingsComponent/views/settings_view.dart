import 'dart:io';

import 'package:campus_flutter/base/enums/appearance.dart';
import 'package:campus_flutter/base/extensions/locale+fullname.dart';
import 'package:campus_flutter/base/helpers/hyperlink_text.dart';
import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/views/seperated_list.dart';
import 'package:campus_flutter/feedbackComponent/views/feedback_form_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/loginComponent/viewModels/login_viewmodel.dart';
import 'package:campus_flutter/loginComponent/views/permission_check_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/settingsComponent/viewModels/user_preferences_viewmodel.dart';
import 'package:campus_flutter/settingsComponent/views/default_maps_picker_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        _generalSettings(context, ref),
        _appearance(context, ref),
        _contact(context, ref),
        _authentication(context, ref),
        _versionNumber(),
      ],
    );
  }

  Widget _generalSettings(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
      title: context.localizations.generalSettings,
      child: Card(
        child: SeparatedList.widgets(
          widgets: [
            _tokenPermission(context),
            _localeSelection(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _tokenPermission(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(Icons.key, size: 20, color: Theme.of(context).primaryColor),
      title: Text(
        context.localizations.tokenPermissions,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const PermissionCheckView(isSettingsView: true),
        ),
      ),
    );
  }

  Widget _localeSelection(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      leading: Icon(
        Icons.language,
        size: 20,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        context.localizations.language,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: DropdownButton(
        onChanged: (Locale? newLocale) {
          if (newLocale != null) {
            ref
                .read(userPreferencesViewModel)
                .saveUserPreference(UserPreference.locale, newLocale);
            ref.read(locale.notifier).state = newLocale;
          }
        },
        value: ref.watch(locale),
        items: AppLocalizations.supportedLocales
            .map((e) => DropdownMenuItem(value: e, child: Text(e.fullName())))
            .toList(),
      ),
    );
  }

  Widget _appearance(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
      title: context.localizations.appearance,
      child: Card(
        child: SeparatedList.widgets(
          widgets: [
            _appearanceSelection(context, ref),
            if (!kIsWeb && Platform.isIOS) _useWebView(context, ref),
            _hideFailedGrades(context, ref),
            if (!kIsWeb && getIt.get<List<AvailableMap>>().isNotEmpty)
              const DefaultMapsPickerView(),
          ],
        ),
      ),
    );
  }

  Widget _appearanceSelection(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      title: Text(
        context.localizations.theme,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: DropdownButton(
        onChanged: (Appearance? newAppearance) {
          if (newAppearance != null) {
            ref.read(appearance.notifier).state = newAppearance;
            ref
                .read(userPreferencesViewModel)
                .saveUserPreference(UserPreference.theme, newAppearance);
          }
        },
        value: ref.watch(appearance),
        items: Appearance.values
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: IconText(
                  iconData: e.icon,
                  iconColor: Theme.of(context).primaryColor,
                  label: ref.read(locale).languageCode == "de"
                      ? e.german
                      : e.english,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _useWebView(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      title: Text(
        context.localizations.useWebView,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Switch(
        value: ref.watch(useWebView),
        onChanged: (showWebView) {
          ref
              .read(userPreferencesViewModel)
              .saveUserPreference(UserPreference.webView, showWebView);
          ref.read(useWebView.notifier).state = showWebView;
        },
      ),
    );
  }

  Widget _hideFailedGrades(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      title: Text(
        context.localizations.hideFailedGrades,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Switch(
        value: ref.watch(hideFailedGrades),
        onChanged: (value) {
          ref
              .read(userPreferencesViewModel)
              .saveUserPreference(UserPreference.hideFailedGrades, value);
          ref.read(hideFailedGrades.notifier).state = value;
          ref.read(gradeViewModel).fetch(false);
        },
      ),
    );
  }

  Widget _contact(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
      title: context.localizations.contactUs,
      child: Card(
        child: SeparatedList.widgets(
          widgets: [
            if (!kIsWeb)
              HyperLinkListTile(
                dense: true,
                link: _betaTester(),
                label: context.localizations.becomeABetaTester,
              ),
            HyperLinkListTile(
              dense: true,
              link: "https://github.com/TUM-Dev",
              label: context.localizations.usOnGitHub,
            ),
            const HyperLinkListTile(
              dense: true,
              link: "https://app.tum.de",
              label: "TUM Dev Website",
            ),
            ListTile(
              dense: true,
              title: Text(
                "Feedback",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FeedbackFormScaffold(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _betaTester() {
    if (Platform.isAndroid) {
      return "https://play.google.com/store/apps/details?id=de.tum.tca_flutter";
    } else {
      return "https://testflight.apple.com/join/4Ddi6f2f";
    }
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
                ? Text(
                    context.localizations.login,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    context.localizations.logout,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                    textAlign: TextAlign.center,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _versionNumber() {
    return Center(
      child: FutureBuilder(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              context.localizations.versionNumber(snapshot.data!.version),
            );
          } else {
            return Text(context.localizations.versionNumber("-.-.-"));
          }
        },
      ),
    );
  }
}
