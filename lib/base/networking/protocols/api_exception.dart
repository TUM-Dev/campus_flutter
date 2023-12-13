import 'package:json_annotation/json_annotation.dart';

part 'api_exception.g.dart';

abstract class ApiException implements Exception {
  final String message;
  final String? recoverySuggestion;

  @pragma("vm:entry-point")
  ApiException([this.message = "", this.recoverySuggestion]);
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
