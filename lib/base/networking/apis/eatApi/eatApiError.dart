import 'package:campus_flutter/base/networking/protocols/apiError.dart';

class EatApiError implements ApiError {

  final String message;

  EatApiError({required this.message});

  /// method for decoder
  // TODO: format of error
  factory EatApiError.fromJson(Map<String, dynamic> json) {
    final error = ErrorBody.fromJson(json);
    return EatApiError(message: error.errorMessage.message);
  }

  String get errorDescription => "Unknown Error: $message";

  String? get recoverySuggestion => null;
}