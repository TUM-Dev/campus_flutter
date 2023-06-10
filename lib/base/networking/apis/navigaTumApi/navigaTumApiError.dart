import 'package:campus_flutter/base/networking/protocols/apiError.dart';

class NavigaTumApiError implements ApiError {

  final String message;

  NavigaTumApiError({required this.message});

  /// method for decoder
  // TODO: format of error
  factory NavigaTumApiError.fromJson(Map<String, dynamic> json) {
    final error = ErrorBody.fromJson(json);
    return NavigaTumApiError(message: error.errorMessage.message);
  }

  String get errorDescription => "Unknown Error: $message";

  String? get recoverySuggestion => null;
}