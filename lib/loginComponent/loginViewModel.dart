import 'package:campus_flutter/loginComponent/loginRepository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel {
  final LoginRepository _loginRepository = LoginRepository();
  final _storage = const FlutterSecureStorage();
  BehaviorSubject<String?> token = BehaviorSubject.seeded(null);
  BehaviorSubject<Credentials?> credentials = BehaviorSubject.seeded(null);

  Future checkLogin() async {
    _storage.read(key: "token").then((value) async {
      if (value != null) {
        await _loginRepository.confirmNewToken(value).then((value) {
          credentials.add(Credentials.tumId);
        }, onError: (error) => _errorHandling());
      } else {
        _errorHandling();
      }
    }, onError: (error) => _errorHandling());
  }

  _errorHandling() {
    print("Error");
    credentials.add(Credentials.none);
  }

  Future requestLogin(String name) async {
    token.add(await _loginRepository.fetchNewToken(name));
    _storage.write(key: "token", value: token.value);
  }

  Future confirmLogin() async {
    if (token != null) {
      try {
        await _loginRepository.confirmNewToken(token.value!);
        credentials.add(Credentials.tumId);
      } catch (e) {}
    }
  }

  Future skip() async {
    credentials.add(Credentials.noTumId);
  }

  Future logout() async {
    credentials.add(Credentials.none);
    _storage.delete(key: "token");
  }
}

enum Credentials {
  none,
  noTumId,
  tumId
}