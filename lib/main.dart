import 'package:campus_flutter/base/networking/apis/campusBackend/cached_client.dart';
import 'package:campus_flutter/base/networking/apis/campusBackend/cached_response.dart';
import 'package:campus_flutter/base/networking/protocols/main_api.dart';
import 'package:campus_flutter/loginComponent/viewModels/login_viewmodel.dart';
import 'package:campus_flutter/loginComponent/views/confirm_view.dart';
import 'package:campus_flutter/loginComponent/views/login_view.dart';
import 'package:campus_flutter/navigation.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/routes.dart';
import 'package:campus_flutter/theme.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Hive.registerAdapter<CacheResponse>(CacheResponseAdapter());
  getIt.registerSingleton<ConnectivityResult>(
      await Connectivity().checkConnectivity());
  if (kIsWeb) {
    getIt.registerSingleton<MainApi>(MainApi.webCache());
    getIt.registerSingleton<CachedCampusClient>(
        await CachedCampusClient.createWebCache());
  } else {
    getIt.registerSingleton<MainApi>(
        MainApi.mobileCache(await getTemporaryDirectory()));
    getIt.registerSingleton<CachedCampusClient>(
        await CachedCampusClient.createMobileCache(
            await getTemporaryDirectory()));
  }
  runApp(const ProviderScope(child: CampusApp()));
}

class CampusApp extends StatelessWidget {
  const CampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "TUM Campus App",
        debugShowCheckedModeBanner: false,
        theme: lightTheme(context),
        darkTheme: darkTheme(context),
        routes: {
          confirm: (context) => const ConfirmView(),
        },
        home: const AuthenticationRouter());
  }
}

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
        });
  }
}
