import 'package:campus_flutter/base/errorHandling/error_snackbar.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/status_message_banner.dart';
import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    ref.read(onboardingViewModel).clearTextFields();
  }

  @override
  Widget build(BuildContext context) {
    final statusMessage = ref.watch(hasStatusMessage);
    return Scaffold(
      backgroundColor:
          MediaQuery.platformBrightnessOf(context) == Brightness.dark
          ? Theme.of(context).canvasColor
          : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            if (statusMessage.$1 && statusMessage.$2 != null)
              StatusMessageBanner(text: statusMessage.$2!.message(context)),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: (constraints.maxHeight - 48).clamp(
                        0,
                        double.infinity,
                      ),
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 440),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Image(
                              image: AssetImage(
                                'assets/images/logos/tum-logo-blue.png',
                              ),
                              height: 60,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              context.tr('welcomeToTheApp'),
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              context.tr('enterYourIDToStart'),
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              context.tr('tumIdHelp'),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            _loginForm(),
                            TextButton.icon(
                              onPressed: _isSubmitting ? null : _openTumIdHelp,
                              icon: const Icon(Icons.help_outline),
                              label: Text(context.tr('findTumId')),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              context.tr('loginActivationHint'),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: _isSubmitting
                                  ? null
                                  : () => ref
                                        .read(onboardingViewModel)
                                        .skip(context),
                              child: Text(context.tr('continueWithoutID')),
                            ),
                            const SizedBox(height: 24),
                            const Image(
                              image: AssetImage('assets/images/tower.png'),
                              height: 140,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    final model = ref.watch(onboardingViewModel);
    return StreamBuilder<bool>(
      stream: model.tumIdValid,
      builder: (context, snapshot) {
        final canSubmit = !snapshot.hasError && snapshot.data == true;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: model.tumIdController,
              enabled: !_isSubmitting,
              decoration: InputDecoration(
                labelText: context.tr('tumIdLabel'),
                hintText: 'go42tum',
                border: const OutlineInputBorder(),
                errorText: snapshot.hasError ? snapshot.error.toString() : null,
                errorMaxLines: 4,
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.none,
              autocorrect: false,
              enableSuggestions: false,
              onChanged: (_) => model.checkTumId(context),
              onSubmitted: (_) {
                if (canSubmit) _requestLogin();
              },
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: canSubmit && !_isSubmitting ? _requestLogin : null,
              child: _isSubmitting
                  ? SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        semanticsLabel: context.tr('requestingAccess'),
                      ),
                    )
                  : Text(
                      context.tr('requestAccess'),
                      textAlign: TextAlign.center,
                    ),
            ),
          ],
        );
      },
    );
  }

  void _openTumIdHelp() {
    final url = context.locale.languageCode == 'de'
        ? 'https://www.it.tum.de/it/tum-kennung/'
        : 'https://www.it.tum.de/en/it/faq/account-login-tum-id-mwnid-tumcard/tum-id/what-is-the-tum-id-tum-kennung/';
    UrlLauncher.urlString(url, ref);
  }

  Future<void> _requestLogin() async {
    if (_isSubmitting) return;
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() => _isSubmitting = true);
    try {
      await ref.read(onboardingViewModel).requestLogin();
      if (mounted) context.push(confirm);
    } catch (error, stack) {
      if (mounted) {
        showErrorSnackBar(context, error, stackTrace: stack, isMutation: true);
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }
}
