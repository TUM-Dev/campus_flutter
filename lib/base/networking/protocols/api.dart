import 'package:dio/dio.dart' as dio;

abstract class Api {
  static String tumToken = "";
  static String tumId = "";

  String get domain;

  String get path;

  Map<String, String> get baseHeaders {
    return {};
  }

  String get slug;

  Map<String, String> get parameters;

  bool get needsAuth;

  Future<dio.Response<String>> get({required dio.Dio dioClient}) async {
    return dioClient.getUri(
      asURL(),
      options: _customDecodingOptions(baseHeaders),
    );
  }

  Future<dio.Response<String>> post({required dio.Dio dioClient}) async {
    return dioClient.postUri(
      asURL(),
      options: _customDecodingOptions(baseHeaders),
    );
  }

  Uri asURL() {
    if (needsAuth) {
      var finalParameters = parameters;
      finalParameters.addAll({"pToken": tumToken});
      return Uri.https(domain, path + slug, finalParameters);
    } else {
      return Uri.https(domain, path + slug, parameters);
    }
  }

  dio.Options _customDecodingOptions(Map<String, String> headers) {
    return dio.Options(headers: headers);
  }

  @override
  String toString() {
    return domain + path + slug;
  }
}
