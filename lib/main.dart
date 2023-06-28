import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/mapComponent/location.dart';
import 'package:campus_flutter/routes.dart';
import 'package:campus_flutter/theme.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'loginComponent/views/loginView.dart';
import 'loginComponent/viewModels/loginViewModel.dart';
import 'navigation.dart';

main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Get.put(LocationService());
  Get.put(Connectivity());
  Get.put(MainApi(await getTemporaryDirectory()));
  runApp(Provider(create: (context) => LoginViewModel(), child: const CampusApp()));
}

class CampusApp extends StatelessWidget {
  const CampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "TUM Campus App",
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
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
    Provider.of<LoginViewModel>(context, listen: false).checkLogin();
    super.initState();
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
