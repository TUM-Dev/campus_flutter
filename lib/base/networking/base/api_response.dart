class ApiResponse<T> {
  T data;
  DateTime? saved;

  ApiResponse({required this.data, this.saved});

  factory ApiResponse.fromJson(
    dynamic json,
    Map<String, dynamic> extras,
    Function(Map<String, dynamic>) create,
  ) {
    if (json is List<dynamic>) {
      return ApiResponse<T>(
        data: create({"data": json}),
        saved: extras["saved"] as DateTime,
      );
    } else {
      return ApiResponse<T>(
        data: create(json),
        saved: extras["saved"] as DateTime,
      );
    }
  }
}
