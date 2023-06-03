import 'package:campus_flutter/base/networking/apis/tumOnlineAPI.dart';
import 'package:campus_flutter/loginComponent/services/loginService.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel {
  final _storage = const FlutterSecureStorage();
  BehaviorSubject<String?> token = BehaviorSubject.seeded(null);
  BehaviorSubject<Credentials?> credentials = BehaviorSubject.seeded(null);

  Future checkLogin() async {
    _storage.read(key: "token").then((value) async {
      if (value != null) {
        TUMOnlineAPI.token = value;
        await LoginService.confirmToken().then((value) {
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
    token.add((await LoginService.requestNewToken(name)).content);
    _storage.write(key: "token", value: token.value);
  }

  Future confirmLogin() async {
    if (token != null) {
      try {
        final confirm = await LoginService.confirmToken();
        if (confirm.confirmed) {
          credentials.add(Credentials.tumId);
        }
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