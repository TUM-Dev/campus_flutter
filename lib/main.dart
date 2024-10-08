import 'package:campus_flutter/base/enums/appearance.dart';
import 'package:campus_flutter/base/enums/remote_config_message.dart';
import 'package:campus_flutter/base/enums/shortcut_item.dart';
import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:campus_flutter/base/util/enum_parser.dart';
import 'package:campus_flutter/base/networking/base/grpc_client.dart';
import 'package:campus_flutter/base/services/connection_service.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/base/routing/router.dart';
import 'package:campus_flutter/base/routing/router_service.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/theme/dark_theme.dart';
import 'package:campus_flutter/base/theme/light_theme.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_preference_service.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_view_service.dart';
import 'package:campus_flutter/onboardingComponent/services/onboarding_service.dart';
import 'package:campus_flutter/navigation_service.dart';
import 'package:campus_flutter/placesComponent/services/map_theme_service.dart';
import 'package:campus_flutter/settingsComponent/service/user_preferences_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:home_widget/home_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
final customLocale = StateProvider<Locale?>((ref) => null);
final appearance = StateProvider<Appearance>((ref) => Appearance.system);
final hasStatusMessage = StateProvider<(bool, RemoteConfigMessage?)>(
  (ref) => (false, null),
);

main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await _initializeLocalization();
  await _initializeFirebase();
  await _initializeNetworkingClients();
  await _initializeServices();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('de')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: ProviderScope(
        child: CampusApp(launchedFromWidget: await _initializeHomeWidgets()),
      ),
    ),
  );
}

Future<void> _initializeLocalization() async {
  EasyLocalization.logger.enableLevels = [
    LevelMessages.error,
    LevelMessages.warning,
  ];
  await EasyLocalization.ensureInitialized();
}

Future<void> _initializeFirebase() async {
  if (!kDebugMode) {
    await Firebase.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(hours: 1),
        ),
      );
    } catch (_) {}
  }
}

Future<void> _initializeNetworkingClients() async {
  final cacheDatabase = CacheDatabase();
  getIt.registerSingleton<RestClient>(
    RestClient(cacheDatabase),
  );
  getIt.registerSingleton<GrpcClient>(
    await GrpcClient.createGrpcClient(cacheDatabase),
  );
}

Future<void> _initializeServices() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<ConnectionService>(ConnectionService());
  getIt.registerSingleton<MapThemeService>(MapThemeService());
  getIt.registerSingleton<NavigationService>(NavigationService());
  getIt.registerSingleton<CalendarViewService>(CalendarViewService());
  getIt.registerSingleton<OnboardingService>(
    OnboardingService(sharedPreferences),
  );
  getIt.registerSingleton<UserPreferencesService>(
    UserPreferencesService(sharedPreferences),
  );
  getIt.registerSingleton<CalendarPreferenceService>(
    CalendarPreferenceService(sharedPreferences),
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
    firebaseCallback();
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
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
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

  void firebaseCallback() {
    if (!kDebugMode) {
      final remoteConfig = FirebaseRemoteConfig.instance;
      remoteConfig.fetchAndActivate().then((value) {
        if (value) {
          _handleFirebaseValues(
            RemoteConfigMessage.keys,
            remoteConfig.getAll(),
          );
        }
      });
      remoteConfig.onConfigUpdated.listen((event) async {
        await remoteConfig.activate();
        _handleFirebaseValues(event.updatedKeys, remoteConfig.getAll());
      });
    }
  }

  void _handleFirebaseValues(
    Set<String> updatedKeys,
    Map<String, RemoteConfigValue> values,
  ) {
    var shouldClear = true;
    for (var updatedKey in updatedKeys) {
      if (values[updatedKey]?.asBool() ?? false) {
        shouldClear = false;
        ref.read(hasStatusMessage.notifier).state = (
          true,
          RemoteConfigMessage.fromString(updatedKey),
        );
      }
    }
    if (shouldClear) {
      ref.read(hasStatusMessage.notifier).state = (false, null);
    }
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

  @override
  bool get wantKeepAlive => true;
}
