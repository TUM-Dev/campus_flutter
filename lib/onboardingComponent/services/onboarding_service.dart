import 'dart:io';

import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_endpoint.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/onboardingComponent/model/confirm.dart';
import 'package:campus_flutter/onboardingComponent/model/token.dart';
import 'package:campus_flutter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  static const key = "isOnboarded";

  final SharedPreferences sharedPreferences;

  OnboardingService(this.sharedPreferences);

  void setOnboarded() {
    sharedPreferences.setBool(OnboardingService.key, true);
  }

  void resetOnboardingStatus() {
    sharedPreferences.remove(OnboardingService.key);
  }

  bool? getOnboardingStatus() {
    return sharedPreferences.getBool(OnboardingService.key);
  }

  static Future<Token> requestNewToken(bool forcedRefresh, String name) async {
    RestClient restClient = getIt<RestClient>();
    final response = await restClient
        .getWithException<Token, TumOnlineApi, TumOnlineApiException>(
      TumOnlineApi(
        TumOnlineEndpointTokenRequest(
          tumId: name,
          deviceName: "TCA - ${Platform.isIOS ? "iOS" : "Android"}",
        ),
      ),
      Token.fromJson,
      TumOnlineApiException.fromJson,
      forcedRefresh,
    );
    return response.data;
  }

  static Future<Confirm> confirmToken(bool forcedRefresh) async {
    RestClient restClient = getIt<RestClient>();
    final response = await restClient
        .getWithException<Confirm, TumOnlineApi, TumOnlineApiException>(
      TumOnlineApi(TumOnlineEndpointTokenConfirmation()),
      Confirm.fromJson,
      TumOnlineApiException.fromJson,
      forcedRefresh,
    );

    return response.data;
  }
}
