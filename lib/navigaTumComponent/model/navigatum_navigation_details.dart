import 'package:campus_flutter/navigaTumComponent/model/details/navigatum_navigation_additional_properties.dart';
import 'package:campus_flutter/navigaTumComponent/model/details/navigatum_navigation_coordinates.dart';
import 'package:campus_flutter/navigaTumComponent/model/details/navigatum_navigation_maps.dart';
import 'package:json_annotation/json_annotation.dart';

part 'navigatum_navigation_details.g.dart';

@JsonSerializable()
class NavigaTumNavigationDetails {
  final String id;
  final String name;
  @JsonKey(name: "parent_names")
  final List<String> parentNames;
  final String type;
  @JsonKey(name: "type_common_name")
  final String typeCommonName;
  @JsonKey(name: "props")
  final NavigaTumNavigationAdditionalProperties additionalProperties;
  @JsonKey(name: "coords")
  final NavigaTumNavigationCoordinates coordinates;
  final NavigaTumNavigationMaps maps;

  bool get hasCoordinates =>
      coordinates.latitude != null && coordinates.longitude != null;

  NavigaTumNavigationDetails(
    this.id,
    this.name,
    this.parentNames,
    this.type,
    this.typeCommonName,
    this.additionalProperties,
    this.coordinates,
    this.maps,
  );

  factory NavigaTumNavigationDetails.fromJson(Map<String, dynamic> json) =>
      _$NavigaTumNavigationDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$NavigaTumNavigationDetailsToJson(this);
}
