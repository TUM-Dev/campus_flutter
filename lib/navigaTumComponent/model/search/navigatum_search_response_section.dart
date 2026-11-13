import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'navigatum_search_response_section.g.dart';

@JsonSerializable()
class NavigaTumSearchResponseSection {
  @JsonKey(name: "facet")
  final String type;
  final List<NavigaTumNavigationEntity> entries;

  NavigaTumSearchResponseSection(this.type, this.entries);

  factory NavigaTumSearchResponseSection.fromJson(Map<String, dynamic> json) {
    if (json['facet'] != 'lectures') {
      return _$NavigaTumSearchResponseSectionFromJson(json);
    }

    // 'lectures' facet does not have a 'type' field, but since we mix all the facets and
    // need to filter by type, we manually set it here
    return _$NavigaTumSearchResponseSectionFromJson({
      ...json,
      'entries': (json['entries'] as List<dynamic>)
          .map((entry) => {...entry as Map<String, dynamic>, 'type': 'lecture'})
          .toList(),
    });
  }

  Map<String, dynamic> toJson() => _$NavigaTumSearchResponseSectionToJson(this);
}
