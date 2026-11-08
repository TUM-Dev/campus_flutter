import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/campusComponent/view/movie/movies_widget_view.dart';
import 'package:campus_flutter/campusComponent/view/news/news_widget_view.dart';
import 'package:campus_flutter/campusComponent/view/studentClub/student_club_widget_view.dart';
import 'package:campus_flutter/campusComponent/viewmodel/movies_viewmodel.dart';
import 'package:campus_flutter/campusComponent/viewmodel/news_viewmodel.dart';
import 'package:campus_flutter/campusComponent/viewmodel/student_club_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Translations extends AssetLoader {
  const _Translations();
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async => {
    'apiNotFound': 'Information unavailable',
    'apiNotFoundRecovery': 'This information is unavailable.',
    'apiUnavailable': 'Service temporarily unavailable',
    'apiTryLater': 'Please try again later.',
    'more': 'More',
    'news': 'News',
    'tryAgain': 'Try again',
  };
}

class _Movies extends MovieViewModel {
  _Movies(this.failure);
  final Object failure;
  @override
  Future<void> fetch(bool forcedRefresh) async => movies.addError(failure);
}

class _News extends NewsViewModel {
  _News(this.failure);
  final Object failure;
  @override
  Future<void> fetch(bool forcedRefresh) async => news.addError(failure);
}

class _Clubs extends StudentClubViewModel {
  _Clubs(this.failure);
  final Object failure;
  @override
  Future<void> fetchStudentClubs(
    bool forceRefresh,
    BuildContext context,
  ) async => suggestions.addError(failure);
}

Future<void> pumpCard(WidgetTester tester, Widget child) async {
  await tester.pumpWidget(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      startLocale: const Locale('en'),
      saveLocale: false,
      path: 'unused',
      assetLoader: const _Translations(),
      child: Builder(
        builder: (context) => MaterialApp(
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          home: Scaffold(body: SingleChildScrollView(child: child)),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  for (final failure in [
    const GrpcError.notFound('not found'),
    const GrpcError.unavailable('unavailable'),
  ]) {
    testWidgets('TU Film preserves gRPC status ${failure.code}', (
      tester,
    ) async {
      final model = _Movies(failure);
      addTearDown(() async {
        await model.movies.close();
        await model.lastFetched.close();
      });
      await pumpCard(
        tester,
        ProviderScope(
          overrides: [movieViewModel.overrideWithValue(model)],
          child: const MovieWidgetView(),
        ),
      );
      expect(
        tester
            .widget<ErrorHandlingRouter>(find.byType(ErrorHandlingRouter))
            .error,
        same(failure),
      );
      expect(
        find.text(
          failure.code == StatusCode.notFound
              ? 'Information unavailable'
              : 'Service temporarily unavailable',
        ),
        findsOneWidget,
      );
      expect(find.text('Unknown Error'), findsNothing);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('News preserves the missing-data status', (tester) async {
    const failure = GrpcError.notFound('not found');
    final model = _News(failure);
    addTearDown(() async {
      await model.news.close();
      await model.newsBySource.close();
      await model.lastFetched.close();
    });
    await pumpCard(
      tester,
      ProviderScope(
        overrides: [newsViewModel.overrideWithValue(model)],
        child: const NewsWidgetView(),
      ),
    );
    expect(
      tester
          .widget<ErrorHandlingRouter>(find.byType(ErrorHandlingRouter))
          .error,
      same(failure),
    );
    expect(find.text('Information unavailable'), findsOneWidget);
  });

  testWidgets('Student Clubs preserves the actual failure', (tester) async {
    const failure = GrpcError.unavailable('unavailable');
    final model = _Clubs(failure);
    addTearDown(() async {
      await model.collections.close();
      await model.suggestions.close();
    });
    await pumpCard(
      tester,
      ProviderScope(
        overrides: [studentClubViewModel.overrideWithValue(model)],
        child: const StudentClubWidgetView(),
      ),
    );
    expect(
      tester
          .widget<ErrorHandlingRouter>(find.byType(ErrorHandlingRouter))
          .error,
      same(failure),
    );
    expect(find.text('Service temporarily unavailable'), findsOneWidget);
  });
}
