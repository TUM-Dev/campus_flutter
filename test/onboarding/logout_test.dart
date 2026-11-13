import 'package:campus_flutter/base/enums/credentials.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

class _LogoutModel extends OnboardingViewModel {
  bool preferencesReset = false;

  @override
  Future<void> resetPreferences(WidgetRef ref) async => preferencesReset = true;
}

class _Client implements RestClient {
  bool cacheCleared = false;

  @override
  Future<void> clearCache() async => cacheCleared = true;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const storage = FlutterSecureStorage();
  const channel = MethodChannel('home_widget');
  late _LogoutModel model;
  late _Client client;
  late List<MethodCall> calls;
  String? failingMethod;

  setUp(() {
    FlutterSecureStorage.setMockInitialValues({'token': 'signed-in'});
    Api.tumToken = 'signed-in';
    model = _LogoutModel()..credentials.add(Credentials.tumId);
    client = _Client();
    getIt.registerSingleton<RestClient>(client);
    calls = [];
    failingMethod = null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          calls.add(call);
          if (call.method == failingMethod) {
            throw PlatformException(code: '-3', message: 'Widget unavailable');
          }
          return true;
        });
  });

  tearDown(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
    model.tumIdController.dispose();
    await model.credentials.close();
    await model.tumIdValid.close();
    Api.tumToken = '';
    await getIt.reset();
  });

  Future<void> expectSignedOut() async {
    expect(await storage.read(key: 'token'), isNull);
    expect(Api.tumToken, isEmpty);
    expect(model.credentials.value, Credentials.none);
    expect(model.preferencesReset, isTrue);
    expect(client.cacheCleared, isTrue);
  }

  Future<WidgetRef> mountRef(WidgetTester tester) async {
    late WidgetRef widgetRef;
    await tester.pumpWidget(
      ProviderScope(
        child: Consumer(
          builder: (context, ref, child) {
            widgetRef = ref;
            return const SizedBox();
          },
        ),
      ),
    );
    return widgetRef;
  }

  testWidgets('logout clears widget data and updates the registered provider', (
    tester,
  ) async {
    await model.logout(await mountRef(tester));
    await expectSignedOut();
    final writes = calls
        .where((call) => call.method != 'getWidgetData')
        .toList();
    expect(writes.map((call) => call.method), [
      'saveWidgetData',
      'saveWidgetData',
      'updateWidget',
    ]);
    expect(writes[0].arguments, {'id': 'calendar', 'data': null});
    expect(writes[1].arguments, {'id': 'calendar_save', 'data': null});
    expect(
      calls.last.arguments['android'],
      'widgets.calendar.CalendarWidgetProvider',
    );
    expect(calls.last.arguments['ios'], 'CalendarWidget');
  });

  for (final method in ['getWidgetData', 'saveWidgetData', 'updateWidget']) {
    testWidgets('logout completes when $method fails', (tester) async {
      failingMethod = method;
      await model.logout(await mountRef(tester));
      await expectSignedOut();
    });
  }
}
