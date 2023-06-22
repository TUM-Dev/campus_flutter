import 'dart:developer';

import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/loginComponent/services/loginService.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel {
  final _storage = const FlutterSecureStorage();
  BehaviorSubject<Credentials?> credentials = BehaviorSubject.seeded(null);

  Future checkLogin() async {
    _storage.read(key: "token").then((value) async {
      if (value != null) {
        Api.tumToken = value;
        await LoginService.confirmToken(false).then((value) {
          credentials.add(Credentials.tumId);
        }, onError: (error) => _errorHandling(error));
      } else {
        credentials.add(Credentials.none);
      }
    }, onError: (error) => _errorHandling(error));
  }

  _errorHandling(dynamic error) {
    log(error.toString());
    credentials.add(Credentials.none);
  }

  Future requestLogin(String name) async {
    final token = (await LoginService.requestNewToken(true, name)).content;
    _storage.write(key: "token", value: token);
    Api.tumToken = token;
  }

  Future confirmLogin() async {
    final confirm = await LoginService.confirmToken(true);
    if (confirm.confirmed) {
      credentials.add(Credentials.tumId);
    }
  }

  Future skip() async {
    credentials.add(Credentials.noTumId);
  }

  Future logout() async {
    credentials.add(Credentials.none);
    final directory = await getTemporaryDirectory();
    HiveCacheStore(directory.path).close();
    _storage.delete(key: "token");
  }
}

enum Credentials {
  none,
  noTumId,
  tumId
}