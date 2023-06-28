import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:xml2json/xml2json.dart';

abstract class Api {

  static String tumToken = "";

  String get baseURL;

  String get path;

  Map<String, String> get baseHeaders { return {}; }

  //Type get error;

  String get paths;

  Map<String, String> get parameters;

  bool get needsAuth;

  Future<dio.Response<String>> asResponse({required dio.Dio dio}) async {
    if (needsAuth) {
      var finalParameters = parameters;
      // TODO: figure out token sharing
      finalParameters.addAll({"pToken": tumToken});
      final uri = Uri.https(baseURL, paths, finalParameters);
      return dio.getUri(uri, options: _customDecodingOptions(baseHeaders));
    } else {
      final uri = Uri.https(baseURL, paths, parameters);
      return dio.getUri(uri, options: _customDecodingOptions(baseHeaders));
    }
  }

  dio.Options _customDecodingOptions(Map<String, String> headers) {
    return dio.Options(responseDecoder: (data, options, body) {
      final decoded = utf8.decoder.convert(data);
      if (body.headers["content-type"]?.first.contains("json") ?? false) {
        return decoded;
      } else {
        final transformer = Xml2Json();
        transformer.parse(decoded);
        return transformer.toParker();
      }
    }, headers: headers);
  }

  @override
  String toString() {
    return baseURL + path + paths;
  }
}
