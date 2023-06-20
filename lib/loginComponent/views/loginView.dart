import 'dart:math';

import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campus_flutter/loginComponent/viewModels/loginViewModel.dart';
import 'package:campus_flutter/loginComponent/views/confirmView.dart';

class LoginView extends ConsumerWidget {
  LoginView({super.key});

  final textFieldController1 = TextEditingController();
  final textFieldController2 = TextEditingController();
  final textFieldController3 = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Image(
            image: AssetImage("assets/images/logos/tum-logo-blue.png"),
            height: 60,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          Text("Welcome to the TUM Campus App", style: Theme.of(context).textTheme.titleLarge),
          const Spacer(),
          Text("Enter your TUM ID to get started", style: Theme.of(context).textTheme.titleMedium),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          _tumIdTextFields(context),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          _loginButton(context, ref),
          _skipLoginButton(context, ref),
          const Spacer(),
          _towerImage(),
          const Spacer()
        ],
      )),
    );
  }

  Widget _tumIdTextFields(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Expanded(
            child: TextField(
          decoration: const InputDecoration(hintText: "go", border: OutlineInputBorder()),
          controller: textFieldController1,
          onChanged: (text) {
            if (text.length == 2) {
              FocusScope.of(context).nextFocus();
            }
          },
          enableSuggestions: false,
        )),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
        Expanded(
            child: TextField(
          decoration: const InputDecoration(hintText: "42", border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
          controller: textFieldController2,
          onChanged: (text) {
            if (text.length == 2 && int.tryParse(text) != null) {
              FocusScope.of(context).nextFocus();
            }
          },
          enableSuggestions: false,
        )),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
        Expanded(
            child: TextField(
          decoration: const InputDecoration(hintText: "tum", border: OutlineInputBorder()),
          controller: textFieldController3,
          enableSuggestions: false,
        )),
        const Spacer()
      ],
    );
  }

  Widget _loginButton(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {
          ref.read(loginViewModel).requestLogin("${textFieldController1.text}${textFieldController2.text}${textFieldController3.text}").then((value) =>
          //Provider.of<LoginViewModel>(context, listen: false).requestLogin("${textFieldController1.text}${textFieldController2.text}${textFieldController3.text}").then((value) =>
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const ConfirmView()))); //);
        },
        child: Text("Log in", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)));
  }

  Widget _skipLoginButton(BuildContext context, WidgetRef ref) {
    return TextButton(
        onPressed: () => ref.read(loginViewModel).skip(),
        child: Text("Continue without TUM ID",
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.apply(color: Theme.of(context).primaryColor)));
  }

  Widget _towerImage() {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 64.0),
        child: Image(image: AssetImage("assets/images/tower.png"), fit: BoxFit.contain));
  }
}
