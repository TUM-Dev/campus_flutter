import 'package:json_annotation/json_annotation.dart';

part 'navigatum_navigation_property.g.dart';

@JsonSerializable()
class NavigaTumNavigationProperty {
  final String name;
  final String text;

  NavigaTumNavigationProperty({required this.name, required this.text});

  factory NavigaTumNavigationProperty.fromJson(Map<String, dynamic> json) =>
      _$NavigaTumNavigationPropertyFromJson(json);

  Map<String, dynamic> toJson() => _$NavigaTumNavigationPropertyToJson(this);
}
