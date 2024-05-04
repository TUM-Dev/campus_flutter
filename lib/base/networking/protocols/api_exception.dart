import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_exception.g.dart';

abstract class ApiException implements Exception {
  String message(BuildContext context, WidgetRef ref);

  String? recoverySuggestion(BuildContext context, WidgetRef ref);

  Function()? overwriteRetry(BuildContext context);

  String? overwriteRetryMessage(BuildContext context);
}

@JsonSerializable()
class ExceptionBody {
  @JsonKey(name: "error")
  final ExceptionMessage exceptionMessage;

  ExceptionBody({required this.exceptionMessage});

  factory ExceptionBody.fromJson(Map<String, dynamic> json) =>
      _$ExceptionBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ExceptionBodyToJson(this);
}

@JsonSerializable()
class ExceptionMessage {
  final String message;

  ExceptionMessage({required this.message});

  factory ExceptionMessage.fromJson(Map<String, dynamic> json) =>
      _$ExceptionMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ExceptionMessageToJson(this);
}
