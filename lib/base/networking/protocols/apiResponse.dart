import 'package:dio/dio.dart';

class ApiResponse<T> {
  T data;
  DateTime? saved;

  ApiResponse({required this.data, this.saved});

  factory ApiResponse.fromJson(
      dynamic json,
      Headers headers,
      Function(Map<String, dynamic>) create) {
    if (json is List<dynamic>) {
      return ApiResponse<T>(
        data: create({"data": json}),
        saved: DateTime.tryParse(headers["date"]?.first ?? "")
      );
    } else {
      return ApiResponse<T>(
          data: create(json),
          saved: DateTime.tryParse(headers["date"]?.first ?? "")
      );
    }
  }
}