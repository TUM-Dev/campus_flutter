import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/views/seperated_list.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/loginComponent/views/permission_check_view.dart';
import 'package:campus_flutter/base/extensions/locale_fullname.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/settingsComponent/viewModels/user_preferences_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GeneralSettingsView extends ConsumerWidget {
  const GeneralSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
}
