import 'dart:developer';

import 'package:campus_flutter/base/networking/protocols/apiError.dart';
import 'package:http/http.dart' as http;

abstract class API {

  String get baseURL;

  String get path;

  List<String> get baseHeaders;

  APIError get error;

  String get paths;

  Map<String, String> get parameters;

  bool get needsAuth;

  Future<http.Response> asResponse({String? token}) async {
    if (needsAuth) {
      var finalParameters = parameters;
      finalParameters.addAll({"pToken": token ?? ""});
      final uri = Uri.https(baseURL, paths, finalParameters);
      log(uri.toString());
      return http.get(uri);
    } else {
      final uri = Uri(scheme: "https",
          host: baseURL,
          path: paths,
          queryParameters: parameters);
      log(uri.toString());
      return http.get(uri);
    }
  }

  // TODO: fix caching for endpoints which use multiple params
  String requestURL() {
    return Uri.https(baseURL, paths, parameters).toString();
  }

  @override
  String toString() {
    return baseURL + paths;
  }
}

// TODO: rewrite with sealed class
//class APIState<T>