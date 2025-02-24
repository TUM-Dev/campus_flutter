import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
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
                          context.tr("welcomeToTheApp"),
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                        Text(
                          context.tr("enterYourIDToStart"),
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
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                  Text(
                    context.tr("welcomeToTheApp"),
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Text(
                    context.tr("enterYourIDToStart"),
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                  _tumIdTextFields(context, ref),
                  _loginButton(context, ref),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
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
          child: _loginTextField(
            "go",
            TextInputType.text,
            2,
            ref.read(onboardingViewModel).textEditingController1,
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
        Expanded(
          child: _loginTextField(
            "42",
            TextInputType.number,
            2,
            ref.read(onboardingViewModel).textEditingController2,
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
        Expanded(
          child: _loginTextField(
            "tum",
            TextInputType.text,
            3,
            ref.read(onboardingViewModel).textEditingController3,
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _loginTextField(
    String hintText,
    TextInputType keyboardType,
    int maxLength,
    TextEditingController controller,
  ) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color:
              MediaQuery.platformBrightnessOf(context) == Brightness.dark
                  ? Colors.grey.shade700
                  : Colors.grey.shade400,
        ),
        border: const OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
      controller: controller,
      onChanged: (text) {
        ref.read(onboardingViewModel).checkTumId(context);
        if (text.length == maxLength && maxLength != 3) {
          FocusScope.of(context).nextFocus();
        }
      },
      enableSuggestions: false,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }

  Widget _loginButton(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: StreamBuilder(
        stream: ref.watch(onboardingViewModel).tumIdValid,
        builder: (context, snapshot) {
          return Column(
            children: [
              if (snapshot.hasError) _textFieldError(snapshot.error!),
              ElevatedButton(
                onPressed:
                    (snapshot.data != null && snapshot.data!)
                        ? () {
                          ref
                              .read(onboardingViewModel)
                              .requestLogin()
                              .then(
                                (value) {
                                  if (context.mounted) {
                                    context.push(confirm);
                                  }
                                },
                                onError: (error) {
                                  if (context.mounted) {
                                    ScaffoldMessenger.maybeOf(
                                      context,
                                    )?.showSnackBar(
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
                                  }
                                },
                              );
                        }
                        : null,
                child: Text(
                  context.tr("login"),
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _textFieldError(Object error) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(error.toString(), style: const TextStyle(color: Colors.red)),
    );
  }

  Widget _skipLoginButton(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(onboardingViewModel).skip(context),
      child: Text(
        context.tr("continueWithoutID"),
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.apply(color: context.primaryColor),
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
