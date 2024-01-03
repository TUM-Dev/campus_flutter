import 'package:dio/dio.dart' as dio;

abstract class Api {
  static String tumToken = "";

  String get baseURL;

  String get path;

  Map<String, String> get baseHeaders {
    return {};
  }

  String get paths;

  Map<String, String> get parameters;

  bool get needsAuth;

  Future<dio.Response<String>> getResponse({required dio.Dio dioClient}) async {
    return dioClient.getUri(
      asURL(),
      options: _customDecodingOptions(baseHeaders),
    );
  }

  Future<dio.Response<String>> postResponse({
    required dio.Dio dioClient,
  }) async {
    return dioClient.postUri(
      asURL(),
      options: _customDecodingOptions(baseHeaders),
    );
  }

  Uri asURL() {
    if (needsAuth) {
      var finalParameters = parameters;
      finalParameters.addAll({"pToken": tumToken});
      return Uri.https(baseURL, paths, finalParameters);
    } else {
      return Uri.https(baseURL, paths, parameters);
    }
  }

  dio.Options _customDecodingOptions(Map<String, String> headers) {
    return dio.Options(headers: headers);
  }

  @override
  String toString() {
    return baseURL + path + paths;
  }
}
