import 'package:json_annotation/json_annotation.dart';

part 'navigatum_navigation_entity.g.dart';

@JsonSerializable()
class NavigaTumNavigationEntity {
  final String id;
  final String type;
  final String name;
  final String subtext;
  @JsonKey(name: "parsed_id")
  final String? parsedId;

  NavigaTumNavigationEntity(
      {required this.id,
      required this.type,
      required this.name,
      required this.subtext,
      this.parsedId});

  String getFormattedName() {
    if (parsedId != null) {
      return "${_removeHighlight(parsedId!)} ➤ ${_removeHighlight(name)}";
    } else {
      return _removeHighlight(name);
    }
  }

  String getFormattedSubtext() {
    return _removeHighlight(subtext);
  }

  String _removeHighlight(String field) {
    /***
     * Info from NavigaTum swagger: https://editor.swagger.io/?url=https://raw.githubusercontent.com/TUM-Dev/navigatum/main/openapi.yaml
     * In future maybe there will be query parameter for this
     * "Some fields support highlighting the query terms and it uses DC3 (\x19 or \u{0019})
     * and DC1 (\x17 or \u{0017}) to mark the beginning/end of a highlighted sequence"
     */
    return field
        .replaceAll("\u{0019}", "")
        .replaceAll("\u{0017}", "")
        .replaceAll("\\x19", "")
        .replaceAll("\\x17", "");
  }

  factory NavigaTumNavigationEntity.fromJson(Map<String, dynamic> json) =>
      _$NavigaTumNavigationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NavigaTumNavigationEntityToJson(this);
}
