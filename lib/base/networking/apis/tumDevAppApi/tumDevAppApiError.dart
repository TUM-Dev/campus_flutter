import 'package:campus_flutter/base/networking/protocols/apiError.dart';

class TumDevAppApiError implements ApiError {

  final String message;

  TumDevAppApiError({required this.message});

  /// method for decoder
  // TODO: format of error
  factory TumDevAppApiError.fromJson(Map<String, dynamic> json) {
    final error = ErrorBody.fromJson(json);
    return TumDevAppApiError(message: error.errorMessage.message);
  }

  String get errorDescription => "Unknown Error: $message";

  String? get recoverySuggestion => null;
}