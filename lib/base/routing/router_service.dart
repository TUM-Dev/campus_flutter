import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/settingsComponent/viewModels/settings_viewmodel.dart';
import 'package:campus_flutter/studentCardComponent/viewModel/student_card_viewmodel.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RouterService {
  String? _alternativeRoute;
  bool _isInitialized = false;

  final WidgetRef ref;

  RouterService(this.ref);

  Future<String> routingCallback(GoRouterState state) async {
    if (!_isInitialized) {
      if (await ref.read(onboardingViewModel).checkLogin() == true) {
        await ref.read(settingsViewModel).loadPreferences();
        await ref.read(studentCardViewModel).fetch(false);
        _isInitialized = true;
        FlutterNativeSplash.remove();
        return _alternativeRoute ?? home;
      } else {
        _isInitialized = true;
        FlutterNativeSplash.remove();
        return onboarding;
      }
    } else {
      return state.fullPath ?? home;
    }
  }

  void setOnboarded() {
    _isInitialized = true;
  }

  bool get isInitialized {
    return _isInitialized;
  }

  set alternativeRoute(String value) {
    _alternativeRoute = value;
  }
}
