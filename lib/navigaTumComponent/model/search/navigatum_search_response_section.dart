import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'navigatum_search_response_section.g.dart';

@JsonSerializable()
class NavigaTumSearchResponseSection {
  @JsonKey(name: "facet")
  final String type;
  final List<NavigaTumNavigationEntity> entries;

  NavigaTumSearchResponseSection(this.type, this.entries);

  factory NavigaTumSearchResponseSection.fromJson(Map<String, dynamic> json) =>
      _$NavigaTumSearchResponseSectionFromJson(json);

  Map<String, dynamic> toJson() => _$NavigaTumSearchResponseSectionToJson(this);
}
