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

import '../google/protobuf/timestamp.pb.dart' as $1;
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
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..aOS(2, _omitFieldNames ? '' : 'publicKey')
    ..e<DeviceType>(3, _omitFieldNames ? '' : 'deviceType', $pb.PbFieldType.OE, defaultOrMaker: DeviceType.IOS, valueOf: DeviceType.valueOf, enumValues: DeviceType.values)
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
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
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
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..e<DeviceType>(2, _omitFieldNames ? '' : 'deviceType', $pb.PbFieldType.OE, defaultOrMaker: DeviceType.IOS, valueOf: DeviceType.valueOf, enumValues: DeviceType.values)
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
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
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
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
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
    $fixnum.Int64? roomId,
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
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
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
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
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

class News extends $pb.GeneratedMessage {
  factory News({
    $fixnum.Int64? id,
    $core.String? title,
    $core.String? text,
    $core.String? link,
    $core.String? imageUrl,
    $core.String? source,
    $1.Timestamp? created,
    $1.Timestamp? date,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (title != null) {
      $result.title = title;
    }
    if (text != null) {
      $result.text = text;
    }
    if (link != null) {
      $result.link = link;
    }
    if (imageUrl != null) {
      $result.imageUrl = imageUrl;
    }
    if (source != null) {
      $result.source = source;
    }
    if (created != null) {
      $result.created = created;
    }
    if (date != null) {
      $result.date = date;
    }
    return $result;
  }
  News._() : super();
  factory News.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory News.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'News', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'text')
    ..aOS(4, _omitFieldNames ? '' : 'link')
    ..aOS(5, _omitFieldNames ? '' : 'imageUrl')
    ..aOS(6, _omitFieldNames ? '' : 'source')
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'created', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(8, _omitFieldNames ? '' : 'date', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  News clone() => News()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  News copyWith(void Function(News) updates) => super.copyWith((message) => updates(message as News)) as News;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static News create() => News._();
  News createEmptyInstance() => create();
  static $pb.PbList<News> createRepeated() => $pb.PbList<News>();
  @$core.pragma('dart2js:noInline')
  static News getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<News>(create);
  static News? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(2);
  @$pb.TagNumber(3)
  set text($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);
  @$pb.TagNumber(3)
  void clearText() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get link => $_getSZ(3);
  @$pb.TagNumber(4)
  set link($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLink() => $_has(3);
  @$pb.TagNumber(4)
  void clearLink() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get imageUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set imageUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasImageUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearImageUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get source => $_getSZ(5);
  @$pb.TagNumber(6)
  set source($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSource() => $_has(5);
  @$pb.TagNumber(6)
  void clearSource() => clearField(6);

  @$pb.TagNumber(7)
  $1.Timestamp get created => $_getN(6);
  @$pb.TagNumber(7)
  set created($1.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreated() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreated() => clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureCreated() => $_ensure(6);

  @$pb.TagNumber(8)
  $1.Timestamp get date => $_getN(7);
  @$pb.TagNumber(8)
  set date($1.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearDate() => clearField(8);
  @$pb.TagNumber(8)
  $1.Timestamp ensureDate() => $_ensure(7);
}

class GetNewsReply extends $pb.GeneratedMessage {
  factory GetNewsReply({
    $core.Iterable<News>? news,
  }) {
    final $result = create();
    if (news != null) {
      $result.news.addAll(news);
    }
    return $result;
  }
  GetNewsReply._() : super();
  factory GetNewsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNewsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNewsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<News>(1, _omitFieldNames ? '' : 'news', $pb.PbFieldType.PM, subBuilder: News.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNewsReply clone() => GetNewsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNewsReply copyWith(void Function(GetNewsReply) updates) => super.copyWith((message) => updates(message as GetNewsReply)) as GetNewsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNewsReply create() => GetNewsReply._();
  GetNewsReply createEmptyInstance() => create();
  static $pb.PbList<GetNewsReply> createRepeated() => $pb.PbList<GetNewsReply>();
  @$core.pragma('dart2js:noInline')
  static GetNewsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNewsReply>(create);
  static GetNewsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<News> get news => $_getList(0);
}

class GetNewsRequest extends $pb.GeneratedMessage {
  factory GetNewsRequest({
    $core.int? lastNewsId,
    $core.int? newsSource,
  }) {
    final $result = create();
    if (lastNewsId != null) {
      $result.lastNewsId = lastNewsId;
    }
    if (newsSource != null) {
      $result.newsSource = newsSource;
    }
    return $result;
  }
  GetNewsRequest._() : super();
  factory GetNewsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNewsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNewsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'lastNewsId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'newsSource', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNewsRequest clone() => GetNewsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNewsRequest copyWith(void Function(GetNewsRequest) updates) => super.copyWith((message) => updates(message as GetNewsRequest)) as GetNewsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNewsRequest create() => GetNewsRequest._();
  GetNewsRequest createEmptyInstance() => create();
  static $pb.PbList<GetNewsRequest> createRepeated() => $pb.PbList<GetNewsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetNewsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNewsRequest>(create);
  static GetNewsRequest? _defaultInstance;

  /// the last id of the news item received. 0 to get all news items
  @$pb.TagNumber(1)
  $core.int get lastNewsId => $_getIZ(0);
  @$pb.TagNumber(1)
  set lastNewsId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastNewsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastNewsId() => clearField(1);

  /// filter by news source id. 0 to get all news items
  @$pb.TagNumber(2)
  $core.int get newsSource => $_getIZ(1);
  @$pb.TagNumber(2)
  set newsSource($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewsSource() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewsSource() => clearField(2);
}

class GetNewsSourcesRequest extends $pb.GeneratedMessage {
  factory GetNewsSourcesRequest() => create();
  GetNewsSourcesRequest._() : super();
  factory GetNewsSourcesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNewsSourcesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNewsSourcesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNewsSourcesRequest clone() => GetNewsSourcesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNewsSourcesRequest copyWith(void Function(GetNewsSourcesRequest) updates) => super.copyWith((message) => updates(message as GetNewsSourcesRequest)) as GetNewsSourcesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNewsSourcesRequest create() => GetNewsSourcesRequest._();
  GetNewsSourcesRequest createEmptyInstance() => create();
  static $pb.PbList<GetNewsSourcesRequest> createRepeated() => $pb.PbList<GetNewsSourcesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetNewsSourcesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNewsSourcesRequest>(create);
  static GetNewsSourcesRequest? _defaultInstance;
}

class GetNewsSourcesReply extends $pb.GeneratedMessage {
  factory GetNewsSourcesReply({
    $core.Iterable<NewsSource>? sources,
  }) {
    final $result = create();
    if (sources != null) {
      $result.sources.addAll(sources);
    }
    return $result;
  }
  GetNewsSourcesReply._() : super();
  factory GetNewsSourcesReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNewsSourcesReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNewsSourcesReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<NewsSource>(1, _omitFieldNames ? '' : 'sources', $pb.PbFieldType.PM, subBuilder: NewsSource.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNewsSourcesReply clone() => GetNewsSourcesReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNewsSourcesReply copyWith(void Function(GetNewsSourcesReply) updates) => super.copyWith((message) => updates(message as GetNewsSourcesReply)) as GetNewsSourcesReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNewsSourcesReply create() => GetNewsSourcesReply._();
  GetNewsSourcesReply createEmptyInstance() => create();
  static $pb.PbList<GetNewsSourcesReply> createRepeated() => $pb.PbList<GetNewsSourcesReply>();
  @$core.pragma('dart2js:noInline')
  static GetNewsSourcesReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNewsSourcesReply>(create);
  static GetNewsSourcesReply? _defaultInstance;

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

class GetTopNewsRequest extends $pb.GeneratedMessage {
  factory GetTopNewsRequest() => create();
  GetTopNewsRequest._() : super();
  factory GetTopNewsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTopNewsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTopNewsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTopNewsRequest clone() => GetTopNewsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTopNewsRequest copyWith(void Function(GetTopNewsRequest) updates) => super.copyWith((message) => updates(message as GetTopNewsRequest)) as GetTopNewsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTopNewsRequest create() => GetTopNewsRequest._();
  GetTopNewsRequest createEmptyInstance() => create();
  static $pb.PbList<GetTopNewsRequest> createRepeated() => $pb.PbList<GetTopNewsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTopNewsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTopNewsRequest>(create);
  static GetTopNewsRequest? _defaultInstance;
}

class GetTopNewsReply extends $pb.GeneratedMessage {
  factory GetTopNewsReply({
    $core.String? imageUrl,
    $core.String? link,
    $1.Timestamp? created,
    $1.Timestamp? from,
    $1.Timestamp? to,
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
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'created', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'from', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'to', subBuilder: $1.Timestamp.create)
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
  $1.Timestamp get created => $_getN(2);
  @$pb.TagNumber(3)
  set created($1.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreated() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreated() => clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureCreated() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Timestamp get from => $_getN(3);
  @$pb.TagNumber(4)
  set from($1.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFrom() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrom() => clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureFrom() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Timestamp get to => $_getN(4);
  @$pb.TagNumber(5)
  set to($1.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTo() => $_has(4);
  @$pb.TagNumber(5)
  void clearTo() => clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureTo() => $_ensure(4);
}

class GetCanteenRatingsRequest extends $pb.GeneratedMessage {
  factory GetCanteenRatingsRequest({
    $core.String? canteenId,
    $1.Timestamp? from,
    $1.Timestamp? to,
    $core.int? limit,
  }) {
    final $result = create();
    if (canteenId != null) {
      $result.canteenId = canteenId;
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
  GetCanteenRatingsRequest._() : super();
  factory GetCanteenRatingsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCanteenRatingsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCanteenRatingsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'canteenId')
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'from', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'to', subBuilder: $1.Timestamp.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCanteenRatingsRequest clone() => GetCanteenRatingsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCanteenRatingsRequest copyWith(void Function(GetCanteenRatingsRequest) updates) => super.copyWith((message) => updates(message as GetCanteenRatingsRequest)) as GetCanteenRatingsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCanteenRatingsRequest create() => GetCanteenRatingsRequest._();
  GetCanteenRatingsRequest createEmptyInstance() => create();
  static $pb.PbList<GetCanteenRatingsRequest> createRepeated() => $pb.PbList<GetCanteenRatingsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCanteenRatingsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCanteenRatingsRequest>(create);
  static GetCanteenRatingsRequest? _defaultInstance;

  /// canteenId Mandatory Name of the canteen (EAT-API naming scheme "MENSA_GARCHING")
  @$pb.TagNumber(1)
  $core.String get canteenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set canteenId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCanteenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanteenId() => clearField(1);

  /// Optional Parameter to define an interval for the ratings (Lower bound)
  @$pb.TagNumber(2)
  $1.Timestamp get from => $_getN(1);
  @$pb.TagNumber(2)
  set from($1.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => clearField(2);
  @$pb.TagNumber(2)
  $1.Timestamp ensureFrom() => $_ensure(1);

  /// Optional Parameter to define an interval for the ratings (Upper bound)
  @$pb.TagNumber(3)
  $1.Timestamp get to => $_getN(2);
  @$pb.TagNumber(3)
  set to($1.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTo() => clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureTo() => $_ensure(2);

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

class GetCanteenRatingsReply extends $pb.GeneratedMessage {
  factory GetCanteenRatingsReply({
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
  GetCanteenRatingsReply._() : super();
  factory GetCanteenRatingsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCanteenRatingsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCanteenRatingsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<SingleRatingReply>(1, _omitFieldNames ? '' : 'rating', $pb.PbFieldType.PM, subBuilder: SingleRatingReply.create)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'avg', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'std', $pb.PbFieldType.OD)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'min', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'max', $pb.PbFieldType.O3)
    ..pc<RatingTagResult>(6, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, subBuilder: RatingTagResult.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCanteenRatingsReply clone() => GetCanteenRatingsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCanteenRatingsReply copyWith(void Function(GetCanteenRatingsReply) updates) => super.copyWith((message) => updates(message as GetCanteenRatingsReply)) as GetCanteenRatingsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCanteenRatingsReply create() => GetCanteenRatingsReply._();
  GetCanteenRatingsReply createEmptyInstance() => create();
  static $pb.PbList<GetCanteenRatingsReply> createRepeated() => $pb.PbList<GetCanteenRatingsReply>();
  @$core.pragma('dart2js:noInline')
  static GetCanteenRatingsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCanteenRatingsReply>(create);
  static GetCanteenRatingsReply? _defaultInstance;

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

class GetDishRatingsRequest extends $pb.GeneratedMessage {
  factory GetDishRatingsRequest({
    $core.String? canteenId,
    $core.String? dish,
    $1.Timestamp? from,
    $1.Timestamp? to,
    $core.int? limit,
  }) {
    final $result = create();
    if (canteenId != null) {
      $result.canteenId = canteenId;
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
  GetDishRatingsRequest._() : super();
  factory GetDishRatingsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDishRatingsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetDishRatingsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'canteenId')
    ..aOS(2, _omitFieldNames ? '' : 'dish')
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'from', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'to', subBuilder: $1.Timestamp.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDishRatingsRequest clone() => GetDishRatingsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDishRatingsRequest copyWith(void Function(GetDishRatingsRequest) updates) => super.copyWith((message) => updates(message as GetDishRatingsRequest)) as GetDishRatingsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDishRatingsRequest create() => GetDishRatingsRequest._();
  GetDishRatingsRequest createEmptyInstance() => create();
  static $pb.PbList<GetDishRatingsRequest> createRepeated() => $pb.PbList<GetDishRatingsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetDishRatingsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDishRatingsRequest>(create);
  static GetDishRatingsRequest? _defaultInstance;

  /// Mandatory Name of the canteen (EAT-API naming scheme "MENSA_GARCHING")
  @$pb.TagNumber(1)
  $core.String get canteenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set canteenId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCanteenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanteenId() => clearField(1);

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
  $1.Timestamp get from => $_getN(2);
  @$pb.TagNumber(3)
  set from($1.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrom() => clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureFrom() => $_ensure(2);

  /// Optional Parameter to define an interval for the ratings (Upper bound)
  @$pb.TagNumber(4)
  $1.Timestamp get to => $_getN(3);
  @$pb.TagNumber(4)
  set to($1.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTo() => $_has(3);
  @$pb.TagNumber(4)
  void clearTo() => clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureTo() => $_ensure(3);

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

class GetDishRatingsReply extends $pb.GeneratedMessage {
  factory GetDishRatingsReply({
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
  GetDishRatingsReply._() : super();
  factory GetDishRatingsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDishRatingsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetDishRatingsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<SingleRatingReply>(1, _omitFieldNames ? '' : 'rating', $pb.PbFieldType.PM, subBuilder: SingleRatingReply.create)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'avg', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'std', $pb.PbFieldType.OD)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'min', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'max', $pb.PbFieldType.O3)
    ..pc<RatingTagResult>(6, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, subBuilder: RatingTagResult.create)
    ..pc<RatingTagResult>(7, _omitFieldNames ? '' : 'nameTags', $pb.PbFieldType.PM, subBuilder: RatingTagResult.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDishRatingsReply clone() => GetDishRatingsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDishRatingsReply copyWith(void Function(GetDishRatingsReply) updates) => super.copyWith((message) => updates(message as GetDishRatingsReply)) as GetDishRatingsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDishRatingsReply create() => GetDishRatingsReply._();
  GetDishRatingsReply createEmptyInstance() => create();
  static $pb.PbList<GetDishRatingsReply> createRepeated() => $pb.PbList<GetDishRatingsReply>();
  @$core.pragma('dart2js:noInline')
  static GetDishRatingsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDishRatingsReply>(create);
  static GetDishRatingsReply? _defaultInstance;

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
    $1.Timestamp? visited,
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
    ..pc<RatingTagNewRequest>(4, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, subBuilder: RatingTagNewRequest.create)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'visited', subBuilder: $1.Timestamp.create)
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
  $1.Timestamp get visited => $_getN(4);
  @$pb.TagNumber(5)
  set visited($1.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasVisited() => $_has(4);
  @$pb.TagNumber(5)
  void clearVisited() => clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureVisited() => $_ensure(4);
}

class NewCanteenRatingReply extends $pb.GeneratedMessage {
  factory NewCanteenRatingReply() => create();
  NewCanteenRatingReply._() : super();
  factory NewCanteenRatingReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewCanteenRatingReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NewCanteenRatingReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewCanteenRatingReply clone() => NewCanteenRatingReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewCanteenRatingReply copyWith(void Function(NewCanteenRatingReply) updates) => super.copyWith((message) => updates(message as NewCanteenRatingReply)) as NewCanteenRatingReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewCanteenRatingReply create() => NewCanteenRatingReply._();
  NewCanteenRatingReply createEmptyInstance() => create();
  static $pb.PbList<NewCanteenRatingReply> createRepeated() => $pb.PbList<NewCanteenRatingReply>();
  @$core.pragma('dart2js:noInline')
  static NewCanteenRatingReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewCanteenRatingReply>(create);
  static NewCanteenRatingReply? _defaultInstance;
}

class NewCanteenRatingRequest extends $pb.GeneratedMessage {
  factory NewCanteenRatingRequest({
    $core.int? points,
    $core.String? canteenId,
    $core.List<$core.int>? image,
    $core.Iterable<RatingTag>? ratingTags,
    $core.String? comment,
  }) {
    final $result = create();
    if (points != null) {
      $result.points = points;
    }
    if (canteenId != null) {
      $result.canteenId = canteenId;
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
  NewCanteenRatingRequest._() : super();
  factory NewCanteenRatingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewCanteenRatingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NewCanteenRatingRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'points', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'canteenId')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OY)
    ..pc<RatingTag>(4, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, subBuilder: RatingTag.create)
    ..aOS(6, _omitFieldNames ? '' : 'comment')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewCanteenRatingRequest clone() => NewCanteenRatingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewCanteenRatingRequest copyWith(void Function(NewCanteenRatingRequest) updates) => super.copyWith((message) => updates(message as NewCanteenRatingRequest)) as NewCanteenRatingRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewCanteenRatingRequest create() => NewCanteenRatingRequest._();
  NewCanteenRatingRequest createEmptyInstance() => create();
  static $pb.PbList<NewCanteenRatingRequest> createRepeated() => $pb.PbList<NewCanteenRatingRequest>();
  @$core.pragma('dart2js:noInline')
  static NewCanteenRatingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewCanteenRatingRequest>(create);
  static NewCanteenRatingRequest? _defaultInstance;

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
  $core.String get canteenId => $_getSZ(1);
  @$pb.TagNumber(2)
  set canteenId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCanteenId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCanteenId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get image => $_getN(2);
  @$pb.TagNumber(3)
  set image($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);

  /// Optional list of tag ratings add as many tags with a rating (1-5) of the list of canteenRatingTags
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

class NewDishRatingReply extends $pb.GeneratedMessage {
  factory NewDishRatingReply() => create();
  NewDishRatingReply._() : super();
  factory NewDishRatingReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewDishRatingReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NewDishRatingReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewDishRatingReply clone() => NewDishRatingReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewDishRatingReply copyWith(void Function(NewDishRatingReply) updates) => super.copyWith((message) => updates(message as NewDishRatingReply)) as NewDishRatingReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewDishRatingReply create() => NewDishRatingReply._();
  NewDishRatingReply createEmptyInstance() => create();
  static $pb.PbList<NewDishRatingReply> createRepeated() => $pb.PbList<NewDishRatingReply>();
  @$core.pragma('dart2js:noInline')
  static NewDishRatingReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewDishRatingReply>(create);
  static NewDishRatingReply? _defaultInstance;
}

class NewDishRatingRequest extends $pb.GeneratedMessage {
  factory NewDishRatingRequest({
    $core.int? points,
    $core.String? canteenId,
    $core.String? dish,
    $core.List<$core.int>? image,
    $core.Iterable<RatingTag>? ratingTags,
    $core.String? comment,
  }) {
    final $result = create();
    if (points != null) {
      $result.points = points;
    }
    if (canteenId != null) {
      $result.canteenId = canteenId;
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
    ..aOS(2, _omitFieldNames ? '' : 'canteenId')
    ..aOS(3, _omitFieldNames ? '' : 'dish')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OY)
    ..pc<RatingTag>(5, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, subBuilder: RatingTag.create)
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
  $core.String get canteenId => $_getSZ(1);
  @$pb.TagNumber(2)
  set canteenId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCanteenId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCanteenId() => clearField(2);

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

class GetAvailableDishTagsRequest extends $pb.GeneratedMessage {
  factory GetAvailableDishTagsRequest() => create();
  GetAvailableDishTagsRequest._() : super();
  factory GetAvailableDishTagsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAvailableDishTagsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAvailableDishTagsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAvailableDishTagsRequest clone() => GetAvailableDishTagsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAvailableDishTagsRequest copyWith(void Function(GetAvailableDishTagsRequest) updates) => super.copyWith((message) => updates(message as GetAvailableDishTagsRequest)) as GetAvailableDishTagsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAvailableDishTagsRequest create() => GetAvailableDishTagsRequest._();
  GetAvailableDishTagsRequest createEmptyInstance() => create();
  static $pb.PbList<GetAvailableDishTagsRequest> createRepeated() => $pb.PbList<GetAvailableDishTagsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAvailableDishTagsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAvailableDishTagsRequest>(create);
  static GetAvailableDishTagsRequest? _defaultInstance;
}

class GetAvailableDishTagsReply extends $pb.GeneratedMessage {
  factory GetAvailableDishTagsReply({
    $core.Iterable<TagsOverview>? ratingTags,
  }) {
    final $result = create();
    if (ratingTags != null) {
      $result.ratingTags.addAll(ratingTags);
    }
    return $result;
  }
  GetAvailableDishTagsReply._() : super();
  factory GetAvailableDishTagsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAvailableDishTagsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAvailableDishTagsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<TagsOverview>(1, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, subBuilder: TagsOverview.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAvailableDishTagsReply clone() => GetAvailableDishTagsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAvailableDishTagsReply copyWith(void Function(GetAvailableDishTagsReply) updates) => super.copyWith((message) => updates(message as GetAvailableDishTagsReply)) as GetAvailableDishTagsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAvailableDishTagsReply create() => GetAvailableDishTagsReply._();
  GetAvailableDishTagsReply createEmptyInstance() => create();
  static $pb.PbList<GetAvailableDishTagsReply> createRepeated() => $pb.PbList<GetAvailableDishTagsReply>();
  @$core.pragma('dart2js:noInline')
  static GetAvailableDishTagsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAvailableDishTagsReply>(create);
  static GetAvailableDishTagsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TagsOverview> get ratingTags => $_getList(0);
}

class GetNameTagsRequest extends $pb.GeneratedMessage {
  factory GetNameTagsRequest() => create();
  GetNameTagsRequest._() : super();
  factory GetNameTagsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNameTagsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNameTagsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNameTagsRequest clone() => GetNameTagsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNameTagsRequest copyWith(void Function(GetNameTagsRequest) updates) => super.copyWith((message) => updates(message as GetNameTagsRequest)) as GetNameTagsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNameTagsRequest create() => GetNameTagsRequest._();
  GetNameTagsRequest createEmptyInstance() => create();
  static $pb.PbList<GetNameTagsRequest> createRepeated() => $pb.PbList<GetNameTagsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetNameTagsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNameTagsRequest>(create);
  static GetNameTagsRequest? _defaultInstance;
}

class GetNameTagsReply extends $pb.GeneratedMessage {
  factory GetNameTagsReply({
    $core.Iterable<TagsOverview>? ratingTags,
  }) {
    final $result = create();
    if (ratingTags != null) {
      $result.ratingTags.addAll(ratingTags);
    }
    return $result;
  }
  GetNameTagsReply._() : super();
  factory GetNameTagsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNameTagsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNameTagsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<TagsOverview>(1, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, subBuilder: TagsOverview.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNameTagsReply clone() => GetNameTagsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNameTagsReply copyWith(void Function(GetNameTagsReply) updates) => super.copyWith((message) => updates(message as GetNameTagsReply)) as GetNameTagsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNameTagsReply create() => GetNameTagsReply._();
  GetNameTagsReply createEmptyInstance() => create();
  static $pb.PbList<GetNameTagsReply> createRepeated() => $pb.PbList<GetNameTagsReply>();
  @$core.pragma('dart2js:noInline')
  static GetNameTagsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNameTagsReply>(create);
  static GetNameTagsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TagsOverview> get ratingTags => $_getList(0);
}

class GetAvailableCanteenTagsRequest extends $pb.GeneratedMessage {
  factory GetAvailableCanteenTagsRequest() => create();
  GetAvailableCanteenTagsRequest._() : super();
  factory GetAvailableCanteenTagsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAvailableCanteenTagsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAvailableCanteenTagsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAvailableCanteenTagsRequest clone() => GetAvailableCanteenTagsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAvailableCanteenTagsRequest copyWith(void Function(GetAvailableCanteenTagsRequest) updates) => super.copyWith((message) => updates(message as GetAvailableCanteenTagsRequest)) as GetAvailableCanteenTagsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAvailableCanteenTagsRequest create() => GetAvailableCanteenTagsRequest._();
  GetAvailableCanteenTagsRequest createEmptyInstance() => create();
  static $pb.PbList<GetAvailableCanteenTagsRequest> createRepeated() => $pb.PbList<GetAvailableCanteenTagsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAvailableCanteenTagsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAvailableCanteenTagsRequest>(create);
  static GetAvailableCanteenTagsRequest? _defaultInstance;
}

class GetAvailableCanteenTagsReply extends $pb.GeneratedMessage {
  factory GetAvailableCanteenTagsReply({
    $core.Iterable<TagsOverview>? ratingTags,
  }) {
    final $result = create();
    if (ratingTags != null) {
      $result.ratingTags.addAll(ratingTags);
    }
    return $result;
  }
  GetAvailableCanteenTagsReply._() : super();
  factory GetAvailableCanteenTagsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAvailableCanteenTagsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAvailableCanteenTagsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<TagsOverview>(1, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, subBuilder: TagsOverview.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAvailableCanteenTagsReply clone() => GetAvailableCanteenTagsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAvailableCanteenTagsReply copyWith(void Function(GetAvailableCanteenTagsReply) updates) => super.copyWith((message) => updates(message as GetAvailableCanteenTagsReply)) as GetAvailableCanteenTagsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAvailableCanteenTagsReply create() => GetAvailableCanteenTagsReply._();
  GetAvailableCanteenTagsReply createEmptyInstance() => create();
  static $pb.PbList<GetAvailableCanteenTagsReply> createRepeated() => $pb.PbList<GetAvailableCanteenTagsReply>();
  @$core.pragma('dart2js:noInline')
  static GetAvailableCanteenTagsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAvailableCanteenTagsReply>(create);
  static GetAvailableCanteenTagsReply? _defaultInstance;

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
    ..a<$core.int>(1, _omitFieldNames ? '' : 'tagId', $pb.PbFieldType.O3)
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
    $fixnum.Int64? tagId,
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
    ..aInt64(1, _omitFieldNames ? '' : 'tagId')
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
  $fixnum.Int64 get tagId => $_getI64(0);
  @$pb.TagNumber(1)
  set tagId($fixnum.Int64 v) { $_setInt64(0, v); }
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
    ..a<$core.int>(1, _omitFieldNames ? '' : 'tagId', $pb.PbFieldType.O3)
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
    ..a<$core.int>(1, _omitFieldNames ? '' : 'tagId', $pb.PbFieldType.O3)
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

class GetCanteensRequest extends $pb.GeneratedMessage {
  factory GetCanteensRequest() => create();
  GetCanteensRequest._() : super();
  factory GetCanteensRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCanteensRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCanteensRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCanteensRequest clone() => GetCanteensRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCanteensRequest copyWith(void Function(GetCanteensRequest) updates) => super.copyWith((message) => updates(message as GetCanteensRequest)) as GetCanteensRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCanteensRequest create() => GetCanteensRequest._();
  GetCanteensRequest createEmptyInstance() => create();
  static $pb.PbList<GetCanteensRequest> createRepeated() => $pb.PbList<GetCanteensRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCanteensRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCanteensRequest>(create);
  static GetCanteensRequest? _defaultInstance;
}

class GetCanteensReply extends $pb.GeneratedMessage {
  factory GetCanteensReply({
    $core.Iterable<Canteen>? canteen,
  }) {
    final $result = create();
    if (canteen != null) {
      $result.canteen.addAll(canteen);
    }
    return $result;
  }
  GetCanteensReply._() : super();
  factory GetCanteensReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCanteensReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCanteensReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<Canteen>(1, _omitFieldNames ? '' : 'canteen', $pb.PbFieldType.PM, subBuilder: Canteen.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCanteensReply clone() => GetCanteensReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCanteensReply copyWith(void Function(GetCanteensReply) updates) => super.copyWith((message) => updates(message as GetCanteensReply)) as GetCanteensReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCanteensReply create() => GetCanteensReply._();
  GetCanteensReply createEmptyInstance() => create();
  static $pb.PbList<GetCanteensReply> createRepeated() => $pb.PbList<GetCanteensReply>();
  @$core.pragma('dart2js:noInline')
  static GetCanteensReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCanteensReply>(create);
  static GetCanteensReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Canteen> get canteen => $_getList(0);
}

class Canteen extends $pb.GeneratedMessage {
  factory Canteen({
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
  Canteen._() : super();
  factory Canteen.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Canteen.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Canteen', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
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
  Canteen clone() => Canteen()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Canteen copyWith(void Function(Canteen) updates) => super.copyWith((message) => updates(message as Canteen)) as Canteen;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Canteen create() => Canteen._();
  Canteen createEmptyInstance() => create();
  static $pb.PbList<Canteen> createRepeated() => $pb.PbList<Canteen>();
  @$core.pragma('dart2js:noInline')
  static Canteen getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Canteen>(create);
  static Canteen? _defaultInstance;

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
    $core.String? canteenId,
    $core.int? year,
    $core.int? week,
    $core.int? day,
  }) {
    final $result = create();
    if (canteenId != null) {
      $result.canteenId = canteenId;
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
    ..aOS(1, _omitFieldNames ? '' : 'canteenId')
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
  $core.String get canteenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set canteenId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCanteenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanteenId() => clearField(1);

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

class GetResponsiblePersonRequest extends $pb.GeneratedMessage {
  factory GetResponsiblePersonRequest() => create();
  GetResponsiblePersonRequest._() : super();
  factory GetResponsiblePersonRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetResponsiblePersonRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetResponsiblePersonRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetResponsiblePersonRequest clone() => GetResponsiblePersonRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetResponsiblePersonRequest copyWith(void Function(GetResponsiblePersonRequest) updates) => super.copyWith((message) => updates(message as GetResponsiblePersonRequest)) as GetResponsiblePersonRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetResponsiblePersonRequest create() => GetResponsiblePersonRequest._();
  GetResponsiblePersonRequest createEmptyInstance() => create();
  static $pb.PbList<GetResponsiblePersonRequest> createRepeated() => $pb.PbList<GetResponsiblePersonRequest>();
  @$core.pragma('dart2js:noInline')
  static GetResponsiblePersonRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetResponsiblePersonRequest>(create);
  static GetResponsiblePersonRequest? _defaultInstance;
}

class GetResponsiblePersonReply extends $pb.GeneratedMessage {
  factory GetResponsiblePersonReply({
    $core.Iterable<ResponsiblePerson>? responsiblePerson,
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
    ..pc<ResponsiblePerson>(1, _omitFieldNames ? '' : 'responsiblePerson', $pb.PbFieldType.PM, subBuilder: ResponsiblePerson.create)
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
  $core.List<ResponsiblePerson> get responsiblePerson => $_getList(0);
}

class ResponsiblePerson extends $pb.GeneratedMessage {
  factory ResponsiblePerson({
    $core.String? name,
    $core.String? telephone,
    $core.String? email,
    $core.String? faculty,
    $core.String? tumId,
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
    if (tumId != null) {
      $result.tumId = tumId;
    }
    return $result;
  }
  ResponsiblePerson._() : super();
  factory ResponsiblePerson.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponsiblePerson.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResponsiblePerson', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'telephone')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..aOS(4, _omitFieldNames ? '' : 'faculty')
    ..aOS(5, _omitFieldNames ? '' : 'tumId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponsiblePerson clone() => ResponsiblePerson()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponsiblePerson copyWith(void Function(ResponsiblePerson) updates) => super.copyWith((message) => updates(message as ResponsiblePerson)) as ResponsiblePerson;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResponsiblePerson create() => ResponsiblePerson._();
  ResponsiblePerson createEmptyInstance() => create();
  static $pb.PbList<ResponsiblePerson> createRepeated() => $pb.PbList<ResponsiblePerson>();
  @$core.pragma('dart2js:noInline')
  static ResponsiblePerson getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponsiblePerson>(create);
  static ResponsiblePerson? _defaultInstance;

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
  $core.String get tumId => $_getSZ(4);
  @$pb.TagNumber(5)
  set tumId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTumId() => $_has(4);
  @$pb.TagNumber(5)
  void clearTumId() => clearField(5);
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
    ..a<$core.int>(1, _omitFieldNames ? '' : 'roomId', $pb.PbFieldType.O3)
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

class GetMoreInformationRequest extends $pb.GeneratedMessage {
  factory GetMoreInformationRequest() => create();
  GetMoreInformationRequest._() : super();
  factory GetMoreInformationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMoreInformationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMoreInformationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMoreInformationRequest clone() => GetMoreInformationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMoreInformationRequest copyWith(void Function(GetMoreInformationRequest) updates) => super.copyWith((message) => updates(message as GetMoreInformationRequest)) as GetMoreInformationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMoreInformationRequest create() => GetMoreInformationRequest._();
  GetMoreInformationRequest createEmptyInstance() => create();
  static $pb.PbList<GetMoreInformationRequest> createRepeated() => $pb.PbList<GetMoreInformationRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMoreInformationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMoreInformationRequest>(create);
  static GetMoreInformationRequest? _defaultInstance;
}

class GetMoreInformationReply_MoreInformation extends $pb.GeneratedMessage {
  factory GetMoreInformationReply_MoreInformation({
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
  GetMoreInformationReply_MoreInformation._() : super();
  factory GetMoreInformationReply_MoreInformation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMoreInformationReply_MoreInformation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMoreInformationReply.MoreInformation', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'category')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMoreInformationReply_MoreInformation clone() => GetMoreInformationReply_MoreInformation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMoreInformationReply_MoreInformation copyWith(void Function(GetMoreInformationReply_MoreInformation) updates) => super.copyWith((message) => updates(message as GetMoreInformationReply_MoreInformation)) as GetMoreInformationReply_MoreInformation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMoreInformationReply_MoreInformation create() => GetMoreInformationReply_MoreInformation._();
  GetMoreInformationReply_MoreInformation createEmptyInstance() => create();
  static $pb.PbList<GetMoreInformationReply_MoreInformation> createRepeated() => $pb.PbList<GetMoreInformationReply_MoreInformation>();
  @$core.pragma('dart2js:noInline')
  static GetMoreInformationReply_MoreInformation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMoreInformationReply_MoreInformation>(create);
  static GetMoreInformationReply_MoreInformation? _defaultInstance;

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

class GetMoreInformationReply extends $pb.GeneratedMessage {
  factory GetMoreInformationReply({
    $core.Iterable<GetMoreInformationReply_MoreInformation>? infos,
  }) {
    final $result = create();
    if (infos != null) {
      $result.infos.addAll(infos);
    }
    return $result;
  }
  GetMoreInformationReply._() : super();
  factory GetMoreInformationReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMoreInformationReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMoreInformationReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<GetMoreInformationReply_MoreInformation>(1, _omitFieldNames ? '' : 'infos', $pb.PbFieldType.PM, subBuilder: GetMoreInformationReply_MoreInformation.create)
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
  $core.List<GetMoreInformationReply_MoreInformation> get infos => $_getList(0);
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
    $fixnum.Int64? version,
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
    ..aInt64(1, _omitFieldNames ? '' : 'version')
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
  $fixnum.Int64 get version => $_getI64(0);
  @$pb.TagNumber(1)
  set version($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);
}

class GetUpdateNoteReply extends $pb.GeneratedMessage {
  factory GetUpdateNoteReply({
    $core.String? message,
    $core.String? versionName,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    if (versionName != null) {
      $result.versionName = versionName;
    }
    return $result;
  }
  GetUpdateNoteReply._() : super();
  factory GetUpdateNoteReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUpdateNoteReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUpdateNoteReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..aOS(2, _omitFieldNames ? '' : 'versionName')
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

  @$pb.TagNumber(2)
  $core.String get versionName => $_getSZ(1);
  @$pb.TagNumber(2)
  set versionName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersionName() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersionName() => clearField(2);
}

class GetStudyRoomListRequest extends $pb.GeneratedMessage {
  factory GetStudyRoomListRequest() => create();
  GetStudyRoomListRequest._() : super();
  factory GetStudyRoomListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStudyRoomListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStudyRoomListRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStudyRoomListRequest clone() => GetStudyRoomListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStudyRoomListRequest copyWith(void Function(GetStudyRoomListRequest) updates) => super.copyWith((message) => updates(message as GetStudyRoomListRequest)) as GetStudyRoomListRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStudyRoomListRequest create() => GetStudyRoomListRequest._();
  GetStudyRoomListRequest createEmptyInstance() => create();
  static $pb.PbList<GetStudyRoomListRequest> createRepeated() => $pb.PbList<GetStudyRoomListRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStudyRoomListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStudyRoomListRequest>(create);
  static GetStudyRoomListRequest? _defaultInstance;
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
    ..a<$core.int>(2, _omitFieldNames ? '' : 'roomId', $pb.PbFieldType.O3)
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

class GetMoviesRequest extends $pb.GeneratedMessage {
  factory GetMoviesRequest({
    $core.int? lastId,
  }) {
    final $result = create();
    if (lastId != null) {
      $result.lastId = lastId;
    }
    return $result;
  }
  GetMoviesRequest._() : super();
  factory GetMoviesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMoviesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMoviesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'lastId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMoviesRequest clone() => GetMoviesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMoviesRequest copyWith(void Function(GetMoviesRequest) updates) => super.copyWith((message) => updates(message as GetMoviesRequest)) as GetMoviesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMoviesRequest create() => GetMoviesRequest._();
  GetMoviesRequest createEmptyInstance() => create();
  static $pb.PbList<GetMoviesRequest> createRepeated() => $pb.PbList<GetMoviesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMoviesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMoviesRequest>(create);
  static GetMoviesRequest? _defaultInstance;

  /// the last Id you have requested. Use -1 to get all movies
  @$pb.TagNumber(1)
  $core.int get lastId => $_getIZ(0);
  @$pb.TagNumber(1)
  set lastId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastId() => clearField(1);
}

class GetMoviesReply extends $pb.GeneratedMessage {
  factory GetMoviesReply({
    $core.Iterable<Movie>? movies,
  }) {
    final $result = create();
    if (movies != null) {
      $result.movies.addAll(movies);
    }
    return $result;
  }
  GetMoviesReply._() : super();
  factory GetMoviesReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMoviesReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMoviesReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<Movie>(1, _omitFieldNames ? '' : 'movies', $pb.PbFieldType.PM, subBuilder: Movie.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMoviesReply clone() => GetMoviesReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMoviesReply copyWith(void Function(GetMoviesReply) updates) => super.copyWith((message) => updates(message as GetMoviesReply)) as GetMoviesReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMoviesReply create() => GetMoviesReply._();
  GetMoviesReply createEmptyInstance() => create();
  static $pb.PbList<GetMoviesReply> createRepeated() => $pb.PbList<GetMoviesReply>();
  @$core.pragma('dart2js:noInline')
  static GetMoviesReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMoviesReply>(create);
  static GetMoviesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Movie> get movies => $_getList(0);
}

class Movie extends $pb.GeneratedMessage {
  factory Movie({
    $core.String? coverName,
    $core.String? coverPath,
    $fixnum.Int64? movieId,
    $1.Timestamp? date,
    $1.Timestamp? created,
    $core.String? title,
    $core.String? releaseYear,
    $core.String? runtime,
    $core.String? genre,
    $core.String? director,
    $core.String? actors,
    $core.String? imdbRating,
    $core.String? description,
    $fixnum.Int64? coverId,
    $core.String? link,
  }) {
    final $result = create();
    if (coverName != null) {
      $result.coverName = coverName;
    }
    if (coverPath != null) {
      $result.coverPath = coverPath;
    }
    if (movieId != null) {
      $result.movieId = movieId;
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
    if (releaseYear != null) {
      $result.releaseYear = releaseYear;
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
    if (imdbRating != null) {
      $result.imdbRating = imdbRating;
    }
    if (description != null) {
      $result.description = description;
    }
    if (coverId != null) {
      $result.coverId = coverId;
    }
    if (link != null) {
      $result.link = link;
    }
    return $result;
  }
  Movie._() : super();
  factory Movie.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Movie.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Movie', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'coverName')
    ..aOS(2, _omitFieldNames ? '' : 'coverPath')
    ..aInt64(3, _omitFieldNames ? '' : 'movieId')
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'date', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'created', subBuilder: $1.Timestamp.create)
    ..aOS(6, _omitFieldNames ? '' : 'title')
    ..aOS(7, _omitFieldNames ? '' : 'releaseYear')
    ..aOS(8, _omitFieldNames ? '' : 'runtime')
    ..aOS(9, _omitFieldNames ? '' : 'genre')
    ..aOS(10, _omitFieldNames ? '' : 'director')
    ..aOS(11, _omitFieldNames ? '' : 'actors')
    ..aOS(12, _omitFieldNames ? '' : 'imdbRating')
    ..aOS(13, _omitFieldNames ? '' : 'description')
    ..aInt64(14, _omitFieldNames ? '' : 'coverId')
    ..aOS(16, _omitFieldNames ? '' : 'link')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Movie clone() => Movie()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Movie copyWith(void Function(Movie) updates) => super.copyWith((message) => updates(message as Movie)) as Movie;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Movie create() => Movie._();
  Movie createEmptyInstance() => create();
  static $pb.PbList<Movie> createRepeated() => $pb.PbList<Movie>();
  @$core.pragma('dart2js:noInline')
  static Movie getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Movie>(create);
  static Movie? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get coverName => $_getSZ(0);
  @$pb.TagNumber(1)
  set coverName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCoverName() => $_has(0);
  @$pb.TagNumber(1)
  void clearCoverName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get coverPath => $_getSZ(1);
  @$pb.TagNumber(2)
  set coverPath($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCoverPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearCoverPath() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get movieId => $_getI64(2);
  @$pb.TagNumber(3)
  set movieId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMovieId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMovieId() => clearField(3);

  @$pb.TagNumber(4)
  $1.Timestamp get date => $_getN(3);
  @$pb.TagNumber(4)
  set date($1.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearDate() => clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureDate() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Timestamp get created => $_getN(4);
  @$pb.TagNumber(5)
  set created($1.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreated() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreated() => clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureCreated() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get title => $_getSZ(5);
  @$pb.TagNumber(6)
  set title($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitle() => clearField(6);

  /// release year of the movie
  @$pb.TagNumber(7)
  $core.String get releaseYear => $_getSZ(6);
  @$pb.TagNumber(7)
  set releaseYear($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasReleaseYear() => $_has(6);
  @$pb.TagNumber(7)
  void clearReleaseYear() => clearField(7);

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

  /// imdb rating
  @$pb.TagNumber(12)
  $core.String get imdbRating => $_getSZ(11);
  @$pb.TagNumber(12)
  set imdbRating($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasImdbRating() => $_has(11);
  @$pb.TagNumber(12)
  void clearImdbRating() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get description => $_getSZ(12);
  @$pb.TagNumber(13)
  set description($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasDescription() => $_has(12);
  @$pb.TagNumber(13)
  void clearDescription() => clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get coverId => $_getI64(13);
  @$pb.TagNumber(14)
  set coverId($fixnum.Int64 v) { $_setInt64(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasCoverId() => $_has(13);
  @$pb.TagNumber(14)
  void clearCoverId() => clearField(14);

  /// Where to find additional information about this movie
  @$pb.TagNumber(16)
  $core.String get link => $_getSZ(14);
  @$pb.TagNumber(16)
  set link($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(16)
  $core.bool hasLink() => $_has(14);
  @$pb.TagNumber(16)
  void clearLink() => clearField(16);
}

class SendFeedbackReply extends $pb.GeneratedMessage {
  factory SendFeedbackReply() => create();
  SendFeedbackReply._() : super();
  factory SendFeedbackReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendFeedbackReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendFeedbackReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendFeedbackReply clone() => SendFeedbackReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendFeedbackReply copyWith(void Function(SendFeedbackReply) updates) => super.copyWith((message) => updates(message as SendFeedbackReply)) as SendFeedbackReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendFeedbackReply create() => SendFeedbackReply._();
  SendFeedbackReply createEmptyInstance() => create();
  static $pb.PbList<SendFeedbackReply> createRepeated() => $pb.PbList<SendFeedbackReply>();
  @$core.pragma('dart2js:noInline')
  static SendFeedbackReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendFeedbackReply>(create);
  static SendFeedbackReply? _defaultInstance;
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
    ..aOS(3, _omitFieldNames ? '' : 'emailId')
    ..aOS(4, _omitFieldNames ? '' : 'message')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'imageCount', $pb.PbFieldType.O3)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..aOS(8, _omitFieldNames ? '' : 'osVersion')
    ..aOS(9, _omitFieldNames ? '' : 'appVersion')
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
    ..a<$core.int>(2, _omitFieldNames ? '' : 'imageNr', $pb.PbFieldType.O3)
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
    ..aOS(1, _omitFieldNames ? '' : 'lrzId')
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
    ..aOS(1, _omitFieldNames ? '' : 'lrzId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'memberId', $pb.PbFieldType.O3)
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
    ..aOS(1, _omitFieldNames ? '' : 'lrzId')
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

class GetNotificationRequest extends $pb.GeneratedMessage {
  factory GetNotificationRequest({
    $core.int? notificationId,
  }) {
    final $result = create();
    if (notificationId != null) {
      $result.notificationId = notificationId;
    }
    return $result;
  }
  GetNotificationRequest._() : super();
  factory GetNotificationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotificationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNotificationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'notificationId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotificationRequest clone() => GetNotificationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotificationRequest copyWith(void Function(GetNotificationRequest) updates) => super.copyWith((message) => updates(message as GetNotificationRequest)) as GetNotificationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotificationRequest create() => GetNotificationRequest._();
  GetNotificationRequest createEmptyInstance() => create();
  static $pb.PbList<GetNotificationRequest> createRepeated() => $pb.PbList<GetNotificationRequest>();
  @$core.pragma('dart2js:noInline')
  static GetNotificationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotificationRequest>(create);
  static GetNotificationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get notificationId => $_getIZ(0);
  @$pb.TagNumber(1)
  set notificationId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNotificationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotificationId() => clearField(1);
}

class GetNotificationReply extends $pb.GeneratedMessage {
  factory GetNotificationReply({
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
  GetNotificationReply._() : super();
  factory GetNotificationReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotificationReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNotificationReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'notificationId', $pb.PbFieldType.O3)
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
  GetNotificationReply clone() => GetNotificationReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotificationReply copyWith(void Function(GetNotificationReply) updates) => super.copyWith((message) => updates(message as GetNotificationReply)) as GetNotificationReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotificationReply create() => GetNotificationReply._();
  GetNotificationReply createEmptyInstance() => create();
  static $pb.PbList<GetNotificationReply> createRepeated() => $pb.PbList<GetNotificationReply>();
  @$core.pragma('dart2js:noInline')
  static GetNotificationReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotificationReply>(create);
  static GetNotificationReply? _defaultInstance;

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

class GetNotificationConfirmRequest extends $pb.GeneratedMessage {
  factory GetNotificationConfirmRequest({
    $core.int? notificationId,
  }) {
    final $result = create();
    if (notificationId != null) {
      $result.notificationId = notificationId;
    }
    return $result;
  }
  GetNotificationConfirmRequest._() : super();
  factory GetNotificationConfirmRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotificationConfirmRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNotificationConfirmRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'notificationId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotificationConfirmRequest clone() => GetNotificationConfirmRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotificationConfirmRequest copyWith(void Function(GetNotificationConfirmRequest) updates) => super.copyWith((message) => updates(message as GetNotificationConfirmRequest)) as GetNotificationConfirmRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotificationConfirmRequest create() => GetNotificationConfirmRequest._();
  GetNotificationConfirmRequest createEmptyInstance() => create();
  static $pb.PbList<GetNotificationConfirmRequest> createRepeated() => $pb.PbList<GetNotificationConfirmRequest>();
  @$core.pragma('dart2js:noInline')
  static GetNotificationConfirmRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotificationConfirmRequest>(create);
  static GetNotificationConfirmRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get notificationId => $_getIZ(0);
  @$pb.TagNumber(1)
  set notificationId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNotificationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotificationId() => clearField(1);
}

class GetNotificationConfirmReply extends $pb.GeneratedMessage {
  factory GetNotificationConfirmReply({
    $core.String? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  GetNotificationConfirmReply._() : super();
  factory GetNotificationConfirmReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotificationConfirmReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNotificationConfirmReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotificationConfirmReply clone() => GetNotificationConfirmReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotificationConfirmReply copyWith(void Function(GetNotificationConfirmReply) updates) => super.copyWith((message) => updates(message as GetNotificationConfirmReply)) as GetNotificationConfirmReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotificationConfirmReply create() => GetNotificationConfirmReply._();
  GetNotificationConfirmReply createEmptyInstance() => create();
  static $pb.PbList<GetNotificationConfirmReply> createRepeated() => $pb.PbList<GetNotificationConfirmReply>();
  @$core.pragma('dart2js:noInline')
  static GetNotificationConfirmReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotificationConfirmReply>(create);
  static GetNotificationConfirmReply? _defaultInstance;

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
    ..aOS(1, _omitFieldNames ? '' : 'canteenId')
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
    $1.Timestamp? timestamp,
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
    ..a<$core.int>(2, _omitFieldNames ? '' : 'maxCount', $pb.PbFieldType.OU3)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'percent', $pb.PbFieldType.OF)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'timestamp', subBuilder: $1.Timestamp.create)
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
  $1.Timestamp get timestamp => $_getN(3);
  @$pb.TagNumber(4)
  set timestamp($1.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureTimestamp() => $_ensure(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
