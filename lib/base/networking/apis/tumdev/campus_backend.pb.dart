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

class CreateDeviceRequest extends $pb.GeneratedMessage {
  factory CreateDeviceRequest({
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
  CreateDeviceRequest._() : super();
  factory CreateDeviceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDeviceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateDeviceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..aOS(2, _omitFieldNames ? '' : 'publicKey')
    ..e<DeviceType>(3, _omitFieldNames ? '' : 'deviceType', $pb.PbFieldType.OE, defaultOrMaker: DeviceType.IOS, valueOf: DeviceType.valueOf, enumValues: DeviceType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateDeviceRequest clone() => CreateDeviceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateDeviceRequest copyWith(void Function(CreateDeviceRequest) updates) => super.copyWith((message) => updates(message as CreateDeviceRequest)) as CreateDeviceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateDeviceRequest create() => CreateDeviceRequest._();
  CreateDeviceRequest createEmptyInstance() => create();
  static $pb.PbList<CreateDeviceRequest> createRepeated() => $pb.PbList<CreateDeviceRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateDeviceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDeviceRequest>(create);
  static CreateDeviceRequest? _defaultInstance;

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

class CreateDeviceReply extends $pb.GeneratedMessage {
  factory CreateDeviceReply({
    $core.String? deviceId,
  }) {
    final $result = create();
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    return $result;
  }
  CreateDeviceReply._() : super();
  factory CreateDeviceReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDeviceReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateDeviceReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateDeviceReply clone() => CreateDeviceReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateDeviceReply copyWith(void Function(CreateDeviceReply) updates) => super.copyWith((message) => updates(message as CreateDeviceReply)) as CreateDeviceReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateDeviceReply create() => CreateDeviceReply._();
  CreateDeviceReply createEmptyInstance() => create();
  static $pb.PbList<CreateDeviceReply> createRepeated() => $pb.PbList<CreateDeviceReply>();
  @$core.pragma('dart2js:noInline')
  static CreateDeviceReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDeviceReply>(create);
  static CreateDeviceReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);
}

class DeleteDeviceRequest extends $pb.GeneratedMessage {
  factory DeleteDeviceRequest({
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
  DeleteDeviceRequest._() : super();
  factory DeleteDeviceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteDeviceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteDeviceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..e<DeviceType>(2, _omitFieldNames ? '' : 'deviceType', $pb.PbFieldType.OE, defaultOrMaker: DeviceType.IOS, valueOf: DeviceType.valueOf, enumValues: DeviceType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteDeviceRequest clone() => DeleteDeviceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteDeviceRequest copyWith(void Function(DeleteDeviceRequest) updates) => super.copyWith((message) => updates(message as DeleteDeviceRequest)) as DeleteDeviceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteDeviceRequest create() => DeleteDeviceRequest._();
  DeleteDeviceRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteDeviceRequest> createRepeated() => $pb.PbList<DeleteDeviceRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteDeviceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteDeviceRequest>(create);
  static DeleteDeviceRequest? _defaultInstance;

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

class DeleteDeviceReply extends $pb.GeneratedMessage {
  factory DeleteDeviceReply({
    $core.String? deviceId,
  }) {
    final $result = create();
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    return $result;
  }
  DeleteDeviceReply._() : super();
  factory DeleteDeviceReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteDeviceReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteDeviceReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteDeviceReply clone() => DeleteDeviceReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteDeviceReply copyWith(void Function(DeleteDeviceReply) updates) => super.copyWith((message) => updates(message as DeleteDeviceReply)) as DeleteDeviceReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteDeviceReply create() => DeleteDeviceReply._();
  DeleteDeviceReply createEmptyInstance() => create();
  static $pb.PbList<DeleteDeviceReply> createRepeated() => $pb.PbList<DeleteDeviceReply>();
  @$core.pragma('dart2js:noInline')
  static DeleteDeviceReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteDeviceReply>(create);
  static DeleteDeviceReply? _defaultInstance;

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

  /// where a news thumbnail is stored. empty string means no image is available
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

  /// when the news item was created in OUR database
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

  /// the date of the news item
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

class ListNewsReply extends $pb.GeneratedMessage {
  factory ListNewsReply({
    $core.Iterable<News>? news,
  }) {
    final $result = create();
    if (news != null) {
      $result.news.addAll(news);
    }
    return $result;
  }
  ListNewsReply._() : super();
  factory ListNewsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListNewsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListNewsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<News>(1, _omitFieldNames ? '' : 'news', $pb.PbFieldType.PM, subBuilder: News.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListNewsReply clone() => ListNewsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListNewsReply copyWith(void Function(ListNewsReply) updates) => super.copyWith((message) => updates(message as ListNewsReply)) as ListNewsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListNewsReply create() => ListNewsReply._();
  ListNewsReply createEmptyInstance() => create();
  static $pb.PbList<ListNewsReply> createRepeated() => $pb.PbList<ListNewsReply>();
  @$core.pragma('dart2js:noInline')
  static ListNewsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNewsReply>(create);
  static ListNewsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<News> get news => $_getList(0);
}

class ListNewsRequest extends $pb.GeneratedMessage {
  factory ListNewsRequest({
    $core.int? lastNewsId,
    $core.int? newsSource,
    $1.Timestamp? oldestDateAt,
  }) {
    final $result = create();
    if (lastNewsId != null) {
      $result.lastNewsId = lastNewsId;
    }
    if (newsSource != null) {
      $result.newsSource = newsSource;
    }
    if (oldestDateAt != null) {
      $result.oldestDateAt = oldestDateAt;
    }
    return $result;
  }
  ListNewsRequest._() : super();
  factory ListNewsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListNewsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListNewsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'lastNewsId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'newsSource', $pb.PbFieldType.O3)
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'oldestDateAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListNewsRequest clone() => ListNewsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListNewsRequest copyWith(void Function(ListNewsRequest) updates) => super.copyWith((message) => updates(message as ListNewsRequest)) as ListNewsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListNewsRequest create() => ListNewsRequest._();
  ListNewsRequest createEmptyInstance() => create();
  static $pb.PbList<ListNewsRequest> createRepeated() => $pb.PbList<ListNewsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListNewsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNewsRequest>(create);
  static ListNewsRequest? _defaultInstance;

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

  /// the oldest time you want to be included in the response
  @$pb.TagNumber(3)
  $1.Timestamp get oldestDateAt => $_getN(2);
  @$pb.TagNumber(3)
  set oldestDateAt($1.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOldestDateAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearOldestDateAt() => clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureOldestDateAt() => $_ensure(2);
}

class ListNewsSourcesRequest extends $pb.GeneratedMessage {
  factory ListNewsSourcesRequest() => create();
  ListNewsSourcesRequest._() : super();
  factory ListNewsSourcesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListNewsSourcesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListNewsSourcesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListNewsSourcesRequest clone() => ListNewsSourcesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListNewsSourcesRequest copyWith(void Function(ListNewsSourcesRequest) updates) => super.copyWith((message) => updates(message as ListNewsSourcesRequest)) as ListNewsSourcesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListNewsSourcesRequest create() => ListNewsSourcesRequest._();
  ListNewsSourcesRequest createEmptyInstance() => create();
  static $pb.PbList<ListNewsSourcesRequest> createRepeated() => $pb.PbList<ListNewsSourcesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListNewsSourcesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNewsSourcesRequest>(create);
  static ListNewsSourcesRequest? _defaultInstance;
}

class ListNewsSourcesReply extends $pb.GeneratedMessage {
  factory ListNewsSourcesReply({
    $core.Iterable<NewsSource>? sources,
  }) {
    final $result = create();
    if (sources != null) {
      $result.sources.addAll(sources);
    }
    return $result;
  }
  ListNewsSourcesReply._() : super();
  factory ListNewsSourcesReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListNewsSourcesReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListNewsSourcesReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<NewsSource>(1, _omitFieldNames ? '' : 'sources', $pb.PbFieldType.PM, subBuilder: NewsSource.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListNewsSourcesReply clone() => ListNewsSourcesReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListNewsSourcesReply copyWith(void Function(ListNewsSourcesReply) updates) => super.copyWith((message) => updates(message as ListNewsSourcesReply)) as ListNewsSourcesReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListNewsSourcesReply create() => ListNewsSourcesReply._();
  ListNewsSourcesReply createEmptyInstance() => create();
  static $pb.PbList<ListNewsSourcesReply> createRepeated() => $pb.PbList<ListNewsSourcesReply>();
  @$core.pragma('dart2js:noInline')
  static ListNewsSourcesReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNewsSourcesReply>(create);
  static ListNewsSourcesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<NewsSource> get sources => $_getList(0);
}

class NewsSource extends $pb.GeneratedMessage {
  factory NewsSource({
    $core.String? source,
    $core.String? title,
    $core.String? iconUrl,
  }) {
    final $result = create();
    if (source != null) {
      $result.source = source;
    }
    if (title != null) {
      $result.title = title;
    }
    if (iconUrl != null) {
      $result.iconUrl = iconUrl;
    }
    return $result;
  }
  NewsSource._() : super();
  factory NewsSource.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewsSource.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NewsSource', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'source')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'iconUrl')
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

  /// where the icon can be found
  @$pb.TagNumber(3)
  $core.String get iconUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set iconUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIconUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearIconUrl() => clearField(3);
}

class ListNewsAlertsRequest extends $pb.GeneratedMessage {
  factory ListNewsAlertsRequest({
    $core.int? lastNewsAlertId,
  }) {
    final $result = create();
    if (lastNewsAlertId != null) {
      $result.lastNewsAlertId = lastNewsAlertId;
    }
    return $result;
  }
  ListNewsAlertsRequest._() : super();
  factory ListNewsAlertsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListNewsAlertsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListNewsAlertsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'lastNewsAlertId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListNewsAlertsRequest clone() => ListNewsAlertsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListNewsAlertsRequest copyWith(void Function(ListNewsAlertsRequest) updates) => super.copyWith((message) => updates(message as ListNewsAlertsRequest)) as ListNewsAlertsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListNewsAlertsRequest create() => ListNewsAlertsRequest._();
  ListNewsAlertsRequest createEmptyInstance() => create();
  static $pb.PbList<ListNewsAlertsRequest> createRepeated() => $pb.PbList<ListNewsAlertsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListNewsAlertsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNewsAlertsRequest>(create);
  static ListNewsAlertsRequest? _defaultInstance;

  /// the last id of the news item received. 0 to get all news items
  @$pb.TagNumber(1)
  $core.int get lastNewsAlertId => $_getIZ(0);
  @$pb.TagNumber(1)
  set lastNewsAlertId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastNewsAlertId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastNewsAlertId() => clearField(1);
}

class ListNewsAlertsReply extends $pb.GeneratedMessage {
  factory ListNewsAlertsReply({
    $core.Iterable<NewsAlert>? alerts,
  }) {
    final $result = create();
    if (alerts != null) {
      $result.alerts.addAll(alerts);
    }
    return $result;
  }
  ListNewsAlertsReply._() : super();
  factory ListNewsAlertsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListNewsAlertsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListNewsAlertsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<NewsAlert>(1, _omitFieldNames ? '' : 'alerts', $pb.PbFieldType.PM, subBuilder: NewsAlert.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListNewsAlertsReply clone() => ListNewsAlertsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListNewsAlertsReply copyWith(void Function(ListNewsAlertsReply) updates) => super.copyWith((message) => updates(message as ListNewsAlertsReply)) as ListNewsAlertsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListNewsAlertsReply create() => ListNewsAlertsReply._();
  ListNewsAlertsReply createEmptyInstance() => create();
  static $pb.PbList<ListNewsAlertsReply> createRepeated() => $pb.PbList<ListNewsAlertsReply>();
  @$core.pragma('dart2js:noInline')
  static ListNewsAlertsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNewsAlertsReply>(create);
  static ListNewsAlertsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<NewsAlert> get alerts => $_getList(0);
}

class NewsAlert extends $pb.GeneratedMessage {
  factory NewsAlert({
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
  NewsAlert._() : super();
  factory NewsAlert.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewsAlert.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NewsAlert', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
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
  NewsAlert clone() => NewsAlert()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewsAlert copyWith(void Function(NewsAlert) updates) => super.copyWith((message) => updates(message as NewsAlert)) as NewsAlert;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewsAlert create() => NewsAlert._();
  NewsAlert createEmptyInstance() => create();
  static $pb.PbList<NewsAlert> createRepeated() => $pb.PbList<NewsAlert>();
  @$core.pragma('dart2js:noInline')
  static NewsAlert getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewsAlert>(create);
  static NewsAlert? _defaultInstance;

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

class ListCanteenRatingsRequest extends $pb.GeneratedMessage {
  factory ListCanteenRatingsRequest({
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
  ListCanteenRatingsRequest._() : super();
  factory ListCanteenRatingsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCanteenRatingsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCanteenRatingsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
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
  ListCanteenRatingsRequest clone() => ListCanteenRatingsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCanteenRatingsRequest copyWith(void Function(ListCanteenRatingsRequest) updates) => super.copyWith((message) => updates(message as ListCanteenRatingsRequest)) as ListCanteenRatingsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCanteenRatingsRequest create() => ListCanteenRatingsRequest._();
  ListCanteenRatingsRequest createEmptyInstance() => create();
  static $pb.PbList<ListCanteenRatingsRequest> createRepeated() => $pb.PbList<ListCanteenRatingsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListCanteenRatingsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCanteenRatingsRequest>(create);
  static ListCanteenRatingsRequest? _defaultInstance;

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

class ListCanteenRatingsReply extends $pb.GeneratedMessage {
  factory ListCanteenRatingsReply({
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
  ListCanteenRatingsReply._() : super();
  factory ListCanteenRatingsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCanteenRatingsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCanteenRatingsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
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
  ListCanteenRatingsReply clone() => ListCanteenRatingsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCanteenRatingsReply copyWith(void Function(ListCanteenRatingsReply) updates) => super.copyWith((message) => updates(message as ListCanteenRatingsReply)) as ListCanteenRatingsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCanteenRatingsReply create() => ListCanteenRatingsReply._();
  ListCanteenRatingsReply createEmptyInstance() => create();
  static $pb.PbList<ListCanteenRatingsReply> createRepeated() => $pb.PbList<ListCanteenRatingsReply>();
  @$core.pragma('dart2js:noInline')
  static ListCanteenRatingsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCanteenRatingsReply>(create);
  static ListCanteenRatingsReply? _defaultInstance;

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

class CreateCanteenRatingReply extends $pb.GeneratedMessage {
  factory CreateCanteenRatingReply() => create();
  CreateCanteenRatingReply._() : super();
  factory CreateCanteenRatingReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateCanteenRatingReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCanteenRatingReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateCanteenRatingReply clone() => CreateCanteenRatingReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateCanteenRatingReply copyWith(void Function(CreateCanteenRatingReply) updates) => super.copyWith((message) => updates(message as CreateCanteenRatingReply)) as CreateCanteenRatingReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCanteenRatingReply create() => CreateCanteenRatingReply._();
  CreateCanteenRatingReply createEmptyInstance() => create();
  static $pb.PbList<CreateCanteenRatingReply> createRepeated() => $pb.PbList<CreateCanteenRatingReply>();
  @$core.pragma('dart2js:noInline')
  static CreateCanteenRatingReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCanteenRatingReply>(create);
  static CreateCanteenRatingReply? _defaultInstance;
}

class CreateCanteenRatingRequest extends $pb.GeneratedMessage {
  factory CreateCanteenRatingRequest({
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
  CreateCanteenRatingRequest._() : super();
  factory CreateCanteenRatingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateCanteenRatingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCanteenRatingRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
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
  CreateCanteenRatingRequest clone() => CreateCanteenRatingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateCanteenRatingRequest copyWith(void Function(CreateCanteenRatingRequest) updates) => super.copyWith((message) => updates(message as CreateCanteenRatingRequest)) as CreateCanteenRatingRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCanteenRatingRequest create() => CreateCanteenRatingRequest._();
  CreateCanteenRatingRequest createEmptyInstance() => create();
  static $pb.PbList<CreateCanteenRatingRequest> createRepeated() => $pb.PbList<CreateCanteenRatingRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateCanteenRatingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCanteenRatingRequest>(create);
  static CreateCanteenRatingRequest? _defaultInstance;

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

class CreateDishRatingReply extends $pb.GeneratedMessage {
  factory CreateDishRatingReply() => create();
  CreateDishRatingReply._() : super();
  factory CreateDishRatingReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDishRatingReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateDishRatingReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateDishRatingReply clone() => CreateDishRatingReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateDishRatingReply copyWith(void Function(CreateDishRatingReply) updates) => super.copyWith((message) => updates(message as CreateDishRatingReply)) as CreateDishRatingReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateDishRatingReply create() => CreateDishRatingReply._();
  CreateDishRatingReply createEmptyInstance() => create();
  static $pb.PbList<CreateDishRatingReply> createRepeated() => $pb.PbList<CreateDishRatingReply>();
  @$core.pragma('dart2js:noInline')
  static CreateDishRatingReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDishRatingReply>(create);
  static CreateDishRatingReply? _defaultInstance;
}

class CreateDishRatingRequest extends $pb.GeneratedMessage {
  factory CreateDishRatingRequest({
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
  CreateDishRatingRequest._() : super();
  factory CreateDishRatingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDishRatingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateDishRatingRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
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
  CreateDishRatingRequest clone() => CreateDishRatingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateDishRatingRequest copyWith(void Function(CreateDishRatingRequest) updates) => super.copyWith((message) => updates(message as CreateDishRatingRequest)) as CreateDishRatingRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateDishRatingRequest create() => CreateDishRatingRequest._();
  CreateDishRatingRequest createEmptyInstance() => create();
  static $pb.PbList<CreateDishRatingRequest> createRepeated() => $pb.PbList<CreateDishRatingRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateDishRatingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDishRatingRequest>(create);
  static CreateDishRatingRequest? _defaultInstance;

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

class ListAvailableDishTagsRequest extends $pb.GeneratedMessage {
  factory ListAvailableDishTagsRequest() => create();
  ListAvailableDishTagsRequest._() : super();
  factory ListAvailableDishTagsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAvailableDishTagsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAvailableDishTagsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAvailableDishTagsRequest clone() => ListAvailableDishTagsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAvailableDishTagsRequest copyWith(void Function(ListAvailableDishTagsRequest) updates) => super.copyWith((message) => updates(message as ListAvailableDishTagsRequest)) as ListAvailableDishTagsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAvailableDishTagsRequest create() => ListAvailableDishTagsRequest._();
  ListAvailableDishTagsRequest createEmptyInstance() => create();
  static $pb.PbList<ListAvailableDishTagsRequest> createRepeated() => $pb.PbList<ListAvailableDishTagsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAvailableDishTagsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAvailableDishTagsRequest>(create);
  static ListAvailableDishTagsRequest? _defaultInstance;
}

class ListAvailableDishTagsReply extends $pb.GeneratedMessage {
  factory ListAvailableDishTagsReply({
    $core.Iterable<TagsOverview>? ratingTags,
  }) {
    final $result = create();
    if (ratingTags != null) {
      $result.ratingTags.addAll(ratingTags);
    }
    return $result;
  }
  ListAvailableDishTagsReply._() : super();
  factory ListAvailableDishTagsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAvailableDishTagsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAvailableDishTagsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<TagsOverview>(1, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, subBuilder: TagsOverview.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAvailableDishTagsReply clone() => ListAvailableDishTagsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAvailableDishTagsReply copyWith(void Function(ListAvailableDishTagsReply) updates) => super.copyWith((message) => updates(message as ListAvailableDishTagsReply)) as ListAvailableDishTagsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAvailableDishTagsReply create() => ListAvailableDishTagsReply._();
  ListAvailableDishTagsReply createEmptyInstance() => create();
  static $pb.PbList<ListAvailableDishTagsReply> createRepeated() => $pb.PbList<ListAvailableDishTagsReply>();
  @$core.pragma('dart2js:noInline')
  static ListAvailableDishTagsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAvailableDishTagsReply>(create);
  static ListAvailableDishTagsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TagsOverview> get ratingTags => $_getList(0);
}

class ListNameTagsRequest extends $pb.GeneratedMessage {
  factory ListNameTagsRequest() => create();
  ListNameTagsRequest._() : super();
  factory ListNameTagsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListNameTagsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListNameTagsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListNameTagsRequest clone() => ListNameTagsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListNameTagsRequest copyWith(void Function(ListNameTagsRequest) updates) => super.copyWith((message) => updates(message as ListNameTagsRequest)) as ListNameTagsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListNameTagsRequest create() => ListNameTagsRequest._();
  ListNameTagsRequest createEmptyInstance() => create();
  static $pb.PbList<ListNameTagsRequest> createRepeated() => $pb.PbList<ListNameTagsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListNameTagsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNameTagsRequest>(create);
  static ListNameTagsRequest? _defaultInstance;
}

class ListNameTagsReply extends $pb.GeneratedMessage {
  factory ListNameTagsReply({
    $core.Iterable<TagsOverview>? ratingTags,
  }) {
    final $result = create();
    if (ratingTags != null) {
      $result.ratingTags.addAll(ratingTags);
    }
    return $result;
  }
  ListNameTagsReply._() : super();
  factory ListNameTagsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListNameTagsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListNameTagsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<TagsOverview>(1, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, subBuilder: TagsOverview.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListNameTagsReply clone() => ListNameTagsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListNameTagsReply copyWith(void Function(ListNameTagsReply) updates) => super.copyWith((message) => updates(message as ListNameTagsReply)) as ListNameTagsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListNameTagsReply create() => ListNameTagsReply._();
  ListNameTagsReply createEmptyInstance() => create();
  static $pb.PbList<ListNameTagsReply> createRepeated() => $pb.PbList<ListNameTagsReply>();
  @$core.pragma('dart2js:noInline')
  static ListNameTagsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNameTagsReply>(create);
  static ListNameTagsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TagsOverview> get ratingTags => $_getList(0);
}

class ListAvailableCanteenTagsRequest extends $pb.GeneratedMessage {
  factory ListAvailableCanteenTagsRequest() => create();
  ListAvailableCanteenTagsRequest._() : super();
  factory ListAvailableCanteenTagsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAvailableCanteenTagsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAvailableCanteenTagsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAvailableCanteenTagsRequest clone() => ListAvailableCanteenTagsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAvailableCanteenTagsRequest copyWith(void Function(ListAvailableCanteenTagsRequest) updates) => super.copyWith((message) => updates(message as ListAvailableCanteenTagsRequest)) as ListAvailableCanteenTagsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAvailableCanteenTagsRequest create() => ListAvailableCanteenTagsRequest._();
  ListAvailableCanteenTagsRequest createEmptyInstance() => create();
  static $pb.PbList<ListAvailableCanteenTagsRequest> createRepeated() => $pb.PbList<ListAvailableCanteenTagsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAvailableCanteenTagsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAvailableCanteenTagsRequest>(create);
  static ListAvailableCanteenTagsRequest? _defaultInstance;
}

class ListAvailableCanteenTagsReply extends $pb.GeneratedMessage {
  factory ListAvailableCanteenTagsReply({
    $core.Iterable<TagsOverview>? ratingTags,
  }) {
    final $result = create();
    if (ratingTags != null) {
      $result.ratingTags.addAll(ratingTags);
    }
    return $result;
  }
  ListAvailableCanteenTagsReply._() : super();
  factory ListAvailableCanteenTagsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAvailableCanteenTagsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListAvailableCanteenTagsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<TagsOverview>(1, _omitFieldNames ? '' : 'ratingTags', $pb.PbFieldType.PM, subBuilder: TagsOverview.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListAvailableCanteenTagsReply clone() => ListAvailableCanteenTagsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListAvailableCanteenTagsReply copyWith(void Function(ListAvailableCanteenTagsReply) updates) => super.copyWith((message) => updates(message as ListAvailableCanteenTagsReply)) as ListAvailableCanteenTagsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListAvailableCanteenTagsReply create() => ListAvailableCanteenTagsReply._();
  ListAvailableCanteenTagsReply createEmptyInstance() => create();
  static $pb.PbList<ListAvailableCanteenTagsReply> createRepeated() => $pb.PbList<ListAvailableCanteenTagsReply>();
  @$core.pragma('dart2js:noInline')
  static ListAvailableCanteenTagsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAvailableCanteenTagsReply>(create);
  static ListAvailableCanteenTagsReply? _defaultInstance;

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

class ListCanteensRequest extends $pb.GeneratedMessage {
  factory ListCanteensRequest() => create();
  ListCanteensRequest._() : super();
  factory ListCanteensRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCanteensRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCanteensRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListCanteensRequest clone() => ListCanteensRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCanteensRequest copyWith(void Function(ListCanteensRequest) updates) => super.copyWith((message) => updates(message as ListCanteensRequest)) as ListCanteensRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCanteensRequest create() => ListCanteensRequest._();
  ListCanteensRequest createEmptyInstance() => create();
  static $pb.PbList<ListCanteensRequest> createRepeated() => $pb.PbList<ListCanteensRequest>();
  @$core.pragma('dart2js:noInline')
  static ListCanteensRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCanteensRequest>(create);
  static ListCanteensRequest? _defaultInstance;
}

class ListCanteensReply extends $pb.GeneratedMessage {
  factory ListCanteensReply({
    $core.Iterable<Canteen>? canteen,
  }) {
    final $result = create();
    if (canteen != null) {
      $result.canteen.addAll(canteen);
    }
    return $result;
  }
  ListCanteensReply._() : super();
  factory ListCanteensReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCanteensReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCanteensReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<Canteen>(1, _omitFieldNames ? '' : 'canteen', $pb.PbFieldType.PM, subBuilder: Canteen.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListCanteensReply clone() => ListCanteensReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCanteensReply copyWith(void Function(ListCanteensReply) updates) => super.copyWith((message) => updates(message as ListCanteensReply)) as ListCanteensReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCanteensReply create() => ListCanteensReply._();
  ListCanteensReply createEmptyInstance() => create();
  static $pb.PbList<ListCanteensReply> createRepeated() => $pb.PbList<ListCanteensReply>();
  @$core.pragma('dart2js:noInline')
  static ListCanteensReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCanteensReply>(create);
  static ListCanteensReply? _defaultInstance;

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

class ListDishesRequest extends $pb.GeneratedMessage {
  factory ListDishesRequest({
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
  ListDishesRequest._() : super();
  factory ListDishesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListDishesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListDishesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
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
  ListDishesRequest clone() => ListDishesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListDishesRequest copyWith(void Function(ListDishesRequest) updates) => super.copyWith((message) => updates(message as ListDishesRequest)) as ListDishesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDishesRequest create() => ListDishesRequest._();
  ListDishesRequest createEmptyInstance() => create();
  static $pb.PbList<ListDishesRequest> createRepeated() => $pb.PbList<ListDishesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListDishesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListDishesRequest>(create);
  static ListDishesRequest? _defaultInstance;

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

class ListDishesReply extends $pb.GeneratedMessage {
  factory ListDishesReply({
    $core.Iterable<$core.String>? dish,
  }) {
    final $result = create();
    if (dish != null) {
      $result.dish.addAll(dish);
    }
    return $result;
  }
  ListDishesReply._() : super();
  factory ListDishesReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListDishesReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListDishesReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'dish')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListDishesReply clone() => ListDishesReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListDishesReply copyWith(void Function(ListDishesReply) updates) => super.copyWith((message) => updates(message as ListDishesReply)) as ListDishesReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDishesReply create() => ListDishesReply._();
  ListDishesReply createEmptyInstance() => create();
  static $pb.PbList<ListDishesReply> createRepeated() => $pb.PbList<ListDishesReply>();
  @$core.pragma('dart2js:noInline')
  static ListDishesReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListDishesReply>(create);
  static ListDishesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get dish => $_getList(0);
}

class ListResponsiblePersonRequest extends $pb.GeneratedMessage {
  factory ListResponsiblePersonRequest() => create();
  ListResponsiblePersonRequest._() : super();
  factory ListResponsiblePersonRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListResponsiblePersonRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListResponsiblePersonRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListResponsiblePersonRequest clone() => ListResponsiblePersonRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListResponsiblePersonRequest copyWith(void Function(ListResponsiblePersonRequest) updates) => super.copyWith((message) => updates(message as ListResponsiblePersonRequest)) as ListResponsiblePersonRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListResponsiblePersonRequest create() => ListResponsiblePersonRequest._();
  ListResponsiblePersonRequest createEmptyInstance() => create();
  static $pb.PbList<ListResponsiblePersonRequest> createRepeated() => $pb.PbList<ListResponsiblePersonRequest>();
  @$core.pragma('dart2js:noInline')
  static ListResponsiblePersonRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListResponsiblePersonRequest>(create);
  static ListResponsiblePersonRequest? _defaultInstance;
}

class ListResponsiblePersonReply extends $pb.GeneratedMessage {
  factory ListResponsiblePersonReply({
    $core.Iterable<ResponsiblePerson>? responsiblePerson,
  }) {
    final $result = create();
    if (responsiblePerson != null) {
      $result.responsiblePerson.addAll(responsiblePerson);
    }
    return $result;
  }
  ListResponsiblePersonReply._() : super();
  factory ListResponsiblePersonReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListResponsiblePersonReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListResponsiblePersonReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<ResponsiblePerson>(1, _omitFieldNames ? '' : 'responsiblePerson', $pb.PbFieldType.PM, subBuilder: ResponsiblePerson.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListResponsiblePersonReply clone() => ListResponsiblePersonReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListResponsiblePersonReply copyWith(void Function(ListResponsiblePersonReply) updates) => super.copyWith((message) => updates(message as ListResponsiblePersonReply)) as ListResponsiblePersonReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListResponsiblePersonReply create() => ListResponsiblePersonReply._();
  ListResponsiblePersonReply createEmptyInstance() => create();
  static $pb.PbList<ListResponsiblePersonReply> createRepeated() => $pb.PbList<ListResponsiblePersonReply>();
  @$core.pragma('dart2js:noInline')
  static ListResponsiblePersonReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListResponsiblePersonReply>(create);
  static ListResponsiblePersonReply? _defaultInstance;

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

class ListMoreInformationRequest extends $pb.GeneratedMessage {
  factory ListMoreInformationRequest() => create();
  ListMoreInformationRequest._() : super();
  factory ListMoreInformationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListMoreInformationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListMoreInformationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListMoreInformationRequest clone() => ListMoreInformationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListMoreInformationRequest copyWith(void Function(ListMoreInformationRequest) updates) => super.copyWith((message) => updates(message as ListMoreInformationRequest)) as ListMoreInformationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListMoreInformationRequest create() => ListMoreInformationRequest._();
  ListMoreInformationRequest createEmptyInstance() => create();
  static $pb.PbList<ListMoreInformationRequest> createRepeated() => $pb.PbList<ListMoreInformationRequest>();
  @$core.pragma('dart2js:noInline')
  static ListMoreInformationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListMoreInformationRequest>(create);
  static ListMoreInformationRequest? _defaultInstance;
}

class ListMoreInformationReply_MoreInformation extends $pb.GeneratedMessage {
  factory ListMoreInformationReply_MoreInformation({
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
  ListMoreInformationReply_MoreInformation._() : super();
  factory ListMoreInformationReply_MoreInformation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListMoreInformationReply_MoreInformation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListMoreInformationReply.MoreInformation', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'category')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListMoreInformationReply_MoreInformation clone() => ListMoreInformationReply_MoreInformation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListMoreInformationReply_MoreInformation copyWith(void Function(ListMoreInformationReply_MoreInformation) updates) => super.copyWith((message) => updates(message as ListMoreInformationReply_MoreInformation)) as ListMoreInformationReply_MoreInformation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListMoreInformationReply_MoreInformation create() => ListMoreInformationReply_MoreInformation._();
  ListMoreInformationReply_MoreInformation createEmptyInstance() => create();
  static $pb.PbList<ListMoreInformationReply_MoreInformation> createRepeated() => $pb.PbList<ListMoreInformationReply_MoreInformation>();
  @$core.pragma('dart2js:noInline')
  static ListMoreInformationReply_MoreInformation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListMoreInformationReply_MoreInformation>(create);
  static ListMoreInformationReply_MoreInformation? _defaultInstance;

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

class ListMoreInformationReply extends $pb.GeneratedMessage {
  factory ListMoreInformationReply({
    $core.Iterable<ListMoreInformationReply_MoreInformation>? infos,
  }) {
    final $result = create();
    if (infos != null) {
      $result.infos.addAll(infos);
    }
    return $result;
  }
  ListMoreInformationReply._() : super();
  factory ListMoreInformationReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListMoreInformationReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListMoreInformationReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<ListMoreInformationReply_MoreInformation>(1, _omitFieldNames ? '' : 'infos', $pb.PbFieldType.PM, subBuilder: ListMoreInformationReply_MoreInformation.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListMoreInformationReply clone() => ListMoreInformationReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListMoreInformationReply copyWith(void Function(ListMoreInformationReply) updates) => super.copyWith((message) => updates(message as ListMoreInformationReply)) as ListMoreInformationReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListMoreInformationReply create() => ListMoreInformationReply._();
  ListMoreInformationReply createEmptyInstance() => create();
  static $pb.PbList<ListMoreInformationReply> createRepeated() => $pb.PbList<ListMoreInformationReply>();
  @$core.pragma('dart2js:noInline')
  static ListMoreInformationReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListMoreInformationReply>(create);
  static ListMoreInformationReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ListMoreInformationReply_MoreInformation> get infos => $_getList(0);
}

class ListOpeningTimesRequest extends $pb.GeneratedMessage {
  factory ListOpeningTimesRequest({
    $core.String? language,
  }) {
    final $result = create();
    if (language != null) {
      $result.language = language;
    }
    return $result;
  }
  ListOpeningTimesRequest._() : super();
  factory ListOpeningTimesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListOpeningTimesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListOpeningTimesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'language')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListOpeningTimesRequest clone() => ListOpeningTimesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListOpeningTimesRequest copyWith(void Function(ListOpeningTimesRequest) updates) => super.copyWith((message) => updates(message as ListOpeningTimesRequest)) as ListOpeningTimesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListOpeningTimesRequest create() => ListOpeningTimesRequest._();
  ListOpeningTimesRequest createEmptyInstance() => create();
  static $pb.PbList<ListOpeningTimesRequest> createRepeated() => $pb.PbList<ListOpeningTimesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListOpeningTimesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListOpeningTimesRequest>(create);
  static ListOpeningTimesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get language => $_getSZ(0);
  @$pb.TagNumber(1)
  set language($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLanguage() => $_has(0);
  @$pb.TagNumber(1)
  void clearLanguage() => clearField(1);
}

class ListOpeningTimesReply extends $pb.GeneratedMessage {
  factory ListOpeningTimesReply({
    $core.Iterable<OpeningTimesMsgElement>? facilities,
  }) {
    final $result = create();
    if (facilities != null) {
      $result.facilities.addAll(facilities);
    }
    return $result;
  }
  ListOpeningTimesReply._() : super();
  factory ListOpeningTimesReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListOpeningTimesReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListOpeningTimesReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<OpeningTimesMsgElement>(1, _omitFieldNames ? '' : 'facilities', $pb.PbFieldType.PM, subBuilder: OpeningTimesMsgElement.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListOpeningTimesReply clone() => ListOpeningTimesReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListOpeningTimesReply copyWith(void Function(ListOpeningTimesReply) updates) => super.copyWith((message) => updates(message as ListOpeningTimesReply)) as ListOpeningTimesReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListOpeningTimesReply create() => ListOpeningTimesReply._();
  ListOpeningTimesReply createEmptyInstance() => create();
  static $pb.PbList<ListOpeningTimesReply> createRepeated() => $pb.PbList<ListOpeningTimesReply>();
  @$core.pragma('dart2js:noInline')
  static ListOpeningTimesReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListOpeningTimesReply>(create);
  static ListOpeningTimesReply? _defaultInstance;

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

class ListStudyRoomsRequest extends $pb.GeneratedMessage {
  factory ListStudyRoomsRequest() => create();
  ListStudyRoomsRequest._() : super();
  factory ListStudyRoomsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListStudyRoomsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListStudyRoomsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListStudyRoomsRequest clone() => ListStudyRoomsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListStudyRoomsRequest copyWith(void Function(ListStudyRoomsRequest) updates) => super.copyWith((message) => updates(message as ListStudyRoomsRequest)) as ListStudyRoomsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListStudyRoomsRequest create() => ListStudyRoomsRequest._();
  ListStudyRoomsRequest createEmptyInstance() => create();
  static $pb.PbList<ListStudyRoomsRequest> createRepeated() => $pb.PbList<ListStudyRoomsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListStudyRoomsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListStudyRoomsRequest>(create);
  static ListStudyRoomsRequest? _defaultInstance;
}

class ListStudyRoomsReply extends $pb.GeneratedMessage {
  factory ListStudyRoomsReply({
    $core.Iterable<StudyRoomMsgElement>? rooms,
  }) {
    final $result = create();
    if (rooms != null) {
      $result.rooms.addAll(rooms);
    }
    return $result;
  }
  ListStudyRoomsReply._() : super();
  factory ListStudyRoomsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListStudyRoomsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListStudyRoomsReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<StudyRoomMsgElement>(1, _omitFieldNames ? '' : 'rooms', $pb.PbFieldType.PM, subBuilder: StudyRoomMsgElement.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListStudyRoomsReply clone() => ListStudyRoomsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListStudyRoomsReply copyWith(void Function(ListStudyRoomsReply) updates) => super.copyWith((message) => updates(message as ListStudyRoomsReply)) as ListStudyRoomsReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListStudyRoomsReply create() => ListStudyRoomsReply._();
  ListStudyRoomsReply createEmptyInstance() => create();
  static $pb.PbList<ListStudyRoomsReply> createRepeated() => $pb.PbList<ListStudyRoomsReply>();
  @$core.pragma('dart2js:noInline')
  static ListStudyRoomsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListStudyRoomsReply>(create);
  static ListStudyRoomsReply? _defaultInstance;

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

class ListMoviesRequest extends $pb.GeneratedMessage {
  factory ListMoviesRequest({
    $core.int? lastId,
    $1.Timestamp? oldestDateAt,
  }) {
    final $result = create();
    if (lastId != null) {
      $result.lastId = lastId;
    }
    if (oldestDateAt != null) {
      $result.oldestDateAt = oldestDateAt;
    }
    return $result;
  }
  ListMoviesRequest._() : super();
  factory ListMoviesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListMoviesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListMoviesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'lastId', $pb.PbFieldType.O3)
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'oldestDateAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListMoviesRequest clone() => ListMoviesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListMoviesRequest copyWith(void Function(ListMoviesRequest) updates) => super.copyWith((message) => updates(message as ListMoviesRequest)) as ListMoviesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListMoviesRequest create() => ListMoviesRequest._();
  ListMoviesRequest createEmptyInstance() => create();
  static $pb.PbList<ListMoviesRequest> createRepeated() => $pb.PbList<ListMoviesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListMoviesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListMoviesRequest>(create);
  static ListMoviesRequest? _defaultInstance;

  /// the last Id you have requested. Use -1 to get all movies
  @$pb.TagNumber(1)
  $core.int get lastId => $_getIZ(0);
  @$pb.TagNumber(1)
  set lastId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastId() => clearField(1);

  /// the oldest time you want to be included in the response
  @$pb.TagNumber(2)
  $1.Timestamp get oldestDateAt => $_getN(1);
  @$pb.TagNumber(2)
  set oldestDateAt($1.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOldestDateAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearOldestDateAt() => clearField(2);
  @$pb.TagNumber(2)
  $1.Timestamp ensureOldestDateAt() => $_ensure(1);
}

class ListMoviesReply extends $pb.GeneratedMessage {
  factory ListMoviesReply({
    $core.Iterable<Movie>? movies,
  }) {
    final $result = create();
    if (movies != null) {
      $result.movies.addAll(movies);
    }
    return $result;
  }
  ListMoviesReply._() : super();
  factory ListMoviesReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListMoviesReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListMoviesReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..pc<Movie>(1, _omitFieldNames ? '' : 'movies', $pb.PbFieldType.PM, subBuilder: Movie.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListMoviesReply clone() => ListMoviesReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListMoviesReply copyWith(void Function(ListMoviesReply) updates) => super.copyWith((message) => updates(message as ListMoviesReply)) as ListMoviesReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListMoviesReply create() => ListMoviesReply._();
  ListMoviesReply createEmptyInstance() => create();
  static $pb.PbList<ListMoviesReply> createRepeated() => $pb.PbList<ListMoviesReply>();
  @$core.pragma('dart2js:noInline')
  static ListMoviesReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListMoviesReply>(create);
  static ListMoviesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Movie> get movies => $_getList(0);
}

class Movie extends $pb.GeneratedMessage {
  factory Movie({
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
    $core.String? coverUrl,
  }) {
    final $result = create();
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
    if (coverUrl != null) {
      $result.coverUrl = coverUrl;
    }
    return $result;
  }
  Movie._() : super();
  factory Movie.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Movie.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Movie', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
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
    ..aOS(17, _omitFieldNames ? '' : 'coverUrl')
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

  @$pb.TagNumber(3)
  $fixnum.Int64 get movieId => $_getI64(0);
  @$pb.TagNumber(3)
  set movieId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasMovieId() => $_has(0);
  @$pb.TagNumber(3)
  void clearMovieId() => clearField(3);

  @$pb.TagNumber(4)
  $1.Timestamp get date => $_getN(1);
  @$pb.TagNumber(4)
  set date($1.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDate() => $_has(1);
  @$pb.TagNumber(4)
  void clearDate() => clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureDate() => $_ensure(1);

  @$pb.TagNumber(5)
  $1.Timestamp get created => $_getN(2);
  @$pb.TagNumber(5)
  set created($1.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreated() => $_has(2);
  @$pb.TagNumber(5)
  void clearCreated() => clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureCreated() => $_ensure(2);

  @$pb.TagNumber(6)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(6)
  set title($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(6)
  void clearTitle() => clearField(6);

  /// release year of the movie
  @$pb.TagNumber(7)
  $core.String get releaseYear => $_getSZ(4);
  @$pb.TagNumber(7)
  set releaseYear($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(7)
  $core.bool hasReleaseYear() => $_has(4);
  @$pb.TagNumber(7)
  void clearReleaseYear() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get runtime => $_getSZ(5);
  @$pb.TagNumber(8)
  set runtime($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(8)
  $core.bool hasRuntime() => $_has(5);
  @$pb.TagNumber(8)
  void clearRuntime() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get genre => $_getSZ(6);
  @$pb.TagNumber(9)
  set genre($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(9)
  $core.bool hasGenre() => $_has(6);
  @$pb.TagNumber(9)
  void clearGenre() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get director => $_getSZ(7);
  @$pb.TagNumber(10)
  set director($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(10)
  $core.bool hasDirector() => $_has(7);
  @$pb.TagNumber(10)
  void clearDirector() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get actors => $_getSZ(8);
  @$pb.TagNumber(11)
  set actors($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(11)
  $core.bool hasActors() => $_has(8);
  @$pb.TagNumber(11)
  void clearActors() => clearField(11);

  /// imdb rating
  @$pb.TagNumber(12)
  $core.String get imdbRating => $_getSZ(9);
  @$pb.TagNumber(12)
  set imdbRating($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(12)
  $core.bool hasImdbRating() => $_has(9);
  @$pb.TagNumber(12)
  void clearImdbRating() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get description => $_getSZ(10);
  @$pb.TagNumber(13)
  set description($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(13)
  $core.bool hasDescription() => $_has(10);
  @$pb.TagNumber(13)
  void clearDescription() => clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get coverId => $_getI64(11);
  @$pb.TagNumber(14)
  set coverId($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(14)
  $core.bool hasCoverId() => $_has(11);
  @$pb.TagNumber(14)
  void clearCoverId() => clearField(14);

  /// Where to find additional information about this movie
  @$pb.TagNumber(16)
  $core.String get link => $_getSZ(12);
  @$pb.TagNumber(16)
  set link($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(16)
  $core.bool hasLink() => $_has(12);
  @$pb.TagNumber(16)
  void clearLink() => clearField(16);

  /// Where to find a cover image for this movie
  @$pb.TagNumber(17)
  $core.String get coverUrl => $_getSZ(13);
  @$pb.TagNumber(17)
  set coverUrl($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(17)
  $core.bool hasCoverUrl() => $_has(13);
  @$pb.TagNumber(17)
  void clearCoverUrl() => clearField(17);
}

class CreateFeedbackRequest extends $pb.GeneratedMessage {
  factory CreateFeedbackRequest({
    CreateFeedbackRequest_Recipient? recipient,
    $core.String? fromEmail,
    $core.String? message,
    Coordinate? location,
    $core.String? osVersion,
    $core.String? appVersion,
    $core.List<$core.int>? attachment,
  }) {
    final $result = create();
    if (recipient != null) {
      $result.recipient = recipient;
    }
    if (fromEmail != null) {
      $result.fromEmail = fromEmail;
    }
    if (message != null) {
      $result.message = message;
    }
    if (location != null) {
      $result.location = location;
    }
    if (osVersion != null) {
      $result.osVersion = osVersion;
    }
    if (appVersion != null) {
      $result.appVersion = appVersion;
    }
    if (attachment != null) {
      $result.attachment = attachment;
    }
    return $result;
  }
  CreateFeedbackRequest._() : super();
  factory CreateFeedbackRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateFeedbackRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateFeedbackRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..e<CreateFeedbackRequest_Recipient>(1, _omitFieldNames ? '' : 'recipient', $pb.PbFieldType.OE, defaultOrMaker: CreateFeedbackRequest_Recipient.TUM_DEV, valueOf: CreateFeedbackRequest_Recipient.valueOf, enumValues: CreateFeedbackRequest_Recipient.values)
    ..aOS(2, _omitFieldNames ? '' : 'fromEmail')
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..aOM<Coordinate>(4, _omitFieldNames ? '' : 'location', subBuilder: Coordinate.create)
    ..aOS(5, _omitFieldNames ? '' : 'osVersion')
    ..aOS(6, _omitFieldNames ? '' : 'appVersion')
    ..a<$core.List<$core.int>>(7, _omitFieldNames ? '' : 'attachment', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateFeedbackRequest clone() => CreateFeedbackRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateFeedbackRequest copyWith(void Function(CreateFeedbackRequest) updates) => super.copyWith((message) => updates(message as CreateFeedbackRequest)) as CreateFeedbackRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFeedbackRequest create() => CreateFeedbackRequest._();
  CreateFeedbackRequest createEmptyInstance() => create();
  static $pb.PbList<CreateFeedbackRequest> createRepeated() => $pb.PbList<CreateFeedbackRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateFeedbackRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateFeedbackRequest>(create);
  static CreateFeedbackRequest? _defaultInstance;

  /// who is the feedback for
  @$pb.TagNumber(1)
  CreateFeedbackRequest_Recipient get recipient => $_getN(0);
  @$pb.TagNumber(1)
  set recipient(CreateFeedbackRequest_Recipient v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRecipient() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecipient() => clearField(1);

  /// the email address of the user
  @$pb.TagNumber(2)
  $core.String get fromEmail => $_getSZ(1);
  @$pb.TagNumber(2)
  set fromEmail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFromEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromEmail() => clearField(2);

  /// The actual message
  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  /// Optional location which the user can choose (data protection) to attach or not
  @$pb.TagNumber(4)
  Coordinate get location => $_getN(3);
  @$pb.TagNumber(4)
  set location(Coordinate v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasLocation() => $_has(3);
  @$pb.TagNumber(4)
  void clearLocation() => clearField(4);
  @$pb.TagNumber(4)
  Coordinate ensureLocation() => $_ensure(3);

  /// Optional os information which the user can choose (data protection) to attach or not
  @$pb.TagNumber(5)
  $core.String get osVersion => $_getSZ(4);
  @$pb.TagNumber(5)
  set osVersion($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOsVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearOsVersion() => clearField(5);

  /// Optional app information which the user can choose (data protection) to attach or not
  @$pb.TagNumber(6)
  $core.String get appVersion => $_getSZ(5);
  @$pb.TagNumber(6)
  set appVersion($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAppVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearAppVersion() => clearField(6);

  /// Optional file in Base64.
  /// Accepted file formats: jpeg, jpg, png, webp, md, txt, pdf
  /// Maximum file size 4MB as by Protobuf maximum per request message size
  @$pb.TagNumber(7)
  $core.List<$core.int> get attachment => $_getN(6);
  @$pb.TagNumber(7)
  set attachment($core.List<$core.int> v) { $_setBytes(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAttachment() => $_has(6);
  @$pb.TagNumber(7)
  void clearAttachment() => clearField(7);
}

class Coordinate extends $pb.GeneratedMessage {
  factory Coordinate({
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final $result = create();
    if (latitude != null) {
      $result.latitude = latitude;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    return $result;
  }
  Coordinate._() : super();
  factory Coordinate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Coordinate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Coordinate', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Coordinate clone() => Coordinate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Coordinate copyWith(void Function(Coordinate) updates) => super.copyWith((message) => updates(message as Coordinate)) as Coordinate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Coordinate create() => Coordinate._();
  Coordinate createEmptyInstance() => create();
  static $pb.PbList<Coordinate> createRepeated() => $pb.PbList<Coordinate>();
  @$core.pragma('dart2js:noInline')
  static Coordinate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Coordinate>(create);
  static Coordinate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get latitude => $_getN(0);
  @$pb.TagNumber(1)
  set latitude($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLatitude() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatitude() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get longitude => $_getN(1);
  @$pb.TagNumber(2)
  set longitude($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLongitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLongitude() => clearField(2);
}

class CreateFeedbackReply extends $pb.GeneratedMessage {
  factory CreateFeedbackReply() => create();
  CreateFeedbackReply._() : super();
  factory CreateFeedbackReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateFeedbackReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateFeedbackReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateFeedbackReply clone() => CreateFeedbackReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateFeedbackReply copyWith(void Function(CreateFeedbackReply) updates) => super.copyWith((message) => updates(message as CreateFeedbackReply)) as CreateFeedbackReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFeedbackReply create() => CreateFeedbackReply._();
  CreateFeedbackReply createEmptyInstance() => create();
  static $pb.PbList<CreateFeedbackReply> createRepeated() => $pb.PbList<CreateFeedbackReply>();
  @$core.pragma('dart2js:noInline')
  static CreateFeedbackReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateFeedbackReply>(create);
  static CreateFeedbackReply? _defaultInstance;
}

class CreateFeedbackImageReply extends $pb.GeneratedMessage {
  factory CreateFeedbackImageReply({
    $core.String? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  CreateFeedbackImageReply._() : super();
  factory CreateFeedbackImageReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateFeedbackImageReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateFeedbackImageReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateFeedbackImageReply clone() => CreateFeedbackImageReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateFeedbackImageReply copyWith(void Function(CreateFeedbackImageReply) updates) => super.copyWith((message) => updates(message as CreateFeedbackImageReply)) as CreateFeedbackImageReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFeedbackImageReply create() => CreateFeedbackImageReply._();
  CreateFeedbackImageReply createEmptyInstance() => create();
  static $pb.PbList<CreateFeedbackImageReply> createRepeated() => $pb.PbList<CreateFeedbackImageReply>();
  @$core.pragma('dart2js:noInline')
  static CreateFeedbackImageReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateFeedbackImageReply>(create);
  static CreateFeedbackImageReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class CreateFeedbackImageRequest extends $pb.GeneratedMessage {
  factory CreateFeedbackImageRequest({
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
  CreateFeedbackImageRequest._() : super();
  factory CreateFeedbackImageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateFeedbackImageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateFeedbackImageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'imageNr', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateFeedbackImageRequest clone() => CreateFeedbackImageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateFeedbackImageRequest copyWith(void Function(CreateFeedbackImageRequest) updates) => super.copyWith((message) => updates(message as CreateFeedbackImageRequest)) as CreateFeedbackImageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFeedbackImageRequest create() => CreateFeedbackImageRequest._();
  CreateFeedbackImageRequest createEmptyInstance() => create();
  static $pb.PbList<CreateFeedbackImageRequest> createRepeated() => $pb.PbList<CreateFeedbackImageRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateFeedbackImageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateFeedbackImageRequest>(create);
  static CreateFeedbackImageRequest? _defaultInstance;

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

class GetMemberRequest extends $pb.GeneratedMessage {
  factory GetMemberRequest({
    $core.String? lrzId,
  }) {
    final $result = create();
    if (lrzId != null) {
      $result.lrzId = lrzId;
    }
    return $result;
  }
  GetMemberRequest._() : super();
  factory GetMemberRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMemberRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMemberRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'lrzId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMemberRequest clone() => GetMemberRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMemberRequest copyWith(void Function(GetMemberRequest) updates) => super.copyWith((message) => updates(message as GetMemberRequest)) as GetMemberRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMemberRequest create() => GetMemberRequest._();
  GetMemberRequest createEmptyInstance() => create();
  static $pb.PbList<GetMemberRequest> createRepeated() => $pb.PbList<GetMemberRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMemberRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMemberRequest>(create);
  static GetMemberRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lrzId => $_getSZ(0);
  @$pb.TagNumber(1)
  set lrzId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLrzId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLrzId() => clearField(1);
}

class GetMemberReply extends $pb.GeneratedMessage {
  factory GetMemberReply({
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
  GetMemberReply._() : super();
  factory GetMemberReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMemberReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMemberReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'lrzId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'memberId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMemberReply clone() => GetMemberReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMemberReply copyWith(void Function(GetMemberReply) updates) => super.copyWith((message) => updates(message as GetMemberReply)) as GetMemberReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMemberReply create() => GetMemberReply._();
  GetMemberReply createEmptyInstance() => create();
  static $pb.PbList<GetMemberReply> createRepeated() => $pb.PbList<GetMemberReply>();
  @$core.pragma('dart2js:noInline')
  static GetMemberReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMemberReply>(create);
  static GetMemberReply? _defaultInstance;

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
