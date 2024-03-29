import 'dart:io';

import 'package:campus_flutter/base/enums/appearance.dart';
import 'package:campus_flutter/base/enums/shortcut_item.dart';
import 'package:campus_flutter/base/util/enum_parser.dart';
import 'package:campus_flutter/base/networking/base/grpc_client.dart';
import 'package:campus_flutter/base/networking/base/connection_checker.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/base/routing/router.dart';
import 'package:campus_flutter/base/routing/router_service.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/theme/dark_theme.dart';
import 'package:campus_flutter/base/theme/light_theme.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_view_service.dart';
import 'package:campus_flutter/onboardingComponent/services/onboarding_service.dart';
import 'package:campus_flutter/navigation_service.dart';
import 'package:campus_flutter/placesComponent/services/map_theme_service.dart';
import 'package:campus_flutter/settingsComponent/service/user_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:home_widget/home_widget.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base/networking/cache/cache_entry.dart';

final getIt = GetIt.instance;
final customLocale = StateProvider<Locale?>((ref) => null);
final appearance = StateProvider<Appearance>((ref) => Appearance.system);

main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await _initializeFirebase();
  await _initializeNetworkingClients();
  await _initializeServices();
  runApp(
    ProviderScope(
      child: CampusApp(launchedFromWidget: await _initializeHomeWidgets()),
    ),
  );
}

Future<void> _initializeFirebase() async {
  if (!kDebugMode) {
    await Firebase.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
}

Future<void> _initializeNetworkingClients() async {
  final directory = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [
      CacheEntrySchema,
    ],
    directory: directory.path,
  );
  getIt.registerSingleton<RestClient>(RestClient(isar));
  getIt.registerSingleton<GrpcClient>(await GrpcClient.createGrpcClient(isar));
}

Future<void> _initializeServices() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<ConnectionChecker>(ConnectionChecker());
  getIt.registerSingleton<MapThemeService>(MapThemeService());
  getIt.registerSingleton<NavigationService>(NavigationService());
  getIt.registerSingleton<CalendarViewService>(CalendarViewService());
  getIt.registerSingleton<OnboardingService>(
    OnboardingService(sharedPreferences),
  );
  getIt.registerSingleton<UserPreferencesService>(
    UserPreferencesService(sharedPreferences),
  );
}

Future<bool> _initializeHomeWidgets() async {
  try {
    HomeWidget.setAppGroupId("group.de.tum.tca-widget");
    return await HomeWidget.initiallyLaunchedFromHomeWidget() != null;
  } catch (_) {
    return false;
  }
}

class CampusApp extends ConsumerStatefulWidget {
  const CampusApp({super.key, required this.launchedFromWidget});

  final bool launchedFromWidget;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CampusAppState();
}

class _CampusAppState extends ConsumerState<CampusApp>
    with AutomaticKeepAliveClientMixin {
  late QuickActions quickActions;

  @override
  void initState() {
    getIt.registerSingleton<RouterService>(RouterService(ref));
    quickActionsCallback();
    homeWidgetLaunchCallback();
    homeWidgetCallback();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp.router(
      title: "TUM Campus App",
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: ref.watch(appearance).themeMode,
      locale: ref.watch(customLocale) ?? getDeviceLocale(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (locale, locales) {
        quickActions.setShortcutItems(<ShortcutItem>[
          for (var shortcutItemType in ActiveShortcuts.items)
            shortcutItemType.shortcutItem(locale),
        ]);
        return locale;
      },
      routerConfig: ref.watch(routerProvider),
    );
  }

  void quickActionsCallback() {
    quickActions = const QuickActions()
      ..initialize((shortcutType) {
        final shortcutItemType = EnumParser.typeFromString(shortcutType);
        if (getIt<RouterService>().isInitialized) {
          ref.read(routerProvider).go(shortcutItemType.route);
        } else {
          getIt<RouterService>().alternativeRoute = shortcutItemType.route;
        }
      });
  }

  void homeWidgetLaunchCallback() {
    if (widget.launchedFromWidget) {
      getIt<RouterService>().alternativeRoute = calendar;
    }
  }

  void homeWidgetCallback() {
    HomeWidget.widgetClicked.listen((uri) async {
      if (uri != null) {
        if (uri.query.contains("calendar")) {
          if (getIt<RouterService>().isInitialized) {
            ref.read(routerProvider).go(calendar);
          } else {
            getIt<RouterService>().alternativeRoute = calendar;
          }
        }
      }
    });
  }

  Locale getDeviceLocale() {
    final deviceLocal = Platform.localeName;
    if (deviceLocal.contains("de")) {
      return const Locale("de", "DE");
    } else {
      return const Locale("en", "DE");
    }
  }

  @override
  bool get wantKeepAlive => true;
}
