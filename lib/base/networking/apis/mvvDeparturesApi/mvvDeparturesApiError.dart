import 'package:campus_flutter/base/networking/protocols/apiError.dart';

class MvvDeparturesApiError implements ApiError {

  final String message;

  MvvDeparturesApiError({required this.message});

  /// method for decoder
  // TODO: format of error
  factory MvvDeparturesApiError.fromJson(Map<String, dynamic> json) {
    final error = ErrorBody.fromJson(json);
    return MvvDeparturesApiError(message: error.errorMessage.message);
  }

  String get errorDescription => "Unknown Error: $message";

  String? get recoverySuggestion => null;
}