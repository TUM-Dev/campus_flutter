import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_service.dart';
import 'package:campus_flutter/base/networking/protocols/main_api.dart';
import 'package:campus_flutter/loginComponent/model/confirm.dart';
import 'package:campus_flutter/loginComponent/model/token.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginService {
  static Future<Token> requestNewToken(bool forcedRefresh, String name) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi
        .makeRequestWithException<Token, TumOnlineApi, TumOnlineApiException>(
      TumOnlineApi(
        TumOnlineServiceTokenRequest(
          tumId: name,
          deviceName: "TCA - ${kIsWeb ? "Web App" : "Mobile"}",
        ),
      ),
      Token.fromJson,
      TumOnlineApiException.fromJson,
      forcedRefresh,
    );
    return response.data;
  }

  static Future<Confirm> confirmToken(bool forcedRefresh) async {
    MainApi mainApi = getIt<MainApi>();
    final response = await mainApi
        .makeRequestWithException<Confirm, TumOnlineApi, TumOnlineApiException>(
      TumOnlineApi(TumOnlineServiceTokenConfirmation()),
      Confirm.fromJson,
      TumOnlineApiException.fromJson,
      forcedRefresh,
    );

    return response.data;
  }
}
