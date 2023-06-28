import 'package:campus_flutter/base/networking/apis/tumOnlineAPI.dart';
import 'package:xml/xml.dart';
import 'dart:io' as io;

class LoginRepository {
  Future<String> fetchNewToken(String name) async {
    final response = await TUMOnlineAPI(
        TUMOnlineServices.tokenRequest,
        {TUMOnlineParameters.tumID: name, TUMOnlineParameters.tokenName : io.Platform.localHostname}
    ).asResponse();

    print(response.body);

    if(response.statusCode == 200) {
      final document = XmlDocument.parse(response.body);
      try {
        return document.findAllElements('token').first.children.first.text;
      } catch (e) {
        throw Exception("new token could not be fetched");
      }
    } else {
      throw Exception("new token could not be fetched");
    }
  }

  Future confirmNewToken(String token) async {
    TUMOnlineAPI.token = token;

    print(TUMOnlineAPI.token);

    final response = await TUMOnlineAPI(
        TUMOnlineServices.tokenConfirmation,
        {}
    ).asResponse(token: token);

    try {
      final document = XmlDocument.parse(response.body);
      final value = document
          .findAllElements('confirmed')
          .first
          .children
          .first
          .text;

      if (response.statusCode != 200 || value != "true") {
        throw Exception('unable to check token');
      }
    } catch (e) {
      throw Exception('unable to check token');
    }
  }
}