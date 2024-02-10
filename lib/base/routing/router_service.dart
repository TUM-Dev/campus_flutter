import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/onboardingComponent/services/onboarding_service.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/settingsComponent/viewModels/user_preferences_viewmodel.dart';
import 'package:campus_flutter/studentCardComponent/viewModel/student_card_viewmodel.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RouterService {
  String? _alternativeRoute;
  bool isInitialized = false;

  final WidgetRef ref;

  RouterService(this.ref);

  Future<String> routingCallback(GoRouterState state) async {
    if (!isInitialized) {
      if (getIt<OnboardingService>().getOnboardingStatus() != null) {
        await ref.read(userPreferencesViewModel).loadPreferences();
        await ref.read(onboardingViewModel).checkLogin();
        await ref.read(studentCardViewModel).fetch(false);
        isInitialized = true;
        FlutterNativeSplash.remove();
        return _alternativeRoute ?? home;
      } else {
        isInitialized = false;
        FlutterNativeSplash.remove();
        return onboarding;
      }
    } else {
      return state.fullPath ?? home;
    }
  }

  set alternativeRoute(String value) {
    _alternativeRoute = value;
  }
}
