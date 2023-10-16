import 'package:json_annotation/json_annotation.dart';

part 'contact_info.g.dart';

@JsonSerializable()
class ContactInfo {
  @JsonKey(name: "telefon")
  final String? phone;
  @JsonKey(name: "fax")
  final String? fax;
  @JsonKey(name: "mobiltelefon")
  final String? mobilePhone;
  @JsonKey(name: "zusatz_info")
  final String? additionalInfo;
  @JsonKey(name: "www_homepage")
  final String? homepage;

  ContactInfo(
      {this.phone,
      this.fax,
      this.mobilePhone,
      this.additionalInfo,
      this.homepage});

  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ContactInfoToJson(this);
}
