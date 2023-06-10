import 'package:campus_flutter/base/networking/protocols/apiError.dart';

class TumCabeApiError implements ApiError {

  final String message;

  TumCabeApiError({required this.message});

  /// method for decoder
  // TODO: format of error
  factory TumCabeApiError.fromJson(Map<String, dynamic> json) {
    final error = ErrorBody.fromJson(json);
    return TumCabeApiError(message: error.errorMessage.message);
  }

  String get errorDescription => "Unknown Error: $message";

  String? get recoverySuggestion => null;
}