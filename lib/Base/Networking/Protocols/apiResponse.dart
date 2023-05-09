class ApiResponse<T extends Serializable> {
  T data;

  ApiResponse({required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return ApiResponse<T>(
      data: create(json),
    );
  }

  Map<String, dynamic> toJson() => {
    "data": this.data.toJson(),
  };
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}