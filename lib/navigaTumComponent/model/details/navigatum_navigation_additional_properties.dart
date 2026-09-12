import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_property.dart';
import 'package:json_annotation/json_annotation.dart';

part 'navigatum_navigation_additional_properties.g.dart';

@JsonSerializable()
class NavigaTumNavigationAdditionalProperties {
  @JsonKey(name: "computed")
  final List<NavigaTumNavigationProperty> properties;
  @JsonKey(name: "calendar_url")
  final String? calendarUrl;

  NavigaTumNavigationAdditionalProperties(this.properties, this.calendarUrl);

  factory NavigaTumNavigationAdditionalProperties.fromJson(
    Map<String, dynamic> json,
  ) => _$NavigaTumNavigationAdditionalPropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NavigaTumNavigationAdditionalPropertiesToJson(this);
}
