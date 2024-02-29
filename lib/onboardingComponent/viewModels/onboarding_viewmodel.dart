import 'dart:developer';

import 'package:campus_flutter/base/enums/credentials.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/base/routing/router_service.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/onboardingComponent/model/confirm.dart';
import 'package:campus_flutter/onboardingComponent/services/onboarding_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/personDetailedComponent/viewModel/person_details_viewmodel.dart';
import 'package:campus_flutter/profileComponent/viewModel/profile_viewmodel.dart';
import 'package:campus_flutter/studentCardComponent/viewModel/student_card_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

final onboardingViewModel = Provider((ref) => OnboardingViewModel());

class OnboardingViewModel {
  final _storage = const FlutterSecureStorage();
  BehaviorSubject<Credentials?> credentials = BehaviorSubject.seeded(null);
  BehaviorSubject<bool> tumIdValid = BehaviorSubject.seeded(false);

  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
  final TextEditingController textEditingController3 = TextEditingController();

  void clearTextFields() {
    textEditingController1.clear();
    textEditingController2.clear();
    textEditingController3.clear();
  }

  void checkTumId(BuildContext context) {
    final RegExp lettersRegex = RegExp(r'^[a-zA-Z]+$');
    final RegExp numberRegex = RegExp(r'^[0-9]+$');

    validateField(
      textEditingController1.text,
      lettersRegex,
      context.localizations.onlyLetters,
    );
    validateField(
      textEditingController2.text,
      numberRegex,
      context.localizations.onlyNumbers,
    );
    validateField(
      textEditingController3.text,
      lettersRegex,
      context.localizations.onlyLetters,
    );

    validateLength(textEditingController1.text, 2);
    validateLength(textEditingController2.text, 2);
    validateLength(textEditingController3.text, 3);

    tumIdValid.add(true);
  }

  void validateField(String text, RegExp regex, String errorMessage) {
    if (!regex.hasMatch(text)) {
      tumIdValid.addError(errorMessage);
      tumIdValid.add(false);
    }
  }

  void validateLength(String text, int length) {
    if (text.length != length) {
      tumIdValid.add(false);
    }
  }

  Future<bool> checkLogin() async {
    return _storage.read(key: "token").then(
      (value) async {
        if (value != null) {
          Api.tumToken = value;
          credentials.add(Credentials.tumId);
          return true;
        } else if (getIt<OnboardingService>().getOnboardingStatus() != null) {
          credentials.add(Credentials.noTumId);
          return true;
        } else {
          credentials.add(Credentials.none);
          return false;
        }
      },
      onError: (error) {
        log(error.toString());
        credentials.add(Credentials.none);
        return false;
      },
    );
  }

  Future requestLogin() async {
    return OnboardingService.requestNewToken(
      true,
      "${textEditingController1.text}${textEditingController2.text}${textEditingController3.text}",
    ).then((value) {
      final token = value.content;
      _storage.write(key: "token", value: token);
      Api.tumToken = token;
    });
  }

  Future<Confirm> confirmLogin() async {
    return OnboardingService.confirmToken(true).then((value) {
      if (value.confirmed) {
        credentials.add(Credentials.tumId);
      }
      return value;
    });
  }

  void skip(BuildContext context) {
    context.push(locationPermission);
  }

  Future<void> requestLocation(WidgetRef ref, BuildContext context) async {
    Permission.location.request().then(
      (value) {
        finishOnboarding(ref, context);
      },
    );
  }

  void finishOnboarding(WidgetRef ref, BuildContext context) {
    getIt<OnboardingService>().setOnboarded();
    getIt<RouterService>().isInitialized = true;
    ref.read(studentCardViewModel).fetch(false);
    context.go(home);
  }

  Future logout(WidgetRef ref) async {
    // TODO: Widgets
    ref.invalidate(profileViewModel);
    ref.invalidate(personDetailsViewModel);
    ref.invalidate(studentCardViewModel);
    await getIt<RESTClient>().clearCache();
    await _storage.delete(key: "token");
    Api.tumToken = "";
    credentials.add(Credentials.none);
  }
}
