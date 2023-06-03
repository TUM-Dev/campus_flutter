import 'dart:convert';

import 'package:campus_flutter/base/networking/protocols/apiResponse.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:dio/dio.dart';
import 'package:xml2json/xml2json.dart';

class MainAPI {
  static Future<T> makeRequest<T extends Serializable, S extends API>(
      S endpoint,
      dynamic Function(Map<String, dynamic>) create,
      String? token,
      bool forcedRefresh) async {

    Response<String> response;

    try {
      response = await endpoint.asResponse(token: token);
    } catch (e) {
      print(e.toString());
      // TODO: networking Error
      throw Exception();
    }

    if (response.statusCode != 200 && response.statusCode != 304) {
      //// TODO: response Error
      throw Exception();
    } else {
      // TODO: check if it's api error

      if (response.headers["content-type"]?.contains("json") ?? false) {
        final data =
            ApiResponse<T>.fromJson(
                jsonDecode(response.data.toString()), create)
                .data;
        return data;
      } else {
        final transformer = Xml2Json();
        transformer.parse(response.data.toString());
        final json = transformer.toParker();
        final data = ApiResponse<T>.fromJson(jsonDecode(json), create).data;
        return data;
      }
    }
  }
}
