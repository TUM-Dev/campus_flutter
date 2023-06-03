import 'package:campus_flutter/base/networking/protocols/apiResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token implements Serializable {
  @JsonKey(name: "token")
  final String content;

  Token({required this.content});

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TokenToJson(this);
}