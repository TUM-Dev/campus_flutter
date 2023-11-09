import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class ApiResponse<T> {
  T data;
  DateTime? saved;

  ApiResponse({required this.data, this.saved});

  factory ApiResponse.fromJson(
    dynamic json,
    Headers headers,
    Function(Map<String, dynamic>) create,
  ) {
    if (json is List<dynamic>) {
      return ApiResponse<T>(
        data: create({"data": json}),
        saved: ApiResponse._parseDate(headers["date"]?.first),
      );
    } else {
      return ApiResponse<T>(
        data: create(json),
        saved: ApiResponse._parseDate(headers["date"]?.first),
      );
    }
  }

  static DateTime? _parseDate(String? dateString) {
    DateFormat format = DateFormat('E, d MMM yyyy HH:mm:ss Z');
    if (dateString != null) {
      try {
        final today = DateTime.now();
        return format.parse(dateString).add(today.timeZoneOffset);
      } catch (_) {
        return null;
      }
    } else {
      return null;
    }
  }
}
