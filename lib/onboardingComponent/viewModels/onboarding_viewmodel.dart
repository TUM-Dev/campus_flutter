import 'dart:developer';

import 'package:campus_flutter/base/enums/credentials.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/base/routing/router_service.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_preference_service.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/onboardingComponent/model/confirm.dart';
import 'package:campus_flutter/onboardingComponent/services/onboarding_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/personComponent/viewModel/person_details_viewmodel.dart';
import 'package:campus_flutter/personComponent/viewModel/profile_viewmodel.dart';
import 'package:campus_flutter/base/services/user_preferences_service.dart';
import 'package:campus_flutter/settingsComponent/viewModels/settings_viewmodel.dart';
import 'package:campus_flutter/studentCardComponent/viewModel/student_card_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:home_widget/home_widget.dart';
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
    final RegExp lettersRegex = RegExp(r'^[a-z]+$');
    final RegExp numberRegex = RegExp(r'^[0-9]+$');

    if (textEditingController1.text.isEmpty ||
        textEditingController2.text.isEmpty ||
        textEditingController3.text.isEmpty) {
      tumIdValid.add(false);
      return;
    }

    if (!lettersRegex.hasMatch(textEditingController1.text)) {
      tumIdValid.addError(context.tr("onlyLetters"));
      return;
    }

    if (!numberRegex.hasMatch(textEditingController2.text)) {
      tumIdValid.addError(context.tr("onlyNumbers"));
      return;
    }

    if (!lettersRegex.hasMatch(textEditingController3.text)) {
      tumIdValid.addError(context.tr("onlyLetters"));
      return;
    }

    if (textEditingController1.text.length != 2 ||
        textEditingController2.text.length != 2 ||
        textEditingController3.text.length != 3) {
      tumIdValid.add(false);
      return;
    }

    tumIdValid.add(true);
  }

  Future<bool> checkLogin() async {
    return _storage
        .read(key: "token")
        .then(
          (value) async {
            final status = getIt<OnboardingService>().getOnboardingStatus();
            if (value != null) {
              Api.tumToken = value;
              credentials.add(Credentials.tumId);
              return true;
            } else if (status != null && status) {
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
    Permission.location.request().then((value) {
      {
        if (context.mounted) {
          finishOnboarding(ref, context);
        }
      }
    });
  }

  void finishOnboarding(WidgetRef ref, BuildContext context) {
    getIt<OnboardingService>().setOnboarded();
    getIt<RouterService>().setOnboarded();
    ref.read(studentCardViewModel).fetch(false);
    context.go(home);
  }

  Future resetPreferences(WidgetRef ref) async {
    getIt<UserPreferencesService>().resetAll();
    getIt<CalendarPreferenceService>().resetPreferences();
    ref.read(settingsViewModel).loadPreferences();
    ref.read(calendarViewModel).resetPreferences();
  }

  Future logout(WidgetRef ref) async {
    ref.invalidate(profileViewModel);
    ref.invalidate(personDetailsViewModel);
    ref.invalidate(studentCardViewModel);
    await getIt<RestClient>().clearCache();
    await _storage.delete(key: "token");
    await HomeWidget.saveWidgetData("calendar", null);
    await HomeWidget.saveWidgetData("calendar_save", null);
    await HomeWidget.updateWidget(
      iOSName: "CalendarWidget",
      androidName: "widgets.calendar.CalendarWidget",
    );
    await resetPreferences(ref);
    Api.tumToken = "";
    credentials.add(Credentials.none);
  }
}
