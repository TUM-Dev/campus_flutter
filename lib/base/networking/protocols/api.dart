import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:xml2json/xml2json.dart';

abstract class Api {

  static String tumToken = "";

  String get baseURL;

  String get path;

  Map<String, String> get baseHeaders { return {}; }

  String get paths;

  Map<String, String> get parameters;

  bool get needsAuth;

  Future<dio.Response<String>> asResponse({required dio.Dio dioClient}) async {
    if (needsAuth) {
      var finalParameters = parameters;
      // TODO: figure out token sharing
      finalParameters.addAll({"pToken": tumToken});
      final uri = Uri.https(baseURL, paths, finalParameters);
      return dioClient.getUri(uri, options: _customDecodingOptions(baseHeaders));
    } else {
      final uri = Uri.https(baseURL, paths, parameters);
      return dioClient.getUri(uri, options: _customDecodingOptions(baseHeaders));
    }
  }

  dio.Options _customDecodingOptions(Map<String, String> headers) {
    return dio.Options(responseDecoder: (data, options, body) {
      final decoded = utf8.decoder.convert(data);
      if (body.headers["content-type"]?.first.contains("xml") ?? false) {
        final transformer = Xml2Json();
        transformer.parse(decoded);
        return transformer.toParker();
      } else {
        return decoded;
      }
    }, headers: headers);
  }

  @override
  String toString() {
    return baseURL + path + paths;
  }
}
