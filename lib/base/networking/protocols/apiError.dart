import 'package:json_annotation/json_annotation.dart';

part 'apiError.g.dart';

abstract class ApiError {}

@JsonSerializable()
class ErrorBody {
  @JsonKey(name: "error")
  final ErrorMessage errorMessage;

  ErrorBody({required this.errorMessage});

  factory ErrorBody.fromJson(Map<String, dynamic> json) => _$ErrorBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorBodyToJson(this);
}

@JsonSerializable()
class ErrorMessage {
  final String message;

  ErrorMessage({required this.message});

  factory ErrorMessage.fromJson(Map<String, dynamic> json) => _$ErrorMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorMessageToJson(this);
}