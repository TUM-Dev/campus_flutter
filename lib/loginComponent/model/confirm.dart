import 'package:json_annotation/json_annotation.dart';

part 'confirm.g.dart';

@JsonSerializable()
class Confirm {
  @JsonKey(fromJson: bool.parse)
  final bool confirmed;

  Confirm({required this.confirmed});

  factory Confirm.fromJson(Map<String, dynamic> json) => _$ConfirmFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmToJson(this);
}