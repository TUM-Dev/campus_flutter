import 'package:campus_flutter/loginComponent/viewModels/login_viewmodel.dart';
import 'package:campus_flutter/loginComponent/views/login_view.dart';
import 'package:campus_flutter/navigation.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRouter extends ConsumerStatefulWidget {
  const AuthenticationRouter({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthenticationRouterState();
}

class _AuthenticationRouterState extends ConsumerState<AuthenticationRouter> {
  @override
  void initState() {
    ref.read(loginViewModel).checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.watch(loginViewModel).credentials,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ref.read(userPreferencesViewModel).loadUserPreferences();
          FlutterNativeSplash.remove();
          if (snapshot.data == Credentials.tumId ||
              snapshot.data == Credentials.noTumId) {
            return const Navigation();
          } else {
            return const LoginView();
          }
        } else {
          return const LoginView();
        }
      },
    );
  }
}
