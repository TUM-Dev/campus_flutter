import 'package:campus_flutter/base/enums/credentials.dart';
import 'package:campus_flutter/base/networking/base/api_response.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/networking/protocols/api_exception.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/onboardingComponent/services/onboarding_service.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late OnboardingViewModel model;
  late _TokenClient client;
  const storage = FlutterSecureStorage();

  setUp(() async {
    FlutterSecureStorage.setMockInitialValues({});
    SharedPreferences.setMockInitialValues({});
    getIt.registerSingleton<OnboardingService>(
      OnboardingService(await SharedPreferences.getInstance()),
    );
    client = _TokenClient();
    getIt.registerSingleton<RestClient>(client);
    Api.tumToken = '';
    model = OnboardingViewModel();
    model.tumIdController.text = ' GO42TUM ';
  });

  tearDown(() async {
    model.tumIdController.dispose();
    await model.tumIdValid.close();
    await model.credentials.close();
    Api.tumToken = '';
    await getIt.reset();
  });

  test('normalizes request and does not persist unconfirmed access', () async {
    await model.requestLogin();
    expect(client.username, 'go42tum');
    expect(Api.tumToken, 'pending-token');
    expect(await storage.read(key: 'token'), isNull);

    final restarted = OnboardingViewModel();
    expect(await restarted.checkLogin(), isFalse);
    restarted.tumIdController.dispose();
    await restarted.credentials.close();
    await restarted.tumIdValid.close();
  });

  test('keeps access pending when confirmation returns false', () async {
    await model.requestLogin();
    expect((await model.confirmLogin()).confirmed, isFalse);
    expect(await storage.read(key: 'token'), isNull);
    expect(model.credentials.value, isNot(Credentials.tumId));
  });

  test('persists access only after successful confirmation', () async {
    await model.requestLogin();
    client.confirmed = true;
    expect((await model.confirmLogin()).confirmed, isTrue);
    expect(await storage.read(key: 'token'), 'pending-token');
    expect(model.credentials.value, Credentials.tumId);
  });

  test('rejects invalid input before making a token request', () async {
    model.tumIdController.text = 'name@tum.de';
    await expectLater(model.requestLogin(), throwsArgumentError);
    expect(client.username, isNull);
  });

  test('clearing the form resets the previous valid state', () {
    model.tumIdValid.add(true);
    model.clearTextFields();
    expect(model.tumIdController.text, isEmpty);
    expect(model.tumIdValid.value, isFalse);
  });
}

class _TokenClient implements RestClient {
  String? username;
  bool confirmed = false;

  @override
  Future<ApiResponse<T>>
  getWithException<T, S extends Api, U extends ApiException>(
    S endpoint,
    dynamic Function(Map<String, dynamic>) createObject,
    dynamic Function(Map<String, dynamic>) createError,
    bool forcedRefresh,
  ) async {
    final Map<String, dynamic> data;
    if (endpoint.slug.endsWith('requestToken')) {
      username = endpoint.parameters['pUsername'];
      data = {'token': 'pending-token'};
    } else {
      data = {'confirmed': '$confirmed'};
    }
    return ApiResponse(data: createObject(data) as T, saved: null);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
