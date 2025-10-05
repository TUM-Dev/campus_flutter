// This is a generated file - do not edit.
//
// Generated from tumdev/campus_backend.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

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

  static final $core.List<DeviceType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static DeviceType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DeviceType._(super.value, super.name);
}

class Language extends $pb.ProtobufEnum {
  static const Language German = Language._(0, _omitEnumNames ? '' : 'German');
  static const Language English =
      Language._(1, _omitEnumNames ? '' : 'English');

  static const $core.List<Language> values = <Language>[
    German,
    English,
  ];

  static final $core.List<Language?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static Language? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Language._(super.value, super.name);
}

class CreateFeedbackRequest_Recipient extends $pb.ProtobufEnum {
  /// Feedback for the TUM Dev Team
  static const CreateFeedbackRequest_Recipient TUM_DEV =
      CreateFeedbackRequest_Recipient._(0, _omitEnumNames ? '' : 'TUM_DEV');

  /// Feedback for the general TUM Contact Form
  static const CreateFeedbackRequest_Recipient TUM_CONTACT =
      CreateFeedbackRequest_Recipient._(1, _omitEnumNames ? '' : 'TUM_CONTACT');

  static const $core.List<CreateFeedbackRequest_Recipient> values =
      <CreateFeedbackRequest_Recipient>[
    TUM_DEV,
    TUM_CONTACT,
  ];

  static final $core.List<CreateFeedbackRequest_Recipient?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static CreateFeedbackRequest_Recipient? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CreateFeedbackRequest_Recipient._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
