import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:json_annotation/json_annotation.dart';

part 'navigatum_navigation_coordinates.g.dart';

@JsonSerializable()
class NavigaTumNavigationCoordinates {
  @JsonKey(name: "lat", fromJson: StringParser.stringToDouble)
  final double latitude;
  @JsonKey(name: "long", fromJson: StringParser.stringToDouble)
  final double longitude;

  NavigaTumNavigationCoordinates(this.latitude, this.longitude);

  factory NavigaTumNavigationCoordinates.fromJson(Map<String, dynamic> json) =>
      _$NavigaTumNavigationCoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$NavigaTumNavigationCoordinatesToJson(this);
}
