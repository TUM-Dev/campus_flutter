import 'dart:developer';

import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/loginComponent/services/loginService.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel {
  final _storage = const FlutterSecureStorage();
  BehaviorSubject<Credentials?> credentials = BehaviorSubject.seeded(null);
  BehaviorSubject<bool> tumIdValid = BehaviorSubject.seeded(false);

  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
  final TextEditingController textEditingController3 = TextEditingController();

  void checkTumId() {
    final RegExp lettersRegex = RegExp(r'^[a-zA-Z]+$');
    final RegExp numberRegex = RegExp(r'^[0-9]+$');

    if (textEditingController1.text.length != 2) {
      //tumIdValid.addError(Exception("make sure you provide 2 letters"));
      tumIdValid.add(false);
      return;
    }

    if (textEditingController2.text.length != 2) {
      //tumIdValid.addError(Exception("make sure you provide 2 numbers"));
      tumIdValid.add(false);
      return;
    }

    if (textEditingController3.text.length != 3) {
      //tumIdValid.addError(Exception("make sure you provide 3 letters"));
      tumIdValid.add(false);
      return;
    }

    if (!lettersRegex.hasMatch(textEditingController1.text)) {
      //tumIdValid.addError(Exception("make sure to use letters only"));
      tumIdValid.add(false);
      return;
    }

    if (!numberRegex.hasMatch(textEditingController2.text)) {
      //tumIdValid.addError(Exception("make sure to use letters only"));
      tumIdValid.add(false);
      return;
    }

    if (!lettersRegex.hasMatch(textEditingController3.text)) {
      //tumIdValid.addError(Exception("make sure to use letters only"));
      tumIdValid.add(false);
      return;
    }

    tumIdValid.add(true);
  }

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
    LoginService.confirmToken(true)
        .then((value) => credentials.add(Credentials.tumId),
        onError: (error) => credentials.add(error));
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