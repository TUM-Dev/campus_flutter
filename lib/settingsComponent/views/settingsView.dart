import 'package:campus_flutter/loginComponent/loginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: ListView(children: [
        IconButton(
            onPressed: () {
              Provider.of<LoginViewModel>(context, listen: false).logout();
            },
            icon: const Icon(Icons.logout_rounded))
      ])
    );
  }
}