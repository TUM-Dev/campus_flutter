import 'package:campus_flutter/loginComponent/loginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../routes.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: Column(
          children: [
            TextField(controller: textFieldController),
            ElevatedButton(
              onPressed: () {
                Provider.of<LoginViewModel>(context, listen: false)
                    .requestLogin(textFieldController.value.text)
                    .then((value) => Navigator.of(context).pushNamed(confirm));
              },
              child: const Text("Login"),
            ),
          ],
        ));
  }
}

class ConfirmView extends StatelessWidget {
  const ConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Confirm")),
        body: ElevatedButton(
          onPressed: () {
            Provider.of<LoginViewModel>(context, listen: false)
                .confirmLogin()
                .then((value) {
              if (value != null) {
                Navigator.of(context).pop();
              }
            });
          },
          child: const Text("Confirm"),
        ));
  }
}
