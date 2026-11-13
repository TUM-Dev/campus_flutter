import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/theme/light_theme.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/campusComponent/screen/movie_screen.dart';
import 'package:campus_flutter/campusComponent/screen/news_screen.dart';
import 'package:campus_flutter/campusComponent/screen/student_clubs_screen.dart';
import 'package:campus_flutter/campusComponent/viewmodel/movies_viewmodel.dart';
import 'package:campus_flutter/campusComponent/viewmodel/news_viewmodel.dart';
import 'package:campus_flutter/campusComponent/viewmodel/student_club_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _translations = <String, Map<String, dynamic>>{};

class _Translations extends AssetLoader {
  const _Translations();
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async =>
      _translations[locale.languageCode]!;
}

class _ImageCache extends Fake implements BaseCacheManager {
  @override
  Stream<FileResponse> getFileStream(
    String url, {
    String? key,
    Map<String, String>? headers,
    bool withProgress = false,
  }) => Stream.error(StateError('Local placeholders'));
}

class _Response {
  bool empty = true;
  Object? error;
  final StackTrace stack = StackTrace.fromString('original collection stack');
  final calls = <bool>[];
}

class _News extends NewsViewModel {
  _News(this.response);
  final _Response response;
  @override
  Future<void> fetch(bool forcedRefresh) async {
    response.calls.add(forcedRefresh);
    if (response.error != null) {
      newsBySource.addError(response.error!, response.stack);
      return;
    }
    newsBySource.add(
      response.empty
          ? {}
          : {
              'TUM': [
                News(title: 'Research and life on campus', sourceTitle: 'TUM'),
              ],
              'Campus': [
                News(
                  title: 'Meet your campus community',
                  sourceTitle: 'Campus',
                ),
              ],
            },
    );
  }
}

class _Movies extends MovieViewModel {
  _Movies(this.response);
  final _Response response;
  @override
  Future<void> fetch(bool forcedRefresh) async {
    response.calls.add(forcedRefresh);
    if (response.error != null) {
      movies.addError(response.error!, response.stack);
      return;
    }
    movies.add(
      response.empty
          ? []
          : [
              Movie(title: 'Interstellar'),
              Movie(title: 'The Grand Budapest Hotel'),
            ],
    );
  }
}

