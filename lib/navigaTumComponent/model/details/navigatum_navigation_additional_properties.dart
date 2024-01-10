import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_property.dart';
import 'package:json_annotation/json_annotation.dart';

part 'navigatum_navigation_additional_properties.g.dart';

@JsonSerializable()
class NavigaTumNavigationAdditionalProperties {
  @JsonKey(name: "computed")
  final List<NavigaTumNavigationProperty> properties;

  NavigaTumNavigationAdditionalProperties(this.properties);

  factory NavigaTumNavigationAdditionalProperties.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$NavigaTumNavigationAdditionalPropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NavigaTumNavigationAdditionalPropertiesToJson(this);
}
