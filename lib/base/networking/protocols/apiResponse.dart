import 'package:dio/dio.dart';

class ApiResponse<T> {
  T data;
  DateTime? saved;

  ApiResponse({required this.data, this.saved});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, 
      Headers headers,
      Function(Map<String, dynamic>) create) {
    return ApiResponse<T>(
        data: create(json),
        saved: DateTime.tryParse(headers["date"]?.first ?? "")
    );
  }
}