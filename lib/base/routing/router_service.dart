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
  bool _isOnboarded = false;

  final WidgetRef ref;

  RouterService(this.ref);

  Future<String?> routingCallback(GoRouterState state) async {
    if (!_isInitialized) {
      if (await ref.read(onboardingViewModel).checkLogin() == true) {
        await ref.read(settingsViewModel).loadPreferences();
        await ref.read(studentCardViewModel).fetch(false);
        _isInitialized = true;
        _isOnboarded = true;
        FlutterNativeSplash.remove();
        return _takeAlternativeRoute() ?? home;
      } else {
        _isInitialized = true;
        FlutterNativeSplash.remove();
        return onboarding;
      }
    } else {
      // Returning fullPath would discard the geo link's query parameters.
      return canNavigate ? _takeAlternativeRoute() : null;
    }
  }

  void setOnboarded() {
    _isInitialized = true;
    _isOnboarded = true;
  }

  bool get canNavigate => _isInitialized && _isOnboarded;

  String? _takeAlternativeRoute() {
    final route = _alternativeRoute;
    _alternativeRoute = null;
    return route;
  }

  bool get isInitialized {
    return _isInitialized;
  }

  set alternativeRoute(String value) {
    _alternativeRoute = value;
  }
}
