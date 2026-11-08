import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/theme/light_theme.dart';
import 'package:campus_flutter/base/theme/dark_theme.dart';
import 'package:campus_flutter/campusComponent/screen/campus_screen.dart';
import 'package:campus_flutter/campusComponent/view/news/news_widget_view.dart';
import 'package:campus_flutter/campusComponent/viewmodel/news_viewmodel.dart';
import 'package:campus_flutter/campusComponent/viewmodel/movies_viewmodel.dart';
import 'package:campus_flutter/campusComponent/viewmodel/student_club_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _translations = <String, Map<String, dynamic>>{};

class _ImageCache extends Fake implements BaseCacheManager {
  @override
  Stream<FileResponse> getFileStream(
    String url, {
    String? key,
    Map<String, String>? headers,
    bool withProgress = false,
  }) => Stream.error(StateError('Use bundled placeholders in widget tests'));
}

class _Translations extends AssetLoader {
  const _Translations();
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async =>
      _translations[locale.languageCode]!;
}

class _News extends NewsViewModel {
  @override
  Future<void> fetch(bool forcedRefresh) async {}
}

class _Movies extends MovieViewModel {
  @override
  Future<void> fetch(bool forcedRefresh) async {}
}

class _Clubs extends StudentClubViewModel {
  @override
  Future<void> fetchStudentClubs(
    bool forceRefresh,
    BuildContext context,
  ) async {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
    CachedNetworkImageProvider.defaultCacheManager = _ImageCache();
    for (final language in ['en', 'de']) {
      _translations[language] = jsonDecode(
        await rootBundle.loadString('assets/translations/$language.json'),
      ) as Map<String, dynamic>;
    }
    // Real text makes optional local previews useful for visual review.
    if (Platform.isMacOS) {
      for (final family in ['Roboto', 'Ahem']) {
        final font = FontLoader(family)
          ..addFont(
            File('/System/Library/Fonts/Supplemental/Arial.ttf')
                .readAsBytes()
                .then((bytes) => ByteData.sublistView(bytes)),
          );
        await font.load();
      }
      final icons = FontLoader('MaterialIcons')
        ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'));
      await icons.load();
    }
  });

  Future<GoRouter> pumpCampus(
    WidgetTester tester, {
    Size size = const Size(390, 844),
    double scale = 1,
    String language = 'en',
    bool dark = false,
    Widget child = const CampusScreen(),
  }) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final newsModel = _News();
    final movieModel = _Movies();
    final clubModel = _Clubs();
    // Duplicate headlines intentionally exercise the displayed-list tap mapping.
    newsModel.news.add([
      News(
        title: 'A new semester on campus',
        imageUrl: 'https://example.test/first.png',
        sourceTitle: 'TUM',
      ),
      News(
        title: 'A new semester on campus',
        imageUrl: 'https://example.test/duplicate.png',
        sourceTitle: 'TUM',
      ),
      News(
        title: 'Research that makes a difference',
        imageUrl: 'https://example.test/second.png',
        sourceTitle: 'TUM',
      ),
    ]);
    movieModel.movies.add([
      Movie(title: 'TU Film: Interstellar'),
      Movie(title: 'TU Film: The Grand Budapest Hotel'),
      Movie(title: 'TU Film: Perfect Days'),
    ]);
    clubModel.suggestions.add([
      StudentClub(name: 'Student Music Initiative'),
      StudentClub(name: 'Robotics & Engineering'),
      StudentClub(name: 'Campus Volunteers'),
    ]);
    addTearDown(() async {
      await newsModel.news.close();
      await newsModel.newsBySource.close();
      await newsModel.lastFetched.close();
      await movieModel.movies.close();
      await movieModel.lastFetched.close();
      await clubModel.suggestions.close();
      await clubModel.collections.close();
    });
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => RepaintBoundary(
            key: const ValueKey('preview'),
            child: Scaffold(body: child),
          ),
        ),
        for (final route in [networkImage, news, movies, studentClubs])
          GoRoute(
            path: route,
            builder: (context, state) =>
                Scaffold(body: Text(state.extra?.toString() ?? route)),
          ),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          newsViewModel.overrideWithValue(newsModel),
          movieViewModel.overrideWithValue(movieModel),
          studentClubViewModel.overrideWithValue(clubModel),
        ],
        child: EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('de')],
          startLocale: Locale(language),
          saveLocale: false,
          path: 'unused',
          assetLoader: const _Translations(),
          child: Builder(
            builder: (context) => MaterialApp.router(
              routerConfig: router,
              theme: dark ? darkTheme(context) : lightTheme(context),
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.linear(scale)),
                child: child!,
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.runAsync(() async {
      final context = tester.element(find.byType(Scaffold).first);
      for (final asset in ['news', 'movie', 'student_club']) {
        await precacheImage(
          AssetImage('assets/images/placeholders/${asset}_placeholder.png'),
          context,
        );
      }
    });
    await tester.pumpAndSettle();
    return router;
  }

  for (final config in [
    (const Size(390, 844), 1.0, 'en', false),
    (const Size(320, 700), 2.0, 'de', false),
    (const Size(1200, 900), 1.0, 'en', true),
  ]) {
    testWidgets(
      'Campus browses at ${config.$1}, text ${config.$2}, ${config.$3}',
      (tester) async {
        await pumpCampus(
          tester,
          size: config.$1,
          scale: config.$2,
          language: config.$3,
          dark: config.$4,
        );
        expect(tester.takeException(), isNull);
        expect(find.byType(CarouselView), findsNWidgets(3));
        for (final carousel in tester.widgetList<CarouselView>(
          find.byType(CarouselView),
        )) {
          expect(carousel.itemSnapping, isFalse);
        }
        if (const bool.fromEnvironment('CAMPUS_PREVIEW')) {
          await tester.runAsync(() async {
            final boundary = tester.renderObject<RenderRepaintBoundary>(
              find.byKey(const ValueKey('preview')),
            );
            final image = await boundary.toImage();
            final data = await image.toByteData(format: ui.ImageByteFormat.png);
            await File('/tmp/campus-${config.$1.width.toInt()}.png')
                .writeAsBytes(data!.buffer.asUint8List());
            image.dispose();
          });
        }
        await tester.drag(
          find.byType(SingleChildScrollView).first,
          const Offset(0, -1200),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      },
    );
  }

  testWidgets('news opens the deduplicated card that was selected', (
    tester,
  ) async {
    await pumpCampus(tester, child: const NewsWidgetView());
    final carousel = tester.widget<CarouselView>(find.byType(CarouselView));
    expect(carousel.children.length, 2);
    carousel.onTap!(1);
    await tester.pumpAndSettle();
    expect(find.textContaining('second.png'), findsOneWidget);
  });

  testWidgets('Campus category shortcuts open their collections', (
    tester,
  ) async {
    final router = await pumpCampus(tester);
    for (final (index, destination) in [
      (0, news),
      (1, movies),
      (2, studentClubs),
    ]) {
      await tester.tap(find.byType(ActionChip).at(index));
      await tester.pumpAndSettle();
      expect(find.text(destination), findsOneWidget);
      router.pop();
      await tester.pumpAndSettle();
    }
  });
}
