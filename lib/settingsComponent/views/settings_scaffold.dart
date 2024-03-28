import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScaffold extends StatelessWidget {
  const SettingsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        titleSpacing: 0,
        title: Text(context.localizations.settingsAndFeedback),
        actions: [
          IconButton(
            onPressed: () => context.push(feedback),
            icon: Icon(
              Icons.help,
              color: context.theme.primaryColor,
            ),
          ),
        ],
      ),
      body: const SettingsView(),
    );
  }
}
