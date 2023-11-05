import 'package:campus_flutter/feedbackComponent/views/feedback_form_view.dart';
import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';

class SettingsScaffold extends StatelessWidget {
  const SettingsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: Text(context.localizations.settings),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FeedbackFormScaffold())),
                icon: Icon(
                  Icons.help,
                  color: context.theme.primaryColor,
                ))
          ],
        ),
        body: const SettingsView());
  }
}
