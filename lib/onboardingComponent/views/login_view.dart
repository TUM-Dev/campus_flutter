import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:go_router/go_router.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  @override
  void initState() {
    ref.read(onboardingViewModel).clearTextFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor:
          MediaQuery.platformBrightnessOf(context) == Brightness.dark
              ? Theme.of(context).canvasColor
              : Colors.white,
      resizeToAvoidBottomInset: orientation != Orientation.portrait,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.landscape) {
              return Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        const Spacer(),
                        const Image(
                          image: AssetImage(
                            "assets/images/logos/tum-logo-blue.png",
                          ),
                          height: 60,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                        Text(
                          context.localizations.welcomeToTheApp,
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                        Text(
                          context.localizations.enterYourIDToStart,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                        ),
                        _tumIdTextFields(context, ref),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                        _loginButton(context, ref),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                        _skipLoginButton(context, ref),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: _towerImage()),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Image(
                    image: AssetImage("assets/images/logos/tum-logo-blue.png"),
                    height: 60,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  Text(
                    context.localizations.welcomeToTheApp,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Text(
                    context.localizations.enterYourIDToStart,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                  _tumIdTextFields(context, ref),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  _loginButton(context, ref),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  _skipLoginButton(context, ref),
                  const Spacer(),
                  _towerImage(),
                  const Spacer(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _tumIdTextFields(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Spacer(),
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              hintText: "go",
              border: OutlineInputBorder(),
            ),
            inputFormatters: [LengthLimitingTextInputFormatter(2)],
            controller: ref.read(onboardingViewModel).textEditingController1,
            onChanged: (text) {
              ref.read(onboardingViewModel).checkTumId(context);
              if (text.length == 2) {
                FocusScope.of(context).nextFocus();
              }
            },
            enableSuggestions: false,
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              hintText: "42",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [LengthLimitingTextInputFormatter(2)],
            controller: ref.read(onboardingViewModel).textEditingController2,
            onChanged: (text) {
              ref.read(onboardingViewModel).checkTumId(context);
              if (text.length == 2 && int.tryParse(text) != null) {
                FocusScope.of(context).nextFocus();
              } else if (text.isEmpty) {
                FocusScope.of(context).previousFocus();
              }
            },
            enableSuggestions: false,
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              hintText: "tum",
              border: OutlineInputBorder(),
            ),
            controller: ref.read(onboardingViewModel).textEditingController3,
            inputFormatters: [LengthLimitingTextInputFormatter(3)],
            onChanged: (text) {
              ref.read(onboardingViewModel).checkTumId(context);
              if (text.isEmpty) {
                FocusScope.of(context).previousFocus();
              }
            },
            enableSuggestions: false,
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _loginButton(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.watch(onboardingViewModel).tumIdValid,
      builder: (context, snapshot) {
        return Column(
          children: [
            if (snapshot.hasError) _textFieldError(snapshot.error!),
            ElevatedButton(
              onPressed: (snapshot.data != null && snapshot.data!)
                  ? () {
                      ref.read(onboardingViewModel).requestLogin().then(
                        (value) => context.push(confirm),
                        onError: (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 10),
                              content: ErrorHandlingRouter(
                                error: error,
                                errorHandlingViewType:
                                    ErrorHandlingViewType.textOnly,
                                titleColor: Colors.white,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  : null,
              child: Text(
                context.localizations.login,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _textFieldError(Object error) {
    return Text(error.toString(), style: const TextStyle(color: Colors.red));
  }

  Widget _skipLoginButton(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(onboardingViewModel).skip(context),
      child: Text(
        context.localizations.continueWithoutID,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.apply(color: Theme.of(context).primaryColor),
      ),
    );
  }

  Widget _towerImage() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 64.0),
      child: Image(
        image: AssetImage("assets/images/tower.png"),
        fit: BoxFit.contain,
      ),
    );
  }
}
