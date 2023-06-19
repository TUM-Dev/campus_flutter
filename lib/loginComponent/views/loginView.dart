import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerWidget {
  LoginView({super.key});

  final textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: Column(
          children: [
            TextField(controller: textFieldController),
            ElevatedButton(
                onPressed: () {
                  ref.watch(loginViewModel)
                      .requestLogin(textFieldController.value.text)
                      .then((value) => Navigator.of(context).pushNamed(confirm));
                },
                child: const Text("Login")),
            ElevatedButton(
              onPressed: () {
                ref.read(loginViewModel).skip();
              },
              child: const Text("Skip"),
            ),
          ],
        ));
  }
}

class ConfirmView extends ConsumerWidget {
  const ConfirmView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(title: const Text("Confirm")),
        body: ElevatedButton(
          onPressed: () {
            ref.read(loginViewModel).confirmLogin().then((value) {
              if (value != null) {
                Navigator.of(context).pop();
              }
            });
          },
          child: const Text("Confirm"),
        ));
  }
}
