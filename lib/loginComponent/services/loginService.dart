import 'dart:io' as io;

import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApi.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiError.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/loginComponent/model/confirm.dart';
import 'package:campus_flutter/loginComponent/model/token.dart';
import 'package:get/get.dart';

class LoginService {
  static Future<Token> requestNewToken(String name) async {
    MainApi mainApi = Get.find();
    final response = await mainApi.makeRequest<Token, TumOnlineApi, TumOnlineApiError>(
        TumOnlineApi(TumOnlineServiceTokenRequest(tumId: name, deviceName: io.Platform.localHostname)),
        Token.fromJson,
        TumOnlineApiError.fromJson,
        false
    );
    return response.data;
  }
  
  static Future<Confirm> confirmToken() async {
    MainApi mainApi = Get.find();
    final response = await mainApi.makeRequest<Confirm, TumOnlineApi, TumOnlineApiError>(
        TumOnlineApi(TumOnlineServiceTokenConfirmation()),
        Confirm.fromJson,
        TumOnlineApiError.fromJson,
        false
    );

    return response.data;
  }
}