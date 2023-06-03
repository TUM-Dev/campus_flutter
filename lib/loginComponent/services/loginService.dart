import 'dart:io' as io;

import 'package:campus_flutter/base/networking/apis/tumOnlineAPI.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/loginComponent/model/confirm.dart';
import 'package:campus_flutter/loginComponent/model/token.dart';

class LoginService {
  static Future<Token> requestNewToken(String name) async {
    final token = await MainAPI.makeRequest<Token, TUMOnlineAPI>(
        TUMOnlineAPI(TUMOnlineServices.tokenRequest, {
          TUMOnlineParameters.tumID: name,
          TUMOnlineParameters.tokenName: io.Platform.localHostname
        }),
        Token.fromJson,
        null,
        false
    );
    TUMOnlineAPI.token = token.content;
    return token;
  }
  
  static Future<Confirm> confirmToken() async {
    return await MainAPI.makeRequest<Confirm, TUMOnlineAPI>(
        TUMOnlineAPI(TUMOnlineServices.tokenConfirmation, {}),
        Confirm.fromJson,
        TUMOnlineAPI.token,
        false
    );
  }
}