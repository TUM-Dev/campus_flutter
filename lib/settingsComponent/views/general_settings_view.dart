import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/extensions/locale_fullname.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/seperated_list.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class GeneralSettingsView extends ConsumerWidget {
  const GeneralSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
      title: context.tr("generalSettings"),
      child: Card(
        child: SeparatedList.widgets(
          widgets: [
            _tokenPermission(context),
            _localeSelection(context, ref),
            _moreSettings(context),
          ],
        ),
      ),
    );
  }

  Widget _tokenPermission(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(Icons.key, size: 20, color: context.primaryColor),
      title: Text(
        context.tr("tokenPermissions"),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
      onTap: () => context.push(permissionCheck, extra: true),
    );
  }

  Widget _localeSelection(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      leading: Icon(Icons.language, size: 20, color: context.primaryColor),
      title: Text(
        context.tr("language"),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: DropdownButton<Locale?>(
        onChanged: (Locale? newLocale) {
          if (newLocale != null) {
            context.setLocale(newLocale);
          }
        },
        value: context.locale,
        items:
            context.supportedLocales
                .map(
                  (e) => DropdownMenuItem(value: e, child: Text(e.fullName())),
                )
                .toList(),
      ),
    );
  }

  Widget _moreSettings(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(Icons.settings, size: 20, color: context.primaryColor),
      title: Text(context.tr("deviceSettings")),
      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
      onTap: () => openAppSettings(),
    );
  }
}
