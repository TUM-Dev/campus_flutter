import 'package:campus_flutter/navigaTumComponent/model/search/navigatum_search_response_section.dart';
import 'package:json_annotation/json_annotation.dart';

part 'navigatum_search_response.g.dart';

@JsonSerializable()
class NavigaTumSearchResponse {
  // TODO: uuid?
  //final String id;
  final List<NavigaTumSearchResponseSection> sections;

  NavigaTumSearchResponse(this.sections);

  factory NavigaTumSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$NavigaTumSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NavigaTumSearchResponseToJson(this);
}
