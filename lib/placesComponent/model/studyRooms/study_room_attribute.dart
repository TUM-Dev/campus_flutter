import 'package:campus_flutter/searchComponent/model/comparison_token.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'study_room_attribute.g.dart';

@JsonSerializable()
class StudyRoomAttribute extends Searchable {
  final String? detail;
  final String? name;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ComparisonToken> get comparisonTokens => [
        ComparisonToken(value: detail ?? ""),
        ComparisonToken(value: name ?? ""),
      ];

  StudyRoomAttribute({this.detail, this.name});

  factory StudyRoomAttribute.fromJson(Map<String, dynamic> json) =>
      _$StudyRoomAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$StudyRoomAttributeToJson(this);
}
