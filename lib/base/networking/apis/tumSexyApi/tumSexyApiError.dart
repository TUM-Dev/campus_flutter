import 'package:campus_flutter/base/networking/protocols/apiError.dart';

class TumSexyApiError implements ApiError {

  final String message;

  TumSexyApiError({required this.message});

  /// method for decoder
  // TODO: format of error
  factory TumSexyApiError.fromJson(Map<String, dynamic> json) {
    final error = ErrorBody.fromJson(json);
    return TumSexyApiError(message: error.errorMessage.message);
  }

  String get errorDescription => "Unknown Error: $message";

  String? get recoverySuggestion => null;
}