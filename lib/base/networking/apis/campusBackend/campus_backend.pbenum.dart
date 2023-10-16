//
//  Generated code. Do not modify.
//  source: campusBackend/campus_backend.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class DeviceType extends $pb.ProtobufEnum {
  static const DeviceType IOS = DeviceType._(0, _omitEnumNames ? '' : 'IOS');
  static const DeviceType ANDROID =
      DeviceType._(1, _omitEnumNames ? '' : 'ANDROID');
  static const DeviceType WINDOWS =
      DeviceType._(2, _omitEnumNames ? '' : 'WINDOWS');

  static const $core.List<DeviceType> values = <DeviceType>[
    IOS,
    ANDROID,
    WINDOWS,
  ];

  static final $core.Map<$core.int, DeviceType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static DeviceType? valueOf($core.int value) => _byValue[value];

  const DeviceType._($core.int v, $core.String n) : super(v, n);
}

class CreateFeedbackRequest_Recipient extends $pb.ProtobufEnum {
  static const CreateFeedbackRequest_Recipient TUM_DEV =
      CreateFeedbackRequest_Recipient._(0, _omitEnumNames ? '' : 'TUM_DEV');
  static const CreateFeedbackRequest_Recipient TUM_CONTACT =
      CreateFeedbackRequest_Recipient._(1, _omitEnumNames ? '' : 'TUM_CONTACT');

  static const $core.List<CreateFeedbackRequest_Recipient> values =
      <CreateFeedbackRequest_Recipient>[
    TUM_DEV,
    TUM_CONTACT,
  ];

  static final $core.Map<$core.int, CreateFeedbackRequest_Recipient> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static CreateFeedbackRequest_Recipient? valueOf($core.int value) =>
      _byValue[value];

  const CreateFeedbackRequest_Recipient._($core.int v, $core.String n)
      : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
