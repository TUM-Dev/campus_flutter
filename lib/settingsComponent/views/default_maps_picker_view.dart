import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/settingsComponent/viewModels/user_preferences_viewmodel.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_launcher/map_launcher.dart';

final selectedMapsApp = StateProvider<AvailableMap?>((ref) => null);

class DefaultMapsPickerView extends ConsumerStatefulWidget {
  const DefaultMapsPickerView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DefaultMapsPickerViewState();
}

class _DefaultMapsPickerViewState extends ConsumerState<DefaultMapsPickerView> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(
        context.localizations.defaultMapsApplication,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: PopupMenuButton<AvailableMap>(
        icon: ref.read(selectedMapsApp)?.icon != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: SvgPicture.asset(
                  ref.read(selectedMapsApp)!.icon,
                  height: 30,
                  width: 30,
                ),
              )
            : null,
        itemBuilder: UserPreferencesViewModel.getInstalledMapTypes,
        initialValue: ref.read(selectedMapsApp),
        onSelected: (selection) {
          ref.read(userPreferencesViewModel).savePreference(
                UserPreference.defaultMapsApplication,
                selection,
              );
          setState(() {});
        },
      ),
    );
  }
}