class _Clubs extends StudentClubViewModel {
  _Clubs(this.response);
  final _Response response;
  @override
  Future<void> fetchStudentClubs(
    bool forceRefresh,
    BuildContext context,
  ) async {
    response.calls.add(forceRefresh);
    if (response.error != null) {
      collections.addError(response.error!, response.stack);
      return;
    }
    collections.add(
      response.empty
          ? []
          : [
              StudentClubCollection(
                title: 'Music',
                clubs: [StudentClub(name: 'Student Music Initiative')],
              ),
              StudentClubCollection(
                title: 'Technology',
                clubs: [StudentClub(name: 'Robotics and Engineering')],
              ),
            ],
    );
  }
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
    if (const bool.fromEnvironment('CAMPUS_PREVIEW') && Platform.isMacOS) {
      for (final family in ['Ahem', 'Roboto']) {
        await (FontLoader(family)..addFont(
              File('/System/Library/Fonts/Supplemental/Arial.ttf')
                  .readAsBytes()
                  .then((bytes) => ByteData.sublistView(bytes)),
            ))
            .load();
      }
      await (FontLoader(
        'MaterialIcons',
      )..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'))).load();
    }
  });

  Future<_Response> pumpCollection(
    WidgetTester tester,
    String kind, {
    bool empty = true,
    Object? error,
    double scale = 1,
    Size size = const Size(390, 844),
    String language = 'en',
  }) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final response = _Response()
      ..empty = empty
      ..error = error;
    final news = _News(response);
    final movies = _Movies(response);
    final clubs = _Clubs(response);
    addTearDown(() async {
      await news.news.close();
      await news.newsBySource.close();
      await news.lastFetched.close();
      await movies.movies.close();
      await movies.lastFetched.close();
      await clubs.collections.close();
      await clubs.suggestions.close();
    });
    final screen = switch (kind) {
      'news' => const NewsScreen(),
      'movies' => const MovieScreen(),
      _ => const StudentClubsScreen(),
    };
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          newsViewModel.overrideWithValue(news),
          movieViewModel.overrideWithValue(movies),
          studentClubViewModel.overrideWithValue(clubs),
        ],
        child: EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('de')],
          startLocale: Locale(language),
          saveLocale: false,
          path: 'unused',
          assetLoader: const _Translations(),
          child: Builder(
            builder: (context) => MaterialApp(
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: [
                ...GlobalMaterialLocalizations.delegates,
                ...context.localizationDelegates,
              ],
              theme: lightTheme(context),
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.linear(scale)),
                child: child!,
              ),
              home: RepaintBoundary(
                key: const ValueKey('collection-preview'),
                child: screen,
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return response;
  }

  for (final kind in ['news', 'movies', 'clubs']) {
    testWidgets(
      '$kind loads on direct entry and empty results can pull to refresh',
      (tester) async {
        final response = await pumpCollection(tester, kind);
        expect(response.calls, [false]);
        expect(find.textContaining('Found!'), findsOneWidget);
        expect(find.byType(TabBar), findsNothing);
        await tester.drag(find.byType(CustomScrollView), const Offset(0, 350));
        await tester.pumpAndSettle();
        expect(response.calls, [false, true]);
        await tester.tap(find.byTooltip('Refresh'));
        await tester.pumpAndSettle();
        expect(response.calls, [false, true, true]);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets('$kind recovers from a service error with retry', (
      tester,
    ) async {
      final response = await pumpCollection(
        tester,
        kind,
        error: const GrpcError.unavailable(),
      );
      expect(find.byType(ErrorHandlingRouter), findsOneWidget);
      final router = tester.widget<ErrorHandlingRouter>(
        find.byType(ErrorHandlingRouter),
      );
      expect(router.error, same(response.error));
      expect(router.stackTrace, same(response.stack));
      response.error = null;
      response.empty = false;
      await tester.tap(find.text('Try Again'));
      await tester.pumpAndSettle();
      expect(response.calls, [false, true]);
      expect(find.byType(ErrorHandlingRouter), findsNothing);
      expect(find.byType(SliverGrid), findsWidgets);
      expect(tester.takeException(), isNull);
    });

    if (kind != 'movies') {
      testWidgets('$kind preserves the selected category when refreshed', (
        tester,
      ) async {
        final response = await pumpCollection(tester, kind, empty: false);
        final tab = kind == 'news' ? 'Campus' : 'Technology';
        final title = kind == 'news'
            ? 'Meet your campus community'
            : 'Robotics and Engineering';
        await tester.tap(find.text(tab));
        await tester.pumpAndSettle();
        expect(find.text(title), findsOneWidget);
        await tester.tap(find.byTooltip('Refresh'));
        await tester.pumpAndSettle();
        expect(response.calls, [false, true]);
        expect(find.text(title), findsOneWidget);
        expect(tester.takeException(), isNull);
      });
    }

    for (final config in [
      (const Size(320, 700), 2.0, 'de'),
      (const Size(1100, 850), 1.0, 'en'),
    ]) {
      testWidgets('$kind cards fit ${config.$1} with text scale ${config.$2}', (
        tester,
      ) async {
        final response = await pumpCollection(
          tester,
          kind,
          empty: false,
          size: config.$1,
          scale: config.$2,
          language: config.$3,
        );
        await tester.runAsync(() async {
          for (final asset in ['news', 'movie', 'student_club']) {
            await precacheImage(
              AssetImage('assets/images/placeholders/${asset}_placeholder.png'),
              tester.element(find.byType(Scaffold)),
            );
          }
        });
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        if (const bool.fromEnvironment('CAMPUS_PREVIEW')) {
          await tester.runAsync(() async {
            final boundary = tester.renderObject<RenderRepaintBoundary>(
              find.byKey(const ValueKey('collection-preview')),
            );
            final image = await boundary.toImage();
            final bytes = await image.toByteData(
              format: ui.ImageByteFormat.png,
            );
            await File('/tmp/collection-$kind-${config.$1.width.toInt()}.png')
                .writeAsBytes(bytes!.buffer.asUint8List());
            image.dispose();
          });
        }
        // Even a short collection can refresh, then settle into its empty state.
        response.empty = true;
        await tester.drag(
          find.byType(CustomScrollView).first,
          const Offset(0, 350),
        );
        await tester.pumpAndSettle();
        expect(response.calls, [false, true]);
        expect(find.byType(TabBar), findsNothing);
        expect(tester.takeException(), isNull);
      });
    }
  }
}
