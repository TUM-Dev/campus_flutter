import 'dart:developer';

import 'package:campus_flutter/base/enums/credentials.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/base/routing/router_service.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_preference_service.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/onboardingComponent/model/confirm.dart';
import 'package:campus_flutter/onboardingComponent/model/tum_id.dart';
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
import 'package:geolocator/geolocator.dart';
import 'package:home_widget/home_widget.dart';
import 'package:rxdart/rxdart.dart';

final onboardingViewModel = Provider((ref) => OnboardingViewModel());

class OnboardingViewModel {
  final _storage = const FlutterSecureStorage();
  BehaviorSubject<Credentials?> credentials = BehaviorSubject.seeded(null);
  BehaviorSubject<bool> tumIdValid = BehaviorSubject.seeded(false);

  final TextEditingController tumIdController = TextEditingController();

  String get tumId => TumId.normalize(tumIdController.text);

  void clearTextFields() {
    tumIdController.clear();
    tumIdValid.add(false);
  }

  void checkTumId(BuildContext context) {
    if (tumId.isEmpty) {
      tumIdValid.add(false);
      return;
    }

    final error = TumId.validationError(tumId);
    if (error != null) {
      tumIdValid.addError(context.tr(error));
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

  Future<void> requestLogin() async {
    if (TumId.validationError(tumId) != null) {
      throw ArgumentError('Invalid TUM ID');
    }
    final token = await OnboardingService.requestNewToken(true, tumId);
    // Keep pending access in memory until the user activates it in TUMonline.
    Api.tumToken = token.content;
  }

  Future<Confirm> confirmLogin() async {
    return OnboardingService.confirmToken(true).then((value) async {
      if (value.confirmed) {
        await _storage.write(key: "token", value: Api.tumToken);
        credentials.add(Credentials.tumId);
      }
      return value;
    });
  }

  void skip(BuildContext context) {
    context.push(locationPermission);
  }

  Future<void> requestLocation(WidgetRef ref, BuildContext context) async {
    await Geolocator.requestPermission();
    if (context.mounted) {
      finishOnboarding(ref, context);
    }
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
