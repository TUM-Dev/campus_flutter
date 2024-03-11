import 'package:campus_flutter/base/enums/home_widget.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/viewModels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeSettingsView extends ConsumerWidget {
  const HomeSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          context.localizations.editHome,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.apply(color: Theme.of(context).primaryColor),
        ),
        Text(context.localizations.reorderDisable),
        Padding(
          padding: EdgeInsets.symmetric(vertical: context.halfPadding),
        ),
        TextButton(
          onPressed: () => ref.read(homeViewModel).reset(),
          child: Text(context.localizations.reset),
        ),
        _list(ref),
      ],
    );
  }

  Widget _list(WidgetRef ref) {
    return Expanded(
      child: StreamBuilder(
        stream: ref.read(homeViewModel).widgets,
        builder: (context, snapshot) {
          return ReorderableListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final homeWidget = snapshot.data![index];
              return _listTile(homeWidget, index, context, ref);
            },
            itemCount: snapshot.data?.length ?? 0,
            onReorder: (oldIndex, newIndex) => ref.read(homeViewModel).reorder(
                  oldIndex,
                  newIndex,
                ),
          );
        },
      ),
    );
  }

  Widget _listTile(
    HomeScreenWidget homeWidget,
    int index,
    BuildContext context,
    WidgetRef ref,
  ) {
    return ListTile(
      key: Key(homeWidget.widgetType.name),
      title: Text(
        HomeViewModel.getTitle(homeWidget.widgetType, context),
        style: !homeWidget.enabled ? const TextStyle(color: Colors.grey) : null,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: homeWidget.enabled,
            onChanged: (value) =>
                ref.read(homeViewModel).toggleWidget(index, value ?? true),
          ),
          Icon(
            Icons.menu,
            color: !homeWidget.enabled ? Colors.grey : null,
          ),
        ],
      ),
    );
  }
}
