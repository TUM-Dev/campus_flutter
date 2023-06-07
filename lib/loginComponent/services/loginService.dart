import 'dart:io' as io;

import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApi.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/loginComponent/model/confirm.dart';
import 'package:campus_flutter/loginComponent/model/token.dart';

class LoginService {
  static Future<Token> requestNewToken(String name) async {
    final token = await MainApi.makeRequest<Token, TUMOnlineApi>(
        TUMOnlineApi(TUMOnlineServiceTokenRequest(tumId: name, deviceName: io.Platform.localHostname)),
        Token.fromJson,
        null,
        false
    );
    TUMOnlineApi.token = token.content;
    return token;
  }
  
  static Future<Confirm> confirmToken() async {
    return await MainApi.makeRequest<Confirm, TUMOnlineApi>(
        TUMOnlineApi(TUMOnlineServiceTokenConfirmation()),
        Confirm.fromJson,
        TUMOnlineApi.token,
        false
    );
  }
}