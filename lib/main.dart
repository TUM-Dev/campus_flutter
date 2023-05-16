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
  runApp(Provider(create: (context) => LoginViewModel(), child: const CampusApp()));
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
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            scaffoldBackgroundColor: const Color(0xfff2f2f7),
            textTheme: const TextTheme(
                labelLarge: TextStyle(color: Color(0xff0065bd)),
                titleMedium: TextStyle(color: Color(0xff0065bd))
            ),
            appBarTheme: const AppBarTheme(
                surfaceTintColor: Color(0xfff2f2f7),
                backgroundColor: Color(0xfff2f2f7)),
            cardTheme: const CardTheme(
                color: Colors.white,
                surfaceTintColor: Colors.transparent,
                shadowColor: Colors.transparent),
            expansionTileTheme: const ExpansionTileThemeData(
                collapsedTextColor: Color(0xff0065bd),
                collapsedIconColor: Color(0xff0065bd)),
            useMaterial3: true,
            dividerColor: Colors.transparent,
            navigationBarTheme: const NavigationBarThemeData(
                indicatorColor: Colors.transparent,
                backgroundColor: Color(0xF0F8F9F8),
                surfaceTintColor: Colors.transparent,
                elevation: 50.0)),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorSchemeSeed: const Color(0xff0065bd),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            scaffoldBackgroundColor: const Color(0xff191919),
            appBarTheme: const AppBarTheme(
                surfaceTintColor: Color(0xff191919),
                backgroundColor: Color(0xff191919)),
            cardTheme: const CardTheme(
                color: Color(0xff252525),
                surfaceTintColor: Colors.transparent,
                shadowColor: Colors.transparent),
            expansionTileTheme: ExpansionTileThemeData(
              // TODO: figure out color for collapsed text
              collapsedTextColor:
              Theme.of(context).expansionTileTheme.textColor,
              collapsedIconColor:
              Theme.of(context).expansionTileTheme.textColor,
            ),
            useMaterial3: true,
            dividerColor: Colors.transparent,
            navigationBarTheme: const NavigationBarThemeData(
                indicatorColor: Colors.transparent,
                backgroundColor: Color(0xF01D1D1D),
                surfaceTintColor: Colors.transparent,
                elevation: 50.0)),
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
    //WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<LoginViewModel>(context, listen: false).checkLogin();
    //});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<LoginViewModel>(context, listen: true).credentials,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            FlutterNativeSplash.remove();
            if(snapshot.data == Credentials.tumId || snapshot.data == Credentials.noTumId) {
              return const Navigation();
            } else {
              return LoginView();
            }
          } else {
            return LoginView();
          }
        });
  }
}
