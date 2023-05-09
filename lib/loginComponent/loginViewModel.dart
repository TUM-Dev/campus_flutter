import 'package:campus_flutter/loginComponent/loginRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class LoginViewModel extends ChangeNotifier {
  final LoginRepository _loginRepository = LoginRepository();
  final _storage = const FlutterSecureStorage();
  String? token;
  Credentials? credentials;

  Future checkLogin() async {
    _storage.read(key: "token").then((value) async {
      if (value != null) {
        await _loginRepository.confirmNewToken(value).then((value) {
          credentials = Credentials.tumId;
          notifyListeners();
        }, onError: (error) => _errorHandling());
      } else {
        _errorHandling();
      }
    }, onError: (error) => _errorHandling());
  }

  _errorHandling() {
    print("Error");
    credentials = Credentials.none;
    notifyListeners();
  }

  Future requestLogin(String name) async {
    token = await _loginRepository.fetchNewToken(name);
    _storage.write(key: "token", value: token);
    notifyListeners();
  }

  Future confirmLogin() async {
    if (token != null) {
      try {
        await _loginRepository.confirmNewToken(token!);
        credentials = Credentials.tumId;
        notifyListeners();
      } catch (e) {}
    }
  }

  Future skip() async {
    credentials = Credentials.noTumId;
    notifyListeners();
  }

  Future logout() async {
    credentials = Credentials.none;
    _storage.delete(key: "token");
    notifyListeners();
  }
}

enum Credentials {
  none,
  noTumId,
  tumId
}