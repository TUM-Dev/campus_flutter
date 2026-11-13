import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localized_test_app.dart';

import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });
  const channel = MethodChannel('plugins.flutter.io/url_launcher');
  final calls = <MethodCall>[];
  late Future<bool> Function() result;
  late WidgetRef ref;

  setUp(() {
    calls.clear();
    result = () async => true;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          calls.add(call);
          return result();
        });
  });
  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });
  Future<void> pump(WidgetTester tester, {bool inApp = true}) async {
    await pumpCard(
      tester,
      ProviderScope(
        overrides: [useWebView.overrideWith((ref) => inApp)],
        child: Consumer(
          builder: (_, value, _) {
            ref = value;
            return const SizedBox();
          },
        ),
      ),
    );
  }

  testWidgets('awaits in-app failure and then external fallback', (
    tester,
  ) async {
    await pump(tester);
    result = () async {
      if (calls.length == 1) throw PlatformException(code: 'argument_error');
      return true;
    };
    await UrlLauncher.urlString('https://tum.de/a?x=1', ref);
    expect(calls.map((call) => call.method), ['launch', 'launch']);
    expect((calls.first.arguments as Map)['useWebView'], isTrue);
    expect((calls.last.arguments as Map)['useWebView'], isFalse);
    expect(find.byType(SnackBar), findsNothing);
  });
  testWidgets('false launch result also tries the external handler', (
    tester,
  ) async {
    await pump(tester);
    result = () async => calls.length > 1;
    await UrlLauncher.url(Uri.parse('https://tum.de'), ref);
    expect(calls, hasLength(2));
  });
  testWidgets('non-web schemes always use the external application', (
    tester,
  ) async {
    await pump(tester);
    await UrlLauncher.urlString('mailto:info@tum.de', ref);
    expect(calls, hasLength(1));
    expect((calls.single.arguments as Map)['useWebView'], isFalse);
  });
  testWidgets('invalid URLs show an error without invoking the platform', (
    tester,
  ) async {
    await pump(tester);
    for (final value in ['https://', 'not a URL', 'javascript:alert(1)']) {
      await UrlLauncher.urlString(value, ref);
    }
    await tester.pump();
    expect(calls, isEmpty);
    expect(find.byType(SnackBar), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  testWidgets('both asynchronous launch failures are handled', (tester) async {
    await pump(tester);
    result = () async => throw PlatformException(code: 'argument_error');
    await UrlLauncher.urlString('https://tum.de', ref);
    await tester.pump();
    expect(calls, hasLength(2));
    expect(find.byType(SnackBar), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  testWidgets('closing the screen during launch does not access its ref', (
    tester,
  ) async {
    await pump(tester);
    final pending = Completer<bool>();
    result = () => calls.length == 1 ? pending.future : Future.value(false);
    final launch = UrlLauncher.urlString('https://tum.de', ref);
    await tester.pump();
    await tester.pumpWidget(const SizedBox());
    pending.completeError(PlatformException(code: 'failed'));
    await launch;
    expect(tester.takeException(), isNull);
  });
}
