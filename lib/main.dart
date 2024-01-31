import 'dart:io';

import 'package:campus_flutter/authentication_router.dart';
import 'package:campus_flutter/base/enums/appearance.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/cached_client.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/cached_response.dart';
import 'package:campus_flutter/base/networking/base/connection_checker.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/base/theme/dark_theme.dart';
import 'package:campus_flutter/base/theme/light_theme.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_view_service.dart';
import 'package:campus_flutter/navigation_service.dart';
import 'package:campus_flutter/placesComponent/services/map_theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:home_widget/home_widget.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';

final getIt = GetIt.instance;
final customLocale = StateProvider<Locale?>((ref) => null);
final appearance = StateProvider<Appearance>((ref) => Appearance.system);

main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  if (!kDebugMode && !kIsWeb) {
    await Firebase.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
  await _initializeGeneral();
  if (kIsWeb) {
    await _initializeWeb();
  } else {
    await _initializeMobile();
  }
  HomeWidget.setAppGroupId("group.de.tum.tca-widget");
  runApp(
    const ProviderScope(
      child: CampusApp(),
    ),
  );
}

Future<void> _initializeGeneral() async {
  getIt.registerSingleton<ConnectionChecker>(ConnectionChecker());
  getIt.registerSingleton<MapThemeService>(MapThemeService());
  getIt.registerSingleton<NavigationService>(NavigationService());
  getIt.registerSingleton<CalendarViewService>(CalendarViewService());
}

Future<void> _initializeWeb() async {
  getIt.registerSingleton<RESTClient>(RESTClient.webCache());
  getIt.registerSingleton<CachedCampusClient>(
    await CachedCampusClient.createWebCache(),
  );
}

Future<void> _initializeMobile() async {
  final directory = await getTemporaryDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter<CacheResponse>(CacheResponseAdapter());
  getIt.registerSingleton<List<AvailableMap>>(await MapLauncher.installedMaps);
  getIt.registerSingleton<RESTClient>(RESTClient.mobileCache(directory));
  getIt.registerSingleton<CachedCampusClient>(
    await CachedCampusClient.createMobileCache(directory),
  );
}

class CampusApp extends ConsumerWidget {
  const CampusApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: "TUM Campus App",
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: ref.watch(appearance).themeMode,
      locale: ref.watch(customLocale) ?? _getDeviceLocale(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const AuthenticationRouter(),
    );
  }
}

Locale _getDeviceLocale() {
  if (kIsWeb) {
    return const Locale("en", "DE");
  } else {
    final deviceLocal = Platform.localeName;
    if (deviceLocal.contains("de")) {
      return const Locale("de", "DE");
    } else {
      return const Locale("en", "DE");
    }
  }
}
