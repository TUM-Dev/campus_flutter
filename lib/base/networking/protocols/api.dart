import 'package:campus_flutter/base/networking/protocols/apiError.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'api.freezed.dart';

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
      print(uri);
      return http.get(uri);
    } else {
      final uri = Uri(scheme: "https",
          host: baseURL,
          path: paths,
          queryParameters: parameters);
      print(uri);
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


@freezed
class APIState<T> with _$APIState {
  const factory APIState.na() = na;
  const factory APIState.loading() = loading;
  const factory APIState.success(T data) = success;
  const factory APIState.error(Error error) = loadingError;
}