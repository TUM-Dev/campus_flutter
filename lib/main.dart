import 'package:campus_flutter/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'loginComponent/loginView.dart';
import 'loginComponent/loginViewModel.dart';
import 'navigation.dart';

main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(ChangeNotifierProvider(
      create: (context) => LoginViewModel(), child: const CampusApp()));
}

class CampusApp extends StatelessWidget {
  const CampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "TUM Campus App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            colorSchemeSeed: const Color(0xff0065bd),
            useMaterial3: true,
            navigationBarTheme: const NavigationBarThemeData(
                indicatorColor: Colors.transparent
            )),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorSchemeSeed: const Color(0xff0065bd),
            useMaterial3: true,
            navigationBarTheme: const NavigationBarThemeData(
                indicatorColor: Colors.transparent
            )),
        routes: {
          confirm: (context) => const ConfirmView(),
        },
        home: const AuthenticationRouter());
  }
}

class AuthenticationRouter extends StatefulWidget {
  const AuthenticationRouter({super.key});

  @override
  State<StatefulWidget> createState() => _AuthenticationRouterState();
}

class _AuthenticationRouterState extends State<AuthenticationRouter> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<LoginViewModel>(context, listen: false).checkLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, loginViewModel, child) {
        if (loginViewModel.credentials == null) {
          return const CircularProgressIndicator();
        } else {
          FlutterNativeSplash.remove();
          if (loginViewModel.credentials == Credentials.none) {
            return LoginView();
          } else {
            return const Navigation();
          }
        }
      },
    );
  }
}