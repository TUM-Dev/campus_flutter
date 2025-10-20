import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_service.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/personComponent/services/profile_service.dart';
import 'package:campus_flutter/studentCardComponent/viewModel/student_card_viewmodel.dart';
import 'package:campus_flutter/studiesComponent/service/grade_service.dart';
import 'package:campus_flutter/studiesComponent/service/lecture_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PasswordView extends ConsumerWidget {
  var text = "";
  PasswordView({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColor =
    Theme.of(context).brightness == Brightness.dark
        ? Theme.of(context).canvasColor
        : Colors.white;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(context.tr("checkPermissions")),
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Text(
                "Setze hier deine Login-Daten für Moodle. Deine Daten werden verschlüsselt gespeichert.",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            _tumIdTextFields(context, ref),
            const Spacer(),
            _tumPasswordField(context, ref),
            const Spacer(),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                CookieManager.instance().deleteAllCookies();
                ref.read(onboardingViewModel).savePassword(text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(context.tr("passwordSaved")),
                    backgroundColor: Colors.greenAccent,
                  ),
                );
              },
              icon: const Icon(Icons.save, size: 18),
              label: const Text('Passwort speichern'),
            ),
            const Spacer(),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                CookieManager.instance().deleteAllCookies();
                ref.read(onboardingViewModel).clearPassword();
                ref.read(onboardingViewModel).tumOnlinePasswordController.clear();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(context.tr("passwordReset")),
                  ),
                );
              },
              icon: const Icon(Icons.delete, size: 18),
              label: const Text('Passwort zurücksetzen'),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  Widget _tumPasswordField(BuildContext context, WidgetRef ref) {
    return TextField(
      decoration: InputDecoration(
        hintText: context.tr("password"),
        border: const OutlineInputBorder(),
      ),
      obscureText: true,
      controller: ref.read(onboardingViewModel).tumOnlinePasswordController,
      onChanged: (text) {
       this.text = text;
      },
      enableSuggestions: false,
      autocorrect: false,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
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
            TextEditingController(text: Api.tumId[0] + Api.tumId[1]),
              ref, context
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
        Expanded(
          child: _loginTextField(
            "42",
            TextInputType.number,
            2,
            TextEditingController(text: Api.tumId[2] + Api.tumId[3]),
            ref, context
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
        Expanded(
          child: _loginTextField(
            "tum",
            TextInputType.text,
            3,
           TextEditingController(text: Api.tumId.substring(4, 7)),
              ref, context
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
      WidgetRef ref,
      BuildContext context
      ) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: MediaQuery.platformBrightnessOf(context) == Brightness.dark
              ? Colors.grey.shade700
              : Colors.grey.shade400,
        ),
        border: const OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
      controller: controller,
      onChanged: null,
      enableSuggestions: false,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }


}