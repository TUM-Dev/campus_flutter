//
//  Generated code. Do not modify.
//  source: tumdev/campus_backend.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/timestamp.pb.dart' as $2;
import 'campus_backend.pbenum.dart';

export 'campus_backend.pbenum.dart';

class RegisterDeviceRequest extends $pb.GeneratedMessage {
  factory RegisterDeviceRequest({
    $core.String? deviceId,
    $core.String? publicKey,
    DeviceType? deviceType,
  }) {
    final $result = create();
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    if (publicKey != null) {
      $result.publicKey = publicKey;
    }
    if (deviceType != null) {
      $result.deviceType = deviceType;
    }
    return $result;
  }
  RegisterDeviceRequest._() : super();
  factory RegisterDeviceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterDeviceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegisterDeviceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(2, _omitFieldNames ? '' : 'publicKey', protoName: 'publicKey')
    ..e<DeviceType>(3, _omitFieldNames ? '' : 'deviceType', $pb.PbFieldType.OE, protoName: 'deviceType', defaultOrMaker: DeviceType.IOS, valueOf: DeviceType.valueOf, enumValues: DeviceType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterDeviceRequest clone() => RegisterDeviceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterDeviceRequest copyWith(void Function(RegisterDeviceRequest) updates) => super.copyWith((message) => updates(message as RegisterDeviceRequest)) as RegisterDeviceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterDeviceRequest create() => RegisterDeviceRequest._();
  RegisterDeviceRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterDeviceRequest> createRepeated() => $pb.PbList<RegisterDeviceRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterDeviceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterDeviceRequest>(create);
  static RegisterDeviceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get publicKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set publicKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => clearField(2);

  @$pb.TagNumber(3)
  DeviceType get deviceType => $_getN(2);
  @$pb.TagNumber(3)
  set deviceType(DeviceType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceType() => clearField(3);
}

class RegisterDeviceReply extends $pb.GeneratedMessage {
  factory RegisterDeviceReply({
    $core.String? deviceId,
  }) {
    final $result = create();
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    return $result;
  }
  RegisterDeviceReply._() : super();
  factory RegisterDeviceReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterDeviceReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegisterDeviceReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterDeviceReply clone() => RegisterDeviceReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterDeviceReply copyWith(void Function(RegisterDeviceReply) updates) => super.copyWith((message) => updates(message as RegisterDeviceReply)) as RegisterDeviceReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterDeviceReply create() => RegisterDeviceReply._();
  RegisterDeviceReply createEmptyInstance() => create();
  static $pb.PbList<RegisterDeviceReply> createRepeated() => $pb.PbList<RegisterDeviceReply>();
  @$core.pragma('dart2js:noInline')
  static RegisterDeviceReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterDeviceReply>(create);
  static RegisterDeviceReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);
}

class RemoveDeviceRequest extends $pb.GeneratedMessage {
  factory RemoveDeviceRequest({
    $core.String? deviceId,
    DeviceType? deviceType,
  }) {
    final $result = create();
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    if (deviceType != null) {
      $result.deviceType = deviceType;
    }
    return $result;
  }
  RemoveDeviceRequest._() : super();
  factory RemoveDeviceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveDeviceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveDeviceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..e<DeviceType>(2, _omitFieldNames ? '' : 'deviceType', $pb.PbFieldType.OE, protoName: 'deviceType', defaultOrMaker: DeviceType.IOS, valueOf: DeviceType.valueOf, enumValues: DeviceType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveDeviceRequest clone() => RemoveDeviceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveDeviceRequest copyWith(void Function(RemoveDeviceRequest) updates) => super.copyWith((message) => updates(message as RemoveDeviceRequest)) as RemoveDeviceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveDeviceRequest create() => RemoveDeviceRequest._();
  RemoveDeviceRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveDeviceRequest> createRepeated() => $pb.PbList<RemoveDeviceRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveDeviceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveDeviceRequest>(create);
  static RemoveDeviceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  DeviceType get deviceType => $_getN(1);
  @$pb.TagNumber(2)
  set deviceType(DeviceType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceType() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceType() => clearField(2);
}

class RemoveDeviceReply extends $pb.GeneratedMessage {
  factory RemoveDeviceReply({
    $core.String? deviceId,
  }) {
    final $result = create();
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    return $result;
  }
  RemoveDeviceReply._() : super();
  factory RemoveDeviceReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveDeviceReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveDeviceReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveDeviceReply clone() => RemoveDeviceReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveDeviceReply copyWith(void Function(RemoveDeviceReply) updates) => super.copyWith((message) => updates(message as RemoveDeviceReply)) as RemoveDeviceReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveDeviceReply create() => RemoveDeviceReply._();
  RemoveDeviceReply createEmptyInstance() => create();
  static $pb.PbList<RemoveDeviceReply> createRepeated() => $pb.PbList<RemoveDeviceReply>();
  @$core.pragma('dart2js:noInline')
  static RemoveDeviceReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveDeviceReply>(create);
  static RemoveDeviceReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);
}

class IOSDeviceRequestResponseRequest extends $pb.GeneratedMessage {
  factory IOSDeviceRequestResponseRequest({
    $core.String? requestId,
    $core.String? payload,
  }) {
    final $result = create();
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (payload != null) {
      $result.payload = payload;
    }
    return $result;
  }
  IOSDeviceRequestResponseRequest._() : super();
  factory IOSDeviceRequestResponseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IOSDeviceRequestResponseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IOSDeviceRequestResponseRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId', protoName: 'requestId')
    ..aOS(2, _omitFieldNames ? '' : 'payload')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IOSDeviceRequestResponseRequest clone() => IOSDeviceRequestResponseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IOSDeviceRequestResponseRequest copyWith(void Function(IOSDeviceRequestResponseRequest) updates) => super.copyWith((message) => updates(message as IOSDeviceRequestResponseRequest)) as IOSDeviceRequestResponseRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IOSDeviceRequestResponseRequest create() => IOSDeviceRequestResponseRequest._();
  IOSDeviceRequestResponseRequest createEmptyInstance() => create();
  static $pb.PbList<IOSDeviceRequestResponseRequest> createRepeated() => $pb.PbList<IOSDeviceRequestResponseRequest>();
  @$core.pragma('dart2js:noInline')
  static IOSDeviceRequestResponseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IOSDeviceRequestResponseRequest>(create);
  static IOSDeviceRequestResponseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get payload => $_getSZ(1);
  @$pb.TagNumber(2)
  set payload($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPayload() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayload() => clearField(2);
}

class IOSDeviceRequestResponseReply extends $pb.GeneratedMessage {
  factory IOSDeviceRequestResponseReply({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  IOSDeviceRequestResponseReply._() : super();
  factory IOSDeviceRequestResponseReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IOSDeviceRequestResponseReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IOSDeviceRequestResponseReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IOSDeviceRequestResponseReply clone() => IOSDeviceRequestResponseReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IOSDeviceRequestResponseReply copyWith(void Function(IOSDeviceRequestResponseReply) updates) => super.copyWith((message) => updates(message as IOSDeviceRequestResponseReply)) as IOSDeviceRequestResponseReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IOSDeviceRequestResponseReply create() => IOSDeviceRequestResponseReply._();
  IOSDeviceRequestResponseReply createEmptyInstance() => create();
  static $pb.PbList<IOSDeviceRequestResponseReply> createRepeated() => $pb.PbList<IOSDeviceRequestResponseReply>();
  @$core.pragma('dart2js:noInline')
  static IOSDeviceRequestResponseReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IOSDeviceRequestResponseReply>(create);
  static IOSDeviceRequestResponseReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class GetRoomScheduleRequest extends $pb.GeneratedMessage {
  factory GetRoomScheduleRequest({
    $core.int? room,
    $2.Timestamp? start,
    $2.Timestamp? end,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (start != null) {
      $result.start = start;
    }
    if (end != null) {
      $result.end = end;
    }
    return $result;
  }
  GetRoomScheduleRequest._() : super();
  factory GetRoomScheduleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRoomScheduleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRoomScheduleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'room', $pb.PbFieldType.O3)
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'start', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'end', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRoomScheduleRequest clone() => GetRoomScheduleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRoomScheduleRequest copyWith(void Function(GetRoomScheduleRequest) updates) => super.copyWith((message) => updates(message as GetRoomScheduleRequest)) as GetRoomScheduleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRoomScheduleRequest create() => GetRoomScheduleRequest._();
  GetRoomScheduleRequest createEmptyInstance() => create();
  static $pb.PbList<GetRoomScheduleRequest> createRepeated() => $pb.PbList<GetRoomScheduleRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRoomScheduleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRoomScheduleRequest>(create);
  static GetRoomScheduleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get room => $_getIZ(0);
  @$pb.TagNumber(1)
  set room($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);

  @$pb.TagNumber(2)
  $2.Timestamp get start => $_getN(1);
  @$pb.TagNumber(2)
  set start($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStart() => $_has(1);
  @$pb.TagNumber(2)
  void clearStart() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureStart() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.Timestamp get end => $_getN(2);
  @$pb.TagNumber(3)
  set end($2.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEnd() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnd() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureEnd() => $_ensure(2);
}

class GetRoomScheduleReply_RoomScheduleEvent extends $pb.GeneratedMessage {
  factory GetRoomScheduleReply_RoomScheduleEvent({
    $2.Timestamp? start,
    $2.Timestamp? end,
    $core.String? title,
    $core.int? eventId,
    $core.String? courseCode,
  }) {
    final $result = create();
    if (start != null) {
      $result.start = start;
    }
    if (end != null) {
      $result.end = end;
    }
    if (title != null) {
      $result.title = title;
    }
    if (eventId != null) {
      $result.eventId = eventId;
    }
    if (courseCode != null) {
      $result.courseCode = courseCode;
    }
    return $result;
  }
  GetRoomScheduleReply_RoomScheduleEvent._() : super();
  factory GetRoomScheduleReply_RoomScheduleEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRoomScheduleReply_RoomScheduleEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRoomScheduleReply.RoomScheduleEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOM<$2.Timestamp>(1, _omitFieldNames ? '' : 'start', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'end', subBuilder: $2.Timestamp.create)
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'eventId', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'courseCode')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRoomScheduleReply_RoomScheduleEvent clone() => GetRoomScheduleReply_RoomScheduleEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRoomScheduleReply_RoomScheduleEvent copyWith(void Function(GetRoomScheduleReply_RoomScheduleEvent) updates) => super.copyWith((message) => updates(message as GetRoomScheduleReply_RoomScheduleEvent)) as GetRoomScheduleReply_RoomScheduleEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRoomScheduleReply_RoomScheduleEvent create() => GetRoomScheduleReply_RoomScheduleEvent._();
  GetRoomScheduleReply_RoomScheduleEvent createEmptyInstance() => create();
  static $pb.PbList<GetRoomScheduleReply_RoomScheduleEvent> createRepeated() => $pb.PbList<GetRoomScheduleReply_RoomScheduleEvent>();
  @$core.pragma('dart2js:noInline')
  static GetRoomScheduleReply_RoomScheduleEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRoomScheduleReply_RoomScheduleEvent>(create);
  static GetRoomScheduleReply_RoomScheduleEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $2.Timestamp get start => $_getN(0);
  @$pb.TagNumber(1)
  set start($2.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearStart() => clearField(1);
  @$pb.TagNumber(1)
  $2.Timestamp ensureStart() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.Timestamp get end => $_getN(1);
  @$pb.TagNumber(2)
  set end($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnd() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnd() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureEnd() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get eventId => $_getIZ(3);
  @$pb.TagNumber(4)
  set eventId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEventId() => $_has(3);
  @$pb.TagNumber(4)
  void clearEventId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get courseCode => $_getSZ(4);
  @$pb.TagNumber(5)
  set courseCode($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCourseCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearCourseCode() => clearField(5);
}

class GetRoomScheduleReply extends $pb.GeneratedMessage {
  factory GetRoomScheduleReply({
    $core.Iterable<GetRoomScheduleReply_RoomScheduleEvent>? events,
  }) {
    final $result = create();
    if (events != null) {
      $result.events.addAll(events);
    }
    return $result;
  }
  GetRoomScheduleReply._() : super();
  factory GetRoomScheduleReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRoomScheduleReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRoomScheduleReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<GetRoomScheduleReply_RoomScheduleEvent>(1, _omitFieldNames ? '' : 'events', $pb.PbFieldType.PM, subBuilder: GetRoomScheduleReply_RoomScheduleEvent.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRoomScheduleReply clone() => GetRoomScheduleReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRoomScheduleReply copyWith(void Function(GetRoomScheduleReply) updates) => super.copyWith((message) => updates(message as GetRoomScheduleReply)) as GetRoomScheduleReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRoomScheduleReply create() => GetRoomScheduleReply._();
  GetRoomScheduleReply createEmptyInstance() => create();
  static $pb.PbList<GetRoomScheduleReply> createRepeated() => $pb.PbList<GetRoomScheduleReply>();
  @$core.pragma('dart2js:noInline')
  static GetRoomScheduleReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRoomScheduleReply>(create);
  static GetRoomScheduleReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GetRoomScheduleReply_RoomScheduleEvent> get events => $_getList(0);
}

class GetRoomCoordinatesRequest extends $pb.GeneratedMessage {
  factory GetRoomCoordinatesRequest({
    $core.String? archId,
  }) {
    final $result = create();
    if (archId != null) {
      $result.archId = archId;
    }
    return $result;
  }
  GetRoomCoordinatesRequest._() : super();
  factory GetRoomCoordinatesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRoomCoordinatesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRoomCoordinatesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'archId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRoomCoordinatesRequest clone() => GetRoomCoordinatesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRoomCoordinatesRequest copyWith(void Function(GetRoomCoordinatesRequest) updates) => super.copyWith((message) => updates(message as GetRoomCoordinatesRequest)) as GetRoomCoordinatesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRoomCoordinatesRequest create() => GetRoomCoordinatesRequest._();
  GetRoomCoordinatesRequest createEmptyInstance() => create();
  static $pb.PbList<GetRoomCoordinatesRequest> createRepeated() => $pb.PbList<GetRoomCoordinatesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRoomCoordinatesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRoomCoordinatesRequest>(create);
  static GetRoomCoordinatesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get archId => $_getSZ(0);
  @$pb.TagNumber(1)
  set archId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasArchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearArchId() => clearField(1);
}

class GetRoomCoordinatesReply extends $pb.GeneratedMessage {
  factory GetRoomCoordinatesReply({
    $core.String? utmZone,
    $core.double? utmEasting,
    $core.double? utmNorthing,
  }) {
    final $result = create();
    if (utmZone != null) {
      $result.utmZone = utmZone;
    }
    if (utmEasting != null) {
      $result.utmEasting = utmEasting;
    }
    if (utmNorthing != null) {
      $result.utmNorthing = utmNorthing;
    }
    return $result;
  }
  GetRoomCoordinatesReply._() : super();
  factory GetRoomCoordinatesReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRoomCoordinatesReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRoomCoordinatesReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'utmZone')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'utmEasting', $pb.PbFieldType.OF)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'utmNorthing', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRoomCoordinatesReply clone() => GetRoomCoordinatesReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRoomCoordinatesReply copyWith(void Function(GetRoomCoordinatesReply) updates) => super.copyWith((message) => updates(message as GetRoomCoordinatesReply)) as GetRoomCoordinatesReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRoomCoordinatesReply create() => GetRoomCoordinatesReply._();
  GetRoomCoordinatesReply createEmptyInstance() => create();
  static $pb.PbList<GetRoomCoordinatesReply> createRepeated() => $pb.PbList<GetRoomCoordinatesReply>();
  @$core.pragma('dart2js:noInline')
  static GetRoomCoordinatesReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRoomCoordinatesReply>(create);
  static GetRoomCoordinatesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get utmZone => $_getSZ(0);
  @$pb.TagNumber(1)
  set utmZone($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUtmZone() => $_has(0);
  @$pb.TagNumber(1)
  void clearUtmZone() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get utmEasting => $_getN(1);
  @$pb.TagNumber(2)
  set utmEasting($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUtmEasting() => $_has(1);
  @$pb.TagNumber(2)
  void clearUtmEasting() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get utmNorthing => $_getN(2);
  @$pb.TagNumber(3)
  set utmNorthing($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUtmNorthing() => $_has(2);
  @$pb.TagNumber(3)
  void clearUtmNorthing() => clearField(3);
}

class GetRoomMapsRequest extends $pb.GeneratedMessage {
  factory GetRoomMapsRequest({
    $core.String? archId,
  }) {
    final $result = create();
    if (archId != null) {
      $result.archId = archId;
    }
    return $result;
  }
  GetRoomMapsRequest._() : super();
  factory GetRoomMapsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRoomMapsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRoomMapsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'archId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRoomMapsRequest clone() => GetRoomMapsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRoomMapsRequest copyWith(void Function(GetRoomMapsRequest) updates) => super.copyWith((message) => updates(message as GetRoomMapsRequest)) as GetRoomMapsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRoomMapsRequest create() => GetRoomMapsRequest._();
  GetRoomMapsRequest createEmptyInstance() => create();
  static $pb.PbList<GetRoomMapsRequest> createRepeated() => $pb.PbList<GetRoomMapsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRoomMapsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRoomMapsRequest>(create);
  static GetRoomMapsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get archId => $_getSZ(0);
  @$pb.TagNumber(1)
  set archId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasArchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearArchId() => clearField(1);
}

class GetRoomMapsReply_Map extends $pb.GeneratedMessage {
  factory GetRoomMapsReply_Map({
    $fixnum.Int64? mapId,
    $core.String? description,
    $fixnum.Int64? scale,
    $fixnum.Int64? width,
    $fixnum.Int64? height,
  }) {
    final $result = create();
    if (mapId != null) {
      $result.mapId = mapId;
    }
    if (description != null) {
      $result.description = description;
    }
    if (scale != null) {
      $result.scale = scale;
    }
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    return $result;
  }
  GetRoomMapsReply_Map._() : super();
  factory GetRoomMapsReply_Map.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRoomMapsReply_Map.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRoomMapsReply.Map', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'mapId')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aInt64(3, _omitFieldNames ? '' : 'scale')
    ..aInt64(4, _omitFieldNames ? '' : 'width')
    ..aInt64(5, _omitFieldNames ? '' : 'height')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRoomMapsReply_Map clone() => GetRoomMapsReply_Map()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRoomMapsReply_Map copyWith(void Function(GetRoomMapsReply_Map) updates) => super.copyWith((message) => updates(message as GetRoomMapsReply_Map)) as GetRoomMapsReply_Map;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRoomMapsReply_Map create() => GetRoomMapsReply_Map._();
  GetRoomMapsReply_Map createEmptyInstance() => create();
  static $pb.PbList<GetRoomMapsReply_Map> createRepeated() => $pb.PbList<GetRoomMapsReply_Map>();
  @$core.pragma('dart2js:noInline')
  static GetRoomMapsReply_Map getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRoomMapsReply_Map>(create);
  static GetRoomMapsReply_Map? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get mapId => $_getI64(0);
  @$pb.TagNumber(1)
  set mapId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMapId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMapId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get scale => $_getI64(2);
  @$pb.TagNumber(3)
  set scale($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasScale() => $_has(2);
  @$pb.TagNumber(3)
  void clearScale() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get width => $_getI64(3);
  @$pb.TagNumber(4)
  set width($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWidth() => $_has(3);
  @$pb.TagNumber(4)
  void clearWidth() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get height => $_getI64(4);
  @$pb.TagNumber(5)
  set height($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeight() => clearField(5);
}

class GetRoomMapsReply extends $pb.GeneratedMessage {
  factory GetRoomMapsReply({
    $core.Iterable<GetRoomMapsReply_Map>? maps,
  }) {
    final $result = create();
    if (maps != null) {
      $result.maps.addAll(maps);
    }
    return $result;
  }
  GetRoomMapsReply._() : super();
  factory GetRoomMapsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRoomMapsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRoomMapsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<GetRoomMapsReply_Map>(1, _omitFieldNames ? '' : 'maps', $pb.PbFieldType.PM, subBuilder: GetRoomMapsReply_Map.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRoomMapsReply clone() => GetRoomMapsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRoomMapsReply copyWith(void Function(GetRoomMapsReply) updates) => super.copyWith((message) => updates(message as GetRoomMapsReply)) as GetRoomMapsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRoomMapsReply create() => GetRoomMapsReply._();
  GetRoomMapsReply createEmptyInstance() => create();
  static $pb.PbList<GetRoomMapsReply> createRepeated() => $pb.PbList<GetRoomMapsReply>();
  @$core.pragma('dart2js:noInline')
  static GetRoomMapsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRoomMapsReply>(create);
  static GetRoomMapsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GetRoomMapsReply_Map> get maps => $_getList(0);
}

class GetLocationsRequest extends $pb.GeneratedMessage {
  factory GetLocationsRequest({
    $core.String? location,
  }) {
    final $result = create();
    if (location != null) {
      $result.location = location;
    }
    return $result;
  }
  GetLocationsRequest._() : super();
  factory GetLocationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLocationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLocationsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'location')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLocationsRequest clone() => GetLocationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLocationsRequest copyWith(void Function(GetLocationsRequest) updates) => super.copyWith((message) => updates(message as GetLocationsRequest)) as GetLocationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLocationsRequest create() => GetLocationsRequest._();
  GetLocationsRequest createEmptyInstance() => create();
  static $pb.PbList<GetLocationsRequest> createRepeated() => $pb.PbList<GetLocationsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLocationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLocationsRequest>(create);
  static GetLocationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get location => $_getSZ(0);
  @$pb.TagNumber(1)
  set location($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocation() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocation() => clearField(1);
}

class GetLocationsReply_Location extends $pb.GeneratedMessage {
  factory GetLocationsReply_Location({
    $core.String? location,
    $core.String? name,
    $core.String? lon,
    $core.String? lat,
    $core.String? radius,
  }) {
    final $result = create();
    if (location != null) {
      $result.location = location;
    }
    if (name != null) {
      $result.name = name;
    }
    if (lon != null) {
      $result.lon = lon;
    }
    if (lat != null) {
      $result.lat = lat;
    }
    if (radius != null) {
      $result.radius = radius;
    }
    return $result;
  }
  GetLocationsReply_Location._() : super();
  factory GetLocationsReply_Location.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLocationsReply_Location.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLocationsReply.Location', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'location')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'lon')
    ..aOS(4, _omitFieldNames ? '' : 'lat')
    ..aOS(5, _omitFieldNames ? '' : 'radius')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLocationsReply_Location clone() => GetLocationsReply_Location()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLocationsReply_Location copyWith(void Function(GetLocationsReply_Location) updates) => super.copyWith((message) => updates(message as GetLocationsReply_Location)) as GetLocationsReply_Location;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLocationsReply_Location create() => GetLocationsReply_Location._();
  GetLocationsReply_Location createEmptyInstance() => create();
  static $pb.PbList<GetLocationsReply_Location> createRepeated() => $pb.PbList<GetLocationsReply_Location>();
  @$core.pragma('dart2js:noInline')
  static GetLocationsReply_Location getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLocationsReply_Location>(create);
  static GetLocationsReply_Location? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get location => $_getSZ(0);
  @$pb.TagNumber(1)
  set location($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocation() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocation() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lon => $_getSZ(2);
  @$pb.TagNumber(3)
  set lon($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLon() => $_has(2);
  @$pb.TagNumber(3)
  void clearLon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lat => $_getSZ(3);
  @$pb.TagNumber(4)
  set lat($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLat() => $_has(3);
  @$pb.TagNumber(4)
  void clearLat() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get radius => $_getSZ(4);
  @$pb.TagNumber(5)
  set radius($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRadius() => $_has(4);
  @$pb.TagNumber(5)
  void clearRadius() => clearField(5);
}

class GetLocationsReply extends $pb.GeneratedMessage {
  factory GetLocationsReply({
    $core.Iterable<GetLocationsReply_Location>? locations,
  }) {
    final $result = create();
    if (locations != null) {
      $result.locations.addAll(locations);
    }
    return $result;
  }
  GetLocationsReply._() : super();
  factory GetLocationsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLocationsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLocationsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<GetLocationsReply_Location>(1, _omitFieldNames ? '' : 'locations', $pb.PbFieldType.PM, subBuilder: GetLocationsReply_Location.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLocationsReply clone() => GetLocationsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLocationsReply copyWith(void Function(GetLocationsReply) updates) => super.copyWith((message) => updates(message as GetLocationsReply)) as GetLocationsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLocationsReply create() => GetLocationsReply._();
  GetLocationsReply createEmptyInstance() => create();
  static $pb.PbList<GetLocationsReply> createRepeated() => $pb.PbList<GetLocationsReply>();
  @$core.pragma('dart2js:noInline')
  static GetLocationsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLocationsReply>(create);
  static GetLocationsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GetLocationsReply_Location> get locations => $_getList(0);
}

class SearchRoomsRequest extends $pb.GeneratedMessage {
  factory SearchRoomsRequest({
    $core.String? query,
  }) {
    final $result = create();
    if (query != null) {
      $result.query = query;
    }
    return $result;
  }
  SearchRoomsRequest._() : super();
  factory SearchRoomsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchRoomsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchRoomsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'query')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchRoomsRequest clone() => SearchRoomsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchRoomsRequest copyWith(void Function(SearchRoomsRequest) updates) => super.copyWith((message) => updates(message as SearchRoomsRequest)) as SearchRoomsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchRoomsRequest create() => SearchRoomsRequest._();
  SearchRoomsRequest createEmptyInstance() => create();
  static $pb.PbList<SearchRoomsRequest> createRepeated() => $pb.PbList<SearchRoomsRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchRoomsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchRoomsRequest>(create);
  static SearchRoomsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => clearField(1);
}

class SearchRoomsReply extends $pb.GeneratedMessage {
  factory SearchRoomsReply({
    $core.Iterable<Room>? rooms,
  }) {
    final $result = create();
    if (rooms != null) {
      $result.rooms.addAll(rooms);
    }
    return $result;
  }
  SearchRoomsReply._() : super();
  factory SearchRoomsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchRoomsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchRoomsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<Room>(1, _omitFieldNames ? '' : 'rooms', $pb.PbFieldType.PM, subBuilder: Room.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchRoomsReply clone() => SearchRoomsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchRoomsReply copyWith(void Function(SearchRoomsReply) updates) => super.copyWith((message) => updates(message as SearchRoomsReply)) as SearchRoomsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchRoomsReply create() => SearchRoomsReply._();
  SearchRoomsReply createEmptyInstance() => create();
  static $pb.PbList<SearchRoomsReply> createRepeated() => $pb.PbList<SearchRoomsReply>();
  @$core.pragma('dart2js:noInline')
  static SearchRoomsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchRoomsReply>(create);
  static SearchRoomsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Room> get rooms => $_getList(0);
}

class Room extends $pb.GeneratedMessage {
  factory Room({
    $core.int? roomId,
    $core.String? roomCode,
    $core.String? buildingNr,
    $core.String? archId,
    $core.String? info,
    $core.String? address,
    $core.String? purpose,
    $core.String? campus,
    $core.String? name,
  }) {
    final $result = create();
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (roomCode != null) {
      $result.roomCode = roomCode;
    }
    if (buildingNr != null) {
      $result.buildingNr = buildingNr;
    }
    if (archId != null) {
      $result.archId = archId;
    }
    if (info != null) {
      $result.info = info;
    }
    if (address != null) {
      $result.address = address;
    }
    if (purpose != null) {
      $result.purpose = purpose;
    }
    if (campus != null) {
      $result.campus = campus;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  Room._() : super();
  factory Room.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Room.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Room', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'roomId', $pb.PbFieldType.O3, protoName: 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'roomCode')
    ..aOS(3, _omitFieldNames ? '' : 'buildingNr')
    ..aOS(4, _omitFieldNames ? '' : 'archId')
    ..aOS(5, _omitFieldNames ? '' : 'info')
    ..aOS(6, _omitFieldNames ? '' : 'address')
    ..aOS(7, _omitFieldNames ? '' : 'purpose')
    ..aOS(8, _omitFieldNames ? '' : 'campus')
    ..aOS(9, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Room clone() => Room()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Room copyWith(void Function(Room) updates) => super.copyWith((message) => updates(message as Room)) as Room;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Room create() => Room._();
  Room createEmptyInstance() => create();
  static $pb.PbList<Room> createRepeated() => $pb.PbList<Room>();
  @$core.pragma('dart2js:noInline')
  static Room getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Room>(create);
  static Room? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get roomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set roomId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get buildingNr => $_getSZ(2);
  @$pb.TagNumber(3)
  set buildingNr($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBuildingNr() => $_has(2);
  @$pb.TagNumber(3)
  void clearBuildingNr() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get archId => $_getSZ(3);
  @$pb.TagNumber(4)
  set archId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasArchId() => $_has(3);
  @$pb.TagNumber(4)
  void clearArchId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get info => $_getSZ(4);
  @$pb.TagNumber(5)
  set info($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearInfo() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get address => $_getSZ(5);
  @$pb.TagNumber(6)
  set address($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAddress() => $_has(5);
  @$pb.TagNumber(6)
  void clearAddress() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get purpose => $_getSZ(6);
  @$pb.TagNumber(7)
  set purpose($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPurpose() => $_has(6);
  @$pb.TagNumber(7)
  void clearPurpose() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get campus => $_getSZ(7);
  @$pb.TagNumber(8)
  set campus($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCampus() => $_has(7);
  @$pb.TagNumber(8)
  void clearCampus() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get name => $_getSZ(8);
  @$pb.TagNumber(9)
  set name($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasName() => $_has(8);
  @$pb.TagNumber(9)
  void clearName() => clearField(9);
}

class NewsSourceArray extends $pb.GeneratedMessage {
  factory NewsSourceArray({
    $core.Iterable<NewsSource>? sources,
  }) {
    final $result = create();
    if (sources != null) {
      $result.sources.addAll(sources);
    }
    return $result;
  }
  NewsSourceArray._() : super();
  factory NewsSourceArray.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewsSourceArray.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NewsSourceArray', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<NewsSource>(1, _omitFieldNames ? '' : 'sources', $pb.PbFieldType.PM, subBuilder: NewsSource.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewsSourceArray clone() => NewsSourceArray()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewsSourceArray copyWith(void Function(NewsSourceArray) updates) => super.copyWith((message) => updates(message as NewsSourceArray)) as NewsSourceArray;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewsSourceArray create() => NewsSourceArray._();
  NewsSourceArray createEmptyInstance() => create();
  static $pb.PbList<NewsSourceArray> createRepeated() => $pb.PbList<NewsSourceArray>();
  @$core.pragma('dart2js:noInline')
  static NewsSourceArray getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewsSourceArray>(create);
  static NewsSourceArray? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<NewsSource> get sources => $_getList(0);
}

class NewsSource extends $pb.GeneratedMessage {
  factory NewsSource({
    $core.String? source,
    $core.String? title,
    $core.String? icon,
  }) {
    final $result = create();
    if (source != null) {
      $result.source = source;
    }
    if (title != null) {
      $result.title = title;
    }
    if (icon != null) {
      $result.icon = icon;
    }
    return $result;
  }
  NewsSource._() : super();
  factory NewsSource.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewsSource.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NewsSource', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'source')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewsSource clone() => NewsSource()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewsSource copyWith(void Function(NewsSource) updates) => super.copyWith((message) => updates(message as NewsSource)) as NewsSource;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewsSource create() => NewsSource._();
  NewsSource createEmptyInstance() => create();
  static $pb.PbList<NewsSource> createRepeated() => $pb.PbList<NewsSource>();
  @$core.pragma('dart2js:noInline')
  static NewsSource getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewsSource>(create);
  static NewsSource? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get source => $_getSZ(0);
  @$pb.TagNumber(1)
  set source($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSource() => $_has(0);
  @$pb.TagNumber(1)
  void clearSource() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);
}

class GetTopNewsReply extends $pb.GeneratedMessage {
  factory GetTopNewsReply({
    $core.String? imageUrl,
    $core.String? link,
    $2.Timestamp? created,
    $2.Timestamp? from,
    $2.Timestamp? to,
  }) {
    final $result = create();
    if (imageUrl != null) {
      $result.imageUrl = imageUrl;
    }
    if (link != null) {
      $result.link = link;
    }
    if (created != null) {
      $result.created = created;
    }
    if (from != null) {
      $result.from = from;
    }
    if (to != null) {
      $result.to = to;
    }
    return $result;
  }
  GetTopNewsReply._() : super();
  factory GetTopNewsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTopNewsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTopNewsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'imageUrl')
    ..aOS(2, _omitFieldNames ? '' : 'link')
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'created', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(4, _omitFieldNames ? '' : 'from', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(5, _omitFieldNames ? '' : 'to', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTopNewsReply clone() => GetTopNewsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTopNewsReply copyWith(void Function(GetTopNewsReply) updates) => super.copyWith((message) => updates(message as GetTopNewsReply)) as GetTopNewsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTopNewsReply create() => GetTopNewsReply._();
  GetTopNewsReply createEmptyInstance() => create();
  static $pb.PbList<GetTopNewsReply> createRepeated() => $pb.PbList<GetTopNewsReply>();
  @$core.pragma('dart2js:noInline')
  static GetTopNewsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTopNewsReply>(create);
  static GetTopNewsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get imageUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set imageUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasImageUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearImageUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get link => $_getSZ(1);
  @$pb.TagNumber(2)
  set link($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLink() => $_has(1);
  @$pb.TagNumber(2)
  void clearLink() => clearField(2);

  @$pb.TagNumber(3)
  $2.Timestamp get created => $_getN(2);
  @$pb.TagNumber(3)
  set created($2.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreated() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreated() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureCreated() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.Timestamp get from => $_getN(3);
  @$pb.TagNumber(4)
  set from($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFrom() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrom() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureFrom() => $_ensure(3);

  @$pb.TagNumber(5)
  $2.Timestamp get to => $_getN(4);
  @$pb.TagNumber(5)
  set to($2.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTo() => $_has(4);
  @$pb.TagNumber(5)
  void clearTo() => clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureTo() => $_ensure(4);
}

class CafeteriaRatingRequest extends $pb.GeneratedMessage {
  factory CafeteriaRatingRequest({
    $core.String? cafeteriaId,
    $2.Timestamp? from,
    $2.Timestamp? to,
    $core.int? limit,
  }) {
    final $result = create();
    if (cafeteriaId != null) {
      $result.cafeteriaId = cafeteriaId;
    }
    if (from != null) {
      $result.from = from;
    }
    if (to != null) {
      $result.to = to;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    return $result;
  }
  CafeteriaRatingRequest._() : super();
  factory CafeteriaRatingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CafeteriaRatingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CafeteriaRatingRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cafeteriaId', protoName: 'cafeteriaId')
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'from', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'to', subBuilder: $2.Timestamp.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CafeteriaRatingRequest clone() => CafeteriaRatingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CafeteriaRatingRequest copyWith(void Function(CafeteriaRatingRequest) updates) => super.copyWith((message) => updates(message as CafeteriaRatingRequest)) as CafeteriaRatingRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CafeteriaRatingRequest create() => CafeteriaRatingRequest._();
  CafeteriaRatingRequest createEmptyInstance() => create();
  static $pb.PbList<CafeteriaRatingRequest> createRepeated() => $pb.PbList<CafeteriaRatingRequest>();
  @$core.pragma('dart2js:noInline')
  static CafeteriaRatingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CafeteriaRatingRequest>(create);
  static CafeteriaRatingRequest? _defaultInstance;

  /// cafeteriaId Mandatory Name of the cafeteria (EAT-API naming scheme "MENSA_GARCHING")
  @$pb.TagNumber(1)
  $core.String get cafeteriaId => $_getSZ(0);
  @$pb.TagNumber(1)
  set cafeteriaId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCafeteriaId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCafeteriaId() => clearField(1);

  /// Optional Parameter to define an interval for the ratings (Lower bound)
  @$pb.TagNumber(2)
  $2.Timestamp get from => $_getN(1);
  @$pb.TagNumber(2)
  set from($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureFrom() => $_ensure(1);

  /// Optional Parameter to define an interval for the ratings (Upper bound)
  @$pb.TagNumber(3)
  $2.Timestamp get to => $_getN(2);
  @$pb.TagNumber(3)
  set to($2.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTo() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureTo() => $_ensure(2);

  /// Optional Parameter defines how many ratings are queried. If all ratings should be queried, enter "-1"
  @$pb.TagNumber(4)
  $core.int get limit => $_getIZ(3);
  @$pb.TagNumber(4)
  set limit($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLimit() => clearField(4);
}

class DishRatingRequest extends $pb.GeneratedMessage {
  factory DishRatingRequest({
    $core.String? cafeteriaId,
    $core.String? dish,
    $2.Timestamp? from,
    $2.Timestamp? to,
    $core.int? limit,
  }) {
    final $result = create();
    if (cafeteriaId != null) {
      $result.cafeteriaId = cafeteriaId;
    }
    if (dish != null) {
      $result.dish = dish;
    }
    if (from != null) {
      $result.from = from;
    }
    if (to != null) {
      $result.to = to;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    return $result;
  }
  DishRatingRequest._() : super();
  factory DishRatingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DishRatingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DishRatingRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cafeteriaId', protoName: 'cafeteriaId')
    ..aOS(2, _omitFieldNames ? '' : 'dish')
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'from', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(4, _omitFieldNames ? '' : 'to', subBuilder: $2.Timestamp.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DishRatingRequest clone() => DishRatingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DishRatingRequest copyWith(void Function(DishRatingRequest) updates) => super.copyWith((message) => updates(message as DishRatingRequest)) as DishRatingRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DishRatingRequest create() => DishRatingRequest._();
  DishRatingRequest createEmptyInstance() => create();
  static $pb.PbList<DishRatingRequest> createRepeated() => $pb.PbList<DishRatingRequest>();
  @$core.pragma('dart2js:noInline')
  static DishRatingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DishRatingRequest>(create);
  static DishRatingRequest? _defaultInstance;

  /// Mandatory Name of the cafeteria (EAT-API naming scheme "MENSA_GARCHING")
  @$pb.TagNumber(1)
  $core.String get cafeteriaId => $_getSZ(0);
  @$pb.TagNumber(1)
  set cafeteriaId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCafeteriaId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCafeteriaId() => clearField(1);

  /// Mandatory Name of the dish (EAT-API naming scheme) Must be available int the given mensa
  @$pb.TagNumber(2)
  $core.String get dish => $_getSZ(1);
  @$pb.TagNumber(2)
  set dish($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDish() => $_has(1);
  @$pb.TagNumber(2)
  void clearDish() => clearField(2);

  /// Optional Parameter to define an interval for the ratings (Lower bound)
  @$pb.TagNumber(3)
  $2.Timestamp get from => $_getN(2);
  @$pb.TagNumber(3)
  set from($2.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrom() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureFrom() => $_ensure(2);

  /// Optional Parameter to define an interval for the ratings (Upper bound)
  @$pb.TagNumber(4)
  $2.Timestamp get to => $_getN(3);
  @$pb.TagNumber(4)
  set to($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTo() => $_has(3);
  @$pb.TagNumber(4)
  void clearTo() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureTo() => $_ensure(3);

  /// Optional Parameter defines how many ratings are queried. If all ratings should be queried, enter "-1"
  @$pb.TagNumber(5)
  $core.int get limit => $_getIZ(4);
  @$pb.TagNumber(5)
  set limit($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearLimit() => clearField(5);
}

class CafeteriaRatingReply extends $pb.GeneratedMessage {
  factory CafeteriaRatingReply({
    $core.Iterable<SingleRatingReply>? rating,
    $core.double? avg,
    $core.double? std,
    $core.int? min,
    $core.int? max,
    $core.Iterable<RatingTagResult>? ratingTags,
  }) {
    final $result = create();
    if (rating != null) {
      $result.rating.addAll(rating);
    }
    if (avg != null) {
      $result.avg = avg;
    }
    if (std != null) {
      $result.std = std;
    }
    if (min != null) {
      $result.min = min;
    }
    if (max != null) {
      $result.max = max;
    }
    if (ratingTags != null) {
      $result.ratingTags.addAll(ratingTags);
    }
    return $result;
  }
  CafeteriaRatingReply._() : super();
  factory CafeteriaRatingReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CafeteriaRatingReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CafeteriaRatingReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<SingleRatingReply>(1, _omitFieldNames ? '' : 'rating', $pb.PbFieldType.PM, subBuilder: SingleRatingReply.create)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'avg', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'std', $pb.PbFieldType.OD)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'min', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'max', $pb.PbFieldType.O3)
    ..pc<RatingTagResult>(6, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, protoName: 'ratingTags', subBuilder: RatingTagResult.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CafeteriaRatingReply clone() => CafeteriaRatingReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CafeteriaRatingReply copyWith(void Function(CafeteriaRatingReply) updates) => super.copyWith((message) => updates(message as CafeteriaRatingReply)) as CafeteriaRatingReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CafeteriaRatingReply create() => CafeteriaRatingReply._();
  CafeteriaRatingReply createEmptyInstance() => create();
  static $pb.PbList<CafeteriaRatingReply> createRepeated() => $pb.PbList<CafeteriaRatingReply>();
  @$core.pragma('dart2js:noInline')
  static CafeteriaRatingReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CafeteriaRatingReply>(create);
  static CafeteriaRatingReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SingleRatingReply> get rating => $_getList(0);

  @$pb.TagNumber(2)
  $core.double get avg => $_getN(1);
  @$pb.TagNumber(2)
  set avg($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAvg() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvg() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get std => $_getN(2);
  @$pb.TagNumber(3)
  set std($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStd() => $_has(2);
  @$pb.TagNumber(3)
  void clearStd() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get min => $_getIZ(3);
  @$pb.TagNumber(4)
  set min($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMin() => $_has(3);
  @$pb.TagNumber(4)
  void clearMin() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get max => $_getIZ(4);
  @$pb.TagNumber(5)
  set max($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMax() => $_has(4);
  @$pb.TagNumber(5)
  void clearMax() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<RatingTagResult> get ratingTags => $_getList(5);
}

class DishRatingReply extends $pb.GeneratedMessage {
  factory DishRatingReply({
    $core.Iterable<SingleRatingReply>? rating,
    $core.double? avg,
    $core.double? std,
    $core.int? min,
    $core.int? max,
    $core.Iterable<RatingTagResult>? ratingTags,
    $core.Iterable<RatingTagResult>? nameTags,
  }) {
    final $result = create();
    if (rating != null) {
      $result.rating.addAll(rating);
    }
    if (avg != null) {
      $result.avg = avg;
    }
    if (std != null) {
      $result.std = std;
    }
    if (min != null) {
      $result.min = min;
    }
    if (max != null) {
      $result.max = max;
    }
    if (ratingTags != null) {
      $result.ratingTags.addAll(ratingTags);
    }
    if (nameTags != null) {
      $result.nameTags.addAll(nameTags);
    }
    return $result;
  }
  DishRatingReply._() : super();
  factory DishRatingReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DishRatingReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DishRatingReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<SingleRatingReply>(1, _omitFieldNames ? '' : 'rating', $pb.PbFieldType.PM, subBuilder: SingleRatingReply.create)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'avg', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'std', $pb.PbFieldType.OD)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'min', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'max', $pb.PbFieldType.O3)
    ..pc<RatingTagResult>(6, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, protoName: 'ratingTags', subBuilder: RatingTagResult.create)
    ..pc<RatingTagResult>(7, _omitFieldNames ? '' : 'nameTags', $pb.PbFieldType.PM, protoName: 'nameTags', subBuilder: RatingTagResult.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DishRatingReply clone() => DishRatingReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DishRatingReply copyWith(void Function(DishRatingReply) updates) => super.copyWith((message) => updates(message as DishRatingReply)) as DishRatingReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DishRatingReply create() => DishRatingReply._();
  DishRatingReply createEmptyInstance() => create();
  static $pb.PbList<DishRatingReply> createRepeated() => $pb.PbList<DishRatingReply>();
  @$core.pragma('dart2js:noInline')
  static DishRatingReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DishRatingReply>(create);
  static DishRatingReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SingleRatingReply> get rating => $_getList(0);

  @$pb.TagNumber(2)
  $core.double get avg => $_getN(1);
  @$pb.TagNumber(2)
  set avg($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAvg() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvg() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get std => $_getN(2);
  @$pb.TagNumber(3)
  set std($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStd() => $_has(2);
  @$pb.TagNumber(3)
  void clearStd() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get min => $_getIZ(3);
  @$pb.TagNumber(4)
  set min($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMin() => $_has(3);
  @$pb.TagNumber(4)
  void clearMin() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get max => $_getIZ(4);
  @$pb.TagNumber(5)
  set max($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMax() => $_has(4);
  @$pb.TagNumber(5)
  void clearMax() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<RatingTagResult> get ratingTags => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<RatingTagResult> get nameTags => $_getList(6);
}

class SingleRatingReply extends $pb.GeneratedMessage {
  factory SingleRatingReply({
    $core.int? points,
    $core.List<$core.int>? image,
    $core.String? comment,
    $core.Iterable<RatingTagNewRequest>? ratingTags,
    $2.Timestamp? visited,
  }) {
    final $result = create();
    if (points != null) {
      $result.points = points;
    }
    if (image != null) {
      $result.image = image;
    }
    if (comment != null) {
      $result.comment = comment;
    }
    if (ratingTags != null) {
      $result.ratingTags.addAll(ratingTags);
    }
    if (visited != null) {
      $result.visited = visited;
    }
    return $result;
  }
  SingleRatingReply._() : super();
  factory SingleRatingReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SingleRatingReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SingleRatingReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'points', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'comment')
    ..pc<RatingTagNewRequest>(4, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, protoName: 'ratingTags', subBuilder: RatingTagNewRequest.create)
    ..aOM<$2.Timestamp>(5, _omitFieldNames ? '' : 'visited', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SingleRatingReply clone() => SingleRatingReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SingleRatingReply copyWith(void Function(SingleRatingReply) updates) => super.copyWith((message) => updates(message as SingleRatingReply)) as SingleRatingReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SingleRatingReply create() => SingleRatingReply._();
  SingleRatingReply createEmptyInstance() => create();
  static $pb.PbList<SingleRatingReply> createRepeated() => $pb.PbList<SingleRatingReply>();
  @$core.pragma('dart2js:noInline')
  static SingleRatingReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SingleRatingReply>(create);
  static SingleRatingReply? _defaultInstance;

  /// number in the range 1-5
  @$pb.TagNumber(1)
  $core.int get points => $_getIZ(0);
  @$pb.TagNumber(1)
  set points($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPoints() => $_has(0);
  @$pb.TagNumber(1)
  void clearPoints() => clearField(1);

  /// Optional JPEG image in Base64
  @$pb.TagNumber(2)
  $core.List<$core.int> get image => $_getN(1);
  @$pb.TagNumber(2)
  set image($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);

  /// Optional comment (max 256 chars)
  @$pb.TagNumber(3)
  $core.String get comment => $_getSZ(2);
  @$pb.TagNumber(3)
  set comment($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasComment() => $_has(2);
  @$pb.TagNumber(3)
  void clearComment() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<RatingTagNewRequest> get ratingTags => $_getList(3);

  @$pb.TagNumber(5)
  $2.Timestamp get visited => $_getN(4);
  @$pb.TagNumber(5)
  set visited($2.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasVisited() => $_has(4);
  @$pb.TagNumber(5)
  void clearVisited() => clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureVisited() => $_ensure(4);
}

class NewCafeteriaRatingRequest extends $pb.GeneratedMessage {
  factory NewCafeteriaRatingRequest({
    $core.int? points,
    $core.String? cafeteriaId,
    $core.List<$core.int>? image,
    $core.Iterable<RatingTag>? ratingTags,
    $core.String? comment,
  }) {
    final $result = create();
    if (points != null) {
      $result.points = points;
    }
    if (cafeteriaId != null) {
      $result.cafeteriaId = cafeteriaId;
    }
    if (image != null) {
      $result.image = image;
    }
    if (ratingTags != null) {
      $result.ratingTags.addAll(ratingTags);
    }
    if (comment != null) {
      $result.comment = comment;
    }
    return $result;
  }
  NewCafeteriaRatingRequest._() : super();
  factory NewCafeteriaRatingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewCafeteriaRatingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NewCafeteriaRatingRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'points', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'cafeteriaId', protoName: 'cafeteriaId')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OY)
    ..pc<RatingTag>(4, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, protoName: 'ratingTags', subBuilder: RatingTag.create)
    ..aOS(6, _omitFieldNames ? '' : 'comment')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewCafeteriaRatingRequest clone() => NewCafeteriaRatingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewCafeteriaRatingRequest copyWith(void Function(NewCafeteriaRatingRequest) updates) => super.copyWith((message) => updates(message as NewCafeteriaRatingRequest)) as NewCafeteriaRatingRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewCafeteriaRatingRequest create() => NewCafeteriaRatingRequest._();
  NewCafeteriaRatingRequest createEmptyInstance() => create();
  static $pb.PbList<NewCafeteriaRatingRequest> createRepeated() => $pb.PbList<NewCafeteriaRatingRequest>();
  @$core.pragma('dart2js:noInline')
  static NewCafeteriaRatingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewCafeteriaRatingRequest>(create);
  static NewCafeteriaRatingRequest? _defaultInstance;

  /// number in the range 1-5
  @$pb.TagNumber(1)
  $core.int get points => $_getIZ(0);
  @$pb.TagNumber(1)
  set points($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPoints() => $_has(0);
  @$pb.TagNumber(1)
  void clearPoints() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cafeteriaId => $_getSZ(1);
  @$pb.TagNumber(2)
  set cafeteriaId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCafeteriaId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCafeteriaId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get image => $_getN(2);
  @$pb.TagNumber(3)
  set image($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);

  /// Optional list of tag ratings add as many tags with a rating (1-5) of the list of cafeteriaRatingTags
  @$pb.TagNumber(4)
  $core.List<RatingTag> get ratingTags => $_getList(3);

  /// Optional comment (max 256 chars)
  @$pb.TagNumber(6)
  $core.String get comment => $_getSZ(4);
  @$pb.TagNumber(6)
  set comment($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasComment() => $_has(4);
  @$pb.TagNumber(6)
  void clearComment() => clearField(6);
}

class NewDishRatingRequest extends $pb.GeneratedMessage {
  factory NewDishRatingRequest({
    $core.int? points,
    $core.String? cafeteriaId,
    $core.String? dish,
    $core.List<$core.int>? image,
    $core.Iterable<RatingTag>? ratingTags,
    $core.String? comment,
  }) {
    final $result = create();
    if (points != null) {
      $result.points = points;
    }
    if (cafeteriaId != null) {
      $result.cafeteriaId = cafeteriaId;
    }
    if (dish != null) {
      $result.dish = dish;
    }
    if (image != null) {
      $result.image = image;
    }
    if (ratingTags != null) {
      $result.ratingTags.addAll(ratingTags);
    }
    if (comment != null) {
      $result.comment = comment;
    }
    return $result;
  }
  NewDishRatingRequest._() : super();
  factory NewDishRatingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewDishRatingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NewDishRatingRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'points', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'cafeteriaId', protoName: 'cafeteriaId')
    ..aOS(3, _omitFieldNames ? '' : 'dish')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OY)
    ..pc<RatingTag>(5, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, protoName: 'ratingTags', subBuilder: RatingTag.create)
    ..aOS(7, _omitFieldNames ? '' : 'comment')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewDishRatingRequest clone() => NewDishRatingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewDishRatingRequest copyWith(void Function(NewDishRatingRequest) updates) => super.copyWith((message) => updates(message as NewDishRatingRequest)) as NewDishRatingRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewDishRatingRequest create() => NewDishRatingRequest._();
  NewDishRatingRequest createEmptyInstance() => create();
  static $pb.PbList<NewDishRatingRequest> createRepeated() => $pb.PbList<NewDishRatingRequest>();
  @$core.pragma('dart2js:noInline')
  static NewDishRatingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewDishRatingRequest>(create);
  static NewDishRatingRequest? _defaultInstance;

  /// number in the range 1-5
  @$pb.TagNumber(1)
  $core.int get points => $_getIZ(0);
  @$pb.TagNumber(1)
  set points($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPoints() => $_has(0);
  @$pb.TagNumber(1)
  void clearPoints() => clearField(1);

  /// Mandatory Name of the dish (EAT-API naming scheme "MENSA_GARCHING") Must be available int the given mensa
  @$pb.TagNumber(2)
  $core.String get cafeteriaId => $_getSZ(1);
  @$pb.TagNumber(2)
  set cafeteriaId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCafeteriaId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCafeteriaId() => clearField(2);

  /// Mandatory Name of the dish (EAT-API naming scheme) Must be available int the given mensa
  @$pb.TagNumber(3)
  $core.String get dish => $_getSZ(2);
  @$pb.TagNumber(3)
  set dish($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDish() => $_has(2);
  @$pb.TagNumber(3)
  void clearDish() => clearField(3);

  /// Optional JPEG image in Base64
  @$pb.TagNumber(4)
  $core.List<$core.int> get image => $_getN(3);
  @$pb.TagNumber(4)
  set image($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasImage() => $_has(3);
  @$pb.TagNumber(4)
  void clearImage() => clearField(4);

  /// Optional list of tag ratings add as many tags with a rating (1-5) of the list of dishRatingTags
  @$pb.TagNumber(5)
  $core.List<RatingTag> get ratingTags => $_getList(4);

  /// Optional comment (max 256 chars)
  @$pb.TagNumber(7)
  $core.String get comment => $_getSZ(5);
  @$pb.TagNumber(7)
  set comment($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasComment() => $_has(5);
  @$pb.TagNumber(7)
  void clearComment() => clearField(7);
}

class GetTagsReply extends $pb.GeneratedMessage {
  factory GetTagsReply({
    $core.Iterable<TagsOverview>? ratingTags,
  }) {
    final $result = create();
    if (ratingTags != null) {
      $result.ratingTags.addAll(ratingTags);
    }
    return $result;
  }
  GetTagsReply._() : super();
  factory GetTagsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTagsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTagsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<TagsOverview>(1, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, protoName: 'ratingTags', subBuilder: TagsOverview.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTagsReply clone() => GetTagsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTagsReply copyWith(void Function(GetTagsReply) updates) => super.copyWith((message) => updates(message as GetTagsReply)) as GetTagsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTagsReply create() => GetTagsReply._();
  GetTagsReply createEmptyInstance() => create();
  static $pb.PbList<GetTagsReply> createRepeated() => $pb.PbList<GetTagsReply>();
  @$core.pragma('dart2js:noInline')
  static GetTagsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTagsReply>(create);
  static GetTagsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TagsOverview> get ratingTags => $_getList(0);
}

class TagsOverview extends $pb.GeneratedMessage {
  factory TagsOverview({
    $core.int? tagId,
    $core.String? de,
    $core.String? en,
  }) {
    final $result = create();
    if (tagId != null) {
      $result.tagId = tagId;
    }
    if (de != null) {
      $result.de = de;
    }
    if (en != null) {
      $result.en = en;
    }
    return $result;
  }
  TagsOverview._() : super();
  factory TagsOverview.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TagsOverview.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TagsOverview', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'tagId', $pb.PbFieldType.O3, protoName: 'tagId')
    ..aOS(2, _omitFieldNames ? '' : 'de')
    ..aOS(3, _omitFieldNames ? '' : 'en')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TagsOverview clone() => TagsOverview()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TagsOverview copyWith(void Function(TagsOverview) updates) => super.copyWith((message) => updates(message as TagsOverview)) as TagsOverview;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TagsOverview create() => TagsOverview._();
  TagsOverview createEmptyInstance() => create();
  static $pb.PbList<TagsOverview> createRepeated() => $pb.PbList<TagsOverview>();
  @$core.pragma('dart2js:noInline')
  static TagsOverview getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TagsOverview>(create);
  static TagsOverview? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tagId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tagId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get de => $_getSZ(1);
  @$pb.TagNumber(2)
  set de($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDe() => $_has(1);
  @$pb.TagNumber(2)
  void clearDe() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get en => $_getSZ(2);
  @$pb.TagNumber(3)
  set en($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEn() => $_has(2);
  @$pb.TagNumber(3)
  void clearEn() => clearField(3);
}

class RatingTag extends $pb.GeneratedMessage {
  factory RatingTag({
    $core.int? tagId,
    $core.double? points,
  }) {
    final $result = create();
    if (tagId != null) {
      $result.tagId = tagId;
    }
    if (points != null) {
      $result.points = points;
    }
    return $result;
  }
  RatingTag._() : super();
  factory RatingTag.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RatingTag.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RatingTag', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'tagId', $pb.PbFieldType.O3, protoName: 'tagId')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'points', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RatingTag clone() => RatingTag()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RatingTag copyWith(void Function(RatingTag) updates) => super.copyWith((message) => updates(message as RatingTag)) as RatingTag;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RatingTag create() => RatingTag._();
  RatingTag createEmptyInstance() => create();
  static $pb.PbList<RatingTag> createRepeated() => $pb.PbList<RatingTag>();
  @$core.pragma('dart2js:noInline')
  static RatingTag getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RatingTag>(create);
  static RatingTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tagId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tagId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get points => $_getN(1);
  @$pb.TagNumber(2)
  set points($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPoints() => $_has(1);
  @$pb.TagNumber(2)
  void clearPoints() => clearField(2);
}

class RatingTagNewRequest extends $pb.GeneratedMessage {
  factory RatingTagNewRequest({
    $core.int? tagId,
    $core.int? points,
  }) {
    final $result = create();
    if (tagId != null) {
      $result.tagId = tagId;
    }
    if (points != null) {
      $result.points = points;
    }
    return $result;
  }
  RatingTagNewRequest._() : super();
  factory RatingTagNewRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RatingTagNewRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RatingTagNewRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'tagId', $pb.PbFieldType.O3, protoName: 'tagId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'points', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RatingTagNewRequest clone() => RatingTagNewRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RatingTagNewRequest copyWith(void Function(RatingTagNewRequest) updates) => super.copyWith((message) => updates(message as RatingTagNewRequest)) as RatingTagNewRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RatingTagNewRequest create() => RatingTagNewRequest._();
  RatingTagNewRequest createEmptyInstance() => create();
  static $pb.PbList<RatingTagNewRequest> createRepeated() => $pb.PbList<RatingTagNewRequest>();
  @$core.pragma('dart2js:noInline')
  static RatingTagNewRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RatingTagNewRequest>(create);
  static RatingTagNewRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tagId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tagId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get points => $_getIZ(1);
  @$pb.TagNumber(2)
  set points($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPoints() => $_has(1);
  @$pb.TagNumber(2)
  void clearPoints() => clearField(2);
}

class RatingTagResult extends $pb.GeneratedMessage {
  factory RatingTagResult({
    $core.int? tagId,
    $core.double? avg,
    $core.double? std,
    $core.int? min,
    $core.int? max,
  }) {
    final $result = create();
    if (tagId != null) {
      $result.tagId = tagId;
    }
    if (avg != null) {
      $result.avg = avg;
    }
    if (std != null) {
      $result.std = std;
    }
    if (min != null) {
      $result.min = min;
    }
    if (max != null) {
      $result.max = max;
    }
    return $result;
  }
  RatingTagResult._() : super();
  factory RatingTagResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RatingTagResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RatingTagResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'tagId', $pb.PbFieldType.O3, protoName: 'tagId')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'avg', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'std', $pb.PbFieldType.OD)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'min', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'max', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RatingTagResult clone() => RatingTagResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RatingTagResult copyWith(void Function(RatingTagResult) updates) => super.copyWith((message) => updates(message as RatingTagResult)) as RatingTagResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RatingTagResult create() => RatingTagResult._();
  RatingTagResult createEmptyInstance() => create();
  static $pb.PbList<RatingTagResult> createRepeated() => $pb.PbList<RatingTagResult>();
  @$core.pragma('dart2js:noInline')
  static RatingTagResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RatingTagResult>(create);
  static RatingTagResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tagId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tagId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get avg => $_getN(1);
  @$pb.TagNumber(2)
  set avg($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAvg() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvg() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get std => $_getN(2);
  @$pb.TagNumber(3)
  set std($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStd() => $_has(2);
  @$pb.TagNumber(3)
  void clearStd() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get min => $_getIZ(3);
  @$pb.TagNumber(4)
  set min($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMin() => $_has(3);
  @$pb.TagNumber(4)
  void clearMin() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get max => $_getIZ(4);
  @$pb.TagNumber(5)
  set max($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMax() => $_has(4);
  @$pb.TagNumber(5)
  void clearMax() => clearField(5);
}

class GetCafeteriaReply extends $pb.GeneratedMessage {
  factory GetCafeteriaReply({
    $core.Iterable<Cafeteria>? cafeteria,
  }) {
    final $result = create();
    if (cafeteria != null) {
      $result.cafeteria.addAll(cafeteria);
    }
    return $result;
  }
  GetCafeteriaReply._() : super();
  factory GetCafeteriaReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCafeteriaReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCafeteriaReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<Cafeteria>(1, _omitFieldNames ? '' : 'cafeteria', $pb.PbFieldType.PM, subBuilder: Cafeteria.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCafeteriaReply clone() => GetCafeteriaReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCafeteriaReply copyWith(void Function(GetCafeteriaReply) updates) => super.copyWith((message) => updates(message as GetCafeteriaReply)) as GetCafeteriaReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCafeteriaReply create() => GetCafeteriaReply._();
  GetCafeteriaReply createEmptyInstance() => create();
  static $pb.PbList<GetCafeteriaReply> createRepeated() => $pb.PbList<GetCafeteriaReply>();
  @$core.pragma('dart2js:noInline')
  static GetCafeteriaReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCafeteriaReply>(create);
  static GetCafeteriaReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Cafeteria> get cafeteria => $_getList(0);
}

class Cafeteria extends $pb.GeneratedMessage {
  factory Cafeteria({
    $core.String? id,
    $core.String? address,
    $core.double? longitude,
    $core.double? latitude,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (address != null) {
      $result.address = address;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    if (latitude != null) {
      $result.latitude = latitude;
    }
    return $result;
  }
  Cafeteria._() : super();
  factory Cafeteria.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Cafeteria.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Cafeteria', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'address')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Cafeteria clone() => Cafeteria()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Cafeteria copyWith(void Function(Cafeteria) updates) => super.copyWith((message) => updates(message as Cafeteria)) as Cafeteria;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Cafeteria create() => Cafeteria._();
  Cafeteria createEmptyInstance() => create();
  static $pb.PbList<Cafeteria> createRepeated() => $pb.PbList<Cafeteria>();
  @$core.pragma('dart2js:noInline')
  static Cafeteria getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Cafeteria>(create);
  static Cafeteria? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get longitude => $_getN(2);
  @$pb.TagNumber(3)
  set longitude($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLongitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearLongitude() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get latitude => $_getN(3);
  @$pb.TagNumber(4)
  set latitude($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLatitude() => $_has(3);
  @$pb.TagNumber(4)
  void clearLatitude() => clearField(4);
}

class GetDishesRequest extends $pb.GeneratedMessage {
  factory GetDishesRequest({
    $core.String? cafeteriaId,
    $core.int? year,
    $core.int? week,
    $core.int? day,
  }) {
    final $result = create();
    if (cafeteriaId != null) {
      $result.cafeteriaId = cafeteriaId;
    }
    if (year != null) {
      $result.year = year;
    }
    if (week != null) {
      $result.week = week;
    }
    if (day != null) {
      $result.day = day;
    }
    return $result;
  }
  GetDishesRequest._() : super();
  factory GetDishesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDishesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetDishesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cafeteriaId', protoName: 'cafeteriaId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'year', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'week', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'day', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDishesRequest clone() => GetDishesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDishesRequest copyWith(void Function(GetDishesRequest) updates) => super.copyWith((message) => updates(message as GetDishesRequest)) as GetDishesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDishesRequest create() => GetDishesRequest._();
  GetDishesRequest createEmptyInstance() => create();
  static $pb.PbList<GetDishesRequest> createRepeated() => $pb.PbList<GetDishesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetDishesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDishesRequest>(create);
  static GetDishesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cafeteriaId => $_getSZ(0);
  @$pb.TagNumber(1)
  set cafeteriaId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCafeteriaId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCafeteriaId() => clearField(1);

  /// >=2022 until the current year
  @$pb.TagNumber(2)
  $core.int get year => $_getIZ(1);
  @$pb.TagNumber(2)
  set year($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasYear() => $_has(1);
  @$pb.TagNumber(2)
  void clearYear() => clearField(2);

  /// range 1 - 53
  @$pb.TagNumber(3)
  $core.int get week => $_getIZ(2);
  @$pb.TagNumber(3)
  set week($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWeek() => $_has(2);
  @$pb.TagNumber(3)
  void clearWeek() => clearField(3);

  /// range 0 (Monday) - 4 (Friday)
  @$pb.TagNumber(4)
  $core.int get day => $_getIZ(3);
  @$pb.TagNumber(4)
  set day($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDay() => $_has(3);
  @$pb.TagNumber(4)
  void clearDay() => clearField(4);
}

class GetDishesReply extends $pb.GeneratedMessage {
  factory GetDishesReply({
    $core.Iterable<$core.String>? dish,
  }) {
    final $result = create();
    if (dish != null) {
      $result.dish.addAll(dish);
    }
    return $result;
  }
  GetDishesReply._() : super();
  factory GetDishesReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDishesReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetDishesReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'dish')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDishesReply clone() => GetDishesReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDishesReply copyWith(void Function(GetDishesReply) updates) => super.copyWith((message) => updates(message as GetDishesReply)) as GetDishesReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDishesReply create() => GetDishesReply._();
  GetDishesReply createEmptyInstance() => create();
  static $pb.PbList<GetDishesReply> createRepeated() => $pb.PbList<GetDishesReply>();
  @$core.pragma('dart2js:noInline')
  static GetDishesReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDishesReply>(create);
  static GetDishesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get dish => $_getList(0);
}

class GetResponsiblePersonReply extends $pb.GeneratedMessage {
  factory GetResponsiblePersonReply({
    $core.Iterable<ResponsiblePersonElement>? responsiblePerson,
  }) {
    final $result = create();
    if (responsiblePerson != null) {
      $result.responsiblePerson.addAll(responsiblePerson);
    }
    return $result;
  }
  GetResponsiblePersonReply._() : super();
  factory GetResponsiblePersonReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetResponsiblePersonReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetResponsiblePersonReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<ResponsiblePersonElement>(1, _omitFieldNames ? '' : 'responsiblePerson', $pb.PbFieldType.PM, protoName: 'responsiblePerson', subBuilder: ResponsiblePersonElement.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetResponsiblePersonReply clone() => GetResponsiblePersonReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetResponsiblePersonReply copyWith(void Function(GetResponsiblePersonReply) updates) => super.copyWith((message) => updates(message as GetResponsiblePersonReply)) as GetResponsiblePersonReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetResponsiblePersonReply create() => GetResponsiblePersonReply._();
  GetResponsiblePersonReply createEmptyInstance() => create();
  static $pb.PbList<GetResponsiblePersonReply> createRepeated() => $pb.PbList<GetResponsiblePersonReply>();
  @$core.pragma('dart2js:noInline')
  static GetResponsiblePersonReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetResponsiblePersonReply>(create);
  static GetResponsiblePersonReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ResponsiblePersonElement> get responsiblePerson => $_getList(0);
}

class ResponsiblePersonElement extends $pb.GeneratedMessage {
  factory ResponsiblePersonElement({
    $core.String? name,
    $core.String? telephone,
    $core.String? email,
    $core.String? faculty,
    $core.String? tumID,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (telephone != null) {
      $result.telephone = telephone;
    }
    if (email != null) {
      $result.email = email;
    }
    if (faculty != null) {
      $result.faculty = faculty;
    }
    if (tumID != null) {
      $result.tumID = tumID;
    }
    return $result;
  }
  ResponsiblePersonElement._() : super();
  factory ResponsiblePersonElement.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponsiblePersonElement.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResponsiblePersonElement', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'telephone')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..aOS(4, _omitFieldNames ? '' : 'faculty')
    ..aOS(5, _omitFieldNames ? '' : 'tumID', protoName: 'tumID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponsiblePersonElement clone() => ResponsiblePersonElement()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponsiblePersonElement copyWith(void Function(ResponsiblePersonElement) updates) => super.copyWith((message) => updates(message as ResponsiblePersonElement)) as ResponsiblePersonElement;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResponsiblePersonElement create() => ResponsiblePersonElement._();
  ResponsiblePersonElement createEmptyInstance() => create();
  static $pb.PbList<ResponsiblePersonElement> createRepeated() => $pb.PbList<ResponsiblePersonElement>();
  @$core.pragma('dart2js:noInline')
  static ResponsiblePersonElement getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponsiblePersonElement>(create);
  static ResponsiblePersonElement? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get telephone => $_getSZ(1);
  @$pb.TagNumber(2)
  set telephone($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTelephone() => $_has(1);
  @$pb.TagNumber(2)
  void clearTelephone() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get faculty => $_getSZ(3);
  @$pb.TagNumber(4)
  set faculty($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFaculty() => $_has(3);
  @$pb.TagNumber(4)
  void clearFaculty() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get tumID => $_getSZ(4);
  @$pb.TagNumber(5)
  set tumID($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTumID() => $_has(4);
  @$pb.TagNumber(5)
  void clearTumID() => clearField(5);
}

class GetBuilding2GpsReply extends $pb.GeneratedMessage {
  factory GetBuilding2GpsReply({
    $core.Iterable<Building2GpsElement>? building2Gps,
  }) {
    final $result = create();
    if (building2Gps != null) {
      $result.building2Gps.addAll(building2Gps);
    }
    return $result;
  }
  GetBuilding2GpsReply._() : super();
  factory GetBuilding2GpsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBuilding2GpsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBuilding2GpsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<Building2GpsElement>(1, _omitFieldNames ? '' : 'building2Gps', $pb.PbFieldType.PM, protoName: 'building2Gps', subBuilder: Building2GpsElement.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBuilding2GpsReply clone() => GetBuilding2GpsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBuilding2GpsReply copyWith(void Function(GetBuilding2GpsReply) updates) => super.copyWith((message) => updates(message as GetBuilding2GpsReply)) as GetBuilding2GpsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBuilding2GpsReply create() => GetBuilding2GpsReply._();
  GetBuilding2GpsReply createEmptyInstance() => create();
  static $pb.PbList<GetBuilding2GpsReply> createRepeated() => $pb.PbList<GetBuilding2GpsReply>();
  @$core.pragma('dart2js:noInline')
  static GetBuilding2GpsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBuilding2GpsReply>(create);
  static GetBuilding2GpsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Building2GpsElement> get building2Gps => $_getList(0);
}

class Building2GpsElement extends $pb.GeneratedMessage {
  factory Building2GpsElement({
    $core.String? id,
    $core.String? latitude,
    $core.String? longitude,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (latitude != null) {
      $result.latitude = latitude;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    return $result;
  }
  Building2GpsElement._() : super();
  factory Building2GpsElement.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Building2GpsElement.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Building2GpsElement', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'latitude')
    ..aOS(3, _omitFieldNames ? '' : 'longitude')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Building2GpsElement clone() => Building2GpsElement()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Building2GpsElement copyWith(void Function(Building2GpsElement) updates) => super.copyWith((message) => updates(message as Building2GpsElement)) as Building2GpsElement;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Building2GpsElement create() => Building2GpsElement._();
  Building2GpsElement createEmptyInstance() => create();
  static $pb.PbList<Building2GpsElement> createRepeated() => $pb.PbList<Building2GpsElement>();
  @$core.pragma('dart2js:noInline')
  static Building2GpsElement getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Building2GpsElement>(create);
  static Building2GpsElement? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get latitude => $_getSZ(1);
  @$pb.TagNumber(2)
  set latitude($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLatitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatitude() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get longitude => $_getSZ(2);
  @$pb.TagNumber(3)
  set longitude($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLongitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearLongitude() => clearField(3);
}

class GetAreaFacilitiesByBuildingNrReply extends $pb.GeneratedMessage {
  factory GetAreaFacilitiesByBuildingNrReply({
    $core.Iterable<RoomInformationElement>? areaFacilitiesByBuildingNr,
  }) {
    final $result = create();
    if (areaFacilitiesByBuildingNr != null) {
      $result.areaFacilitiesByBuildingNr.addAll(areaFacilitiesByBuildingNr);
    }
    return $result;
  }
  GetAreaFacilitiesByBuildingNrReply._() : super();
  factory GetAreaFacilitiesByBuildingNrReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAreaFacilitiesByBuildingNrReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAreaFacilitiesByBuildingNrReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<RoomInformationElement>(1, _omitFieldNames ? '' : 'areaFacilitiesByBuildingNr', $pb.PbFieldType.PM, protoName: 'areaFacilitiesByBuildingNr', subBuilder: RoomInformationElement.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAreaFacilitiesByBuildingNrReply clone() => GetAreaFacilitiesByBuildingNrReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAreaFacilitiesByBuildingNrReply copyWith(void Function(GetAreaFacilitiesByBuildingNrReply) updates) => super.copyWith((message) => updates(message as GetAreaFacilitiesByBuildingNrReply)) as GetAreaFacilitiesByBuildingNrReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAreaFacilitiesByBuildingNrReply create() => GetAreaFacilitiesByBuildingNrReply._();
  GetAreaFacilitiesByBuildingNrReply createEmptyInstance() => create();
  static $pb.PbList<GetAreaFacilitiesByBuildingNrReply> createRepeated() => $pb.PbList<GetAreaFacilitiesByBuildingNrReply>();
  @$core.pragma('dart2js:noInline')
  static GetAreaFacilitiesByBuildingNrReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAreaFacilitiesByBuildingNrReply>(create);
  static GetAreaFacilitiesByBuildingNrReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomInformationElement> get areaFacilitiesByBuildingNr => $_getList(0);
}

class GetAreaFacilitiesByBuildingNrRequest extends $pb.GeneratedMessage {
  factory GetAreaFacilitiesByBuildingNrRequest({
    $core.String? buildingNr,
  }) {
    final $result = create();
    if (buildingNr != null) {
      $result.buildingNr = buildingNr;
    }
    return $result;
  }
  GetAreaFacilitiesByBuildingNrRequest._() : super();
  factory GetAreaFacilitiesByBuildingNrRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAreaFacilitiesByBuildingNrRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAreaFacilitiesByBuildingNrRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'buildingNr')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAreaFacilitiesByBuildingNrRequest clone() => GetAreaFacilitiesByBuildingNrRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAreaFacilitiesByBuildingNrRequest copyWith(void Function(GetAreaFacilitiesByBuildingNrRequest) updates) => super.copyWith((message) => updates(message as GetAreaFacilitiesByBuildingNrRequest)) as GetAreaFacilitiesByBuildingNrRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAreaFacilitiesByBuildingNrRequest create() => GetAreaFacilitiesByBuildingNrRequest._();
  GetAreaFacilitiesByBuildingNrRequest createEmptyInstance() => create();
  static $pb.PbList<GetAreaFacilitiesByBuildingNrRequest> createRepeated() => $pb.PbList<GetAreaFacilitiesByBuildingNrRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAreaFacilitiesByBuildingNrRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAreaFacilitiesByBuildingNrRequest>(create);
  static GetAreaFacilitiesByBuildingNrRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get buildingNr => $_getSZ(0);
  @$pb.TagNumber(1)
  set buildingNr($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBuildingNr() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuildingNr() => clearField(1);
}

class GetListOfToiletsReply extends $pb.GeneratedMessage {
  factory GetListOfToiletsReply({
    $core.Iterable<RoomInformationElement>? listOfToilets,
  }) {
    final $result = create();
    if (listOfToilets != null) {
      $result.listOfToilets.addAll(listOfToilets);
    }
    return $result;
  }
  GetListOfToiletsReply._() : super();
  factory GetListOfToiletsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetListOfToiletsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetListOfToiletsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<RoomInformationElement>(1, _omitFieldNames ? '' : 'listOfToilets', $pb.PbFieldType.PM, protoName: 'listOfToilets', subBuilder: RoomInformationElement.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetListOfToiletsReply clone() => GetListOfToiletsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetListOfToiletsReply copyWith(void Function(GetListOfToiletsReply) updates) => super.copyWith((message) => updates(message as GetListOfToiletsReply)) as GetListOfToiletsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetListOfToiletsReply create() => GetListOfToiletsReply._();
  GetListOfToiletsReply createEmptyInstance() => create();
  static $pb.PbList<GetListOfToiletsReply> createRepeated() => $pb.PbList<GetListOfToiletsReply>();
  @$core.pragma('dart2js:noInline')
  static GetListOfToiletsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetListOfToiletsReply>(create);
  static GetListOfToiletsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomInformationElement> get listOfToilets => $_getList(0);
}

class RoomInformationElement extends $pb.GeneratedMessage {
  factory RoomInformationElement({
    $core.int? roomId,
    $core.String? roomCode,
    $core.String? buildingNr,
    $core.String? archId,
    $core.String? info,
    $core.String? address,
    $core.String? purpose,
    $core.String? campus,
    $core.String? name,
  }) {
    final $result = create();
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (roomCode != null) {
      $result.roomCode = roomCode;
    }
    if (buildingNr != null) {
      $result.buildingNr = buildingNr;
    }
    if (archId != null) {
      $result.archId = archId;
    }
    if (info != null) {
      $result.info = info;
    }
    if (address != null) {
      $result.address = address;
    }
    if (purpose != null) {
      $result.purpose = purpose;
    }
    if (campus != null) {
      $result.campus = campus;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  RoomInformationElement._() : super();
  factory RoomInformationElement.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomInformationElement.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomInformationElement', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'roomId', $pb.PbFieldType.O3, protoName: 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'roomCode')
    ..aOS(3, _omitFieldNames ? '' : 'buildingNr')
    ..aOS(4, _omitFieldNames ? '' : 'archId')
    ..aOS(5, _omitFieldNames ? '' : 'info')
    ..aOS(6, _omitFieldNames ? '' : 'address')
    ..aOS(7, _omitFieldNames ? '' : 'purpose')
    ..aOS(8, _omitFieldNames ? '' : 'campus')
    ..aOS(9, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomInformationElement clone() => RoomInformationElement()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomInformationElement copyWith(void Function(RoomInformationElement) updates) => super.copyWith((message) => updates(message as RoomInformationElement)) as RoomInformationElement;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomInformationElement create() => RoomInformationElement._();
  RoomInformationElement createEmptyInstance() => create();
  static $pb.PbList<RoomInformationElement> createRepeated() => $pb.PbList<RoomInformationElement>();
  @$core.pragma('dart2js:noInline')
  static RoomInformationElement getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomInformationElement>(create);
  static RoomInformationElement? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get roomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set roomId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get buildingNr => $_getSZ(2);
  @$pb.TagNumber(3)
  set buildingNr($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBuildingNr() => $_has(2);
  @$pb.TagNumber(3)
  void clearBuildingNr() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get archId => $_getSZ(3);
  @$pb.TagNumber(4)
  set archId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasArchId() => $_has(3);
  @$pb.TagNumber(4)
  void clearArchId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get info => $_getSZ(4);
  @$pb.TagNumber(5)
  set info($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearInfo() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get address => $_getSZ(5);
  @$pb.TagNumber(6)
  set address($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAddress() => $_has(5);
  @$pb.TagNumber(6)
  void clearAddress() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get purpose => $_getSZ(6);
  @$pb.TagNumber(7)
  set purpose($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPurpose() => $_has(6);
  @$pb.TagNumber(7)
  void clearPurpose() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get campus => $_getSZ(7);
  @$pb.TagNumber(8)
  set campus($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCampus() => $_has(7);
  @$pb.TagNumber(8)
  void clearCampus() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get name => $_getSZ(8);
  @$pb.TagNumber(9)
  set name($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasName() => $_has(8);
  @$pb.TagNumber(9)
  void clearName() => clearField(9);
}

class GetListOfElevatorsReply extends $pb.GeneratedMessage {
  factory GetListOfElevatorsReply({
    $core.Iterable<RoomInformationElement>? listOfElevators,
  }) {
    final $result = create();
    if (listOfElevators != null) {
      $result.listOfElevators.addAll(listOfElevators);
    }
    return $result;
  }
  GetListOfElevatorsReply._() : super();
  factory GetListOfElevatorsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetListOfElevatorsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetListOfElevatorsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<RoomInformationElement>(1, _omitFieldNames ? '' : 'listOfElevators', $pb.PbFieldType.PM, protoName: 'listOfElevators', subBuilder: RoomInformationElement.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetListOfElevatorsReply clone() => GetListOfElevatorsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetListOfElevatorsReply copyWith(void Function(GetListOfElevatorsReply) updates) => super.copyWith((message) => updates(message as GetListOfElevatorsReply)) as GetListOfElevatorsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetListOfElevatorsReply create() => GetListOfElevatorsReply._();
  GetListOfElevatorsReply createEmptyInstance() => create();
  static $pb.PbList<GetListOfElevatorsReply> createRepeated() => $pb.PbList<GetListOfElevatorsReply>();
  @$core.pragma('dart2js:noInline')
  static GetListOfElevatorsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetListOfElevatorsReply>(create);
  static GetListOfElevatorsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomInformationElement> get listOfElevators => $_getList(0);
}

class GetMoreInformationReply extends $pb.GeneratedMessage {
  factory GetMoreInformationReply({
    $core.Iterable<MoreInformationElement>? information,
  }) {
    final $result = create();
    if (information != null) {
      $result.information.addAll(information);
    }
    return $result;
  }
  GetMoreInformationReply._() : super();
  factory GetMoreInformationReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMoreInformationReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMoreInformationReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<MoreInformationElement>(1, _omitFieldNames ? '' : 'information', $pb.PbFieldType.PM, subBuilder: MoreInformationElement.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMoreInformationReply clone() => GetMoreInformationReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMoreInformationReply copyWith(void Function(GetMoreInformationReply) updates) => super.copyWith((message) => updates(message as GetMoreInformationReply)) as GetMoreInformationReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMoreInformationReply create() => GetMoreInformationReply._();
  GetMoreInformationReply createEmptyInstance() => create();
  static $pb.PbList<GetMoreInformationReply> createRepeated() => $pb.PbList<GetMoreInformationReply>();
  @$core.pragma('dart2js:noInline')
  static GetMoreInformationReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMoreInformationReply>(create);
  static GetMoreInformationReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MoreInformationElement> get information => $_getList(0);
}

class MoreInformationElement extends $pb.GeneratedMessage {
  factory MoreInformationElement({
    $core.String? title,
    $core.String? category,
    $core.String? url,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (category != null) {
      $result.category = category;
    }
    if (url != null) {
      $result.url = url;
    }
    return $result;
  }
  MoreInformationElement._() : super();
  factory MoreInformationElement.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MoreInformationElement.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MoreInformationElement', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'category')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MoreInformationElement clone() => MoreInformationElement()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MoreInformationElement copyWith(void Function(MoreInformationElement) updates) => super.copyWith((message) => updates(message as MoreInformationElement)) as MoreInformationElement;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MoreInformationElement create() => MoreInformationElement._();
  MoreInformationElement createEmptyInstance() => create();
  static $pb.PbList<MoreInformationElement> createRepeated() => $pb.PbList<MoreInformationElement>();
  @$core.pragma('dart2js:noInline')
  static MoreInformationElement getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MoreInformationElement>(create);
  static MoreInformationElement? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get category => $_getSZ(1);
  @$pb.TagNumber(2)
  set category($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategory() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);
}

class GetOpeningTimesRequest extends $pb.GeneratedMessage {
  factory GetOpeningTimesRequest({
    $core.String? language,
  }) {
    final $result = create();
    if (language != null) {
      $result.language = language;
    }
    return $result;
  }
  GetOpeningTimesRequest._() : super();
  factory GetOpeningTimesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetOpeningTimesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetOpeningTimesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'language')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetOpeningTimesRequest clone() => GetOpeningTimesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetOpeningTimesRequest copyWith(void Function(GetOpeningTimesRequest) updates) => super.copyWith((message) => updates(message as GetOpeningTimesRequest)) as GetOpeningTimesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetOpeningTimesRequest create() => GetOpeningTimesRequest._();
  GetOpeningTimesRequest createEmptyInstance() => create();
  static $pb.PbList<GetOpeningTimesRequest> createRepeated() => $pb.PbList<GetOpeningTimesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetOpeningTimesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetOpeningTimesRequest>(create);
  static GetOpeningTimesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get language => $_getSZ(0);
  @$pb.TagNumber(1)
  set language($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLanguage() => $_has(0);
  @$pb.TagNumber(1)
  void clearLanguage() => clearField(1);
}

class GetOpeningTimesReply extends $pb.GeneratedMessage {
  factory GetOpeningTimesReply({
    $core.Iterable<OpeningTimesMsgElement>? facilities,
  }) {
    final $result = create();
    if (facilities != null) {
      $result.facilities.addAll(facilities);
    }
    return $result;
  }
  GetOpeningTimesReply._() : super();
  factory GetOpeningTimesReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetOpeningTimesReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetOpeningTimesReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<OpeningTimesMsgElement>(1, _omitFieldNames ? '' : 'facilities', $pb.PbFieldType.PM, subBuilder: OpeningTimesMsgElement.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetOpeningTimesReply clone() => GetOpeningTimesReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetOpeningTimesReply copyWith(void Function(GetOpeningTimesReply) updates) => super.copyWith((message) => updates(message as GetOpeningTimesReply)) as GetOpeningTimesReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetOpeningTimesReply create() => GetOpeningTimesReply._();
  GetOpeningTimesReply createEmptyInstance() => create();
  static $pb.PbList<GetOpeningTimesReply> createRepeated() => $pb.PbList<GetOpeningTimesReply>();
  @$core.pragma('dart2js:noInline')
  static GetOpeningTimesReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetOpeningTimesReply>(create);
  static GetOpeningTimesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<OpeningTimesMsgElement> get facilities => $_getList(0);
}

class OpeningTimesMsgElement extends $pb.GeneratedMessage {
  factory OpeningTimesMsgElement({
    $core.int? id,
    $core.String? category,
    $core.String? name,
    $core.String? address,
    $core.String? room,
    $core.String? transportStation,
    $core.String? openingHours,
    $core.String? infos,
    $core.String? url,
    $core.String? language,
    $core.int? referenceId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (category != null) {
      $result.category = category;
    }
    if (name != null) {
      $result.name = name;
    }
    if (address != null) {
      $result.address = address;
    }
    if (room != null) {
      $result.room = room;
    }
    if (transportStation != null) {
      $result.transportStation = transportStation;
    }
    if (openingHours != null) {
      $result.openingHours = openingHours;
    }
    if (infos != null) {
      $result.infos = infos;
    }
    if (url != null) {
      $result.url = url;
    }
    if (language != null) {
      $result.language = language;
    }
    if (referenceId != null) {
      $result.referenceId = referenceId;
    }
    return $result;
  }
  OpeningTimesMsgElement._() : super();
  factory OpeningTimesMsgElement.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OpeningTimesMsgElement.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OpeningTimesMsgElement', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'category')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'address')
    ..aOS(5, _omitFieldNames ? '' : 'room')
    ..aOS(6, _omitFieldNames ? '' : 'transportStation')
    ..aOS(7, _omitFieldNames ? '' : 'openingHours')
    ..aOS(8, _omitFieldNames ? '' : 'infos')
    ..aOS(9, _omitFieldNames ? '' : 'url')
    ..aOS(10, _omitFieldNames ? '' : 'language')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'referenceId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OpeningTimesMsgElement clone() => OpeningTimesMsgElement()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OpeningTimesMsgElement copyWith(void Function(OpeningTimesMsgElement) updates) => super.copyWith((message) => updates(message as OpeningTimesMsgElement)) as OpeningTimesMsgElement;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OpeningTimesMsgElement create() => OpeningTimesMsgElement._();
  OpeningTimesMsgElement createEmptyInstance() => create();
  static $pb.PbList<OpeningTimesMsgElement> createRepeated() => $pb.PbList<OpeningTimesMsgElement>();
  @$core.pragma('dart2js:noInline')
  static OpeningTimesMsgElement getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OpeningTimesMsgElement>(create);
  static OpeningTimesMsgElement? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get category => $_getSZ(1);
  @$pb.TagNumber(2)
  set category($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategory() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get address => $_getSZ(3);
  @$pb.TagNumber(4)
  set address($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddress() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get room => $_getSZ(4);
  @$pb.TagNumber(5)
  set room($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRoom() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoom() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get transportStation => $_getSZ(5);
  @$pb.TagNumber(6)
  set transportStation($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTransportStation() => $_has(5);
  @$pb.TagNumber(6)
  void clearTransportStation() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get openingHours => $_getSZ(6);
  @$pb.TagNumber(7)
  set openingHours($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOpeningHours() => $_has(6);
  @$pb.TagNumber(7)
  void clearOpeningHours() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get infos => $_getSZ(7);
  @$pb.TagNumber(8)
  set infos($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasInfos() => $_has(7);
  @$pb.TagNumber(8)
  void clearInfos() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get url => $_getSZ(8);
  @$pb.TagNumber(9)
  set url($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearUrl() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get language => $_getSZ(9);
  @$pb.TagNumber(10)
  set language($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLanguage() => $_has(9);
  @$pb.TagNumber(10)
  void clearLanguage() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get referenceId => $_getIZ(10);
  @$pb.TagNumber(11)
  set referenceId($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasReferenceId() => $_has(10);
  @$pb.TagNumber(11)
  void clearReferenceId() => clearField(11);
}

class GetUpdateNoteRequest extends $pb.GeneratedMessage {
  factory GetUpdateNoteRequest({
    $core.int? version,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
    }
    return $result;
  }
  GetUpdateNoteRequest._() : super();
  factory GetUpdateNoteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUpdateNoteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUpdateNoteRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUpdateNoteRequest clone() => GetUpdateNoteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUpdateNoteRequest copyWith(void Function(GetUpdateNoteRequest) updates) => super.copyWith((message) => updates(message as GetUpdateNoteRequest)) as GetUpdateNoteRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUpdateNoteRequest create() => GetUpdateNoteRequest._();
  GetUpdateNoteRequest createEmptyInstance() => create();
  static $pb.PbList<GetUpdateNoteRequest> createRepeated() => $pb.PbList<GetUpdateNoteRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUpdateNoteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUpdateNoteRequest>(create);
  static GetUpdateNoteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);
}

class GetUpdateNoteReply extends $pb.GeneratedMessage {
  factory GetUpdateNoteReply({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  GetUpdateNoteReply._() : super();
  factory GetUpdateNoteReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUpdateNoteReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUpdateNoteReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUpdateNoteReply clone() => GetUpdateNoteReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUpdateNoteReply copyWith(void Function(GetUpdateNoteReply) updates) => super.copyWith((message) => updates(message as GetUpdateNoteReply)) as GetUpdateNoteReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUpdateNoteReply create() => GetUpdateNoteReply._();
  GetUpdateNoteReply createEmptyInstance() => create();
  static $pb.PbList<GetUpdateNoteReply> createRepeated() => $pb.PbList<GetUpdateNoteReply>();
  @$core.pragma('dart2js:noInline')
  static GetUpdateNoteReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUpdateNoteReply>(create);
  static GetUpdateNoteReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class GetStudyRoomListReply extends $pb.GeneratedMessage {
  factory GetStudyRoomListReply({
    $core.Iterable<StudyRoomMsgElement>? rooms,
  }) {
    final $result = create();
    if (rooms != null) {
      $result.rooms.addAll(rooms);
    }
    return $result;
  }
  GetStudyRoomListReply._() : super();
  factory GetStudyRoomListReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStudyRoomListReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStudyRoomListReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<StudyRoomMsgElement>(1, _omitFieldNames ? '' : 'rooms', $pb.PbFieldType.PM, subBuilder: StudyRoomMsgElement.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStudyRoomListReply clone() => GetStudyRoomListReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStudyRoomListReply copyWith(void Function(GetStudyRoomListReply) updates) => super.copyWith((message) => updates(message as GetStudyRoomListReply)) as GetStudyRoomListReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStudyRoomListReply create() => GetStudyRoomListReply._();
  GetStudyRoomListReply createEmptyInstance() => create();
  static $pb.PbList<GetStudyRoomListReply> createRepeated() => $pb.PbList<GetStudyRoomListReply>();
  @$core.pragma('dart2js:noInline')
  static GetStudyRoomListReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStudyRoomListReply>(create);
  static GetStudyRoomListReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<StudyRoomMsgElement> get rooms => $_getList(0);
}

class StudyRoomMsgElement extends $pb.GeneratedMessage {
  factory StudyRoomMsgElement({
    $core.int? id,
    $core.String? name,
    $core.String? details,
    $core.Iterable<StudyRoom>? rooms,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (details != null) {
      $result.details = details;
    }
    if (rooms != null) {
      $result.rooms.addAll(rooms);
    }
    return $result;
  }
  StudyRoomMsgElement._() : super();
  factory StudyRoomMsgElement.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StudyRoomMsgElement.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StudyRoomMsgElement', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'details')
    ..pc<StudyRoom>(4, _omitFieldNames ? '' : 'rooms', $pb.PbFieldType.PM, subBuilder: StudyRoom.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StudyRoomMsgElement clone() => StudyRoomMsgElement()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StudyRoomMsgElement copyWith(void Function(StudyRoomMsgElement) updates) => super.copyWith((message) => updates(message as StudyRoomMsgElement)) as StudyRoomMsgElement;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StudyRoomMsgElement create() => StudyRoomMsgElement._();
  StudyRoomMsgElement createEmptyInstance() => create();
  static $pb.PbList<StudyRoomMsgElement> createRepeated() => $pb.PbList<StudyRoomMsgElement>();
  @$core.pragma('dart2js:noInline')
  static StudyRoomMsgElement getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StudyRoomMsgElement>(create);
  static StudyRoomMsgElement? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get details => $_getSZ(2);
  @$pb.TagNumber(3)
  set details($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDetails() => $_has(2);
  @$pb.TagNumber(3)
  void clearDetails() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<StudyRoom> get rooms => $_getList(3);
}

class StudyRoom extends $pb.GeneratedMessage {
  factory StudyRoom({
    $core.int? groupId,
    $core.int? roomId,
    $core.String? roomCode,
    $core.String? roomName,
    $core.String? buildingName,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (roomId != null) {
      $result.roomId = roomId;
    }
    if (roomCode != null) {
      $result.roomCode = roomCode;
    }
    if (roomName != null) {
      $result.roomName = roomName;
    }
    if (buildingName != null) {
      $result.buildingName = buildingName;
    }
    return $result;
  }
  StudyRoom._() : super();
  factory StudyRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StudyRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StudyRoom', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'roomId', $pb.PbFieldType.O3, protoName: 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'roomCode')
    ..aOS(4, _omitFieldNames ? '' : 'roomName')
    ..aOS(5, _omitFieldNames ? '' : 'buildingName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StudyRoom clone() => StudyRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StudyRoom copyWith(void Function(StudyRoom) updates) => super.copyWith((message) => updates(message as StudyRoom)) as StudyRoom;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StudyRoom create() => StudyRoom._();
  StudyRoom createEmptyInstance() => create();
  static $pb.PbList<StudyRoom> createRepeated() => $pb.PbList<StudyRoom>();
  @$core.pragma('dart2js:noInline')
  static StudyRoom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StudyRoom>(create);
  static StudyRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get groupId => $_getIZ(0);
  @$pb.TagNumber(1)
  set groupId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get roomId => $_getIZ(1);
  @$pb.TagNumber(2)
  set roomId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomCode($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomCode() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomName => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoomName() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get buildingName => $_getSZ(4);
  @$pb.TagNumber(5)
  set buildingName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBuildingName() => $_has(4);
  @$pb.TagNumber(5)
  void clearBuildingName() => clearField(5);
}

class GetEventListRequest extends $pb.GeneratedMessage {
  factory GetEventListRequest({
    $core.int? eventId,
  }) {
    final $result = create();
    if (eventId != null) {
      $result.eventId = eventId;
    }
    return $result;
  }
  GetEventListRequest._() : super();
  factory GetEventListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEventListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetEventListRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'eventId', $pb.PbFieldType.O3, protoName: 'eventId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetEventListRequest clone() => GetEventListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetEventListRequest copyWith(void Function(GetEventListRequest) updates) => super.copyWith((message) => updates(message as GetEventListRequest)) as GetEventListRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEventListRequest create() => GetEventListRequest._();
  GetEventListRequest createEmptyInstance() => create();
  static $pb.PbList<GetEventListRequest> createRepeated() => $pb.PbList<GetEventListRequest>();
  @$core.pragma('dart2js:noInline')
  static GetEventListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEventListRequest>(create);
  static GetEventListRequest? _defaultInstance;

  /// optional parameter, will return all events if no id is specified
  @$pb.TagNumber(1)
  $core.int get eventId => $_getIZ(0);
  @$pb.TagNumber(1)
  set eventId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventId() => clearField(1);
}

class GetEventListReply extends $pb.GeneratedMessage {
  factory GetEventListReply({
    $core.Iterable<EventListMsgElement>? events,
  }) {
    final $result = create();
    if (events != null) {
      $result.events.addAll(events);
    }
    return $result;
  }
  GetEventListReply._() : super();
  factory GetEventListReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEventListReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetEventListReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<EventListMsgElement>(1, _omitFieldNames ? '' : 'events', $pb.PbFieldType.PM, subBuilder: EventListMsgElement.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetEventListReply clone() => GetEventListReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetEventListReply copyWith(void Function(GetEventListReply) updates) => super.copyWith((message) => updates(message as GetEventListReply)) as GetEventListReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEventListReply create() => GetEventListReply._();
  GetEventListReply createEmptyInstance() => create();
  static $pb.PbList<GetEventListReply> createRepeated() => $pb.PbList<GetEventListReply>();
  @$core.pragma('dart2js:noInline')
  static GetEventListReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEventListReply>(create);
  static GetEventListReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<EventListMsgElement> get events => $_getList(0);
}

class EventListMsgElement extends $pb.GeneratedMessage {
  factory EventListMsgElement({
    $core.String? name,
    $core.String? path,
    $core.int? event,
    $core.int? news,
    $core.int? kino,
    $core.int? file,
    $core.String? title,
    $core.String? description,
    $core.String? locality,
    $core.String? link,
    $2.Timestamp? start,
    $2.Timestamp? end,
    $core.int? ticketGroup,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (path != null) {
      $result.path = path;
    }
    if (event != null) {
      $result.event = event;
    }
    if (news != null) {
      $result.news = news;
    }
    if (kino != null) {
      $result.kino = kino;
    }
    if (file != null) {
      $result.file = file;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (locality != null) {
      $result.locality = locality;
    }
    if (link != null) {
      $result.link = link;
    }
    if (start != null) {
      $result.start = start;
    }
    if (end != null) {
      $result.end = end;
    }
    if (ticketGroup != null) {
      $result.ticketGroup = ticketGroup;
    }
    return $result;
  }
  EventListMsgElement._() : super();
  factory EventListMsgElement.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventListMsgElement.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EventListMsgElement', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'path')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'event', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'news', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'kino', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'file', $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : 'title')
    ..aOS(8, _omitFieldNames ? '' : 'description')
    ..aOS(9, _omitFieldNames ? '' : 'locality')
    ..aOS(10, _omitFieldNames ? '' : 'link')
    ..aOM<$2.Timestamp>(11, _omitFieldNames ? '' : 'start', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(12, _omitFieldNames ? '' : 'end', subBuilder: $2.Timestamp.create)
    ..a<$core.int>(13, _omitFieldNames ? '' : 'ticketGroup', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventListMsgElement clone() => EventListMsgElement()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventListMsgElement copyWith(void Function(EventListMsgElement) updates) => super.copyWith((message) => updates(message as EventListMsgElement)) as EventListMsgElement;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EventListMsgElement create() => EventListMsgElement._();
  EventListMsgElement createEmptyInstance() => create();
  static $pb.PbList<EventListMsgElement> createRepeated() => $pb.PbList<EventListMsgElement>();
  @$core.pragma('dart2js:noInline')
  static EventListMsgElement getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventListMsgElement>(create);
  static EventListMsgElement? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get event => $_getIZ(2);
  @$pb.TagNumber(3)
  set event($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEvent() => $_has(2);
  @$pb.TagNumber(3)
  void clearEvent() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get news => $_getIZ(3);
  @$pb.TagNumber(4)
  set news($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNews() => $_has(3);
  @$pb.TagNumber(4)
  void clearNews() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get kino => $_getIZ(4);
  @$pb.TagNumber(5)
  set kino($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasKino() => $_has(4);
  @$pb.TagNumber(5)
  void clearKino() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get file => $_getIZ(5);
  @$pb.TagNumber(6)
  set file($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFile() => $_has(5);
  @$pb.TagNumber(6)
  void clearFile() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get title => $_getSZ(6);
  @$pb.TagNumber(7)
  set title($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTitle() => $_has(6);
  @$pb.TagNumber(7)
  void clearTitle() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get description => $_getSZ(7);
  @$pb.TagNumber(8)
  set description($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDescription() => $_has(7);
  @$pb.TagNumber(8)
  void clearDescription() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get locality => $_getSZ(8);
  @$pb.TagNumber(9)
  set locality($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLocality() => $_has(8);
  @$pb.TagNumber(9)
  void clearLocality() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get link => $_getSZ(9);
  @$pb.TagNumber(10)
  set link($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLink() => $_has(9);
  @$pb.TagNumber(10)
  void clearLink() => clearField(10);

  @$pb.TagNumber(11)
  $2.Timestamp get start => $_getN(10);
  @$pb.TagNumber(11)
  set start($2.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasStart() => $_has(10);
  @$pb.TagNumber(11)
  void clearStart() => clearField(11);
  @$pb.TagNumber(11)
  $2.Timestamp ensureStart() => $_ensure(10);

  @$pb.TagNumber(12)
  $2.Timestamp get end => $_getN(11);
  @$pb.TagNumber(12)
  set end($2.Timestamp v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasEnd() => $_has(11);
  @$pb.TagNumber(12)
  void clearEnd() => clearField(12);
  @$pb.TagNumber(12)
  $2.Timestamp ensureEnd() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.int get ticketGroup => $_getIZ(12);
  @$pb.TagNumber(13)
  set ticketGroup($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasTicketGroup() => $_has(12);
  @$pb.TagNumber(13)
  void clearTicketGroup() => clearField(13);
}

class GetKinoRequest extends $pb.GeneratedMessage {
  factory GetKinoRequest({
    $core.int? lastId,
  }) {
    final $result = create();
    if (lastId != null) {
      $result.lastId = lastId;
    }
    return $result;
  }
  GetKinoRequest._() : super();
  factory GetKinoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetKinoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetKinoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'lastId', $pb.PbFieldType.O3, protoName: 'lastId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetKinoRequest clone() => GetKinoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetKinoRequest copyWith(void Function(GetKinoRequest) updates) => super.copyWith((message) => updates(message as GetKinoRequest)) as GetKinoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetKinoRequest create() => GetKinoRequest._();
  GetKinoRequest createEmptyInstance() => create();
  static $pb.PbList<GetKinoRequest> createRepeated() => $pb.PbList<GetKinoRequest>();
  @$core.pragma('dart2js:noInline')
  static GetKinoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetKinoRequest>(create);
  static GetKinoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get lastId => $_getIZ(0);
  @$pb.TagNumber(1)
  set lastId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastId() => clearField(1);
}

class GetKinoReply extends $pb.GeneratedMessage {
  factory GetKinoReply({
    $core.Iterable<KinoMsgElement>? kinos,
  }) {
    final $result = create();
    if (kinos != null) {
      $result.kinos.addAll(kinos);
    }
    return $result;
  }
  GetKinoReply._() : super();
  factory GetKinoReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetKinoReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetKinoReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<KinoMsgElement>(1, _omitFieldNames ? '' : 'kinos', $pb.PbFieldType.PM, subBuilder: KinoMsgElement.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetKinoReply clone() => GetKinoReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetKinoReply copyWith(void Function(GetKinoReply) updates) => super.copyWith((message) => updates(message as GetKinoReply)) as GetKinoReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetKinoReply create() => GetKinoReply._();
  GetKinoReply createEmptyInstance() => create();
  static $pb.PbList<GetKinoReply> createRepeated() => $pb.PbList<GetKinoReply>();
  @$core.pragma('dart2js:noInline')
  static GetKinoReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetKinoReply>(create);
  static GetKinoReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<KinoMsgElement> get kinos => $_getList(0);
}

class KinoMsgElement extends $pb.GeneratedMessage {
  factory KinoMsgElement({
    $core.String? name,
    $core.String? path,
    $core.int? kino,
    $2.Timestamp? date,
    $2.Timestamp? created,
    $core.String? title,
    $core.String? year,
    $core.String? runtime,
    $core.String? genre,
    $core.String? director,
    $core.String? actors,
    $core.String? rating,
    $core.String? description,
    $core.int? cover,
    $core.String? trailer,
    $core.String? link,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (path != null) {
      $result.path = path;
    }
    if (kino != null) {
      $result.kino = kino;
    }
    if (date != null) {
      $result.date = date;
    }
    if (created != null) {
      $result.created = created;
    }
    if (title != null) {
      $result.title = title;
    }
    if (year != null) {
      $result.year = year;
    }
    if (runtime != null) {
      $result.runtime = runtime;
    }
    if (genre != null) {
      $result.genre = genre;
    }
    if (director != null) {
      $result.director = director;
    }
    if (actors != null) {
      $result.actors = actors;
    }
    if (rating != null) {
      $result.rating = rating;
    }
    if (description != null) {
      $result.description = description;
    }
    if (cover != null) {
      $result.cover = cover;
    }
    if (trailer != null) {
      $result.trailer = trailer;
    }
    if (link != null) {
      $result.link = link;
    }
    return $result;
  }
  KinoMsgElement._() : super();
  factory KinoMsgElement.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KinoMsgElement.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'KinoMsgElement', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'path')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'kino', $pb.PbFieldType.O3)
    ..aOM<$2.Timestamp>(4, _omitFieldNames ? '' : 'date', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(5, _omitFieldNames ? '' : 'created', subBuilder: $2.Timestamp.create)
    ..aOS(6, _omitFieldNames ? '' : 'title')
    ..aOS(7, _omitFieldNames ? '' : 'year')
    ..aOS(8, _omitFieldNames ? '' : 'runtime')
    ..aOS(9, _omitFieldNames ? '' : 'genre')
    ..aOS(10, _omitFieldNames ? '' : 'director')
    ..aOS(11, _omitFieldNames ? '' : 'actors')
    ..aOS(12, _omitFieldNames ? '' : 'rating')
    ..aOS(13, _omitFieldNames ? '' : 'description')
    ..a<$core.int>(14, _omitFieldNames ? '' : 'cover', $pb.PbFieldType.O3)
    ..aOS(15, _omitFieldNames ? '' : 'trailer')
    ..aOS(16, _omitFieldNames ? '' : 'link')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KinoMsgElement clone() => KinoMsgElement()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KinoMsgElement copyWith(void Function(KinoMsgElement) updates) => super.copyWith((message) => updates(message as KinoMsgElement)) as KinoMsgElement;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KinoMsgElement create() => KinoMsgElement._();
  KinoMsgElement createEmptyInstance() => create();
  static $pb.PbList<KinoMsgElement> createRepeated() => $pb.PbList<KinoMsgElement>();
  @$core.pragma('dart2js:noInline')
  static KinoMsgElement getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KinoMsgElement>(create);
  static KinoMsgElement? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get kino => $_getIZ(2);
  @$pb.TagNumber(3)
  set kino($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasKino() => $_has(2);
  @$pb.TagNumber(3)
  void clearKino() => clearField(3);

  @$pb.TagNumber(4)
  $2.Timestamp get date => $_getN(3);
  @$pb.TagNumber(4)
  set date($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearDate() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureDate() => $_ensure(3);

  @$pb.TagNumber(5)
  $2.Timestamp get created => $_getN(4);
  @$pb.TagNumber(5)
  set created($2.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreated() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreated() => clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureCreated() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get title => $_getSZ(5);
  @$pb.TagNumber(6)
  set title($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitle() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get year => $_getSZ(6);
  @$pb.TagNumber(7)
  set year($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasYear() => $_has(6);
  @$pb.TagNumber(7)
  void clearYear() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get runtime => $_getSZ(7);
  @$pb.TagNumber(8)
  set runtime($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRuntime() => $_has(7);
  @$pb.TagNumber(8)
  void clearRuntime() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get genre => $_getSZ(8);
  @$pb.TagNumber(9)
  set genre($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasGenre() => $_has(8);
  @$pb.TagNumber(9)
  void clearGenre() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get director => $_getSZ(9);
  @$pb.TagNumber(10)
  set director($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDirector() => $_has(9);
  @$pb.TagNumber(10)
  void clearDirector() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get actors => $_getSZ(10);
  @$pb.TagNumber(11)
  set actors($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasActors() => $_has(10);
  @$pb.TagNumber(11)
  void clearActors() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get rating => $_getSZ(11);
  @$pb.TagNumber(12)
  set rating($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasRating() => $_has(11);
  @$pb.TagNumber(12)
  void clearRating() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get description => $_getSZ(12);
  @$pb.TagNumber(13)
  set description($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasDescription() => $_has(12);
  @$pb.TagNumber(13)
  void clearDescription() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get cover => $_getIZ(13);
  @$pb.TagNumber(14)
  set cover($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasCover() => $_has(13);
  @$pb.TagNumber(14)
  void clearCover() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get trailer => $_getSZ(14);
  @$pb.TagNumber(15)
  set trailer($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasTrailer() => $_has(14);
  @$pb.TagNumber(15)
  void clearTrailer() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get link => $_getSZ(15);
  @$pb.TagNumber(16)
  set link($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasLink() => $_has(15);
  @$pb.TagNumber(16)
  void clearLink() => clearField(16);
}

class SendFeedbackRequest extends $pb.GeneratedMessage {
  factory SendFeedbackRequest({
    $core.String? topic,
    $core.String? email,
    $core.String? emailId,
    $core.String? message,
    $core.int? imageCount,
    $core.double? latitude,
    $core.double? longitude,
    $core.String? osVersion,
    $core.String? appVersion,
  }) {
    final $result = create();
    if (topic != null) {
      $result.topic = topic;
    }
    if (email != null) {
      $result.email = email;
    }
    if (emailId != null) {
      $result.emailId = emailId;
    }
    if (message != null) {
      $result.message = message;
    }
    if (imageCount != null) {
      $result.imageCount = imageCount;
    }
    if (latitude != null) {
      $result.latitude = latitude;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    if (osVersion != null) {
      $result.osVersion = osVersion;
    }
    if (appVersion != null) {
      $result.appVersion = appVersion;
    }
    return $result;
  }
  SendFeedbackRequest._() : super();
  factory SendFeedbackRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendFeedbackRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendFeedbackRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'topic')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'emailId', protoName: 'emailId')
    ..aOS(4, _omitFieldNames ? '' : 'message')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'imageCount', $pb.PbFieldType.O3)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..aOS(8, _omitFieldNames ? '' : 'osVersion', protoName: 'osVersion')
    ..aOS(9, _omitFieldNames ? '' : 'appVersion', protoName: 'appVersion')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendFeedbackRequest clone() => SendFeedbackRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendFeedbackRequest copyWith(void Function(SendFeedbackRequest) updates) => super.copyWith((message) => updates(message as SendFeedbackRequest)) as SendFeedbackRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendFeedbackRequest create() => SendFeedbackRequest._();
  SendFeedbackRequest createEmptyInstance() => create();
  static $pb.PbList<SendFeedbackRequest> createRepeated() => $pb.PbList<SendFeedbackRequest>();
  @$core.pragma('dart2js:noInline')
  static SendFeedbackRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendFeedbackRequest>(create);
  static SendFeedbackRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get topic => $_getSZ(0);
  @$pb.TagNumber(1)
  set topic($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTopic() => $_has(0);
  @$pb.TagNumber(1)
  void clearTopic() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get emailId => $_getSZ(2);
  @$pb.TagNumber(3)
  set emailId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmailId() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmailId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get imageCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set imageCount($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasImageCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearImageCount() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get latitude => $_getN(5);
  @$pb.TagNumber(6)
  set latitude($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLatitude() => $_has(5);
  @$pb.TagNumber(6)
  void clearLatitude() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get longitude => $_getN(6);
  @$pb.TagNumber(7)
  set longitude($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLongitude() => $_has(6);
  @$pb.TagNumber(7)
  void clearLongitude() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get osVersion => $_getSZ(7);
  @$pb.TagNumber(8)
  set osVersion($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOsVersion() => $_has(7);
  @$pb.TagNumber(8)
  void clearOsVersion() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get appVersion => $_getSZ(8);
  @$pb.TagNumber(9)
  set appVersion($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAppVersion() => $_has(8);
  @$pb.TagNumber(9)
  void clearAppVersion() => clearField(9);
}

class SendFeedbackImageReply extends $pb.GeneratedMessage {
  factory SendFeedbackImageReply({
    $core.String? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  SendFeedbackImageReply._() : super();
  factory SendFeedbackImageReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendFeedbackImageReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendFeedbackImageReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendFeedbackImageReply clone() => SendFeedbackImageReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendFeedbackImageReply copyWith(void Function(SendFeedbackImageReply) updates) => super.copyWith((message) => updates(message as SendFeedbackImageReply)) as SendFeedbackImageReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendFeedbackImageReply create() => SendFeedbackImageReply._();
  SendFeedbackImageReply createEmptyInstance() => create();
  static $pb.PbList<SendFeedbackImageReply> createRepeated() => $pb.PbList<SendFeedbackImageReply>();
  @$core.pragma('dart2js:noInline')
  static SendFeedbackImageReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendFeedbackImageReply>(create);
  static SendFeedbackImageReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class SendFeedbackImageRequest extends $pb.GeneratedMessage {
  factory SendFeedbackImageRequest({
    $core.int? id,
    $core.int? imageNr,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (imageNr != null) {
      $result.imageNr = imageNr;
    }
    return $result;
  }
  SendFeedbackImageRequest._() : super();
  factory SendFeedbackImageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendFeedbackImageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendFeedbackImageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'imageNr', $pb.PbFieldType.O3, protoName: 'imageNr')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendFeedbackImageRequest clone() => SendFeedbackImageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendFeedbackImageRequest copyWith(void Function(SendFeedbackImageRequest) updates) => super.copyWith((message) => updates(message as SendFeedbackImageRequest)) as SendFeedbackImageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendFeedbackImageRequest create() => SendFeedbackImageRequest._();
  SendFeedbackImageRequest createEmptyInstance() => create();
  static $pb.PbList<SendFeedbackImageRequest> createRepeated() => $pb.PbList<SendFeedbackImageRequest>();
  @$core.pragma('dart2js:noInline')
  static SendFeedbackImageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendFeedbackImageRequest>(create);
  static SendFeedbackImageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get imageNr => $_getIZ(1);
  @$pb.TagNumber(2)
  set imageNr($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasImageNr() => $_has(1);
  @$pb.TagNumber(2)
  void clearImageNr() => clearField(2);
}

class GetMembersRequest extends $pb.GeneratedMessage {
  factory GetMembersRequest({
    $core.String? lrzId,
  }) {
    final $result = create();
    if (lrzId != null) {
      $result.lrzId = lrzId;
    }
    return $result;
  }
  GetMembersRequest._() : super();
  factory GetMembersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMembersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMembersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'lrzId', protoName: 'lrzId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMembersRequest clone() => GetMembersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMembersRequest copyWith(void Function(GetMembersRequest) updates) => super.copyWith((message) => updates(message as GetMembersRequest)) as GetMembersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMembersRequest create() => GetMembersRequest._();
  GetMembersRequest createEmptyInstance() => create();
  static $pb.PbList<GetMembersRequest> createRepeated() => $pb.PbList<GetMembersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMembersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMembersRequest>(create);
  static GetMembersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lrzId => $_getSZ(0);
  @$pb.TagNumber(1)
  set lrzId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLrzId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLrzId() => clearField(1);
}

class GetMembersReply extends $pb.GeneratedMessage {
  factory GetMembersReply({
    $core.String? lrzId,
    $core.String? name,
    $core.int? memberId,
  }) {
    final $result = create();
    if (lrzId != null) {
      $result.lrzId = lrzId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (memberId != null) {
      $result.memberId = memberId;
    }
    return $result;
  }
  GetMembersReply._() : super();
  factory GetMembersReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMembersReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMembersReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'lrzId', protoName: 'lrzId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'memberId', $pb.PbFieldType.O3, protoName: 'memberId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMembersReply clone() => GetMembersReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMembersReply copyWith(void Function(GetMembersReply) updates) => super.copyWith((message) => updates(message as GetMembersReply)) as GetMembersReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMembersReply create() => GetMembersReply._();
  GetMembersReply createEmptyInstance() => create();
  static $pb.PbList<GetMembersReply> createRepeated() => $pb.PbList<GetMembersReply>();
  @$core.pragma('dart2js:noInline')
  static GetMembersReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMembersReply>(create);
  static GetMembersReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lrzId => $_getSZ(0);
  @$pb.TagNumber(1)
  set lrzId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLrzId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLrzId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get memberId => $_getIZ(2);
  @$pb.TagNumber(3)
  set memberId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMemberId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMemberId() => clearField(3);
}

class GetUploadStatusRequest extends $pb.GeneratedMessage {
  factory GetUploadStatusRequest({
    $core.String? lrzId,
  }) {
    final $result = create();
    if (lrzId != null) {
      $result.lrzId = lrzId;
    }
    return $result;
  }
  GetUploadStatusRequest._() : super();
  factory GetUploadStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUploadStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUploadStatusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'lrzId', protoName: 'lrzId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUploadStatusRequest clone() => GetUploadStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUploadStatusRequest copyWith(void Function(GetUploadStatusRequest) updates) => super.copyWith((message) => updates(message as GetUploadStatusRequest)) as GetUploadStatusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUploadStatusRequest create() => GetUploadStatusRequest._();
  GetUploadStatusRequest createEmptyInstance() => create();
  static $pb.PbList<GetUploadStatusRequest> createRepeated() => $pb.PbList<GetUploadStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUploadStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUploadStatusRequest>(create);
  static GetUploadStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lrzId => $_getSZ(0);
  @$pb.TagNumber(1)
  set lrzId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLrzId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLrzId() => clearField(1);
}

class GetUploadStatusReply extends $pb.GeneratedMessage {
  factory GetUploadStatusReply({
    $core.String? fcmToken,
    $core.String? publicKey,
    $core.bool? studentId,
    $core.bool? employeeId,
    $core.bool? externalId,
  }) {
    final $result = create();
    if (fcmToken != null) {
      $result.fcmToken = fcmToken;
    }
    if (publicKey != null) {
      $result.publicKey = publicKey;
    }
    if (studentId != null) {
      $result.studentId = studentId;
    }
    if (employeeId != null) {
      $result.employeeId = employeeId;
    }
    if (externalId != null) {
      $result.externalId = externalId;
    }
    return $result;
  }
  GetUploadStatusReply._() : super();
  factory GetUploadStatusReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUploadStatusReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUploadStatusReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fcmToken')
    ..aOS(2, _omitFieldNames ? '' : 'publicKey')
    ..aOB(3, _omitFieldNames ? '' : 'studentId')
    ..aOB(4, _omitFieldNames ? '' : 'employeeId')
    ..aOB(5, _omitFieldNames ? '' : 'externalId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUploadStatusReply clone() => GetUploadStatusReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUploadStatusReply copyWith(void Function(GetUploadStatusReply) updates) => super.copyWith((message) => updates(message as GetUploadStatusReply)) as GetUploadStatusReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUploadStatusReply create() => GetUploadStatusReply._();
  GetUploadStatusReply createEmptyInstance() => create();
  static $pb.PbList<GetUploadStatusReply> createRepeated() => $pb.PbList<GetUploadStatusReply>();
  @$core.pragma('dart2js:noInline')
  static GetUploadStatusReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUploadStatusReply>(create);
  static GetUploadStatusReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fcmToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set fcmToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFcmToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearFcmToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get publicKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set publicKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get studentId => $_getBF(2);
  @$pb.TagNumber(3)
  set studentId($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStudentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStudentId() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get employeeId => $_getBF(3);
  @$pb.TagNumber(4)
  set employeeId($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmployeeId() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmployeeId() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get externalId => $_getBF(4);
  @$pb.TagNumber(5)
  set externalId($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasExternalId() => $_has(4);
  @$pb.TagNumber(5)
  void clearExternalId() => clearField(5);
}

class GetNotificationsReply extends $pb.GeneratedMessage {
  factory GetNotificationsReply({
    $core.int? notificationId,
    $core.int? type,
    $core.String? title,
    $core.String? description,
    $core.String? signature,
  }) {
    final $result = create();
    if (notificationId != null) {
      $result.notificationId = notificationId;
    }
    if (type != null) {
      $result.type = type;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  GetNotificationsReply._() : super();
  factory GetNotificationsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotificationsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNotificationsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'notificationId', $pb.PbFieldType.O3, protoName: 'notificationId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..aOS(5, _omitFieldNames ? '' : 'signature')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotificationsReply clone() => GetNotificationsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotificationsReply copyWith(void Function(GetNotificationsReply) updates) => super.copyWith((message) => updates(message as GetNotificationsReply)) as GetNotificationsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotificationsReply create() => GetNotificationsReply._();
  GetNotificationsReply createEmptyInstance() => create();
  static $pb.PbList<GetNotificationsReply> createRepeated() => $pb.PbList<GetNotificationsReply>();
  @$core.pragma('dart2js:noInline')
  static GetNotificationsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotificationsReply>(create);
  static GetNotificationsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get notificationId => $_getIZ(0);
  @$pb.TagNumber(1)
  set notificationId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNotificationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotificationId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get type => $_getIZ(1);
  @$pb.TagNumber(2)
  set type($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get signature => $_getSZ(4);
  @$pb.TagNumber(5)
  set signature($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSignature() => $_has(4);
  @$pb.TagNumber(5)
  void clearSignature() => clearField(5);
}

class NotificationsRequest extends $pb.GeneratedMessage {
  factory NotificationsRequest({
    $core.int? notificationId,
  }) {
    final $result = create();
    if (notificationId != null) {
      $result.notificationId = notificationId;
    }
    return $result;
  }
  NotificationsRequest._() : super();
  factory NotificationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotificationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NotificationsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'notificationId', $pb.PbFieldType.O3, protoName: 'notificationId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotificationsRequest clone() => NotificationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotificationsRequest copyWith(void Function(NotificationsRequest) updates) => super.copyWith((message) => updates(message as NotificationsRequest)) as NotificationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotificationsRequest create() => NotificationsRequest._();
  NotificationsRequest createEmptyInstance() => create();
  static $pb.PbList<NotificationsRequest> createRepeated() => $pb.PbList<NotificationsRequest>();
  @$core.pragma('dart2js:noInline')
  static NotificationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotificationsRequest>(create);
  static NotificationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get notificationId => $_getIZ(0);
  @$pb.TagNumber(1)
  set notificationId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNotificationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotificationId() => clearField(1);
}

class GetNotificationsConfirmReply extends $pb.GeneratedMessage {
  factory GetNotificationsConfirmReply({
    $core.String? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  GetNotificationsConfirmReply._() : super();
  factory GetNotificationsConfirmReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotificationsConfirmReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNotificationsConfirmReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotificationsConfirmReply clone() => GetNotificationsConfirmReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotificationsConfirmReply copyWith(void Function(GetNotificationsConfirmReply) updates) => super.copyWith((message) => updates(message as GetNotificationsConfirmReply)) as GetNotificationsConfirmReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotificationsConfirmReply create() => GetNotificationsConfirmReply._();
  GetNotificationsConfirmReply createEmptyInstance() => create();
  static $pb.PbList<GetNotificationsConfirmReply> createRepeated() => $pb.PbList<GetNotificationsConfirmReply>();
  @$core.pragma('dart2js:noInline')
  static GetNotificationsConfirmReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotificationsConfirmReply>(create);
  static GetNotificationsConfirmReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class GetCanteenHeadCountRequest extends $pb.GeneratedMessage {
  factory GetCanteenHeadCountRequest({
    $core.String? canteenId,
  }) {
    final $result = create();
    if (canteenId != null) {
      $result.canteenId = canteenId;
    }
    return $result;
  }
  GetCanteenHeadCountRequest._() : super();
  factory GetCanteenHeadCountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCanteenHeadCountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCanteenHeadCountRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'canteenId', protoName: 'canteenId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCanteenHeadCountRequest clone() => GetCanteenHeadCountRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCanteenHeadCountRequest copyWith(void Function(GetCanteenHeadCountRequest) updates) => super.copyWith((message) => updates(message as GetCanteenHeadCountRequest)) as GetCanteenHeadCountRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCanteenHeadCountRequest create() => GetCanteenHeadCountRequest._();
  GetCanteenHeadCountRequest createEmptyInstance() => create();
  static $pb.PbList<GetCanteenHeadCountRequest> createRepeated() => $pb.PbList<GetCanteenHeadCountRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCanteenHeadCountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCanteenHeadCountRequest>(create);
  static GetCanteenHeadCountRequest? _defaultInstance;

  /// The requested canteen ID
  @$pb.TagNumber(1)
  $core.String get canteenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set canteenId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCanteenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanteenId() => clearField(1);
}

class GetCanteenHeadCountReply extends $pb.GeneratedMessage {
  factory GetCanteenHeadCountReply({
    $core.int? count,
    $core.int? maxCount,
    $core.double? percent,
    $2.Timestamp? timestamp,
  }) {
    final $result = create();
    if (count != null) {
      $result.count = count;
    }
    if (maxCount != null) {
      $result.maxCount = maxCount;
    }
    if (percent != null) {
      $result.percent = percent;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    return $result;
  }
  GetCanteenHeadCountReply._() : super();
  factory GetCanteenHeadCountReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCanteenHeadCountReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCanteenHeadCountReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'count', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'maxCount', $pb.PbFieldType.OU3, protoName: 'maxCount')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'percent', $pb.PbFieldType.OF)
    ..aOM<$2.Timestamp>(4, _omitFieldNames ? '' : 'timestamp', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCanteenHeadCountReply clone() => GetCanteenHeadCountReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCanteenHeadCountReply copyWith(void Function(GetCanteenHeadCountReply) updates) => super.copyWith((message) => updates(message as GetCanteenHeadCountReply)) as GetCanteenHeadCountReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCanteenHeadCountReply create() => GetCanteenHeadCountReply._();
  GetCanteenHeadCountReply createEmptyInstance() => create();
  static $pb.PbList<GetCanteenHeadCountReply> createRepeated() => $pb.PbList<GetCanteenHeadCountReply>();
  @$core.pragma('dart2js:noInline')
  static GetCanteenHeadCountReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCanteenHeadCountReply>(create);
  static GetCanteenHeadCountReply? _defaultInstance;

  /// The absolut count of humans in the canteen. Only valid in case percent != -1.
  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => clearField(1);

  /// The maximum nunmber of humans in the canteen for the percent to be 100.00. Only valid in case percent != -1.
  @$pb.TagNumber(2)
  $core.int get maxCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set maxCount($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaxCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxCount() => clearField(2);

  /// Current capacity utilization of the canteen clamped to 0 and 100 or -1 in case no data is available.
  @$pb.TagNumber(3)
  $core.double get percent => $_getN(2);
  @$pb.TagNumber(3)
  set percent($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPercent() => $_has(2);
  @$pb.TagNumber(3)
  void clearPercent() => clearField(3);

  /// A time stamp indicating how up to date the response is. Only valid in case percent != -1.
  @$pb.TagNumber(4)
  $2.Timestamp get timestamp => $_getN(3);
  @$pb.TagNumber(4)
  set timestamp($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureTimestamp() => $_ensure(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
