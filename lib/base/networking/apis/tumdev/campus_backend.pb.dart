// This is a generated file - do not edit.
//
// Generated from tumdev/campus_backend.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $1;

import 'campus_backend.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'campus_backend.pbenum.dart';

class CreateDeviceRequest extends $pb.GeneratedMessage {
  factory CreateDeviceRequest({
    $core.String? deviceId,
    $core.String? publicKey,
    DeviceType? deviceType,
  }) {
    final result = CreateDeviceRequest._();
    if (deviceId != null) result.deviceId = deviceId;
    if (publicKey != null) result.publicKey = publicKey;
    if (deviceType != null) result.deviceType = deviceType;
    return result;
  }

  CreateDeviceRequest._();

  factory CreateDeviceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateDeviceRequest()..mergeFromBuffer(data, registry);
  factory CreateDeviceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateDeviceRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateDeviceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: CreateDeviceRequest.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..aOS(2, _omitFieldNames ? '' : 'publicKey')
    ..aE<DeviceType>(3, _omitFieldNames ? '' : 'deviceType',
        enumValues: DeviceType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDeviceRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDeviceRequest copyWith(void Function(CreateDeviceRequest) updates) =>
      super.copyWith((message) => updates(message as CreateDeviceRequest))
          as CreateDeviceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core
      .Deprecated('Use CreateDeviceRequest() / CreateDeviceRequest.new instead')
  static CreateDeviceRequest create() => CreateDeviceRequest._();
  static $pb.GeneratedMessage $_createMessage() => CreateDeviceRequest._();
  @$core.override
  CreateDeviceRequest createEmptyInstance() => CreateDeviceRequest._();
  @$core.pragma('dart2js:noInline')
  static CreateDeviceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateDeviceRequest>(
          CreateDeviceRequest.$_createMessage);
  static CreateDeviceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get publicKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set publicKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  DeviceType get deviceType => $_getN(2);
  @$pb.TagNumber(3)
  set deviceType(DeviceType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDeviceType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceType() => $_clearField(3);
}

class CreateDeviceReply extends $pb.GeneratedMessage {
  factory CreateDeviceReply({
    $core.String? deviceId,
  }) {
    final result = CreateDeviceReply._();
    if (deviceId != null) result.deviceId = deviceId;
    return result;
  }

  CreateDeviceReply._();

  factory CreateDeviceReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateDeviceReply()..mergeFromBuffer(data, registry);
  factory CreateDeviceReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateDeviceReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateDeviceReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: CreateDeviceReply.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDeviceReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDeviceReply copyWith(void Function(CreateDeviceReply) updates) =>
      super.copyWith((message) => updates(message as CreateDeviceReply))
          as CreateDeviceReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use CreateDeviceReply() / CreateDeviceReply.new instead')
  static CreateDeviceReply create() => CreateDeviceReply._();
  static $pb.GeneratedMessage $_createMessage() => CreateDeviceReply._();
  @$core.override
  CreateDeviceReply createEmptyInstance() => CreateDeviceReply._();
  @$core.pragma('dart2js:noInline')
  static CreateDeviceReply getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDeviceReply>(
          CreateDeviceReply.$_createMessage);
  static CreateDeviceReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);
}

class DeleteDeviceRequest extends $pb.GeneratedMessage {
  factory DeleteDeviceRequest({
    $core.String? deviceId,
    DeviceType? deviceType,
  }) {
    final result = DeleteDeviceRequest._();
    if (deviceId != null) result.deviceId = deviceId;
    if (deviceType != null) result.deviceType = deviceType;
    return result;
  }

  DeleteDeviceRequest._();

  factory DeleteDeviceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DeleteDeviceRequest()..mergeFromBuffer(data, registry);
  factory DeleteDeviceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DeleteDeviceRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteDeviceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: DeleteDeviceRequest.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..aE<DeviceType>(2, _omitFieldNames ? '' : 'deviceType',
        enumValues: DeviceType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDeviceRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDeviceRequest copyWith(void Function(DeleteDeviceRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteDeviceRequest))
          as DeleteDeviceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core
      .Deprecated('Use DeleteDeviceRequest() / DeleteDeviceRequest.new instead')
  static DeleteDeviceRequest create() => DeleteDeviceRequest._();
  static $pb.GeneratedMessage $_createMessage() => DeleteDeviceRequest._();
  @$core.override
  DeleteDeviceRequest createEmptyInstance() => DeleteDeviceRequest._();
  @$core.pragma('dart2js:noInline')
  static DeleteDeviceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteDeviceRequest>(
          DeleteDeviceRequest.$_createMessage);
  static DeleteDeviceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  DeviceType get deviceType => $_getN(1);
  @$pb.TagNumber(2)
  set deviceType(DeviceType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDeviceType() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceType() => $_clearField(2);
}

class DeleteDeviceReply extends $pb.GeneratedMessage {
  factory DeleteDeviceReply({
    $core.String? deviceId,
  }) {
    final result = DeleteDeviceReply._();
    if (deviceId != null) result.deviceId = deviceId;
    return result;
  }

  DeleteDeviceReply._();

  factory DeleteDeviceReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DeleteDeviceReply()..mergeFromBuffer(data, registry);
  factory DeleteDeviceReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DeleteDeviceReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteDeviceReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: DeleteDeviceReply.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDeviceReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDeviceReply copyWith(void Function(DeleteDeviceReply) updates) =>
      super.copyWith((message) => updates(message as DeleteDeviceReply))
          as DeleteDeviceReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use DeleteDeviceReply() / DeleteDeviceReply.new instead')
  static DeleteDeviceReply create() => DeleteDeviceReply._();
  static $pb.GeneratedMessage $_createMessage() => DeleteDeviceReply._();
  @$core.override
  DeleteDeviceReply createEmptyInstance() => DeleteDeviceReply._();
  @$core.pragma('dart2js:noInline')
  static DeleteDeviceReply getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteDeviceReply>(
          DeleteDeviceReply.$_createMessage);
  static DeleteDeviceReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);
}

class News extends $pb.GeneratedMessage {
  factory News({
    $fixnum.Int64? id,
    $core.String? title,
    $core.String? text,
    $core.String? link,
    $core.String? imageUrl,
    $core.String? sourceId,
    $1.Timestamp? created,
    $1.Timestamp? date,
    $core.String? sourceIconUrl,
    $core.String? sourceTitle,
  }) {
    final result = News._();
    if (id != null) result.id = id;
    if (title != null) result.title = title;
    if (text != null) result.text = text;
    if (link != null) result.link = link;
    if (imageUrl != null) result.imageUrl = imageUrl;
    if (sourceId != null) result.sourceId = sourceId;
    if (created != null) result.created = created;
    if (date != null) result.date = date;
    if (sourceIconUrl != null) result.sourceIconUrl = sourceIconUrl;
    if (sourceTitle != null) result.sourceTitle = sourceTitle;
    return result;
  }

  News._();

  factory News.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      News()..mergeFromBuffer(data, registry);
  factory News.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      News()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'News',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: News.$_createMessage)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'text')
    ..aOS(4, _omitFieldNames ? '' : 'link')
    ..aOS(5, _omitFieldNames ? '' : 'imageUrl')
    ..aOS(6, _omitFieldNames ? '' : 'sourceId')
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'created',
        subBuilder: $1.Timestamp.$_createMessage)
    ..aOM<$1.Timestamp>(8, _omitFieldNames ? '' : 'date',
        subBuilder: $1.Timestamp.$_createMessage)
    ..aOS(9, _omitFieldNames ? '' : 'sourceIconUrl')
    ..aOS(10, _omitFieldNames ? '' : 'sourceTitle')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  News clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  News copyWith(void Function(News) updates) =>
      super.copyWith((message) => updates(message as News)) as News;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use News() / News.new instead')
  static News create() => News._();
  static $pb.GeneratedMessage $_createMessage() => News._();
  @$core.override
  News createEmptyInstance() => News._();
  @$core.pragma('dart2js:noInline')
  static News getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<News>(News.$_createMessage);
  static News? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(2);
  @$pb.TagNumber(3)
  set text($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);
  @$pb.TagNumber(3)
  void clearText() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get link => $_getSZ(3);
  @$pb.TagNumber(4)
  set link($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLink() => $_has(3);
  @$pb.TagNumber(4)
  void clearLink() => $_clearField(4);

  /// where a news thumbnail is stored. empty string means no image is available
  @$pb.TagNumber(5)
  $core.String get imageUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set imageUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasImageUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearImageUrl() => $_clearField(5);

  /// the id of the news source
  @$pb.TagNumber(6)
  $core.String get sourceId => $_getSZ(5);
  @$pb.TagNumber(6)
  set sourceId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSourceId() => $_has(5);
  @$pb.TagNumber(6)
  void clearSourceId() => $_clearField(6);

  /// when the news item was created in OUR database
  @$pb.TagNumber(7)
  $1.Timestamp get created => $_getN(6);
  @$pb.TagNumber(7)
  set created($1.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasCreated() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreated() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureCreated() => $_ensure(6);

  /// the date of the news item
  @$pb.TagNumber(8)
  $1.Timestamp get date => $_getN(7);
  @$pb.TagNumber(8)
  set date($1.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearDate() => $_clearField(8);
  @$pb.TagNumber(8)
  $1.Timestamp ensureDate() => $_ensure(7);

  /// where the icon can be found
  @$pb.TagNumber(9)
  $core.String get sourceIconUrl => $_getSZ(8);
  @$pb.TagNumber(9)
  set sourceIconUrl($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasSourceIconUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearSourceIconUrl() => $_clearField(9);

  /// human readable title of the news source
  @$pb.TagNumber(10)
  $core.String get sourceTitle => $_getSZ(9);
  @$pb.TagNumber(10)
  set sourceTitle($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasSourceTitle() => $_has(9);
  @$pb.TagNumber(10)
  void clearSourceTitle() => $_clearField(10);
}

class ListNewsReply extends $pb.GeneratedMessage {
  factory ListNewsReply({
    $core.Iterable<News>? news,
  }) {
    final result = ListNewsReply._();
    if (news != null) result.news.addAll(news);
    return result;
  }

  ListNewsReply._();

  factory ListNewsReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListNewsReply()..mergeFromBuffer(data, registry);
  factory ListNewsReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListNewsReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListNewsReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListNewsReply.$_createMessage)
    ..pPM<News>(1, _omitFieldNames ? '' : 'news',
        subBuilder: News.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListNewsReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListNewsReply copyWith(void Function(ListNewsReply) updates) =>
      super.copyWith((message) => updates(message as ListNewsReply))
          as ListNewsReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use ListNewsReply() / ListNewsReply.new instead')
  static ListNewsReply create() => ListNewsReply._();
  static $pb.GeneratedMessage $_createMessage() => ListNewsReply._();
  @$core.override
  ListNewsReply createEmptyInstance() => ListNewsReply._();
  @$core.pragma('dart2js:noInline')
  static ListNewsReply getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNewsReply>(
          ListNewsReply.$_createMessage);
  static ListNewsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<News> get news => $_getList(0);
}

class ListNewsRequest extends $pb.GeneratedMessage {
  factory ListNewsRequest({
    $core.int? lastNewsId,
    $core.int? newsSource,
    $1.Timestamp? oldestDateAt,
  }) {
    final result = ListNewsRequest._();
    if (lastNewsId != null) result.lastNewsId = lastNewsId;
    if (newsSource != null) result.newsSource = newsSource;
    if (oldestDateAt != null) result.oldestDateAt = oldestDateAt;
    return result;
  }

  ListNewsRequest._();

  factory ListNewsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListNewsRequest()..mergeFromBuffer(data, registry);
  factory ListNewsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListNewsRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListNewsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListNewsRequest.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'lastNewsId')
    ..aI(2, _omitFieldNames ? '' : 'newsSource')
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'oldestDateAt',
        subBuilder: $1.Timestamp.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListNewsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListNewsRequest copyWith(void Function(ListNewsRequest) updates) =>
      super.copyWith((message) => updates(message as ListNewsRequest))
          as ListNewsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use ListNewsRequest() / ListNewsRequest.new instead')
  static ListNewsRequest create() => ListNewsRequest._();
  static $pb.GeneratedMessage $_createMessage() => ListNewsRequest._();
  @$core.override
  ListNewsRequest createEmptyInstance() => ListNewsRequest._();
  @$core.pragma('dart2js:noInline')
  static ListNewsRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNewsRequest>(
          ListNewsRequest.$_createMessage);
  static ListNewsRequest? _defaultInstance;

  /// the last id of the news item received. 0 to get all news items
  @$pb.TagNumber(1)
  $core.int get lastNewsId => $_getIZ(0);
  @$pb.TagNumber(1)
  set lastNewsId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLastNewsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastNewsId() => $_clearField(1);

  /// filter by news source id. 0 to get all news items
  @$pb.TagNumber(2)
  $core.int get newsSource => $_getIZ(1);
  @$pb.TagNumber(2)
  set newsSource($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNewsSource() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewsSource() => $_clearField(2);

  /// the oldest time you want to be included in the response
  @$pb.TagNumber(3)
  $1.Timestamp get oldestDateAt => $_getN(2);
  @$pb.TagNumber(3)
  set oldestDateAt($1.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasOldestDateAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearOldestDateAt() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureOldestDateAt() => $_ensure(2);
}

class ListNewsSourcesRequest extends $pb.GeneratedMessage {
  factory ListNewsSourcesRequest() => ListNewsSourcesRequest._();

  ListNewsSourcesRequest._();

  factory ListNewsSourcesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListNewsSourcesRequest()..mergeFromBuffer(data, registry);
  factory ListNewsSourcesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListNewsSourcesRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListNewsSourcesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListNewsSourcesRequest.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListNewsSourcesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListNewsSourcesRequest copyWith(
          void Function(ListNewsSourcesRequest) updates) =>
      super.copyWith((message) => updates(message as ListNewsSourcesRequest))
          as ListNewsSourcesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListNewsSourcesRequest() / ListNewsSourcesRequest.new instead')
  static ListNewsSourcesRequest create() => ListNewsSourcesRequest._();
  static $pb.GeneratedMessage $_createMessage() => ListNewsSourcesRequest._();
  @$core.override
  ListNewsSourcesRequest createEmptyInstance() => ListNewsSourcesRequest._();
  @$core.pragma('dart2js:noInline')
  static ListNewsSourcesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListNewsSourcesRequest>(
          ListNewsSourcesRequest.$_createMessage);
  static ListNewsSourcesRequest? _defaultInstance;
}

class ListNewsSourcesReply extends $pb.GeneratedMessage {
  factory ListNewsSourcesReply({
    $core.Iterable<NewsSource>? sources,
  }) {
    final result = ListNewsSourcesReply._();
    if (sources != null) result.sources.addAll(sources);
    return result;
  }

  ListNewsSourcesReply._();

  factory ListNewsSourcesReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListNewsSourcesReply()..mergeFromBuffer(data, registry);
  factory ListNewsSourcesReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListNewsSourcesReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListNewsSourcesReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListNewsSourcesReply.$_createMessage)
    ..pPM<NewsSource>(1, _omitFieldNames ? '' : 'sources',
        subBuilder: NewsSource.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListNewsSourcesReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListNewsSourcesReply copyWith(void Function(ListNewsSourcesReply) updates) =>
      super.copyWith((message) => updates(message as ListNewsSourcesReply))
          as ListNewsSourcesReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListNewsSourcesReply() / ListNewsSourcesReply.new instead')
  static ListNewsSourcesReply create() => ListNewsSourcesReply._();
  static $pb.GeneratedMessage $_createMessage() => ListNewsSourcesReply._();
  @$core.override
  ListNewsSourcesReply createEmptyInstance() => ListNewsSourcesReply._();
  @$core.pragma('dart2js:noInline')
  static ListNewsSourcesReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListNewsSourcesReply>(
          ListNewsSourcesReply.$_createMessage);
  static ListNewsSourcesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<NewsSource> get sources => $_getList(0);
}

class NewsSource extends $pb.GeneratedMessage {
  factory NewsSource({
    $core.String? source,
    $core.String? title,
    $core.String? iconUrl,
  }) {
    final result = NewsSource._();
    if (source != null) result.source = source;
    if (title != null) result.title = title;
    if (iconUrl != null) result.iconUrl = iconUrl;
    return result;
  }

  NewsSource._();

  factory NewsSource.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      NewsSource()..mergeFromBuffer(data, registry);
  factory NewsSource.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      NewsSource()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewsSource',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: NewsSource.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'source')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'iconUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsSource clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsSource copyWith(void Function(NewsSource) updates) =>
      super.copyWith((message) => updates(message as NewsSource)) as NewsSource;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use NewsSource() / NewsSource.new instead')
  static NewsSource create() => NewsSource._();
  static $pb.GeneratedMessage $_createMessage() => NewsSource._();
  @$core.override
  NewsSource createEmptyInstance() => NewsSource._();
  @$core.pragma('dart2js:noInline')
  static NewsSource getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewsSource>(NewsSource.$_createMessage);
  static NewsSource? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get source => $_getSZ(0);
  @$pb.TagNumber(1)
  set source($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSource() => $_has(0);
  @$pb.TagNumber(1)
  void clearSource() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  /// where the icon can be found
  @$pb.TagNumber(3)
  $core.String get iconUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set iconUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIconUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearIconUrl() => $_clearField(3);
}

class ListNewsAlertsRequest extends $pb.GeneratedMessage {
  factory ListNewsAlertsRequest({
    $core.int? lastNewsAlertId,
  }) {
    final result = ListNewsAlertsRequest._();
    if (lastNewsAlertId != null) result.lastNewsAlertId = lastNewsAlertId;
    return result;
  }

  ListNewsAlertsRequest._();

  factory ListNewsAlertsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListNewsAlertsRequest()..mergeFromBuffer(data, registry);
  factory ListNewsAlertsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListNewsAlertsRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListNewsAlertsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListNewsAlertsRequest.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'lastNewsAlertId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListNewsAlertsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListNewsAlertsRequest copyWith(
          void Function(ListNewsAlertsRequest) updates) =>
      super.copyWith((message) => updates(message as ListNewsAlertsRequest))
          as ListNewsAlertsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListNewsAlertsRequest() / ListNewsAlertsRequest.new instead')
  static ListNewsAlertsRequest create() => ListNewsAlertsRequest._();
  static $pb.GeneratedMessage $_createMessage() => ListNewsAlertsRequest._();
  @$core.override
  ListNewsAlertsRequest createEmptyInstance() => ListNewsAlertsRequest._();
  @$core.pragma('dart2js:noInline')
  static ListNewsAlertsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListNewsAlertsRequest>(
          ListNewsAlertsRequest.$_createMessage);
  static ListNewsAlertsRequest? _defaultInstance;

  /// the last id of the news item received. 0 to get all news items
  @$pb.TagNumber(1)
  $core.int get lastNewsAlertId => $_getIZ(0);
  @$pb.TagNumber(1)
  set lastNewsAlertId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLastNewsAlertId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastNewsAlertId() => $_clearField(1);
}

class ListNewsAlertsReply extends $pb.GeneratedMessage {
  factory ListNewsAlertsReply({
    $core.Iterable<NewsAlert>? alerts,
  }) {
    final result = ListNewsAlertsReply._();
    if (alerts != null) result.alerts.addAll(alerts);
    return result;
  }

  ListNewsAlertsReply._();

  factory ListNewsAlertsReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListNewsAlertsReply()..mergeFromBuffer(data, registry);
  factory ListNewsAlertsReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListNewsAlertsReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListNewsAlertsReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListNewsAlertsReply.$_createMessage)
    ..pPM<NewsAlert>(1, _omitFieldNames ? '' : 'alerts',
        subBuilder: NewsAlert.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListNewsAlertsReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListNewsAlertsReply copyWith(void Function(ListNewsAlertsReply) updates) =>
      super.copyWith((message) => updates(message as ListNewsAlertsReply))
          as ListNewsAlertsReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core
      .Deprecated('Use ListNewsAlertsReply() / ListNewsAlertsReply.new instead')
  static ListNewsAlertsReply create() => ListNewsAlertsReply._();
  static $pb.GeneratedMessage $_createMessage() => ListNewsAlertsReply._();
  @$core.override
  ListNewsAlertsReply createEmptyInstance() => ListNewsAlertsReply._();
  @$core.pragma('dart2js:noInline')
  static ListNewsAlertsReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListNewsAlertsReply>(
          ListNewsAlertsReply.$_createMessage);
  static ListNewsAlertsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<NewsAlert> get alerts => $_getList(0);
}

class NewsAlert extends $pb.GeneratedMessage {
  factory NewsAlert({
    $core.String? imageUrl,
    $core.String? link,
    $1.Timestamp? created,
    $1.Timestamp? from,
    $1.Timestamp? to,
  }) {
    final result = NewsAlert._();
    if (imageUrl != null) result.imageUrl = imageUrl;
    if (link != null) result.link = link;
    if (created != null) result.created = created;
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    return result;
  }

  NewsAlert._();

  factory NewsAlert.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      NewsAlert()..mergeFromBuffer(data, registry);
  factory NewsAlert.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      NewsAlert()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewsAlert',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: NewsAlert.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'imageUrl')
    ..aOS(2, _omitFieldNames ? '' : 'link')
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'created',
        subBuilder: $1.Timestamp.$_createMessage)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'from',
        subBuilder: $1.Timestamp.$_createMessage)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'to',
        subBuilder: $1.Timestamp.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsAlert clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsAlert copyWith(void Function(NewsAlert) updates) =>
      super.copyWith((message) => updates(message as NewsAlert)) as NewsAlert;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use NewsAlert() / NewsAlert.new instead')
  static NewsAlert create() => NewsAlert._();
  static $pb.GeneratedMessage $_createMessage() => NewsAlert._();
  @$core.override
  NewsAlert createEmptyInstance() => NewsAlert._();
  @$core.pragma('dart2js:noInline')
  static NewsAlert getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewsAlert>(NewsAlert.$_createMessage);
  static NewsAlert? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get imageUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set imageUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasImageUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearImageUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get link => $_getSZ(1);
  @$pb.TagNumber(2)
  set link($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLink() => $_has(1);
  @$pb.TagNumber(2)
  void clearLink() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.Timestamp get created => $_getN(2);
  @$pb.TagNumber(3)
  set created($1.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCreated() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreated() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureCreated() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Timestamp get from => $_getN(3);
  @$pb.TagNumber(4)
  set from($1.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasFrom() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrom() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureFrom() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Timestamp get to => $_getN(4);
  @$pb.TagNumber(5)
  set to($1.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasTo() => $_has(4);
  @$pb.TagNumber(5)
  void clearTo() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureTo() => $_ensure(4);
}

class ListCanteenRatingsRequest extends $pb.GeneratedMessage {
  factory ListCanteenRatingsRequest({
    $core.String? canteenId,
    $1.Timestamp? from,
    $1.Timestamp? to,
    $core.int? limit,
    $core.int? offset,
    RatingSortOrder? sortBy,
    $core.bool? onlyWithImages,
    $core.bool? onlyWithComments,
    $core.bool? omitInlineImages,
  }) {
    final result = ListCanteenRatingsRequest._();
    if (canteenId != null) result.canteenId = canteenId;
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (limit != null) result.limit = limit;
    if (offset != null) result.offset = offset;
    if (sortBy != null) result.sortBy = sortBy;
    if (onlyWithImages != null) result.onlyWithImages = onlyWithImages;
    if (onlyWithComments != null) result.onlyWithComments = onlyWithComments;
    if (omitInlineImages != null) result.omitInlineImages = omitInlineImages;
    return result;
  }

  ListCanteenRatingsRequest._();

  factory ListCanteenRatingsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListCanteenRatingsRequest()..mergeFromBuffer(data, registry);
  factory ListCanteenRatingsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListCanteenRatingsRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListCanteenRatingsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListCanteenRatingsRequest.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'canteenId')
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'from',
        subBuilder: $1.Timestamp.$_createMessage)
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'to',
        subBuilder: $1.Timestamp.$_createMessage)
    ..aI(4, _omitFieldNames ? '' : 'limit')
    ..aI(5, _omitFieldNames ? '' : 'offset')
    ..aE<RatingSortOrder>(6, _omitFieldNames ? '' : 'sortBy',
        enumValues: RatingSortOrder.values)
    ..aOB(7, _omitFieldNames ? '' : 'onlyWithImages')
    ..aOB(8, _omitFieldNames ? '' : 'onlyWithComments')
    ..aOB(9, _omitFieldNames ? '' : 'omitInlineImages')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCanteenRatingsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCanteenRatingsRequest copyWith(
          void Function(ListCanteenRatingsRequest) updates) =>
      super.copyWith((message) => updates(message as ListCanteenRatingsRequest))
          as ListCanteenRatingsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListCanteenRatingsRequest() / ListCanteenRatingsRequest.new instead')
  static ListCanteenRatingsRequest create() => ListCanteenRatingsRequest._();
  static $pb.GeneratedMessage $_createMessage() =>
      ListCanteenRatingsRequest._();
  @$core.override
  ListCanteenRatingsRequest createEmptyInstance() =>
      ListCanteenRatingsRequest._();
  @$core.pragma('dart2js:noInline')
  static ListCanteenRatingsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListCanteenRatingsRequest>(
          ListCanteenRatingsRequest.$_createMessage);
  static ListCanteenRatingsRequest? _defaultInstance;

  /// canteenId Mandatory Name of the canteen (EAT-API naming scheme "MENSA_GARCHING")
  @$pb.TagNumber(1)
  $core.String get canteenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set canteenId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCanteenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanteenId() => $_clearField(1);

  /// Optional Parameter to define an interval for the ratings (Lower bound)
  @$pb.TagNumber(2)
  $1.Timestamp get from => $_getN(1);
  @$pb.TagNumber(2)
  set from($1.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Timestamp ensureFrom() => $_ensure(1);

  /// Optional Parameter to define an interval for the ratings (Upper bound)
  @$pb.TagNumber(3)
  $1.Timestamp get to => $_getN(2);
  @$pb.TagNumber(3)
  set to($1.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTo() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureTo() => $_ensure(2);

  /// Optional Parameter defines how many ratings are queried. If all ratings should be queried, enter "-1"
  @$pb.TagNumber(4)
  $core.int get limit => $_getIZ(3);
  @$pb.TagNumber(4)
  set limit($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLimit() => $_clearField(4);

  /// Optional pagination offset (0-based)
  @$pb.TagNumber(5)
  $core.int get offset => $_getIZ(4);
  @$pb.TagNumber(5)
  set offset($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOffset() => $_has(4);
  @$pb.TagNumber(5)
  void clearOffset() => $_clearField(5);

  /// Optional sort order for returned ratings (default: newest first)
  @$pb.TagNumber(6)
  RatingSortOrder get sortBy => $_getN(5);
  @$pb.TagNumber(6)
  set sortBy(RatingSortOrder value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasSortBy() => $_has(5);
  @$pb.TagNumber(6)
  void clearSortBy() => $_clearField(6);

  /// Optional filter: return only ratings with an attached photo
  @$pb.TagNumber(7)
  $core.bool get onlyWithImages => $_getBF(6);
  @$pb.TagNumber(7)
  set onlyWithImages($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasOnlyWithImages() => $_has(6);
  @$pb.TagNumber(7)
  void clearOnlyWithImages() => $_clearField(7);

  /// Optional filter: return only ratings with a non-empty comment
  @$pb.TagNumber(8)
  $core.bool get onlyWithComments => $_getBF(7);
  @$pb.TagNumber(8)
  set onlyWithComments($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasOnlyWithComments() => $_has(7);
  @$pb.TagNumber(8)
  void clearOnlyWithComments() => $_clearField(8);

  /// Optional: omit raw JPEG bytes from SingleRatingReply.image (use image_url instead)
  @$pb.TagNumber(9)
  $core.bool get omitInlineImages => $_getBF(8);
  @$pb.TagNumber(9)
  set omitInlineImages($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasOmitInlineImages() => $_has(8);
  @$pb.TagNumber(9)
  void clearOmitInlineImages() => $_clearField(9);
}

class RatingDistribution extends $pb.GeneratedMessage {
  factory RatingDistribution({
    $fixnum.Int64? stars1,
    $fixnum.Int64? stars2,
    $fixnum.Int64? stars3,
    $fixnum.Int64? stars4,
    $fixnum.Int64? stars5,
  }) {
    final result = RatingDistribution._();
    if (stars1 != null) result.stars1 = stars1;
    if (stars2 != null) result.stars2 = stars2;
    if (stars3 != null) result.stars3 = stars3;
    if (stars4 != null) result.stars4 = stars4;
    if (stars5 != null) result.stars5 = stars5;
    return result;
  }

  RatingDistribution._();

  factory RatingDistribution.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      RatingDistribution()..mergeFromBuffer(data, registry);
  factory RatingDistribution.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      RatingDistribution()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RatingDistribution',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: RatingDistribution.$_createMessage)
    ..aInt64(1, _omitFieldNames ? '' : 'stars1', protoName: 'stars_1')
    ..aInt64(2, _omitFieldNames ? '' : 'stars2', protoName: 'stars_2')
    ..aInt64(3, _omitFieldNames ? '' : 'stars3', protoName: 'stars_3')
    ..aInt64(4, _omitFieldNames ? '' : 'stars4', protoName: 'stars_4')
    ..aInt64(5, _omitFieldNames ? '' : 'stars5', protoName: 'stars_5')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RatingDistribution clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RatingDistribution copyWith(void Function(RatingDistribution) updates) =>
      super.copyWith((message) => updates(message as RatingDistribution))
          as RatingDistribution;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use RatingDistribution() / RatingDistribution.new instead')
  static RatingDistribution create() => RatingDistribution._();
  static $pb.GeneratedMessage $_createMessage() => RatingDistribution._();
  @$core.override
  RatingDistribution createEmptyInstance() => RatingDistribution._();
  @$core.pragma('dart2js:noInline')
  static RatingDistribution getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RatingDistribution>(
          RatingDistribution.$_createMessage);
  static RatingDistribution? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get stars1 => $_getI64(0);
  @$pb.TagNumber(1)
  set stars1($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStars1() => $_has(0);
  @$pb.TagNumber(1)
  void clearStars1() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get stars2 => $_getI64(1);
  @$pb.TagNumber(2)
  set stars2($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStars2() => $_has(1);
  @$pb.TagNumber(2)
  void clearStars2() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get stars3 => $_getI64(2);
  @$pb.TagNumber(3)
  set stars3($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStars3() => $_has(2);
  @$pb.TagNumber(3)
  void clearStars3() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get stars4 => $_getI64(3);
  @$pb.TagNumber(4)
  set stars4($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStars4() => $_has(3);
  @$pb.TagNumber(4)
  void clearStars4() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get stars5 => $_getI64(4);
  @$pb.TagNumber(5)
  set stars5($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStars5() => $_has(4);
  @$pb.TagNumber(5)
  void clearStars5() => $_clearField(5);
}

class ListCanteenRatingsReply extends $pb.GeneratedMessage {
  factory ListCanteenRatingsReply({
    $core.Iterable<SingleRatingReply>? rating,
    $core.double? avg,
    $core.double? std,
    $core.int? min,
    $core.int? max,
    $core.Iterable<RatingTagResult>? ratingTags,
    $fixnum.Int64? ratingCount,
    RatingDistribution? distribution,
    $fixnum.Int64? totalMatching,
    $core.bool? hasMore,
  }) {
    final result = ListCanteenRatingsReply._();
    if (rating != null) result.rating.addAll(rating);
    if (avg != null) result.avg = avg;
    if (std != null) result.std = std;
    if (min != null) result.min = min;
    if (max != null) result.max = max;
    if (ratingTags != null) result.ratingTags.addAll(ratingTags);
    if (ratingCount != null) result.ratingCount = ratingCount;
    if (distribution != null) result.distribution = distribution;
    if (totalMatching != null) result.totalMatching = totalMatching;
    if (hasMore != null) result.hasMore = hasMore;
    return result;
  }

  ListCanteenRatingsReply._();

  factory ListCanteenRatingsReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListCanteenRatingsReply()..mergeFromBuffer(data, registry);
  factory ListCanteenRatingsReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListCanteenRatingsReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListCanteenRatingsReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListCanteenRatingsReply.$_createMessage)
    ..pPM<SingleRatingReply>(1, _omitFieldNames ? '' : 'rating',
        subBuilder: SingleRatingReply.$_createMessage)
    ..aD(2, _omitFieldNames ? '' : 'avg')
    ..aD(3, _omitFieldNames ? '' : 'std')
    ..aI(4, _omitFieldNames ? '' : 'min')
    ..aI(5, _omitFieldNames ? '' : 'max')
    ..pPM<RatingTagResult>(6, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: RatingTagResult.$_createMessage)
    ..aInt64(7, _omitFieldNames ? '' : 'ratingCount')
    ..aOM<RatingDistribution>(8, _omitFieldNames ? '' : 'distribution',
        subBuilder: RatingDistribution.$_createMessage)
    ..aInt64(9, _omitFieldNames ? '' : 'totalMatching')
    ..aOB(10, _omitFieldNames ? '' : 'hasMore')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCanteenRatingsReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCanteenRatingsReply copyWith(
          void Function(ListCanteenRatingsReply) updates) =>
      super.copyWith((message) => updates(message as ListCanteenRatingsReply))
          as ListCanteenRatingsReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListCanteenRatingsReply() / ListCanteenRatingsReply.new instead')
  static ListCanteenRatingsReply create() => ListCanteenRatingsReply._();
  static $pb.GeneratedMessage $_createMessage() => ListCanteenRatingsReply._();
  @$core.override
  ListCanteenRatingsReply createEmptyInstance() => ListCanteenRatingsReply._();
  @$core.pragma('dart2js:noInline')
  static ListCanteenRatingsReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListCanteenRatingsReply>(
          ListCanteenRatingsReply.$_createMessage);
  static ListCanteenRatingsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SingleRatingReply> get rating => $_getList(0);

  @$pb.TagNumber(2)
  $core.double get avg => $_getN(1);
  @$pb.TagNumber(2)
  set avg($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAvg() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvg() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get std => $_getN(2);
  @$pb.TagNumber(3)
  set std($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStd() => $_has(2);
  @$pb.TagNumber(3)
  void clearStd() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get min => $_getIZ(3);
  @$pb.TagNumber(4)
  set min($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMin() => $_has(3);
  @$pb.TagNumber(4)
  void clearMin() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get max => $_getIZ(4);
  @$pb.TagNumber(5)
  set max($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMax() => $_has(4);
  @$pb.TagNumber(5)
  void clearMax() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<RatingTagResult> get ratingTags => $_getList(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get ratingCount => $_getI64(6);
  @$pb.TagNumber(7)
  set ratingCount($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRatingCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearRatingCount() => $_clearField(7);

  @$pb.TagNumber(8)
  RatingDistribution get distribution => $_getN(7);
  @$pb.TagNumber(8)
  set distribution(RatingDistribution value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasDistribution() => $_has(7);
  @$pb.TagNumber(8)
  void clearDistribution() => $_clearField(8);
  @$pb.TagNumber(8)
  RatingDistribution ensureDistribution() => $_ensure(7);

  /// Total ratings matching the active filters (from/to, only_with_images, only_with_comments)
  @$pb.TagNumber(9)
  $fixnum.Int64 get totalMatching => $_getI64(8);
  @$pb.TagNumber(9)
  set totalMatching($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasTotalMatching() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotalMatching() => $_clearField(9);

  /// True if additional ratings exist beyond offset + len(rating)
  @$pb.TagNumber(10)
  $core.bool get hasMore => $_getBF(9);
  @$pb.TagNumber(10)
  set hasMore($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasHasMore() => $_has(9);
  @$pb.TagNumber(10)
  void clearHasMore() => $_clearField(10);
}

class GetDishRatingsRequest extends $pb.GeneratedMessage {
  factory GetDishRatingsRequest({
    $core.String? canteenId,
    $core.String? dish,
    $1.Timestamp? from,
    $1.Timestamp? to,
    $core.int? limit,
    $core.int? offset,
    RatingSortOrder? sortBy,
    $core.bool? onlyWithImages,
    $core.bool? onlyWithComments,
    $core.bool? omitInlineImages,
    $core.bool? includeUnratedFallback,
  }) {
    final result = GetDishRatingsRequest._();
    if (canteenId != null) result.canteenId = canteenId;
    if (dish != null) result.dish = dish;
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (limit != null) result.limit = limit;
    if (offset != null) result.offset = offset;
    if (sortBy != null) result.sortBy = sortBy;
    if (onlyWithImages != null) result.onlyWithImages = onlyWithImages;
    if (onlyWithComments != null) result.onlyWithComments = onlyWithComments;
    if (omitInlineImages != null) result.omitInlineImages = omitInlineImages;
    if (includeUnratedFallback != null)
      result.includeUnratedFallback = includeUnratedFallback;
    return result;
  }

  GetDishRatingsRequest._();

  factory GetDishRatingsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetDishRatingsRequest()..mergeFromBuffer(data, registry);
  factory GetDishRatingsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetDishRatingsRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDishRatingsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: GetDishRatingsRequest.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'canteenId')
    ..aOS(2, _omitFieldNames ? '' : 'dish')
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'from',
        subBuilder: $1.Timestamp.$_createMessage)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'to',
        subBuilder: $1.Timestamp.$_createMessage)
    ..aI(5, _omitFieldNames ? '' : 'limit')
    ..aI(6, _omitFieldNames ? '' : 'offset')
    ..aE<RatingSortOrder>(7, _omitFieldNames ? '' : 'sortBy',
        enumValues: RatingSortOrder.values)
    ..aOB(8, _omitFieldNames ? '' : 'onlyWithImages')
    ..aOB(9, _omitFieldNames ? '' : 'onlyWithComments')
    ..aOB(10, _omitFieldNames ? '' : 'omitInlineImages')
    ..aOB(11, _omitFieldNames ? '' : 'includeUnratedFallback')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDishRatingsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDishRatingsRequest copyWith(
          void Function(GetDishRatingsRequest) updates) =>
      super.copyWith((message) => updates(message as GetDishRatingsRequest))
          as GetDishRatingsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use GetDishRatingsRequest() / GetDishRatingsRequest.new instead')
  static GetDishRatingsRequest create() => GetDishRatingsRequest._();
  static $pb.GeneratedMessage $_createMessage() => GetDishRatingsRequest._();
  @$core.override
  GetDishRatingsRequest createEmptyInstance() => GetDishRatingsRequest._();
  @$core.pragma('dart2js:noInline')
  static GetDishRatingsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDishRatingsRequest>(
          GetDishRatingsRequest.$_createMessage);
  static GetDishRatingsRequest? _defaultInstance;

  /// Mandatory Name of the canteen (EAT-API naming scheme "MENSA_GARCHING")
  @$pb.TagNumber(1)
  $core.String get canteenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set canteenId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCanteenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanteenId() => $_clearField(1);

  /// Mandatory Name of the dish (EAT-API naming scheme)
  /// Must be available in the given cafeteria
  @$pb.TagNumber(2)
  $core.String get dish => $_getSZ(1);
  @$pb.TagNumber(2)
  set dish($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDish() => $_has(1);
  @$pb.TagNumber(2)
  void clearDish() => $_clearField(2);

  /// Optional Parameter to define an interval for the ratings (Lower bound)
  @$pb.TagNumber(3)
  $1.Timestamp get from => $_getN(2);
  @$pb.TagNumber(3)
  set from($1.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrom() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureFrom() => $_ensure(2);

  /// Optional Parameter to define an interval for the ratings (Upper bound)
  @$pb.TagNumber(4)
  $1.Timestamp get to => $_getN(3);
  @$pb.TagNumber(4)
  set to($1.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTo() => $_has(3);
  @$pb.TagNumber(4)
  void clearTo() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureTo() => $_ensure(3);

  /// Optional Parameter defines how many ratings are queried. If all ratings should be queried, enter "-1"
  @$pb.TagNumber(5)
  $core.int get limit => $_getIZ(4);
  @$pb.TagNumber(5)
  set limit($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearLimit() => $_clearField(5);

  /// Optional pagination offset (0-based)
  @$pb.TagNumber(6)
  $core.int get offset => $_getIZ(5);
  @$pb.TagNumber(6)
  set offset($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasOffset() => $_has(5);
  @$pb.TagNumber(6)
  void clearOffset() => $_clearField(6);

  /// Optional sort order for returned ratings (default: newest first)
  @$pb.TagNumber(7)
  RatingSortOrder get sortBy => $_getN(6);
  @$pb.TagNumber(7)
  set sortBy(RatingSortOrder value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasSortBy() => $_has(6);
  @$pb.TagNumber(7)
  void clearSortBy() => $_clearField(7);

  /// Optional filter: return only ratings with an attached photo
  @$pb.TagNumber(8)
  $core.bool get onlyWithImages => $_getBF(7);
  @$pb.TagNumber(8)
  set onlyWithImages($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasOnlyWithImages() => $_has(7);
  @$pb.TagNumber(8)
  void clearOnlyWithImages() => $_clearField(8);

  /// Optional filter: return only ratings with a non-empty comment
  @$pb.TagNumber(9)
  $core.bool get onlyWithComments => $_getBF(8);
  @$pb.TagNumber(9)
  set onlyWithComments($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasOnlyWithComments() => $_has(8);
  @$pb.TagNumber(9)
  void clearOnlyWithComments() => $_clearField(9);

  /// Optional: omit raw JPEG bytes from SingleRatingReply.image (use image_url instead)
  @$pb.TagNumber(10)
  $core.bool get omitInlineImages => $_getBF(9);
  @$pb.TagNumber(10)
  set omitInlineImages($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasOmitInlineImages() => $_has(9);
  @$pb.TagNumber(10)
  void clearOmitInlineImages() => $_clearField(10);

  /// Optional: when true, returns rating_count=0 with name_tags fallback instead of NotFound if a dish has no direct ratings yet.
  @$pb.TagNumber(11)
  $core.bool get includeUnratedFallback => $_getBF(10);
  @$pb.TagNumber(11)
  set includeUnratedFallback($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasIncludeUnratedFallback() => $_has(10);
  @$pb.TagNumber(11)
  void clearIncludeUnratedFallback() => $_clearField(11);
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
    $fixnum.Int64? ratingCount,
    RatingDistribution? distribution,
    $fixnum.Int64? totalMatching,
    $core.bool? hasMore,
    $core.bool? soldOut,
    $core.int? soldOutReportCount,
  }) {
    final result = GetDishRatingsReply._();
    if (rating != null) result.rating.addAll(rating);
    if (avg != null) result.avg = avg;
    if (std != null) result.std = std;
    if (min != null) result.min = min;
    if (max != null) result.max = max;
    if (ratingTags != null) result.ratingTags.addAll(ratingTags);
    if (nameTags != null) result.nameTags.addAll(nameTags);
    if (ratingCount != null) result.ratingCount = ratingCount;
    if (distribution != null) result.distribution = distribution;
    if (totalMatching != null) result.totalMatching = totalMatching;
    if (hasMore != null) result.hasMore = hasMore;
    if (soldOut != null) result.soldOut = soldOut;
    if (soldOutReportCount != null)
      result.soldOutReportCount = soldOutReportCount;
    return result;
  }

  GetDishRatingsReply._();

  factory GetDishRatingsReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetDishRatingsReply()..mergeFromBuffer(data, registry);
  factory GetDishRatingsReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetDishRatingsReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDishRatingsReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: GetDishRatingsReply.$_createMessage)
    ..pPM<SingleRatingReply>(1, _omitFieldNames ? '' : 'rating',
        subBuilder: SingleRatingReply.$_createMessage)
    ..aD(2, _omitFieldNames ? '' : 'avg')
    ..aD(3, _omitFieldNames ? '' : 'std')
    ..aI(4, _omitFieldNames ? '' : 'min')
    ..aI(5, _omitFieldNames ? '' : 'max')
    ..pPM<RatingTagResult>(6, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: RatingTagResult.$_createMessage)
    ..pPM<RatingTagResult>(7, _omitFieldNames ? '' : 'nameTags',
        subBuilder: RatingTagResult.$_createMessage)
    ..aInt64(8, _omitFieldNames ? '' : 'ratingCount')
    ..aOM<RatingDistribution>(9, _omitFieldNames ? '' : 'distribution',
        subBuilder: RatingDistribution.$_createMessage)
    ..aInt64(10, _omitFieldNames ? '' : 'totalMatching')
    ..aOB(11, _omitFieldNames ? '' : 'hasMore')
    ..aOB(12, _omitFieldNames ? '' : 'soldOut')
    ..aI(13, _omitFieldNames ? '' : 'soldOutReportCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDishRatingsReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDishRatingsReply copyWith(void Function(GetDishRatingsReply) updates) =>
      super.copyWith((message) => updates(message as GetDishRatingsReply))
          as GetDishRatingsReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core
      .Deprecated('Use GetDishRatingsReply() / GetDishRatingsReply.new instead')
  static GetDishRatingsReply create() => GetDishRatingsReply._();
  static $pb.GeneratedMessage $_createMessage() => GetDishRatingsReply._();
  @$core.override
  GetDishRatingsReply createEmptyInstance() => GetDishRatingsReply._();
  @$core.pragma('dart2js:noInline')
  static GetDishRatingsReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDishRatingsReply>(
          GetDishRatingsReply.$_createMessage);
  static GetDishRatingsReply? _defaultInstance;

  /// a number of actual ratings
  @$pb.TagNumber(1)
  $pb.PbList<SingleRatingReply> get rating => $_getList(0);

  /// average rating for all dish rating tags which were used to rate this dish in this cafeteria
  @$pb.TagNumber(2)
  $core.double get avg => $_getN(1);
  @$pb.TagNumber(2)
  set avg($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAvg() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvg() => $_clearField(2);

  /// std of all dish rating tags which were used to rate this dish in this cafeteria
  @$pb.TagNumber(3)
  $core.double get std => $_getN(2);
  @$pb.TagNumber(3)
  set std($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStd() => $_has(2);
  @$pb.TagNumber(3)
  void clearStd() => $_clearField(3);

  /// minimum of all dish rating tags which were used to rate this dish in this cafeteria
  @$pb.TagNumber(4)
  $core.int get min => $_getIZ(3);
  @$pb.TagNumber(4)
  set min($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMin() => $_has(3);
  @$pb.TagNumber(4)
  void clearMin() => $_clearField(4);

  /// maximum of all dish rating tags which were used to rate this dish in this cafeteria
  @$pb.TagNumber(5)
  $core.int get max => $_getIZ(4);
  @$pb.TagNumber(5)
  set max($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMax() => $_has(4);
  @$pb.TagNumber(5)
  void clearMax() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<RatingTagResult> get ratingTags => $_getList(5);

  @$pb.TagNumber(7)
  $pb.PbList<RatingTagResult> get nameTags => $_getList(6);

  @$pb.TagNumber(8)
  $fixnum.Int64 get ratingCount => $_getI64(7);
  @$pb.TagNumber(8)
  set ratingCount($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRatingCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearRatingCount() => $_clearField(8);

  @$pb.TagNumber(9)
  RatingDistribution get distribution => $_getN(8);
  @$pb.TagNumber(9)
  set distribution(RatingDistribution value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasDistribution() => $_has(8);
  @$pb.TagNumber(9)
  void clearDistribution() => $_clearField(9);
  @$pb.TagNumber(9)
  RatingDistribution ensureDistribution() => $_ensure(8);

  /// Total ratings matching the active filters (from/to, only_with_images, only_with_comments)
  @$pb.TagNumber(10)
  $fixnum.Int64 get totalMatching => $_getI64(9);
  @$pb.TagNumber(10)
  set totalMatching($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasTotalMatching() => $_has(9);
  @$pb.TagNumber(10)
  void clearTotalMatching() => $_clearField(10);

  /// True if additional ratings exist beyond offset + len(rating)
  @$pb.TagNumber(11)
  $core.bool get hasMore => $_getBF(10);
  @$pb.TagNumber(11)
  set hasMore($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasHasMore() => $_has(10);
  @$pb.TagNumber(11)
  void clearHasMore() => $_clearField(11);

  /// True if enough distinct devices reported this dish sold out today
  @$pb.TagNumber(12)
  $core.bool get soldOut => $_getBF(11);
  @$pb.TagNumber(12)
  set soldOut($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasSoldOut() => $_has(11);
  @$pb.TagNumber(12)
  void clearSoldOut() => $_clearField(12);

  /// Number of distinct devices that reported this dish sold out today
  @$pb.TagNumber(13)
  $core.int get soldOutReportCount => $_getIZ(12);
  @$pb.TagNumber(13)
  set soldOutReportCount($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasSoldOutReportCount() => $_has(12);
  @$pb.TagNumber(13)
  void clearSoldOutReportCount() => $_clearField(13);
}

class SingleRatingReply extends $pb.GeneratedMessage {
  factory SingleRatingReply({
    $core.int? points,
    $core.List<$core.int>? image,
    $core.String? comment,
    $core.Iterable<RatingTagNewRequest>? ratingTags,
    $1.Timestamp? visited,
    $fixnum.Int64? ratingId,
    $core.String? imageUrl,
    $core.bool? isOwnRating,
    $1.Timestamp? updatedAt,
    $fixnum.Int64? helpfulCount,
    $core.bool? userVoted,
  }) {
    final result = SingleRatingReply._();
    if (points != null) result.points = points;
    if (image != null) result.image = image;
    if (comment != null) result.comment = comment;
    if (ratingTags != null) result.ratingTags.addAll(ratingTags);
    if (visited != null) result.visited = visited;
    if (ratingId != null) result.ratingId = ratingId;
    if (imageUrl != null) result.imageUrl = imageUrl;
    if (isOwnRating != null) result.isOwnRating = isOwnRating;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (helpfulCount != null) result.helpfulCount = helpfulCount;
    if (userVoted != null) result.userVoted = userVoted;
    return result;
  }

  SingleRatingReply._();

  factory SingleRatingReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      SingleRatingReply()..mergeFromBuffer(data, registry);
  factory SingleRatingReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      SingleRatingReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SingleRatingReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: SingleRatingReply.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'points')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'comment')
    ..pPM<RatingTagNewRequest>(4, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: RatingTagNewRequest.$_createMessage)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'visited',
        subBuilder: $1.Timestamp.$_createMessage)
    ..aInt64(6, _omitFieldNames ? '' : 'ratingId')
    ..aOS(7, _omitFieldNames ? '' : 'imageUrl')
    ..aOB(8, _omitFieldNames ? '' : 'isOwnRating')
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $1.Timestamp.$_createMessage)
    ..aInt64(10, _omitFieldNames ? '' : 'helpfulCount')
    ..aOB(11, _omitFieldNames ? '' : 'userVoted')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SingleRatingReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SingleRatingReply copyWith(void Function(SingleRatingReply) updates) =>
      super.copyWith((message) => updates(message as SingleRatingReply))
          as SingleRatingReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use SingleRatingReply() / SingleRatingReply.new instead')
  static SingleRatingReply create() => SingleRatingReply._();
  static $pb.GeneratedMessage $_createMessage() => SingleRatingReply._();
  @$core.override
  SingleRatingReply createEmptyInstance() => SingleRatingReply._();
  @$core.pragma('dart2js:noInline')
  static SingleRatingReply getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SingleRatingReply>(
          SingleRatingReply.$_createMessage);
  static SingleRatingReply? _defaultInstance;

  /// number in the range 1-5
  @$pb.TagNumber(1)
  $core.int get points => $_getIZ(0);
  @$pb.TagNumber(1)
  set points($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPoints() => $_has(0);
  @$pb.TagNumber(1)
  void clearPoints() => $_clearField(1);

  /// Optional JPEG image in Base64 (omitted when omit_inline_images is true)
  @$pb.TagNumber(2)
  $core.List<$core.int> get image => $_getN(1);
  @$pb.TagNumber(2)
  set image($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => $_clearField(2);

  /// Optional comment (max 256 chars)
  @$pb.TagNumber(3)
  $core.String get comment => $_getSZ(2);
  @$pb.TagNumber(3)
  set comment($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasComment() => $_has(2);
  @$pb.TagNumber(3)
  void clearComment() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<RatingTagNewRequest> get ratingTags => $_getList(3);

  @$pb.TagNumber(5)
  $1.Timestamp get visited => $_getN(4);
  @$pb.TagNumber(5)
  set visited($1.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasVisited() => $_has(4);
  @$pb.TagNumber(5)
  void clearVisited() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureVisited() => $_ensure(4);

  /// Unique identifier of the rating
  @$pb.TagNumber(6)
  $fixnum.Int64 get ratingId => $_getI64(5);
  @$pb.TagNumber(6)
  set ratingId($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRatingId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRatingId() => $_clearField(6);

  /// URL to fetch the rating photo over HTTP with caching; empty if no photo attached
  @$pb.TagNumber(7)
  $core.String get imageUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set imageUrl($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasImageUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearImageUrl() => $_clearField(7);

  /// True if the rating was submitted by the calling device (x-device-id)
  @$pb.TagNumber(8)
  $core.bool get isOwnRating => $_getBF(7);
  @$pb.TagNumber(8)
  set isOwnRating($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasIsOwnRating() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsOwnRating() => $_clearField(8);

  /// Present if the rating was edited after creation
  @$pb.TagNumber(9)
  $1.Timestamp get updatedAt => $_getN(8);
  @$pb.TagNumber(9)
  set updatedAt($1.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasUpdatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearUpdatedAt() => $_clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureUpdatedAt() => $_ensure(8);

  /// Number of helpful votes on this rating
  @$pb.TagNumber(10)
  $fixnum.Int64 get helpfulCount => $_getI64(9);
  @$pb.TagNumber(10)
  set helpfulCount($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasHelpfulCount() => $_has(9);
  @$pb.TagNumber(10)
  void clearHelpfulCount() => $_clearField(10);

  /// True if the calling device has voted this rating helpful
  @$pb.TagNumber(11)
  $core.bool get userVoted => $_getBF(10);
  @$pb.TagNumber(11)
  set userVoted($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasUserVoted() => $_has(10);
  @$pb.TagNumber(11)
  void clearUserVoted() => $_clearField(11);
}

class CreateCanteenRatingReply extends $pb.GeneratedMessage {
  factory CreateCanteenRatingReply({
    $fixnum.Int64? ratingId,
  }) {
    final result = CreateCanteenRatingReply._();
    if (ratingId != null) result.ratingId = ratingId;
    return result;
  }

  CreateCanteenRatingReply._();

  factory CreateCanteenRatingReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateCanteenRatingReply()..mergeFromBuffer(data, registry);
  factory CreateCanteenRatingReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateCanteenRatingReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCanteenRatingReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: CreateCanteenRatingReply.$_createMessage)
    ..aInt64(1, _omitFieldNames ? '' : 'ratingId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCanteenRatingReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCanteenRatingReply copyWith(
          void Function(CreateCanteenRatingReply) updates) =>
      super.copyWith((message) => updates(message as CreateCanteenRatingReply))
          as CreateCanteenRatingReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use CreateCanteenRatingReply() / CreateCanteenRatingReply.new instead')
  static CreateCanteenRatingReply create() => CreateCanteenRatingReply._();
  static $pb.GeneratedMessage $_createMessage() => CreateCanteenRatingReply._();
  @$core.override
  CreateCanteenRatingReply createEmptyInstance() =>
      CreateCanteenRatingReply._();
  @$core.pragma('dart2js:noInline')
  static CreateCanteenRatingReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCanteenRatingReply>(
          CreateCanteenRatingReply.$_createMessage);
  static CreateCanteenRatingReply? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get ratingId => $_getI64(0);
  @$pb.TagNumber(1)
  set ratingId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRatingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRatingId() => $_clearField(1);
}

class CreateCanteenRatingRequest extends $pb.GeneratedMessage {
  factory CreateCanteenRatingRequest({
    $core.int? points,
    $core.String? canteenId,
    $core.List<$core.int>? image,
    $core.Iterable<RatingTag>? ratingTags,
    $core.String? comment,
  }) {
    final result = CreateCanteenRatingRequest._();
    if (points != null) result.points = points;
    if (canteenId != null) result.canteenId = canteenId;
    if (image != null) result.image = image;
    if (ratingTags != null) result.ratingTags.addAll(ratingTags);
    if (comment != null) result.comment = comment;
    return result;
  }

  CreateCanteenRatingRequest._();

  factory CreateCanteenRatingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateCanteenRatingRequest()..mergeFromBuffer(data, registry);
  factory CreateCanteenRatingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateCanteenRatingRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCanteenRatingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: CreateCanteenRatingRequest.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'points')
    ..aOS(2, _omitFieldNames ? '' : 'canteenId')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OY)
    ..pPM<RatingTag>(4, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: RatingTag.$_createMessage)
    ..aOS(6, _omitFieldNames ? '' : 'comment')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCanteenRatingRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCanteenRatingRequest copyWith(
          void Function(CreateCanteenRatingRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateCanteenRatingRequest))
          as CreateCanteenRatingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use CreateCanteenRatingRequest() / CreateCanteenRatingRequest.new instead')
  static CreateCanteenRatingRequest create() => CreateCanteenRatingRequest._();
  static $pb.GeneratedMessage $_createMessage() =>
      CreateCanteenRatingRequest._();
  @$core.override
  CreateCanteenRatingRequest createEmptyInstance() =>
      CreateCanteenRatingRequest._();
  @$core.pragma('dart2js:noInline')
  static CreateCanteenRatingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCanteenRatingRequest>(
          CreateCanteenRatingRequest.$_createMessage);
  static CreateCanteenRatingRequest? _defaultInstance;

  /// number in the range 1-5
  @$pb.TagNumber(1)
  $core.int get points => $_getIZ(0);
  @$pb.TagNumber(1)
  set points($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPoints() => $_has(0);
  @$pb.TagNumber(1)
  void clearPoints() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get canteenId => $_getSZ(1);
  @$pb.TagNumber(2)
  set canteenId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCanteenId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCanteenId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get image => $_getN(2);
  @$pb.TagNumber(3)
  set image($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => $_clearField(3);

  /// Optional list of tag ratings add as many tags with a rating (1-5) of the list of canteenRatingTags
  @$pb.TagNumber(4)
  $pb.PbList<RatingTag> get ratingTags => $_getList(3);

  /// Optional comment (max 256 chars)
  @$pb.TagNumber(6)
  $core.String get comment => $_getSZ(4);
  @$pb.TagNumber(6)
  set comment($core.String value) => $_setString(4, value);
  @$pb.TagNumber(6)
  $core.bool hasComment() => $_has(4);
  @$pb.TagNumber(6)
  void clearComment() => $_clearField(6);
}

class CreateDishRatingReply extends $pb.GeneratedMessage {
  factory CreateDishRatingReply({
    $fixnum.Int64? ratingId,
  }) {
    final result = CreateDishRatingReply._();
    if (ratingId != null) result.ratingId = ratingId;
    return result;
  }

  CreateDishRatingReply._();

  factory CreateDishRatingReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateDishRatingReply()..mergeFromBuffer(data, registry);
  factory CreateDishRatingReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateDishRatingReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateDishRatingReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: CreateDishRatingReply.$_createMessage)
    ..aInt64(1, _omitFieldNames ? '' : 'ratingId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDishRatingReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDishRatingReply copyWith(
          void Function(CreateDishRatingReply) updates) =>
      super.copyWith((message) => updates(message as CreateDishRatingReply))
          as CreateDishRatingReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use CreateDishRatingReply() / CreateDishRatingReply.new instead')
  static CreateDishRatingReply create() => CreateDishRatingReply._();
  static $pb.GeneratedMessage $_createMessage() => CreateDishRatingReply._();
  @$core.override
  CreateDishRatingReply createEmptyInstance() => CreateDishRatingReply._();
  @$core.pragma('dart2js:noInline')
  static CreateDishRatingReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateDishRatingReply>(
          CreateDishRatingReply.$_createMessage);
  static CreateDishRatingReply? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get ratingId => $_getI64(0);
  @$pb.TagNumber(1)
  set ratingId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRatingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRatingId() => $_clearField(1);
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
    final result = CreateDishRatingRequest._();
    if (points != null) result.points = points;
    if (canteenId != null) result.canteenId = canteenId;
    if (dish != null) result.dish = dish;
    if (image != null) result.image = image;
    if (ratingTags != null) result.ratingTags.addAll(ratingTags);
    if (comment != null) result.comment = comment;
    return result;
  }

  CreateDishRatingRequest._();

  factory CreateDishRatingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateDishRatingRequest()..mergeFromBuffer(data, registry);
  factory CreateDishRatingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateDishRatingRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateDishRatingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: CreateDishRatingRequest.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'points')
    ..aOS(2, _omitFieldNames ? '' : 'canteenId')
    ..aOS(3, _omitFieldNames ? '' : 'dish')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OY)
    ..pPM<RatingTag>(5, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: RatingTag.$_createMessage)
    ..aOS(7, _omitFieldNames ? '' : 'comment')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDishRatingRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDishRatingRequest copyWith(
          void Function(CreateDishRatingRequest) updates) =>
      super.copyWith((message) => updates(message as CreateDishRatingRequest))
          as CreateDishRatingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use CreateDishRatingRequest() / CreateDishRatingRequest.new instead')
  static CreateDishRatingRequest create() => CreateDishRatingRequest._();
  static $pb.GeneratedMessage $_createMessage() => CreateDishRatingRequest._();
  @$core.override
  CreateDishRatingRequest createEmptyInstance() => CreateDishRatingRequest._();
  @$core.pragma('dart2js:noInline')
  static CreateDishRatingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateDishRatingRequest>(
          CreateDishRatingRequest.$_createMessage);
  static CreateDishRatingRequest? _defaultInstance;

  /// number in the range 1-5
  @$pb.TagNumber(1)
  $core.int get points => $_getIZ(0);
  @$pb.TagNumber(1)
  set points($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPoints() => $_has(0);
  @$pb.TagNumber(1)
  void clearPoints() => $_clearField(1);

  /// Mandatory Name of the dish (EAT-API naming scheme "MENSA_GARCHING") Must be available in the given cafeteria
  @$pb.TagNumber(2)
  $core.String get canteenId => $_getSZ(1);
  @$pb.TagNumber(2)
  set canteenId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCanteenId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCanteenId() => $_clearField(2);

  /// Mandatory Name of the dish (EAT-API naming scheme)
  /// Must be available in the given cafeteria
  @$pb.TagNumber(3)
  $core.String get dish => $_getSZ(2);
  @$pb.TagNumber(3)
  set dish($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDish() => $_has(2);
  @$pb.TagNumber(3)
  void clearDish() => $_clearField(3);

  /// Optional JPEG image in Base64
  @$pb.TagNumber(4)
  $core.List<$core.int> get image => $_getN(3);
  @$pb.TagNumber(4)
  set image($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasImage() => $_has(3);
  @$pb.TagNumber(4)
  void clearImage() => $_clearField(4);

  /// Optional list of tag ratings add as many tags with a rating (1-5) of the list of dishRatingTags
  @$pb.TagNumber(5)
  $pb.PbList<RatingTag> get ratingTags => $_getList(4);

  /// Optional comment (max 256 chars)
  @$pb.TagNumber(7)
  $core.String get comment => $_getSZ(5);
  @$pb.TagNumber(7)
  set comment($core.String value) => $_setString(5, value);
  @$pb.TagNumber(7)
  $core.bool hasComment() => $_has(5);
  @$pb.TagNumber(7)
  void clearComment() => $_clearField(7);
}

class UpdateDishRatingRequest extends $pb.GeneratedMessage {
  factory UpdateDishRatingRequest({
    $fixnum.Int64? ratingId,
    $core.int? points,
    $core.String? comment,
    $core.Iterable<RatingTag>? ratingTags,
    $core.List<$core.int>? image,
    $core.bool? removeImage,
  }) {
    final result = UpdateDishRatingRequest._();
    if (ratingId != null) result.ratingId = ratingId;
    if (points != null) result.points = points;
    if (comment != null) result.comment = comment;
    if (ratingTags != null) result.ratingTags.addAll(ratingTags);
    if (image != null) result.image = image;
    if (removeImage != null) result.removeImage = removeImage;
    return result;
  }

  UpdateDishRatingRequest._();

  factory UpdateDishRatingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      UpdateDishRatingRequest()..mergeFromBuffer(data, registry);
  factory UpdateDishRatingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      UpdateDishRatingRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateDishRatingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: UpdateDishRatingRequest.$_createMessage)
    ..aInt64(1, _omitFieldNames ? '' : 'ratingId')
    ..aI(2, _omitFieldNames ? '' : 'points')
    ..aOS(3, _omitFieldNames ? '' : 'comment')
    ..pPM<RatingTag>(4, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: RatingTag.$_createMessage)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OY)
    ..aOB(6, _omitFieldNames ? '' : 'removeImage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateDishRatingRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateDishRatingRequest copyWith(
          void Function(UpdateDishRatingRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateDishRatingRequest))
          as UpdateDishRatingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use UpdateDishRatingRequest() / UpdateDishRatingRequest.new instead')
  static UpdateDishRatingRequest create() => UpdateDishRatingRequest._();
  static $pb.GeneratedMessage $_createMessage() => UpdateDishRatingRequest._();
  @$core.override
  UpdateDishRatingRequest createEmptyInstance() => UpdateDishRatingRequest._();
  @$core.pragma('dart2js:noInline')
  static UpdateDishRatingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateDishRatingRequest>(
          UpdateDishRatingRequest.$_createMessage);
  static UpdateDishRatingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get ratingId => $_getI64(0);
  @$pb.TagNumber(1)
  set ratingId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRatingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRatingId() => $_clearField(1);

  /// number in the range 1-5
  @$pb.TagNumber(2)
  $core.int get points => $_getIZ(1);
  @$pb.TagNumber(2)
  set points($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPoints() => $_has(1);
  @$pb.TagNumber(2)
  void clearPoints() => $_clearField(2);

  /// Optional comment (max 256 chars)
  @$pb.TagNumber(3)
  $core.String get comment => $_getSZ(2);
  @$pb.TagNumber(3)
  set comment($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasComment() => $_has(2);
  @$pb.TagNumber(3)
  void clearComment() => $_clearField(3);

  /// Replaces the tag ratings for this rating
  @$pb.TagNumber(4)
  $pb.PbList<RatingTag> get ratingTags => $_getList(3);

  /// Optional replacement JPEG/PNG image
  @$pb.TagNumber(5)
  $core.List<$core.int> get image => $_getN(4);
  @$pb.TagNumber(5)
  set image($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearImage() => $_clearField(5);

  /// If true, removes any existing image from the rating
  @$pb.TagNumber(6)
  $core.bool get removeImage => $_getBF(5);
  @$pb.TagNumber(6)
  set removeImage($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRemoveImage() => $_has(5);
  @$pb.TagNumber(6)
  void clearRemoveImage() => $_clearField(6);
}

class UpdateDishRatingReply extends $pb.GeneratedMessage {
  factory UpdateDishRatingReply({
    $fixnum.Int64? ratingId,
  }) {
    final result = UpdateDishRatingReply._();
    if (ratingId != null) result.ratingId = ratingId;
    return result;
  }

  UpdateDishRatingReply._();

  factory UpdateDishRatingReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      UpdateDishRatingReply()..mergeFromBuffer(data, registry);
  factory UpdateDishRatingReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      UpdateDishRatingReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateDishRatingReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: UpdateDishRatingReply.$_createMessage)
    ..aInt64(1, _omitFieldNames ? '' : 'ratingId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateDishRatingReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateDishRatingReply copyWith(
          void Function(UpdateDishRatingReply) updates) =>
      super.copyWith((message) => updates(message as UpdateDishRatingReply))
          as UpdateDishRatingReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use UpdateDishRatingReply() / UpdateDishRatingReply.new instead')
  static UpdateDishRatingReply create() => UpdateDishRatingReply._();
  static $pb.GeneratedMessage $_createMessage() => UpdateDishRatingReply._();
  @$core.override
  UpdateDishRatingReply createEmptyInstance() => UpdateDishRatingReply._();
  @$core.pragma('dart2js:noInline')
  static UpdateDishRatingReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateDishRatingReply>(
          UpdateDishRatingReply.$_createMessage);
  static UpdateDishRatingReply? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get ratingId => $_getI64(0);
  @$pb.TagNumber(1)
  set ratingId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRatingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRatingId() => $_clearField(1);
}

class DeleteDishRatingRequest extends $pb.GeneratedMessage {
  factory DeleteDishRatingRequest({
    $fixnum.Int64? ratingId,
  }) {
    final result = DeleteDishRatingRequest._();
    if (ratingId != null) result.ratingId = ratingId;
    return result;
  }

  DeleteDishRatingRequest._();

  factory DeleteDishRatingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DeleteDishRatingRequest()..mergeFromBuffer(data, registry);
  factory DeleteDishRatingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DeleteDishRatingRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteDishRatingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: DeleteDishRatingRequest.$_createMessage)
    ..aInt64(1, _omitFieldNames ? '' : 'ratingId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDishRatingRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDishRatingRequest copyWith(
          void Function(DeleteDishRatingRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteDishRatingRequest))
          as DeleteDishRatingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use DeleteDishRatingRequest() / DeleteDishRatingRequest.new instead')
  static DeleteDishRatingRequest create() => DeleteDishRatingRequest._();
  static $pb.GeneratedMessage $_createMessage() => DeleteDishRatingRequest._();
  @$core.override
  DeleteDishRatingRequest createEmptyInstance() => DeleteDishRatingRequest._();
  @$core.pragma('dart2js:noInline')
  static DeleteDishRatingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteDishRatingRequest>(
          DeleteDishRatingRequest.$_createMessage);
  static DeleteDishRatingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get ratingId => $_getI64(0);
  @$pb.TagNumber(1)
  set ratingId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRatingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRatingId() => $_clearField(1);
}

class DeleteDishRatingReply extends $pb.GeneratedMessage {
  factory DeleteDishRatingReply() => DeleteDishRatingReply._();

  DeleteDishRatingReply._();

  factory DeleteDishRatingReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DeleteDishRatingReply()..mergeFromBuffer(data, registry);
  factory DeleteDishRatingReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DeleteDishRatingReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteDishRatingReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: DeleteDishRatingReply.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDishRatingReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDishRatingReply copyWith(
          void Function(DeleteDishRatingReply) updates) =>
      super.copyWith((message) => updates(message as DeleteDishRatingReply))
          as DeleteDishRatingReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use DeleteDishRatingReply() / DeleteDishRatingReply.new instead')
  static DeleteDishRatingReply create() => DeleteDishRatingReply._();
  static $pb.GeneratedMessage $_createMessage() => DeleteDishRatingReply._();
  @$core.override
  DeleteDishRatingReply createEmptyInstance() => DeleteDishRatingReply._();
  @$core.pragma('dart2js:noInline')
  static DeleteDishRatingReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteDishRatingReply>(
          DeleteDishRatingReply.$_createMessage);
  static DeleteDishRatingReply? _defaultInstance;
}

class ReportDishRatingRequest extends $pb.GeneratedMessage {
  factory ReportDishRatingRequest({
    $fixnum.Int64? ratingId,
    $core.String? reason,
  }) {
    final result = ReportDishRatingRequest._();
    if (ratingId != null) result.ratingId = ratingId;
    if (reason != null) result.reason = reason;
    return result;
  }

  ReportDishRatingRequest._();

  factory ReportDishRatingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ReportDishRatingRequest()..mergeFromBuffer(data, registry);
  factory ReportDishRatingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ReportDishRatingRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReportDishRatingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ReportDishRatingRequest.$_createMessage)
    ..aInt64(1, _omitFieldNames ? '' : 'ratingId')
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportDishRatingRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportDishRatingRequest copyWith(
          void Function(ReportDishRatingRequest) updates) =>
      super.copyWith((message) => updates(message as ReportDishRatingRequest))
          as ReportDishRatingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ReportDishRatingRequest() / ReportDishRatingRequest.new instead')
  static ReportDishRatingRequest create() => ReportDishRatingRequest._();
  static $pb.GeneratedMessage $_createMessage() => ReportDishRatingRequest._();
  @$core.override
  ReportDishRatingRequest createEmptyInstance() => ReportDishRatingRequest._();
  @$core.pragma('dart2js:noInline')
  static ReportDishRatingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReportDishRatingRequest>(
          ReportDishRatingRequest.$_createMessage);
  static ReportDishRatingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get ratingId => $_getI64(0);
  @$pb.TagNumber(1)
  set ratingId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRatingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRatingId() => $_clearField(1);

  /// Optional reason for reporting (max 256 chars)
  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => $_clearField(2);
}

class ReportDishRatingReply extends $pb.GeneratedMessage {
  factory ReportDishRatingReply({
    $core.bool? hidden,
  }) {
    final result = ReportDishRatingReply._();
    if (hidden != null) result.hidden = hidden;
    return result;
  }

  ReportDishRatingReply._();

  factory ReportDishRatingReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ReportDishRatingReply()..mergeFromBuffer(data, registry);
  factory ReportDishRatingReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ReportDishRatingReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReportDishRatingReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ReportDishRatingReply.$_createMessage)
    ..aOB(1, _omitFieldNames ? '' : 'hidden')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportDishRatingReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportDishRatingReply copyWith(
          void Function(ReportDishRatingReply) updates) =>
      super.copyWith((message) => updates(message as ReportDishRatingReply))
          as ReportDishRatingReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ReportDishRatingReply() / ReportDishRatingReply.new instead')
  static ReportDishRatingReply create() => ReportDishRatingReply._();
  static $pb.GeneratedMessage $_createMessage() => ReportDishRatingReply._();
  @$core.override
  ReportDishRatingReply createEmptyInstance() => ReportDishRatingReply._();
  @$core.pragma('dart2js:noInline')
  static ReportDishRatingReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReportDishRatingReply>(
          ReportDishRatingReply.$_createMessage);
  static ReportDishRatingReply? _defaultInstance;

  /// True if the rating has been hidden after reaching the report threshold
  @$pb.TagNumber(1)
  $core.bool get hidden => $_getBF(0);
  @$pb.TagNumber(1)
  set hidden($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHidden() => $_has(0);
  @$pb.TagNumber(1)
  void clearHidden() => $_clearField(1);
}

class VoteDishRatingRequest extends $pb.GeneratedMessage {
  factory VoteDishRatingRequest({
    $fixnum.Int64? ratingId,
    $core.bool? helpful,
  }) {
    final result = VoteDishRatingRequest._();
    if (ratingId != null) result.ratingId = ratingId;
    if (helpful != null) result.helpful = helpful;
    return result;
  }

  VoteDishRatingRequest._();

  factory VoteDishRatingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      VoteDishRatingRequest()..mergeFromBuffer(data, registry);
  factory VoteDishRatingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      VoteDishRatingRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VoteDishRatingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: VoteDishRatingRequest.$_createMessage)
    ..aInt64(1, _omitFieldNames ? '' : 'ratingId')
    ..aOB(2, _omitFieldNames ? '' : 'helpful')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoteDishRatingRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoteDishRatingRequest copyWith(
          void Function(VoteDishRatingRequest) updates) =>
      super.copyWith((message) => updates(message as VoteDishRatingRequest))
          as VoteDishRatingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use VoteDishRatingRequest() / VoteDishRatingRequest.new instead')
  static VoteDishRatingRequest create() => VoteDishRatingRequest._();
  static $pb.GeneratedMessage $_createMessage() => VoteDishRatingRequest._();
  @$core.override
  VoteDishRatingRequest createEmptyInstance() => VoteDishRatingRequest._();
  @$core.pragma('dart2js:noInline')
  static VoteDishRatingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VoteDishRatingRequest>(
          VoteDishRatingRequest.$_createMessage);
  static VoteDishRatingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get ratingId => $_getI64(0);
  @$pb.TagNumber(1)
  set ratingId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRatingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRatingId() => $_clearField(1);

  /// True to cast a helpful vote, false to remove a previously cast vote.
  @$pb.TagNumber(2)
  $core.bool get helpful => $_getBF(1);
  @$pb.TagNumber(2)
  set helpful($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHelpful() => $_has(1);
  @$pb.TagNumber(2)
  void clearHelpful() => $_clearField(2);
}

class VoteDishRatingReply extends $pb.GeneratedMessage {
  factory VoteDishRatingReply({
    $fixnum.Int64? helpfulCount,
    $core.bool? userVoted,
  }) {
    final result = VoteDishRatingReply._();
    if (helpfulCount != null) result.helpfulCount = helpfulCount;
    if (userVoted != null) result.userVoted = userVoted;
    return result;
  }

  VoteDishRatingReply._();

  factory VoteDishRatingReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      VoteDishRatingReply()..mergeFromBuffer(data, registry);
  factory VoteDishRatingReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      VoteDishRatingReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VoteDishRatingReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: VoteDishRatingReply.$_createMessage)
    ..aInt64(1, _omitFieldNames ? '' : 'helpfulCount')
    ..aOB(2, _omitFieldNames ? '' : 'userVoted')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoteDishRatingReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoteDishRatingReply copyWith(void Function(VoteDishRatingReply) updates) =>
      super.copyWith((message) => updates(message as VoteDishRatingReply))
          as VoteDishRatingReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core
      .Deprecated('Use VoteDishRatingReply() / VoteDishRatingReply.new instead')
  static VoteDishRatingReply create() => VoteDishRatingReply._();
  static $pb.GeneratedMessage $_createMessage() => VoteDishRatingReply._();
  @$core.override
  VoteDishRatingReply createEmptyInstance() => VoteDishRatingReply._();
  @$core.pragma('dart2js:noInline')
  static VoteDishRatingReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VoteDishRatingReply>(
          VoteDishRatingReply.$_createMessage);
  static VoteDishRatingReply? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get helpfulCount => $_getI64(0);
  @$pb.TagNumber(1)
  set helpfulCount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHelpfulCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearHelpfulCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get userVoted => $_getBF(1);
  @$pb.TagNumber(2)
  set userVoted($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserVoted() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserVoted() => $_clearField(2);
}

class ListDishPhotosRequest extends $pb.GeneratedMessage {
  factory ListDishPhotosRequest({
    $core.String? canteenId,
    $core.String? dish,
    $core.int? limit,
    $core.int? offset,
  }) {
    final result = ListDishPhotosRequest._();
    if (canteenId != null) result.canteenId = canteenId;
    if (dish != null) result.dish = dish;
    if (limit != null) result.limit = limit;
    if (offset != null) result.offset = offset;
    return result;
  }

  ListDishPhotosRequest._();

  factory ListDishPhotosRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListDishPhotosRequest()..mergeFromBuffer(data, registry);
  factory ListDishPhotosRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListDishPhotosRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDishPhotosRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListDishPhotosRequest.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'canteenId')
    ..aOS(2, _omitFieldNames ? '' : 'dish')
    ..aI(3, _omitFieldNames ? '' : 'limit')
    ..aI(4, _omitFieldNames ? '' : 'offset')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDishPhotosRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDishPhotosRequest copyWith(
          void Function(ListDishPhotosRequest) updates) =>
      super.copyWith((message) => updates(message as ListDishPhotosRequest))
          as ListDishPhotosRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListDishPhotosRequest() / ListDishPhotosRequest.new instead')
  static ListDishPhotosRequest create() => ListDishPhotosRequest._();
  static $pb.GeneratedMessage $_createMessage() => ListDishPhotosRequest._();
  @$core.override
  ListDishPhotosRequest createEmptyInstance() => ListDishPhotosRequest._();
  @$core.pragma('dart2js:noInline')
  static ListDishPhotosRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDishPhotosRequest>(
          ListDishPhotosRequest.$_createMessage);
  static ListDishPhotosRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get canteenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set canteenId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCanteenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanteenId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get dish => $_getSZ(1);
  @$pb.TagNumber(2)
  set dish($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDish() => $_has(1);
  @$pb.TagNumber(2)
  void clearDish() => $_clearField(2);

  /// Optional page size (default 12, max 50)
  @$pb.TagNumber(3)
  $core.int get limit => $_getIZ(2);
  @$pb.TagNumber(3)
  set limit($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => $_clearField(3);

  /// Optional pagination offset (0-based)
  @$pb.TagNumber(4)
  $core.int get offset => $_getIZ(3);
  @$pb.TagNumber(4)
  set offset($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOffset() => $_has(3);
  @$pb.TagNumber(4)
  void clearOffset() => $_clearField(4);
}

class DishPhoto extends $pb.GeneratedMessage {
  factory DishPhoto({
    $fixnum.Int64? ratingId,
    $core.String? imageUrl,
    $core.int? points,
    $core.String? comment,
    $fixnum.Int64? helpfulCount,
    $1.Timestamp? visited,
  }) {
    final result = DishPhoto._();
    if (ratingId != null) result.ratingId = ratingId;
    if (imageUrl != null) result.imageUrl = imageUrl;
    if (points != null) result.points = points;
    if (comment != null) result.comment = comment;
    if (helpfulCount != null) result.helpfulCount = helpfulCount;
    if (visited != null) result.visited = visited;
    return result;
  }

  DishPhoto._();

  factory DishPhoto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DishPhoto()..mergeFromBuffer(data, registry);
  factory DishPhoto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DishPhoto()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DishPhoto',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: DishPhoto.$_createMessage)
    ..aInt64(1, _omitFieldNames ? '' : 'ratingId')
    ..aOS(2, _omitFieldNames ? '' : 'imageUrl')
    ..aI(3, _omitFieldNames ? '' : 'points')
    ..aOS(4, _omitFieldNames ? '' : 'comment')
    ..aInt64(5, _omitFieldNames ? '' : 'helpfulCount')
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'visited',
        subBuilder: $1.Timestamp.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DishPhoto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DishPhoto copyWith(void Function(DishPhoto) updates) =>
      super.copyWith((message) => updates(message as DishPhoto)) as DishPhoto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use DishPhoto() / DishPhoto.new instead')
  static DishPhoto create() => DishPhoto._();
  static $pb.GeneratedMessage $_createMessage() => DishPhoto._();
  @$core.override
  DishPhoto createEmptyInstance() => DishPhoto._();
  @$core.pragma('dart2js:noInline')
  static DishPhoto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DishPhoto>(DishPhoto.$_createMessage);
  static DishPhoto? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get ratingId => $_getI64(0);
  @$pb.TagNumber(1)
  set ratingId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRatingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRatingId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get imageUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set imageUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasImageUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearImageUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get points => $_getIZ(2);
  @$pb.TagNumber(3)
  set points($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPoints() => $_has(2);
  @$pb.TagNumber(3)
  void clearPoints() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get comment => $_getSZ(3);
  @$pb.TagNumber(4)
  set comment($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasComment() => $_has(3);
  @$pb.TagNumber(4)
  void clearComment() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get helpfulCount => $_getI64(4);
  @$pb.TagNumber(5)
  set helpfulCount($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasHelpfulCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearHelpfulCount() => $_clearField(5);

  @$pb.TagNumber(6)
  $1.Timestamp get visited => $_getN(5);
  @$pb.TagNumber(6)
  set visited($1.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasVisited() => $_has(5);
  @$pb.TagNumber(6)
  void clearVisited() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureVisited() => $_ensure(5);
}

class ListDishPhotosReply extends $pb.GeneratedMessage {
  factory ListDishPhotosReply({
    $core.Iterable<DishPhoto>? photos,
    $fixnum.Int64? total,
    $core.bool? hasMore,
  }) {
    final result = ListDishPhotosReply._();
    if (photos != null) result.photos.addAll(photos);
    if (total != null) result.total = total;
    if (hasMore != null) result.hasMore = hasMore;
    return result;
  }

  ListDishPhotosReply._();

  factory ListDishPhotosReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListDishPhotosReply()..mergeFromBuffer(data, registry);
  factory ListDishPhotosReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListDishPhotosReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDishPhotosReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListDishPhotosReply.$_createMessage)
    ..pPM<DishPhoto>(1, _omitFieldNames ? '' : 'photos',
        subBuilder: DishPhoto.$_createMessage)
    ..aInt64(2, _omitFieldNames ? '' : 'total')
    ..aOB(3, _omitFieldNames ? '' : 'hasMore')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDishPhotosReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDishPhotosReply copyWith(void Function(ListDishPhotosReply) updates) =>
      super.copyWith((message) => updates(message as ListDishPhotosReply))
          as ListDishPhotosReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core
      .Deprecated('Use ListDishPhotosReply() / ListDishPhotosReply.new instead')
  static ListDishPhotosReply create() => ListDishPhotosReply._();
  static $pb.GeneratedMessage $_createMessage() => ListDishPhotosReply._();
  @$core.override
  ListDishPhotosReply createEmptyInstance() => ListDishPhotosReply._();
  @$core.pragma('dart2js:noInline')
  static ListDishPhotosReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDishPhotosReply>(
          ListDishPhotosReply.$_createMessage);
  static ListDishPhotosReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DishPhoto> get photos => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get total => $_getI64(1);
  @$pb.TagNumber(2)
  set total($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get hasMore => $_getBF(2);
  @$pb.TagNumber(3)
  set hasMore($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHasMore() => $_has(2);
  @$pb.TagNumber(3)
  void clearHasMore() => $_clearField(3);
}

class ListAvailableDishTagsRequest extends $pb.GeneratedMessage {
  factory ListAvailableDishTagsRequest() => ListAvailableDishTagsRequest._();

  ListAvailableDishTagsRequest._();

  factory ListAvailableDishTagsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListAvailableDishTagsRequest()..mergeFromBuffer(data, registry);
  factory ListAvailableDishTagsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListAvailableDishTagsRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAvailableDishTagsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListAvailableDishTagsRequest.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAvailableDishTagsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAvailableDishTagsRequest copyWith(
          void Function(ListAvailableDishTagsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListAvailableDishTagsRequest))
          as ListAvailableDishTagsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListAvailableDishTagsRequest() / ListAvailableDishTagsRequest.new instead')
  static ListAvailableDishTagsRequest create() =>
      ListAvailableDishTagsRequest._();
  static $pb.GeneratedMessage $_createMessage() =>
      ListAvailableDishTagsRequest._();
  @$core.override
  ListAvailableDishTagsRequest createEmptyInstance() =>
      ListAvailableDishTagsRequest._();
  @$core.pragma('dart2js:noInline')
  static ListAvailableDishTagsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAvailableDishTagsRequest>(
          ListAvailableDishTagsRequest.$_createMessage);
  static ListAvailableDishTagsRequest? _defaultInstance;
}

class ListAvailableDishTagsReply extends $pb.GeneratedMessage {
  factory ListAvailableDishTagsReply({
    $core.Iterable<TagsOverview>? ratingTags,
  }) {
    final result = ListAvailableDishTagsReply._();
    if (ratingTags != null) result.ratingTags.addAll(ratingTags);
    return result;
  }

  ListAvailableDishTagsReply._();

  factory ListAvailableDishTagsReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListAvailableDishTagsReply()..mergeFromBuffer(data, registry);
  factory ListAvailableDishTagsReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListAvailableDishTagsReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAvailableDishTagsReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListAvailableDishTagsReply.$_createMessage)
    ..pPM<TagsOverview>(1, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: TagsOverview.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAvailableDishTagsReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAvailableDishTagsReply copyWith(
          void Function(ListAvailableDishTagsReply) updates) =>
      super.copyWith(
              (message) => updates(message as ListAvailableDishTagsReply))
          as ListAvailableDishTagsReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListAvailableDishTagsReply() / ListAvailableDishTagsReply.new instead')
  static ListAvailableDishTagsReply create() => ListAvailableDishTagsReply._();
  static $pb.GeneratedMessage $_createMessage() =>
      ListAvailableDishTagsReply._();
  @$core.override
  ListAvailableDishTagsReply createEmptyInstance() =>
      ListAvailableDishTagsReply._();
  @$core.pragma('dart2js:noInline')
  static ListAvailableDishTagsReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAvailableDishTagsReply>(
          ListAvailableDishTagsReply.$_createMessage);
  static ListAvailableDishTagsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TagsOverview> get ratingTags => $_getList(0);
}

class ListNameTagsRequest extends $pb.GeneratedMessage {
  factory ListNameTagsRequest() => ListNameTagsRequest._();

  ListNameTagsRequest._();

  factory ListNameTagsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListNameTagsRequest()..mergeFromBuffer(data, registry);
  factory ListNameTagsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListNameTagsRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListNameTagsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListNameTagsRequest.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListNameTagsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListNameTagsRequest copyWith(void Function(ListNameTagsRequest) updates) =>
      super.copyWith((message) => updates(message as ListNameTagsRequest))
          as ListNameTagsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core
      .Deprecated('Use ListNameTagsRequest() / ListNameTagsRequest.new instead')
  static ListNameTagsRequest create() => ListNameTagsRequest._();
  static $pb.GeneratedMessage $_createMessage() => ListNameTagsRequest._();
  @$core.override
  ListNameTagsRequest createEmptyInstance() => ListNameTagsRequest._();
  @$core.pragma('dart2js:noInline')
  static ListNameTagsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListNameTagsRequest>(
          ListNameTagsRequest.$_createMessage);
  static ListNameTagsRequest? _defaultInstance;
}

class ListNameTagsReply extends $pb.GeneratedMessage {
  factory ListNameTagsReply({
    $core.Iterable<TagsOverview>? ratingTags,
  }) {
    final result = ListNameTagsReply._();
    if (ratingTags != null) result.ratingTags.addAll(ratingTags);
    return result;
  }

  ListNameTagsReply._();

  factory ListNameTagsReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListNameTagsReply()..mergeFromBuffer(data, registry);
  factory ListNameTagsReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListNameTagsReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListNameTagsReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListNameTagsReply.$_createMessage)
    ..pPM<TagsOverview>(1, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: TagsOverview.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListNameTagsReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListNameTagsReply copyWith(void Function(ListNameTagsReply) updates) =>
      super.copyWith((message) => updates(message as ListNameTagsReply))
          as ListNameTagsReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use ListNameTagsReply() / ListNameTagsReply.new instead')
  static ListNameTagsReply create() => ListNameTagsReply._();
  static $pb.GeneratedMessage $_createMessage() => ListNameTagsReply._();
  @$core.override
  ListNameTagsReply createEmptyInstance() => ListNameTagsReply._();
  @$core.pragma('dart2js:noInline')
  static ListNameTagsReply getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNameTagsReply>(
          ListNameTagsReply.$_createMessage);
  static ListNameTagsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TagsOverview> get ratingTags => $_getList(0);
}

class ListAvailableCanteenTagsRequest extends $pb.GeneratedMessage {
  factory ListAvailableCanteenTagsRequest() =>
      ListAvailableCanteenTagsRequest._();

  ListAvailableCanteenTagsRequest._();

  factory ListAvailableCanteenTagsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListAvailableCanteenTagsRequest()..mergeFromBuffer(data, registry);
  factory ListAvailableCanteenTagsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListAvailableCanteenTagsRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAvailableCanteenTagsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListAvailableCanteenTagsRequest.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAvailableCanteenTagsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAvailableCanteenTagsRequest copyWith(
          void Function(ListAvailableCanteenTagsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListAvailableCanteenTagsRequest))
          as ListAvailableCanteenTagsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListAvailableCanteenTagsRequest() / ListAvailableCanteenTagsRequest.new instead')
  static ListAvailableCanteenTagsRequest create() =>
      ListAvailableCanteenTagsRequest._();
  static $pb.GeneratedMessage $_createMessage() =>
      ListAvailableCanteenTagsRequest._();
  @$core.override
  ListAvailableCanteenTagsRequest createEmptyInstance() =>
      ListAvailableCanteenTagsRequest._();
  @$core.pragma('dart2js:noInline')
  static ListAvailableCanteenTagsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAvailableCanteenTagsRequest>(
          ListAvailableCanteenTagsRequest.$_createMessage);
  static ListAvailableCanteenTagsRequest? _defaultInstance;
}

class ListAvailableCanteenTagsReply extends $pb.GeneratedMessage {
  factory ListAvailableCanteenTagsReply({
    $core.Iterable<TagsOverview>? ratingTags,
  }) {
    final result = ListAvailableCanteenTagsReply._();
    if (ratingTags != null) result.ratingTags.addAll(ratingTags);
    return result;
  }

  ListAvailableCanteenTagsReply._();

  factory ListAvailableCanteenTagsReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListAvailableCanteenTagsReply()..mergeFromBuffer(data, registry);
  factory ListAvailableCanteenTagsReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListAvailableCanteenTagsReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAvailableCanteenTagsReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListAvailableCanteenTagsReply.$_createMessage)
    ..pPM<TagsOverview>(1, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: TagsOverview.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAvailableCanteenTagsReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListAvailableCanteenTagsReply copyWith(
          void Function(ListAvailableCanteenTagsReply) updates) =>
      super.copyWith(
              (message) => updates(message as ListAvailableCanteenTagsReply))
          as ListAvailableCanteenTagsReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListAvailableCanteenTagsReply() / ListAvailableCanteenTagsReply.new instead')
  static ListAvailableCanteenTagsReply create() =>
      ListAvailableCanteenTagsReply._();
  static $pb.GeneratedMessage $_createMessage() =>
      ListAvailableCanteenTagsReply._();
  @$core.override
  ListAvailableCanteenTagsReply createEmptyInstance() =>
      ListAvailableCanteenTagsReply._();
  @$core.pragma('dart2js:noInline')
  static ListAvailableCanteenTagsReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAvailableCanteenTagsReply>(
          ListAvailableCanteenTagsReply.$_createMessage);
  static ListAvailableCanteenTagsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TagsOverview> get ratingTags => $_getList(0);
}

class TagsOverview extends $pb.GeneratedMessage {
  factory TagsOverview({
    $core.int? tagId,
    $core.String? de,
    $core.String? en,
  }) {
    final result = TagsOverview._();
    if (tagId != null) result.tagId = tagId;
    if (de != null) result.de = de;
    if (en != null) result.en = en;
    return result;
  }

  TagsOverview._();

  factory TagsOverview.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      TagsOverview()..mergeFromBuffer(data, registry);
  factory TagsOverview.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      TagsOverview()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TagsOverview',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: TagsOverview.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'tagId')
    ..aOS(2, _omitFieldNames ? '' : 'de')
    ..aOS(3, _omitFieldNames ? '' : 'en')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TagsOverview clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TagsOverview copyWith(void Function(TagsOverview) updates) =>
      super.copyWith((message) => updates(message as TagsOverview))
          as TagsOverview;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use TagsOverview() / TagsOverview.new instead')
  static TagsOverview create() => TagsOverview._();
  static $pb.GeneratedMessage $_createMessage() => TagsOverview._();
  @$core.override
  TagsOverview createEmptyInstance() => TagsOverview._();
  @$core.pragma('dart2js:noInline')
  static TagsOverview getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TagsOverview>(
          TagsOverview.$_createMessage);
  static TagsOverview? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tagId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tagId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get de => $_getSZ(1);
  @$pb.TagNumber(2)
  set de($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDe() => $_has(1);
  @$pb.TagNumber(2)
  void clearDe() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get en => $_getSZ(2);
  @$pb.TagNumber(3)
  set en($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEn() => $_has(2);
  @$pb.TagNumber(3)
  void clearEn() => $_clearField(3);
}

class RatingTag extends $pb.GeneratedMessage {
  factory RatingTag({
    $fixnum.Int64? tagId,
    $core.double? points,
  }) {
    final result = RatingTag._();
    if (tagId != null) result.tagId = tagId;
    if (points != null) result.points = points;
    return result;
  }

  RatingTag._();

  factory RatingTag.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      RatingTag()..mergeFromBuffer(data, registry);
  factory RatingTag.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      RatingTag()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RatingTag',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: RatingTag.$_createMessage)
    ..aInt64(1, _omitFieldNames ? '' : 'tagId')
    ..aD(2, _omitFieldNames ? '' : 'points')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RatingTag clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RatingTag copyWith(void Function(RatingTag) updates) =>
      super.copyWith((message) => updates(message as RatingTag)) as RatingTag;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use RatingTag() / RatingTag.new instead')
  static RatingTag create() => RatingTag._();
  static $pb.GeneratedMessage $_createMessage() => RatingTag._();
  @$core.override
  RatingTag createEmptyInstance() => RatingTag._();
  @$core.pragma('dart2js:noInline')
  static RatingTag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RatingTag>(RatingTag.$_createMessage);
  static RatingTag? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get tagId => $_getI64(0);
  @$pb.TagNumber(1)
  set tagId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get points => $_getN(1);
  @$pb.TagNumber(2)
  set points($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPoints() => $_has(1);
  @$pb.TagNumber(2)
  void clearPoints() => $_clearField(2);
}

class RatingTagNewRequest extends $pb.GeneratedMessage {
  factory RatingTagNewRequest({
    $core.int? tagId,
    $core.int? points,
  }) {
    final result = RatingTagNewRequest._();
    if (tagId != null) result.tagId = tagId;
    if (points != null) result.points = points;
    return result;
  }

  RatingTagNewRequest._();

  factory RatingTagNewRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      RatingTagNewRequest()..mergeFromBuffer(data, registry);
  factory RatingTagNewRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      RatingTagNewRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RatingTagNewRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: RatingTagNewRequest.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'tagId')
    ..aI(2, _omitFieldNames ? '' : 'points')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RatingTagNewRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RatingTagNewRequest copyWith(void Function(RatingTagNewRequest) updates) =>
      super.copyWith((message) => updates(message as RatingTagNewRequest))
          as RatingTagNewRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core
      .Deprecated('Use RatingTagNewRequest() / RatingTagNewRequest.new instead')
  static RatingTagNewRequest create() => RatingTagNewRequest._();
  static $pb.GeneratedMessage $_createMessage() => RatingTagNewRequest._();
  @$core.override
  RatingTagNewRequest createEmptyInstance() => RatingTagNewRequest._();
  @$core.pragma('dart2js:noInline')
  static RatingTagNewRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RatingTagNewRequest>(
          RatingTagNewRequest.$_createMessage);
  static RatingTagNewRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tagId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tagId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get points => $_getIZ(1);
  @$pb.TagNumber(2)
  set points($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPoints() => $_has(1);
  @$pb.TagNumber(2)
  void clearPoints() => $_clearField(2);
}

class RatingTagResult extends $pb.GeneratedMessage {
  factory RatingTagResult({
    $core.int? tagId,
    $core.double? avg,
    $core.double? std,
    $core.int? min,
    $core.int? max,
  }) {
    final result = RatingTagResult._();
    if (tagId != null) result.tagId = tagId;
    if (avg != null) result.avg = avg;
    if (std != null) result.std = std;
    if (min != null) result.min = min;
    if (max != null) result.max = max;
    return result;
  }

  RatingTagResult._();

  factory RatingTagResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      RatingTagResult()..mergeFromBuffer(data, registry);
  factory RatingTagResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      RatingTagResult()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RatingTagResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: RatingTagResult.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'tagId')
    ..aD(2, _omitFieldNames ? '' : 'avg')
    ..aD(3, _omitFieldNames ? '' : 'std')
    ..aI(4, _omitFieldNames ? '' : 'min')
    ..aI(5, _omitFieldNames ? '' : 'max')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RatingTagResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RatingTagResult copyWith(void Function(RatingTagResult) updates) =>
      super.copyWith((message) => updates(message as RatingTagResult))
          as RatingTagResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use RatingTagResult() / RatingTagResult.new instead')
  static RatingTagResult create() => RatingTagResult._();
  static $pb.GeneratedMessage $_createMessage() => RatingTagResult._();
  @$core.override
  RatingTagResult createEmptyInstance() => RatingTagResult._();
  @$core.pragma('dart2js:noInline')
  static RatingTagResult getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RatingTagResult>(
          RatingTagResult.$_createMessage);
  static RatingTagResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tagId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tagId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get avg => $_getN(1);
  @$pb.TagNumber(2)
  set avg($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAvg() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvg() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get std => $_getN(2);
  @$pb.TagNumber(3)
  set std($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStd() => $_has(2);
  @$pb.TagNumber(3)
  void clearStd() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get min => $_getIZ(3);
  @$pb.TagNumber(4)
  set min($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMin() => $_has(3);
  @$pb.TagNumber(4)
  void clearMin() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get max => $_getIZ(4);
  @$pb.TagNumber(5)
  set max($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMax() => $_has(4);
  @$pb.TagNumber(5)
  void clearMax() => $_clearField(5);
}

class ListCanteensRequest extends $pb.GeneratedMessage {
  factory ListCanteensRequest() => ListCanteensRequest._();

  ListCanteensRequest._();

  factory ListCanteensRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListCanteensRequest()..mergeFromBuffer(data, registry);
  factory ListCanteensRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListCanteensRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListCanteensRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListCanteensRequest.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCanteensRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCanteensRequest copyWith(void Function(ListCanteensRequest) updates) =>
      super.copyWith((message) => updates(message as ListCanteensRequest))
          as ListCanteensRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core
      .Deprecated('Use ListCanteensRequest() / ListCanteensRequest.new instead')
  static ListCanteensRequest create() => ListCanteensRequest._();
  static $pb.GeneratedMessage $_createMessage() => ListCanteensRequest._();
  @$core.override
  ListCanteensRequest createEmptyInstance() => ListCanteensRequest._();
  @$core.pragma('dart2js:noInline')
  static ListCanteensRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListCanteensRequest>(
          ListCanteensRequest.$_createMessage);
  static ListCanteensRequest? _defaultInstance;
}

class ListCanteensReply extends $pb.GeneratedMessage {
  factory ListCanteensReply({
    $core.Iterable<Canteen>? canteen,
  }) {
    final result = ListCanteensReply._();
    if (canteen != null) result.canteen.addAll(canteen);
    return result;
  }

  ListCanteensReply._();

  factory ListCanteensReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListCanteensReply()..mergeFromBuffer(data, registry);
  factory ListCanteensReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListCanteensReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListCanteensReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListCanteensReply.$_createMessage)
    ..pPM<Canteen>(1, _omitFieldNames ? '' : 'canteen',
        subBuilder: Canteen.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCanteensReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCanteensReply copyWith(void Function(ListCanteensReply) updates) =>
      super.copyWith((message) => updates(message as ListCanteensReply))
          as ListCanteensReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use ListCanteensReply() / ListCanteensReply.new instead')
  static ListCanteensReply create() => ListCanteensReply._();
  static $pb.GeneratedMessage $_createMessage() => ListCanteensReply._();
  @$core.override
  ListCanteensReply createEmptyInstance() => ListCanteensReply._();
  @$core.pragma('dart2js:noInline')
  static ListCanteensReply getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCanteensReply>(
          ListCanteensReply.$_createMessage);
  static ListCanteensReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Canteen> get canteen => $_getList(0);
}

class Canteen extends $pb.GeneratedMessage {
  factory Canteen({
    $core.String? id,
    $core.String? address,
    $core.double? longitude,
    $core.double? latitude,
  }) {
    final result = Canteen._();
    if (id != null) result.id = id;
    if (address != null) result.address = address;
    if (longitude != null) result.longitude = longitude;
    if (latitude != null) result.latitude = latitude;
    return result;
  }

  Canteen._();

  factory Canteen.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      Canteen()..mergeFromBuffer(data, registry);
  factory Canteen.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      Canteen()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Canteen',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: Canteen.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'address')
    ..aD(3, _omitFieldNames ? '' : 'longitude')
    ..aD(4, _omitFieldNames ? '' : 'latitude')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Canteen clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Canteen copyWith(void Function(Canteen) updates) =>
      super.copyWith((message) => updates(message as Canteen)) as Canteen;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use Canteen() / Canteen.new instead')
  static Canteen create() => Canteen._();
  static $pb.GeneratedMessage $_createMessage() => Canteen._();
  @$core.override
  Canteen createEmptyInstance() => Canteen._();
  @$core.pragma('dart2js:noInline')
  static Canteen getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Canteen>(Canteen.$_createMessage);
  static Canteen? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get longitude => $_getN(2);
  @$pb.TagNumber(3)
  set longitude($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLongitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearLongitude() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get latitude => $_getN(3);
  @$pb.TagNumber(4)
  set latitude($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLatitude() => $_has(3);
  @$pb.TagNumber(4)
  void clearLatitude() => $_clearField(4);
}

class ListDishesRequest extends $pb.GeneratedMessage {
  factory ListDishesRequest({
    $core.String? canteenId,
    $core.int? year,
    $core.int? week,
    $core.int? day,
  }) {
    final result = ListDishesRequest._();
    if (canteenId != null) result.canteenId = canteenId;
    if (year != null) result.year = year;
    if (week != null) result.week = week;
    if (day != null) result.day = day;
    return result;
  }

  ListDishesRequest._();

  factory ListDishesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListDishesRequest()..mergeFromBuffer(data, registry);
  factory ListDishesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListDishesRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDishesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListDishesRequest.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'canteenId')
    ..aI(2, _omitFieldNames ? '' : 'year')
    ..aI(3, _omitFieldNames ? '' : 'week')
    ..aI(4, _omitFieldNames ? '' : 'day')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDishesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDishesRequest copyWith(void Function(ListDishesRequest) updates) =>
      super.copyWith((message) => updates(message as ListDishesRequest))
          as ListDishesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use ListDishesRequest() / ListDishesRequest.new instead')
  static ListDishesRequest create() => ListDishesRequest._();
  static $pb.GeneratedMessage $_createMessage() => ListDishesRequest._();
  @$core.override
  ListDishesRequest createEmptyInstance() => ListDishesRequest._();
  @$core.pragma('dart2js:noInline')
  static ListDishesRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListDishesRequest>(
          ListDishesRequest.$_createMessage);
  static ListDishesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get canteenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set canteenId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCanteenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanteenId() => $_clearField(1);

  /// ISO week-numbering year, >=2022
  @$pb.TagNumber(2)
  $core.int get year => $_getIZ(1);
  @$pb.TagNumber(2)
  set year($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasYear() => $_has(1);
  @$pb.TagNumber(2)
  void clearYear() => $_clearField(2);

  /// ISO week, in the range 1 - 52 or 1 - 53 depending on the ISO year
  @$pb.TagNumber(3)
  $core.int get week => $_getIZ(2);
  @$pb.TagNumber(3)
  set week($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWeek() => $_has(2);
  @$pb.TagNumber(3)
  void clearWeek() => $_clearField(3);

  /// Day of the week
  /// Days must be in the range 0 (Monday) - 4 (Friday)
  @$pb.TagNumber(4)
  $core.int get day => $_getIZ(3);
  @$pb.TagNumber(4)
  set day($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDay() => $_has(3);
  @$pb.TagNumber(4)
  void clearDay() => $_clearField(4);
}

class ListDishesReply extends $pb.GeneratedMessage {
  factory ListDishesReply({
    $core.Iterable<$core.String>? dish,
  }) {
    final result = ListDishesReply._();
    if (dish != null) result.dish.addAll(dish);
    return result;
  }

  ListDishesReply._();

  factory ListDishesReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListDishesReply()..mergeFromBuffer(data, registry);
  factory ListDishesReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListDishesReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDishesReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListDishesReply.$_createMessage)
    ..pPS(1, _omitFieldNames ? '' : 'dish')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDishesReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDishesReply copyWith(void Function(ListDishesReply) updates) =>
      super.copyWith((message) => updates(message as ListDishesReply))
          as ListDishesReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use ListDishesReply() / ListDishesReply.new instead')
  static ListDishesReply create() => ListDishesReply._();
  static $pb.GeneratedMessage $_createMessage() => ListDishesReply._();
  @$core.override
  ListDishesReply createEmptyInstance() => ListDishesReply._();
  @$core.pragma('dart2js:noInline')
  static ListDishesReply getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListDishesReply>(
          ListDishesReply.$_createMessage);
  static ListDishesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get dish => $_getList(0);
}

class ListDishRatingSummariesRequest extends $pb.GeneratedMessage {
  factory ListDishRatingSummariesRequest({
    $core.String? canteenId,
    $core.int? year,
    $core.int? week,
    $core.int? day,
    $core.Iterable<$core.String>? dishes,
    $1.Timestamp? from,
    $1.Timestamp? to,
  }) {
    final result = ListDishRatingSummariesRequest._();
    if (canteenId != null) result.canteenId = canteenId;
    if (year != null) result.year = year;
    if (week != null) result.week = week;
    if (day != null) result.day = day;
    if (dishes != null) result.dishes.addAll(dishes);
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    return result;
  }

  ListDishRatingSummariesRequest._();

  factory ListDishRatingSummariesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListDishRatingSummariesRequest()..mergeFromBuffer(data, registry);
  factory ListDishRatingSummariesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListDishRatingSummariesRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDishRatingSummariesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListDishRatingSummariesRequest.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'canteenId')
    ..aI(2, _omitFieldNames ? '' : 'year')
    ..aI(3, _omitFieldNames ? '' : 'week')
    ..aI(4, _omitFieldNames ? '' : 'day')
    ..pPS(5, _omitFieldNames ? '' : 'dishes')
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'from',
        subBuilder: $1.Timestamp.$_createMessage)
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'to',
        subBuilder: $1.Timestamp.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDishRatingSummariesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDishRatingSummariesRequest copyWith(
          void Function(ListDishRatingSummariesRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListDishRatingSummariesRequest))
          as ListDishRatingSummariesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListDishRatingSummariesRequest() / ListDishRatingSummariesRequest.new instead')
  static ListDishRatingSummariesRequest create() =>
      ListDishRatingSummariesRequest._();
  static $pb.GeneratedMessage $_createMessage() =>
      ListDishRatingSummariesRequest._();
  @$core.override
  ListDishRatingSummariesRequest createEmptyInstance() =>
      ListDishRatingSummariesRequest._();
  @$core.pragma('dart2js:noInline')
  static ListDishRatingSummariesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDishRatingSummariesRequest>(
          ListDishRatingSummariesRequest.$_createMessage);
  static ListDishRatingSummariesRequest? _defaultInstance;

  /// Mandatory canteen identifier (eat-api id or enum name)
  @$pb.TagNumber(1)
  $core.String get canteenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set canteenId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCanteenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanteenId() => $_clearField(1);

  /// Optional ISO date selector: when year > 0, summarizes all dishes on that day's menu.
  @$pb.TagNumber(2)
  $core.int get year => $_getIZ(1);
  @$pb.TagNumber(2)
  set year($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasYear() => $_has(1);
  @$pb.TagNumber(2)
  void clearYear() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get week => $_getIZ(2);
  @$pb.TagNumber(3)
  set week($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWeek() => $_has(2);
  @$pb.TagNumber(3)
  void clearWeek() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get day => $_getIZ(3);
  @$pb.TagNumber(4)
  set day($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDay() => $_has(3);
  @$pb.TagNumber(4)
  void clearDay() => $_clearField(4);

  /// Optional explicit list of dish names (used when year == 0).
  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get dishes => $_getList(4);

  /// Optional lower/upper timestamp bounds for windowed statistics.
  @$pb.TagNumber(6)
  $1.Timestamp get from => $_getN(5);
  @$pb.TagNumber(6)
  set from($1.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasFrom() => $_has(5);
  @$pb.TagNumber(6)
  void clearFrom() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureFrom() => $_ensure(5);

  @$pb.TagNumber(7)
  $1.Timestamp get to => $_getN(6);
  @$pb.TagNumber(7)
  set to($1.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasTo() => $_has(6);
  @$pb.TagNumber(7)
  void clearTo() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureTo() => $_ensure(6);
}

class DishRatingSummary extends $pb.GeneratedMessage {
  factory DishRatingSummary({
    $core.String? dish,
    $core.double? avg,
    $core.double? std,
    $core.int? min,
    $core.int? max,
    $fixnum.Int64? ratingCount,
    RatingDistribution? distribution,
    $core.Iterable<RatingTagResult>? ratingTags,
    $core.Iterable<RatingTagResult>? nameTags,
    $fixnum.Int64? latestImageRatingId,
    $core.String? latestImageUrl,
    $core.bool? soldOut,
    $core.int? soldOutReportCount,
  }) {
    final result = DishRatingSummary._();
    if (dish != null) result.dish = dish;
    if (avg != null) result.avg = avg;
    if (std != null) result.std = std;
    if (min != null) result.min = min;
    if (max != null) result.max = max;
    if (ratingCount != null) result.ratingCount = ratingCount;
    if (distribution != null) result.distribution = distribution;
    if (ratingTags != null) result.ratingTags.addAll(ratingTags);
    if (nameTags != null) result.nameTags.addAll(nameTags);
    if (latestImageRatingId != null)
      result.latestImageRatingId = latestImageRatingId;
    if (latestImageUrl != null) result.latestImageUrl = latestImageUrl;
    if (soldOut != null) result.soldOut = soldOut;
    if (soldOutReportCount != null)
      result.soldOutReportCount = soldOutReportCount;
    return result;
  }

  DishRatingSummary._();

  factory DishRatingSummary.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DishRatingSummary()..mergeFromBuffer(data, registry);
  factory DishRatingSummary.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      DishRatingSummary()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DishRatingSummary',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: DishRatingSummary.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'dish')
    ..aD(2, _omitFieldNames ? '' : 'avg')
    ..aD(3, _omitFieldNames ? '' : 'std')
    ..aI(4, _omitFieldNames ? '' : 'min')
    ..aI(5, _omitFieldNames ? '' : 'max')
    ..aInt64(6, _omitFieldNames ? '' : 'ratingCount')
    ..aOM<RatingDistribution>(7, _omitFieldNames ? '' : 'distribution',
        subBuilder: RatingDistribution.$_createMessage)
    ..pPM<RatingTagResult>(8, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: RatingTagResult.$_createMessage)
    ..pPM<RatingTagResult>(9, _omitFieldNames ? '' : 'nameTags',
        subBuilder: RatingTagResult.$_createMessage)
    ..aInt64(10, _omitFieldNames ? '' : 'latestImageRatingId')
    ..aOS(11, _omitFieldNames ? '' : 'latestImageUrl')
    ..aOB(12, _omitFieldNames ? '' : 'soldOut')
    ..aI(13, _omitFieldNames ? '' : 'soldOutReportCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DishRatingSummary clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DishRatingSummary copyWith(void Function(DishRatingSummary) updates) =>
      super.copyWith((message) => updates(message as DishRatingSummary))
          as DishRatingSummary;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use DishRatingSummary() / DishRatingSummary.new instead')
  static DishRatingSummary create() => DishRatingSummary._();
  static $pb.GeneratedMessage $_createMessage() => DishRatingSummary._();
  @$core.override
  DishRatingSummary createEmptyInstance() => DishRatingSummary._();
  @$core.pragma('dart2js:noInline')
  static DishRatingSummary getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DishRatingSummary>(
          DishRatingSummary.$_createMessage);
  static DishRatingSummary? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dish => $_getSZ(0);
  @$pb.TagNumber(1)
  set dish($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDish() => $_has(0);
  @$pb.TagNumber(1)
  void clearDish() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get avg => $_getN(1);
  @$pb.TagNumber(2)
  set avg($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAvg() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvg() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get std => $_getN(2);
  @$pb.TagNumber(3)
  set std($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStd() => $_has(2);
  @$pb.TagNumber(3)
  void clearStd() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get min => $_getIZ(3);
  @$pb.TagNumber(4)
  set min($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMin() => $_has(3);
  @$pb.TagNumber(4)
  void clearMin() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get max => $_getIZ(4);
  @$pb.TagNumber(5)
  set max($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMax() => $_has(4);
  @$pb.TagNumber(5)
  void clearMax() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get ratingCount => $_getI64(5);
  @$pb.TagNumber(6)
  set ratingCount($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRatingCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearRatingCount() => $_clearField(6);

  @$pb.TagNumber(7)
  RatingDistribution get distribution => $_getN(6);
  @$pb.TagNumber(7)
  set distribution(RatingDistribution value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasDistribution() => $_has(6);
  @$pb.TagNumber(7)
  void clearDistribution() => $_clearField(7);
  @$pb.TagNumber(7)
  RatingDistribution ensureDistribution() => $_ensure(6);

  @$pb.TagNumber(8)
  $pb.PbList<RatingTagResult> get ratingTags => $_getList(7);

  @$pb.TagNumber(9)
  $pb.PbList<RatingTagResult> get nameTags => $_getList(8);

  @$pb.TagNumber(10)
  $fixnum.Int64 get latestImageRatingId => $_getI64(9);
  @$pb.TagNumber(10)
  set latestImageRatingId($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasLatestImageRatingId() => $_has(9);
  @$pb.TagNumber(10)
  void clearLatestImageRatingId() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get latestImageUrl => $_getSZ(10);
  @$pb.TagNumber(11)
  set latestImageUrl($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasLatestImageUrl() => $_has(10);
  @$pb.TagNumber(11)
  void clearLatestImageUrl() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get soldOut => $_getBF(11);
  @$pb.TagNumber(12)
  set soldOut($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasSoldOut() => $_has(11);
  @$pb.TagNumber(12)
  void clearSoldOut() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get soldOutReportCount => $_getIZ(12);
  @$pb.TagNumber(13)
  set soldOutReportCount($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasSoldOutReportCount() => $_has(12);
  @$pb.TagNumber(13)
  void clearSoldOutReportCount() => $_clearField(13);
}

class ListDishRatingSummariesReply extends $pb.GeneratedMessage {
  factory ListDishRatingSummariesReply({
    $core.Iterable<DishRatingSummary>? summaries,
  }) {
    final result = ListDishRatingSummariesReply._();
    if (summaries != null) result.summaries.addAll(summaries);
    return result;
  }

  ListDishRatingSummariesReply._();

  factory ListDishRatingSummariesReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListDishRatingSummariesReply()..mergeFromBuffer(data, registry);
  factory ListDishRatingSummariesReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListDishRatingSummariesReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDishRatingSummariesReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListDishRatingSummariesReply.$_createMessage)
    ..pPM<DishRatingSummary>(1, _omitFieldNames ? '' : 'summaries',
        subBuilder: DishRatingSummary.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDishRatingSummariesReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDishRatingSummariesReply copyWith(
          void Function(ListDishRatingSummariesReply) updates) =>
      super.copyWith(
              (message) => updates(message as ListDishRatingSummariesReply))
          as ListDishRatingSummariesReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListDishRatingSummariesReply() / ListDishRatingSummariesReply.new instead')
  static ListDishRatingSummariesReply create() =>
      ListDishRatingSummariesReply._();
  static $pb.GeneratedMessage $_createMessage() =>
      ListDishRatingSummariesReply._();
  @$core.override
  ListDishRatingSummariesReply createEmptyInstance() =>
      ListDishRatingSummariesReply._();
  @$core.pragma('dart2js:noInline')
  static ListDishRatingSummariesReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDishRatingSummariesReply>(
          ListDishRatingSummariesReply.$_createMessage);
  static ListDishRatingSummariesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DishRatingSummary> get summaries => $_getList(0);
}

class ListTopRatedDishesRequest extends $pb.GeneratedMessage {
  factory ListTopRatedDishesRequest({
    $core.int? year,
    $core.int? week,
    $core.int? day,
    $core.String? canteenId,
    $core.int? limit,
    $core.int? minRatings,
  }) {
    final result = ListTopRatedDishesRequest._();
    if (year != null) result.year = year;
    if (week != null) result.week = week;
    if (day != null) result.day = day;
    if (canteenId != null) result.canteenId = canteenId;
    if (limit != null) result.limit = limit;
    if (minRatings != null) result.minRatings = minRatings;
    return result;
  }

  ListTopRatedDishesRequest._();

  factory ListTopRatedDishesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListTopRatedDishesRequest()..mergeFromBuffer(data, registry);
  factory ListTopRatedDishesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListTopRatedDishesRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListTopRatedDishesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListTopRatedDishesRequest.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'year')
    ..aI(2, _omitFieldNames ? '' : 'week')
    ..aI(3, _omitFieldNames ? '' : 'day')
    ..aOS(4, _omitFieldNames ? '' : 'canteenId')
    ..aI(5, _omitFieldNames ? '' : 'limit')
    ..aI(6, _omitFieldNames ? '' : 'minRatings')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTopRatedDishesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTopRatedDishesRequest copyWith(
          void Function(ListTopRatedDishesRequest) updates) =>
      super.copyWith((message) => updates(message as ListTopRatedDishesRequest))
          as ListTopRatedDishesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListTopRatedDishesRequest() / ListTopRatedDishesRequest.new instead')
  static ListTopRatedDishesRequest create() => ListTopRatedDishesRequest._();
  static $pb.GeneratedMessage $_createMessage() =>
      ListTopRatedDishesRequest._();
  @$core.override
  ListTopRatedDishesRequest createEmptyInstance() =>
      ListTopRatedDishesRequest._();
  @$core.pragma('dart2js:noInline')
  static ListTopRatedDishesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListTopRatedDishesRequest>(
          ListTopRatedDishesRequest.$_createMessage);
  static ListTopRatedDishesRequest? _defaultInstance;

  /// ISO week-numbering year, >=2022
  @$pb.TagNumber(1)
  $core.int get year => $_getIZ(0);
  @$pb.TagNumber(1)
  set year($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasYear() => $_has(0);
  @$pb.TagNumber(1)
  void clearYear() => $_clearField(1);

  /// ISO week (1..52 or 1..53)
  @$pb.TagNumber(2)
  $core.int get week => $_getIZ(1);
  @$pb.TagNumber(2)
  set week($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWeek() => $_has(1);
  @$pb.TagNumber(2)
  void clearWeek() => $_clearField(2);

  /// Day of the week: 0 (Monday) - 4 (Friday)
  @$pb.TagNumber(3)
  $core.int get day => $_getIZ(2);
  @$pb.TagNumber(3)
  set day($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDay() => $_has(2);
  @$pb.TagNumber(3)
  void clearDay() => $_clearField(3);

  /// Optional canteen filter; omit to rank across all canteens.
  @$pb.TagNumber(4)
  $core.String get canteenId => $_getSZ(3);
  @$pb.TagNumber(4)
  set canteenId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCanteenId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCanteenId() => $_clearField(4);

  /// Optional max number of dishes returned (default 10, max 50).
  @$pb.TagNumber(5)
  $core.int get limit => $_getIZ(4);
  @$pb.TagNumber(5)
  set limit($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearLimit() => $_clearField(5);

  /// Optional minimum number of visible ratings required (default 1).
  @$pb.TagNumber(6)
  $core.int get minRatings => $_getIZ(5);
  @$pb.TagNumber(6)
  set minRatings($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMinRatings() => $_has(5);
  @$pb.TagNumber(6)
  void clearMinRatings() => $_clearField(6);
}

class TopRatedDish extends $pb.GeneratedMessage {
  factory TopRatedDish({
    $core.String? canteenId,
    $core.String? dish,
    $core.double? avg,
    $core.double? bayesianScore,
    $fixnum.Int64? ratingCount,
    $fixnum.Int64? latestImageRatingId,
    $core.String? latestImageUrl,
    $core.bool? soldOut,
  }) {
    final result = TopRatedDish._();
    if (canteenId != null) result.canteenId = canteenId;
    if (dish != null) result.dish = dish;
    if (avg != null) result.avg = avg;
    if (bayesianScore != null) result.bayesianScore = bayesianScore;
    if (ratingCount != null) result.ratingCount = ratingCount;
    if (latestImageRatingId != null)
      result.latestImageRatingId = latestImageRatingId;
    if (latestImageUrl != null) result.latestImageUrl = latestImageUrl;
    if (soldOut != null) result.soldOut = soldOut;
    return result;
  }

  TopRatedDish._();

  factory TopRatedDish.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      TopRatedDish()..mergeFromBuffer(data, registry);
  factory TopRatedDish.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      TopRatedDish()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TopRatedDish',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: TopRatedDish.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'canteenId')
    ..aOS(2, _omitFieldNames ? '' : 'dish')
    ..aD(3, _omitFieldNames ? '' : 'avg')
    ..aD(4, _omitFieldNames ? '' : 'bayesianScore')
    ..aInt64(5, _omitFieldNames ? '' : 'ratingCount')
    ..aInt64(6, _omitFieldNames ? '' : 'latestImageRatingId')
    ..aOS(7, _omitFieldNames ? '' : 'latestImageUrl')
    ..aOB(8, _omitFieldNames ? '' : 'soldOut')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TopRatedDish clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TopRatedDish copyWith(void Function(TopRatedDish) updates) =>
      super.copyWith((message) => updates(message as TopRatedDish))
          as TopRatedDish;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use TopRatedDish() / TopRatedDish.new instead')
  static TopRatedDish create() => TopRatedDish._();
  static $pb.GeneratedMessage $_createMessage() => TopRatedDish._();
  @$core.override
  TopRatedDish createEmptyInstance() => TopRatedDish._();
  @$core.pragma('dart2js:noInline')
  static TopRatedDish getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopRatedDish>(
          TopRatedDish.$_createMessage);
  static TopRatedDish? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get canteenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set canteenId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCanteenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanteenId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get dish => $_getSZ(1);
  @$pb.TagNumber(2)
  set dish($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDish() => $_has(1);
  @$pb.TagNumber(2)
  void clearDish() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get avg => $_getN(2);
  @$pb.TagNumber(3)
  set avg($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvg() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvg() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get bayesianScore => $_getN(3);
  @$pb.TagNumber(4)
  set bayesianScore($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBayesianScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearBayesianScore() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get ratingCount => $_getI64(4);
  @$pb.TagNumber(5)
  set ratingCount($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRatingCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearRatingCount() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get latestImageRatingId => $_getI64(5);
  @$pb.TagNumber(6)
  set latestImageRatingId($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLatestImageRatingId() => $_has(5);
  @$pb.TagNumber(6)
  void clearLatestImageRatingId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get latestImageUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set latestImageUrl($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLatestImageUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearLatestImageUrl() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get soldOut => $_getBF(7);
  @$pb.TagNumber(8)
  set soldOut($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSoldOut() => $_has(7);
  @$pb.TagNumber(8)
  void clearSoldOut() => $_clearField(8);
}

class ListTopRatedDishesReply extends $pb.GeneratedMessage {
  factory ListTopRatedDishesReply({
    $core.Iterable<TopRatedDish>? dishes,
  }) {
    final result = ListTopRatedDishesReply._();
    if (dishes != null) result.dishes.addAll(dishes);
    return result;
  }

  ListTopRatedDishesReply._();

  factory ListTopRatedDishesReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListTopRatedDishesReply()..mergeFromBuffer(data, registry);
  factory ListTopRatedDishesReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListTopRatedDishesReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListTopRatedDishesReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListTopRatedDishesReply.$_createMessage)
    ..pPM<TopRatedDish>(1, _omitFieldNames ? '' : 'dishes',
        subBuilder: TopRatedDish.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTopRatedDishesReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTopRatedDishesReply copyWith(
          void Function(ListTopRatedDishesReply) updates) =>
      super.copyWith((message) => updates(message as ListTopRatedDishesReply))
          as ListTopRatedDishesReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListTopRatedDishesReply() / ListTopRatedDishesReply.new instead')
  static ListTopRatedDishesReply create() => ListTopRatedDishesReply._();
  static $pb.GeneratedMessage $_createMessage() => ListTopRatedDishesReply._();
  @$core.override
  ListTopRatedDishesReply createEmptyInstance() => ListTopRatedDishesReply._();
  @$core.pragma('dart2js:noInline')
  static ListTopRatedDishesReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListTopRatedDishesReply>(
          ListTopRatedDishesReply.$_createMessage);
  static ListTopRatedDishesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TopRatedDish> get dishes => $_getList(0);
}

class ReportDishSoldOutRequest extends $pb.GeneratedMessage {
  factory ReportDishSoldOutRequest({
    $core.String? canteenId,
    $core.String? dish,
  }) {
    final result = ReportDishSoldOutRequest._();
    if (canteenId != null) result.canteenId = canteenId;
    if (dish != null) result.dish = dish;
    return result;
  }

  ReportDishSoldOutRequest._();

  factory ReportDishSoldOutRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ReportDishSoldOutRequest()..mergeFromBuffer(data, registry);
  factory ReportDishSoldOutRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ReportDishSoldOutRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReportDishSoldOutRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ReportDishSoldOutRequest.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'canteenId')
    ..aOS(2, _omitFieldNames ? '' : 'dish')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportDishSoldOutRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportDishSoldOutRequest copyWith(
          void Function(ReportDishSoldOutRequest) updates) =>
      super.copyWith((message) => updates(message as ReportDishSoldOutRequest))
          as ReportDishSoldOutRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ReportDishSoldOutRequest() / ReportDishSoldOutRequest.new instead')
  static ReportDishSoldOutRequest create() => ReportDishSoldOutRequest._();
  static $pb.GeneratedMessage $_createMessage() => ReportDishSoldOutRequest._();
  @$core.override
  ReportDishSoldOutRequest createEmptyInstance() =>
      ReportDishSoldOutRequest._();
  @$core.pragma('dart2js:noInline')
  static ReportDishSoldOutRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReportDishSoldOutRequest>(
          ReportDishSoldOutRequest.$_createMessage);
  static ReportDishSoldOutRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get canteenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set canteenId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCanteenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanteenId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get dish => $_getSZ(1);
  @$pb.TagNumber(2)
  set dish($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDish() => $_has(1);
  @$pb.TagNumber(2)
  void clearDish() => $_clearField(2);
}

class ReportDishSoldOutReply extends $pb.GeneratedMessage {
  factory ReportDishSoldOutReply({
    $core.int? reportCount,
    $core.bool? confirmed,
    $core.bool? alreadyReported,
  }) {
    final result = ReportDishSoldOutReply._();
    if (reportCount != null) result.reportCount = reportCount;
    if (confirmed != null) result.confirmed = confirmed;
    if (alreadyReported != null) result.alreadyReported = alreadyReported;
    return result;
  }

  ReportDishSoldOutReply._();

  factory ReportDishSoldOutReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ReportDishSoldOutReply()..mergeFromBuffer(data, registry);
  factory ReportDishSoldOutReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ReportDishSoldOutReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReportDishSoldOutReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ReportDishSoldOutReply.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'reportCount')
    ..aOB(2, _omitFieldNames ? '' : 'confirmed')
    ..aOB(3, _omitFieldNames ? '' : 'alreadyReported')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportDishSoldOutReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportDishSoldOutReply copyWith(
          void Function(ReportDishSoldOutReply) updates) =>
      super.copyWith((message) => updates(message as ReportDishSoldOutReply))
          as ReportDishSoldOutReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ReportDishSoldOutReply() / ReportDishSoldOutReply.new instead')
  static ReportDishSoldOutReply create() => ReportDishSoldOutReply._();
  static $pb.GeneratedMessage $_createMessage() => ReportDishSoldOutReply._();
  @$core.override
  ReportDishSoldOutReply createEmptyInstance() => ReportDishSoldOutReply._();
  @$core.pragma('dart2js:noInline')
  static ReportDishSoldOutReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReportDishSoldOutReply>(
          ReportDishSoldOutReply.$_createMessage);
  static ReportDishSoldOutReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get reportCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set reportCount($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReportCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearReportCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get confirmed => $_getBF(1);
  @$pb.TagNumber(2)
  set confirmed($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConfirmed() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfirmed() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get alreadyReported => $_getBF(2);
  @$pb.TagNumber(3)
  set alreadyReported($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAlreadyReported() => $_has(2);
  @$pb.TagNumber(3)
  void clearAlreadyReported() => $_clearField(3);
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
    final result = RoomInformationElement._();
    if (roomId != null) result.roomId = roomId;
    if (roomCode != null) result.roomCode = roomCode;
    if (buildingNr != null) result.buildingNr = buildingNr;
    if (archId != null) result.archId = archId;
    if (info != null) result.info = info;
    if (address != null) result.address = address;
    if (purpose != null) result.purpose = purpose;
    if (campus != null) result.campus = campus;
    if (name != null) result.name = name;
    return result;
  }

  RoomInformationElement._();

  factory RoomInformationElement.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      RoomInformationElement()..mergeFromBuffer(data, registry);
  factory RoomInformationElement.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      RoomInformationElement()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomInformationElement',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: RoomInformationElement.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'roomCode')
    ..aOS(3, _omitFieldNames ? '' : 'buildingNr')
    ..aOS(4, _omitFieldNames ? '' : 'archId')
    ..aOS(5, _omitFieldNames ? '' : 'info')
    ..aOS(6, _omitFieldNames ? '' : 'address')
    ..aOS(7, _omitFieldNames ? '' : 'purpose')
    ..aOS(8, _omitFieldNames ? '' : 'campus')
    ..aOS(9, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomInformationElement clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomInformationElement copyWith(
          void Function(RoomInformationElement) updates) =>
      super.copyWith((message) => updates(message as RoomInformationElement))
          as RoomInformationElement;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use RoomInformationElement() / RoomInformationElement.new instead')
  static RoomInformationElement create() => RoomInformationElement._();
  static $pb.GeneratedMessage $_createMessage() => RoomInformationElement._();
  @$core.override
  RoomInformationElement createEmptyInstance() => RoomInformationElement._();
  @$core.pragma('dart2js:noInline')
  static RoomInformationElement getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomInformationElement>(
          RoomInformationElement.$_createMessage);
  static RoomInformationElement? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get roomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set roomId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get buildingNr => $_getSZ(2);
  @$pb.TagNumber(3)
  set buildingNr($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBuildingNr() => $_has(2);
  @$pb.TagNumber(3)
  void clearBuildingNr() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get archId => $_getSZ(3);
  @$pb.TagNumber(4)
  set archId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasArchId() => $_has(3);
  @$pb.TagNumber(4)
  void clearArchId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get info => $_getSZ(4);
  @$pb.TagNumber(5)
  set info($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearInfo() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get address => $_getSZ(5);
  @$pb.TagNumber(6)
  set address($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAddress() => $_has(5);
  @$pb.TagNumber(6)
  void clearAddress() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get purpose => $_getSZ(6);
  @$pb.TagNumber(7)
  set purpose($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPurpose() => $_has(6);
  @$pb.TagNumber(7)
  void clearPurpose() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get campus => $_getSZ(7);
  @$pb.TagNumber(8)
  set campus($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCampus() => $_has(7);
  @$pb.TagNumber(8)
  void clearCampus() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get name => $_getSZ(8);
  @$pb.TagNumber(9)
  set name($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasName() => $_has(8);
  @$pb.TagNumber(9)
  void clearName() => $_clearField(9);
}

class GetUpdateNoteRequest extends $pb.GeneratedMessage {
  factory GetUpdateNoteRequest({
    $fixnum.Int64? version,
  }) {
    final result = GetUpdateNoteRequest._();
    if (version != null) result.version = version;
    return result;
  }

  GetUpdateNoteRequest._();

  factory GetUpdateNoteRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetUpdateNoteRequest()..mergeFromBuffer(data, registry);
  factory GetUpdateNoteRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetUpdateNoteRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUpdateNoteRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: GetUpdateNoteRequest.$_createMessage)
    ..aInt64(1, _omitFieldNames ? '' : 'version')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUpdateNoteRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUpdateNoteRequest copyWith(void Function(GetUpdateNoteRequest) updates) =>
      super.copyWith((message) => updates(message as GetUpdateNoteRequest))
          as GetUpdateNoteRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use GetUpdateNoteRequest() / GetUpdateNoteRequest.new instead')
  static GetUpdateNoteRequest create() => GetUpdateNoteRequest._();
  static $pb.GeneratedMessage $_createMessage() => GetUpdateNoteRequest._();
  @$core.override
  GetUpdateNoteRequest createEmptyInstance() => GetUpdateNoteRequest._();
  @$core.pragma('dart2js:noInline')
  static GetUpdateNoteRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUpdateNoteRequest>(
          GetUpdateNoteRequest.$_createMessage);
  static GetUpdateNoteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get version => $_getI64(0);
  @$pb.TagNumber(1)
  set version($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);
}

class GetUpdateNoteReply extends $pb.GeneratedMessage {
  factory GetUpdateNoteReply({
    $core.String? message,
    $core.String? versionName,
  }) {
    final result = GetUpdateNoteReply._();
    if (message != null) result.message = message;
    if (versionName != null) result.versionName = versionName;
    return result;
  }

  GetUpdateNoteReply._();

  factory GetUpdateNoteReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetUpdateNoteReply()..mergeFromBuffer(data, registry);
  factory GetUpdateNoteReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetUpdateNoteReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUpdateNoteReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: GetUpdateNoteReply.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..aOS(2, _omitFieldNames ? '' : 'versionName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUpdateNoteReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUpdateNoteReply copyWith(void Function(GetUpdateNoteReply) updates) =>
      super.copyWith((message) => updates(message as GetUpdateNoteReply))
          as GetUpdateNoteReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use GetUpdateNoteReply() / GetUpdateNoteReply.new instead')
  static GetUpdateNoteReply create() => GetUpdateNoteReply._();
  static $pb.GeneratedMessage $_createMessage() => GetUpdateNoteReply._();
  @$core.override
  GetUpdateNoteReply createEmptyInstance() => GetUpdateNoteReply._();
  @$core.pragma('dart2js:noInline')
  static GetUpdateNoteReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUpdateNoteReply>(
          GetUpdateNoteReply.$_createMessage);
  static GetUpdateNoteReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get versionName => $_getSZ(1);
  @$pb.TagNumber(2)
  set versionName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVersionName() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersionName() => $_clearField(2);
}

class ListMoviesRequest extends $pb.GeneratedMessage {
  factory ListMoviesRequest({
    $core.int? lastId,
    $1.Timestamp? oldestDateAt,
    Cinema? cinema,
  }) {
    final result = ListMoviesRequest._();
    if (lastId != null) result.lastId = lastId;
    if (oldestDateAt != null) result.oldestDateAt = oldestDateAt;
    if (cinema != null) result.cinema = cinema;
    return result;
  }

  ListMoviesRequest._();

  factory ListMoviesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListMoviesRequest()..mergeFromBuffer(data, registry);
  factory ListMoviesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListMoviesRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListMoviesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListMoviesRequest.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'lastId')
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'oldestDateAt',
        subBuilder: $1.Timestamp.$_createMessage)
    ..aE<Cinema>(3, _omitFieldNames ? '' : 'cinema', enumValues: Cinema.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListMoviesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListMoviesRequest copyWith(void Function(ListMoviesRequest) updates) =>
      super.copyWith((message) => updates(message as ListMoviesRequest))
          as ListMoviesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use ListMoviesRequest() / ListMoviesRequest.new instead')
  static ListMoviesRequest create() => ListMoviesRequest._();
  static $pb.GeneratedMessage $_createMessage() => ListMoviesRequest._();
  @$core.override
  ListMoviesRequest createEmptyInstance() => ListMoviesRequest._();
  @$core.pragma('dart2js:noInline')
  static ListMoviesRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListMoviesRequest>(
          ListMoviesRequest.$_createMessage);
  static ListMoviesRequest? _defaultInstance;

  /// the last Id you have requested. Use -1 to get all movies
  @$pb.TagNumber(1)
  $core.int get lastId => $_getIZ(0);
  @$pb.TagNumber(1)
  set lastId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLastId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastId() => $_clearField(1);

  /// the oldest time you want to be included in the response
  @$pb.TagNumber(2)
  $1.Timestamp get oldestDateAt => $_getN(1);
  @$pb.TagNumber(2)
  set oldestDateAt($1.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOldestDateAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearOldestDateAt() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Timestamp ensureOldestDateAt() => $_ensure(1);

  /// optional cinema filter (CINEMA_UNSPECIFIED returns movies from all cinemas)
  @$pb.TagNumber(3)
  Cinema get cinema => $_getN(2);
  @$pb.TagNumber(3)
  set cinema(Cinema value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCinema() => $_has(2);
  @$pb.TagNumber(3)
  void clearCinema() => $_clearField(3);
}

class ListMoviesReply extends $pb.GeneratedMessage {
  factory ListMoviesReply({
    $core.Iterable<Movie>? movies,
  }) {
    final result = ListMoviesReply._();
    if (movies != null) result.movies.addAll(movies);
    return result;
  }

  ListMoviesReply._();

  factory ListMoviesReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListMoviesReply()..mergeFromBuffer(data, registry);
  factory ListMoviesReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListMoviesReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListMoviesReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListMoviesReply.$_createMessage)
    ..pPM<Movie>(1, _omitFieldNames ? '' : 'movies',
        subBuilder: Movie.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListMoviesReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListMoviesReply copyWith(void Function(ListMoviesReply) updates) =>
      super.copyWith((message) => updates(message as ListMoviesReply))
          as ListMoviesReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use ListMoviesReply() / ListMoviesReply.new instead')
  static ListMoviesReply create() => ListMoviesReply._();
  static $pb.GeneratedMessage $_createMessage() => ListMoviesReply._();
  @$core.override
  ListMoviesReply createEmptyInstance() => ListMoviesReply._();
  @$core.pragma('dart2js:noInline')
  static ListMoviesReply getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListMoviesReply>(
          ListMoviesReply.$_createMessage);
  static ListMoviesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Movie> get movies => $_getList(0);
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
    $core.String? trailerUrl,
    $core.String? additionalInformationUrl,
    $core.String? coverUrl,
    $core.String? location,
    Cinema? cinema,
  }) {
    final result = Movie._();
    if (movieId != null) result.movieId = movieId;
    if (date != null) result.date = date;
    if (created != null) result.created = created;
    if (title != null) result.title = title;
    if (releaseYear != null) result.releaseYear = releaseYear;
    if (runtime != null) result.runtime = runtime;
    if (genre != null) result.genre = genre;
    if (director != null) result.director = director;
    if (actors != null) result.actors = actors;
    if (imdbRating != null) result.imdbRating = imdbRating;
    if (description != null) result.description = description;
    if (coverId != null) result.coverId = coverId;
    if (trailerUrl != null) result.trailerUrl = trailerUrl;
    if (additionalInformationUrl != null)
      result.additionalInformationUrl = additionalInformationUrl;
    if (coverUrl != null) result.coverUrl = coverUrl;
    if (location != null) result.location = location;
    if (cinema != null) result.cinema = cinema;
    return result;
  }

  Movie._();

  factory Movie.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      Movie()..mergeFromBuffer(data, registry);
  factory Movie.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      Movie()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Movie',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: Movie.$_createMessage)
    ..aInt64(3, _omitFieldNames ? '' : 'movieId')
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'date',
        subBuilder: $1.Timestamp.$_createMessage)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'created',
        subBuilder: $1.Timestamp.$_createMessage)
    ..aOS(6, _omitFieldNames ? '' : 'title')
    ..aOS(7, _omitFieldNames ? '' : 'releaseYear')
    ..aOS(8, _omitFieldNames ? '' : 'runtime')
    ..aOS(9, _omitFieldNames ? '' : 'genre')
    ..aOS(10, _omitFieldNames ? '' : 'director')
    ..aOS(11, _omitFieldNames ? '' : 'actors')
    ..aOS(12, _omitFieldNames ? '' : 'imdbRating')
    ..aOS(13, _omitFieldNames ? '' : 'description')
    ..aInt64(14, _omitFieldNames ? '' : 'coverId')
    ..aOS(15, _omitFieldNames ? '' : 'trailerUrl')
    ..aOS(16, _omitFieldNames ? '' : 'additionalInformationUrl')
    ..aOS(17, _omitFieldNames ? '' : 'coverUrl')
    ..aOS(18, _omitFieldNames ? '' : 'location')
    ..aE<Cinema>(19, _omitFieldNames ? '' : 'cinema', enumValues: Cinema.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Movie clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Movie copyWith(void Function(Movie) updates) =>
      super.copyWith((message) => updates(message as Movie)) as Movie;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use Movie() / Movie.new instead')
  static Movie create() => Movie._();
  static $pb.GeneratedMessage $_createMessage() => Movie._();
  @$core.override
  Movie createEmptyInstance() => Movie._();
  @$core.pragma('dart2js:noInline')
  static Movie getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Movie>(Movie.$_createMessage);
  static Movie? _defaultInstance;

  /// the id of the movie
  @$pb.TagNumber(3)
  $fixnum.Int64 get movieId => $_getI64(0);
  @$pb.TagNumber(3)
  set movieId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(3)
  $core.bool hasMovieId() => $_has(0);
  @$pb.TagNumber(3)
  void clearMovieId() => $_clearField(3);

  /// the date of the movie
  @$pb.TagNumber(4)
  $1.Timestamp get date => $_getN(1);
  @$pb.TagNumber(4)
  set date($1.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasDate() => $_has(1);
  @$pb.TagNumber(4)
  void clearDate() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureDate() => $_ensure(1);

  /// when the movie was created in OUR database
  @$pb.TagNumber(5)
  $1.Timestamp get created => $_getN(2);
  @$pb.TagNumber(5)
  set created($1.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCreated() => $_has(2);
  @$pb.TagNumber(5)
  void clearCreated() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureCreated() => $_ensure(2);

  /// title of the movie if available, empty otherwise
  @$pb.TagNumber(6)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(6)
  set title($core.String value) => $_setString(3, value);
  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(6)
  void clearTitle() => $_clearField(6);

  /// release year of the movie if available, empty otherwise
  @$pb.TagNumber(7)
  $core.String get releaseYear => $_getSZ(4);
  @$pb.TagNumber(7)
  set releaseYear($core.String value) => $_setString(4, value);
  @$pb.TagNumber(7)
  $core.bool hasReleaseYear() => $_has(4);
  @$pb.TagNumber(7)
  void clearReleaseYear() => $_clearField(7);

  /// runtime of the movie if available, empty otherwise
  @$pb.TagNumber(8)
  $core.String get runtime => $_getSZ(5);
  @$pb.TagNumber(8)
  set runtime($core.String value) => $_setString(5, value);
  @$pb.TagNumber(8)
  $core.bool hasRuntime() => $_has(5);
  @$pb.TagNumber(8)
  void clearRuntime() => $_clearField(8);

  /// genre of the movie if available, empty otherwise
  @$pb.TagNumber(9)
  $core.String get genre => $_getSZ(6);
  @$pb.TagNumber(9)
  set genre($core.String value) => $_setString(6, value);
  @$pb.TagNumber(9)
  $core.bool hasGenre() => $_has(6);
  @$pb.TagNumber(9)
  void clearGenre() => $_clearField(9);

  /// director of the movie as by omdb(/tu-film), empty otherwise
  @$pb.TagNumber(10)
  $core.String get director => $_getSZ(7);
  @$pb.TagNumber(10)
  set director($core.String value) => $_setString(7, value);
  @$pb.TagNumber(10)
  $core.bool hasDirector() => $_has(7);
  @$pb.TagNumber(10)
  void clearDirector() => $_clearField(10);

  /// actors of the movie as by omdb(/tu-film), empty otherwise
  @$pb.TagNumber(11)
  $core.String get actors => $_getSZ(8);
  @$pb.TagNumber(11)
  set actors($core.String value) => $_setString(8, value);
  @$pb.TagNumber(11)
  $core.bool hasActors() => $_has(8);
  @$pb.TagNumber(11)
  void clearActors() => $_clearField(11);

  /// imdb rating for the movie if available, empty otherwise
  @$pb.TagNumber(12)
  $core.String get imdbRating => $_getSZ(9);
  @$pb.TagNumber(12)
  set imdbRating($core.String value) => $_setString(9, value);
  @$pb.TagNumber(12)
  $core.bool hasImdbRating() => $_has(9);
  @$pb.TagNumber(12)
  void clearImdbRating() => $_clearField(12);

  /// short description of the movie including limited html tags (only <b>, <i>)
  @$pb.TagNumber(13)
  $core.String get description => $_getSZ(10);
  @$pb.TagNumber(13)
  set description($core.String value) => $_setString(10, value);
  @$pb.TagNumber(13)
  $core.bool hasDescription() => $_has(10);
  @$pb.TagNumber(13)
  void clearDescription() => $_clearField(13);

  /// the id of the cover image
  @$pb.TagNumber(14)
  $fixnum.Int64 get coverId => $_getI64(11);
  @$pb.TagNumber(14)
  set coverId($fixnum.Int64 value) => $_setInt64(11, value);
  @$pb.TagNumber(14)
  $core.bool hasCoverId() => $_has(11);
  @$pb.TagNumber(14)
  void clearCoverId() => $_clearField(14);

  /// Where to find a trailer for this movie
  @$pb.TagNumber(15)
  $core.String get trailerUrl => $_getSZ(12);
  @$pb.TagNumber(15)
  set trailerUrl($core.String value) => $_setString(12, value);
  @$pb.TagNumber(15)
  $core.bool hasTrailerUrl() => $_has(12);
  @$pb.TagNumber(15)
  void clearTrailerUrl() => $_clearField(15);

  /// Where to find additional information about this movie
  @$pb.TagNumber(16)
  $core.String get additionalInformationUrl => $_getSZ(13);
  @$pb.TagNumber(16)
  set additionalInformationUrl($core.String value) => $_setString(13, value);
  @$pb.TagNumber(16)
  $core.bool hasAdditionalInformationUrl() => $_has(13);
  @$pb.TagNumber(16)
  void clearAdditionalInformationUrl() => $_clearField(16);

  /// Where to find a cover image for this movie
  @$pb.TagNumber(17)
  $core.String get coverUrl => $_getSZ(14);
  @$pb.TagNumber(17)
  set coverUrl($core.String value) => $_setString(14, value);
  @$pb.TagNumber(17)
  $core.bool hasCoverUrl() => $_has(14);
  @$pb.TagNumber(17)
  void clearCoverUrl() => $_clearField(17);

  /// Where the movie is shown
  @$pb.TagNumber(18)
  $core.String get location => $_getSZ(15);
  @$pb.TagNumber(18)
  set location($core.String value) => $_setString(15, value);
  @$pb.TagNumber(18)
  $core.bool hasLocation() => $_has(15);
  @$pb.TagNumber(18)
  void clearLocation() => $_clearField(18);

  /// Which student cinema screens this movie
  @$pb.TagNumber(19)
  Cinema get cinema => $_getN(16);
  @$pb.TagNumber(19)
  set cinema(Cinema value) => $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasCinema() => $_has(16);
  @$pb.TagNumber(19)
  void clearCinema() => $_clearField(19);
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
    $core.String? fromName,
  }) {
    final result = CreateFeedbackRequest._();
    if (recipient != null) result.recipient = recipient;
    if (fromEmail != null) result.fromEmail = fromEmail;
    if (message != null) result.message = message;
    if (location != null) result.location = location;
    if (osVersion != null) result.osVersion = osVersion;
    if (appVersion != null) result.appVersion = appVersion;
    if (attachment != null) result.attachment = attachment;
    if (fromName != null) result.fromName = fromName;
    return result;
  }

  CreateFeedbackRequest._();

  factory CreateFeedbackRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateFeedbackRequest()..mergeFromBuffer(data, registry);
  factory CreateFeedbackRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateFeedbackRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateFeedbackRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: CreateFeedbackRequest.$_createMessage)
    ..aE<CreateFeedbackRequest_Recipient>(1, _omitFieldNames ? '' : 'recipient',
        enumValues: CreateFeedbackRequest_Recipient.values)
    ..aOS(2, _omitFieldNames ? '' : 'fromEmail')
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..aOM<Coordinate>(4, _omitFieldNames ? '' : 'location',
        subBuilder: Coordinate.$_createMessage)
    ..aOS(5, _omitFieldNames ? '' : 'osVersion')
    ..aOS(6, _omitFieldNames ? '' : 'appVersion')
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'attachment', $pb.PbFieldType.OY)
    ..aOS(8, _omitFieldNames ? '' : 'fromName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFeedbackRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFeedbackRequest copyWith(
          void Function(CreateFeedbackRequest) updates) =>
      super.copyWith((message) => updates(message as CreateFeedbackRequest))
          as CreateFeedbackRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use CreateFeedbackRequest() / CreateFeedbackRequest.new instead')
  static CreateFeedbackRequest create() => CreateFeedbackRequest._();
  static $pb.GeneratedMessage $_createMessage() => CreateFeedbackRequest._();
  @$core.override
  CreateFeedbackRequest createEmptyInstance() => CreateFeedbackRequest._();
  @$core.pragma('dart2js:noInline')
  static CreateFeedbackRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateFeedbackRequest>(
          CreateFeedbackRequest.$_createMessage);
  static CreateFeedbackRequest? _defaultInstance;

  /// who is the feedback for
  @$pb.TagNumber(1)
  CreateFeedbackRequest_Recipient get recipient => $_getN(0);
  @$pb.TagNumber(1)
  set recipient(CreateFeedbackRequest_Recipient value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRecipient() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecipient() => $_clearField(1);

  /// the email address of the user
  @$pb.TagNumber(2)
  $core.String get fromEmail => $_getSZ(1);
  @$pb.TagNumber(2)
  set fromEmail($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFromEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromEmail() => $_clearField(2);

  /// The actual message
  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);

  /// Optional location which the user can choose (data protection) to attach or not
  @$pb.TagNumber(4)
  Coordinate get location => $_getN(3);
  @$pb.TagNumber(4)
  set location(Coordinate value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasLocation() => $_has(3);
  @$pb.TagNumber(4)
  void clearLocation() => $_clearField(4);
  @$pb.TagNumber(4)
  Coordinate ensureLocation() => $_ensure(3);

  /// Optional os information which the user can choose (data protection) to attach or not
  @$pb.TagNumber(5)
  $core.String get osVersion => $_getSZ(4);
  @$pb.TagNumber(5)
  set osVersion($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOsVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearOsVersion() => $_clearField(5);

  /// Optional app information which the user can choose (data protection) to attach or not
  @$pb.TagNumber(6)
  $core.String get appVersion => $_getSZ(5);
  @$pb.TagNumber(6)
  set appVersion($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAppVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearAppVersion() => $_clearField(6);

  /// Optional file in Base64.
  /// Accepted file formats: jpeg, jpg, png, webp, md, txt, pdf
  /// Maximum file size 4MB as by Protobuf maximum per request message size
  @$pb.TagNumber(7)
  $core.List<$core.int> get attachment => $_getN(6);
  @$pb.TagNumber(7)
  set attachment($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAttachment() => $_has(6);
  @$pb.TagNumber(7)
  void clearAttachment() => $_clearField(7);

  /// how the person wants to be called
  @$pb.TagNumber(8)
  $core.String get fromName => $_getSZ(7);
  @$pb.TagNumber(8)
  set fromName($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasFromName() => $_has(7);
  @$pb.TagNumber(8)
  void clearFromName() => $_clearField(8);
}

class Coordinate extends $pb.GeneratedMessage {
  factory Coordinate({
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final result = Coordinate._();
    if (latitude != null) result.latitude = latitude;
    if (longitude != null) result.longitude = longitude;
    return result;
  }

  Coordinate._();

  factory Coordinate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      Coordinate()..mergeFromBuffer(data, registry);
  factory Coordinate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      Coordinate()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Coordinate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: Coordinate.$_createMessage)
    ..aD(1, _omitFieldNames ? '' : 'latitude')
    ..aD(2, _omitFieldNames ? '' : 'longitude')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Coordinate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Coordinate copyWith(void Function(Coordinate) updates) =>
      super.copyWith((message) => updates(message as Coordinate)) as Coordinate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use Coordinate() / Coordinate.new instead')
  static Coordinate create() => Coordinate._();
  static $pb.GeneratedMessage $_createMessage() => Coordinate._();
  @$core.override
  Coordinate createEmptyInstance() => Coordinate._();
  @$core.pragma('dart2js:noInline')
  static Coordinate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Coordinate>(Coordinate.$_createMessage);
  static Coordinate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get latitude => $_getN(0);
  @$pb.TagNumber(1)
  set latitude($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLatitude() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatitude() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get longitude => $_getN(1);
  @$pb.TagNumber(2)
  set longitude($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLongitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLongitude() => $_clearField(2);
}

class CreateFeedbackReply extends $pb.GeneratedMessage {
  factory CreateFeedbackReply() => CreateFeedbackReply._();

  CreateFeedbackReply._();

  factory CreateFeedbackReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateFeedbackReply()..mergeFromBuffer(data, registry);
  factory CreateFeedbackReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateFeedbackReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateFeedbackReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: CreateFeedbackReply.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFeedbackReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFeedbackReply copyWith(void Function(CreateFeedbackReply) updates) =>
      super.copyWith((message) => updates(message as CreateFeedbackReply))
          as CreateFeedbackReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core
      .Deprecated('Use CreateFeedbackReply() / CreateFeedbackReply.new instead')
  static CreateFeedbackReply create() => CreateFeedbackReply._();
  static $pb.GeneratedMessage $_createMessage() => CreateFeedbackReply._();
  @$core.override
  CreateFeedbackReply createEmptyInstance() => CreateFeedbackReply._();
  @$core.pragma('dart2js:noInline')
  static CreateFeedbackReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateFeedbackReply>(
          CreateFeedbackReply.$_createMessage);
  static CreateFeedbackReply? _defaultInstance;
}

class CreateFeedbackImageReply extends $pb.GeneratedMessage {
  factory CreateFeedbackImageReply({
    $core.String? status,
  }) {
    final result = CreateFeedbackImageReply._();
    if (status != null) result.status = status;
    return result;
  }

  CreateFeedbackImageReply._();

  factory CreateFeedbackImageReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateFeedbackImageReply()..mergeFromBuffer(data, registry);
  factory CreateFeedbackImageReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateFeedbackImageReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateFeedbackImageReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: CreateFeedbackImageReply.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFeedbackImageReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFeedbackImageReply copyWith(
          void Function(CreateFeedbackImageReply) updates) =>
      super.copyWith((message) => updates(message as CreateFeedbackImageReply))
          as CreateFeedbackImageReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use CreateFeedbackImageReply() / CreateFeedbackImageReply.new instead')
  static CreateFeedbackImageReply create() => CreateFeedbackImageReply._();
  static $pb.GeneratedMessage $_createMessage() => CreateFeedbackImageReply._();
  @$core.override
  CreateFeedbackImageReply createEmptyInstance() =>
      CreateFeedbackImageReply._();
  @$core.pragma('dart2js:noInline')
  static CreateFeedbackImageReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateFeedbackImageReply>(
          CreateFeedbackImageReply.$_createMessage);
  static CreateFeedbackImageReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);
}

class CreateFeedbackImageRequest extends $pb.GeneratedMessage {
  factory CreateFeedbackImageRequest({
    $core.int? id,
    $core.int? imageNr,
  }) {
    final result = CreateFeedbackImageRequest._();
    if (id != null) result.id = id;
    if (imageNr != null) result.imageNr = imageNr;
    return result;
  }

  CreateFeedbackImageRequest._();

  factory CreateFeedbackImageRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateFeedbackImageRequest()..mergeFromBuffer(data, registry);
  factory CreateFeedbackImageRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      CreateFeedbackImageRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateFeedbackImageRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: CreateFeedbackImageRequest.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aI(2, _omitFieldNames ? '' : 'imageNr')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFeedbackImageRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateFeedbackImageRequest copyWith(
          void Function(CreateFeedbackImageRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateFeedbackImageRequest))
          as CreateFeedbackImageRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use CreateFeedbackImageRequest() / CreateFeedbackImageRequest.new instead')
  static CreateFeedbackImageRequest create() => CreateFeedbackImageRequest._();
  static $pb.GeneratedMessage $_createMessage() =>
      CreateFeedbackImageRequest._();
  @$core.override
  CreateFeedbackImageRequest createEmptyInstance() =>
      CreateFeedbackImageRequest._();
  @$core.pragma('dart2js:noInline')
  static CreateFeedbackImageRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateFeedbackImageRequest>(
          CreateFeedbackImageRequest.$_createMessage);
  static CreateFeedbackImageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get imageNr => $_getIZ(1);
  @$pb.TagNumber(2)
  set imageNr($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasImageNr() => $_has(1);
  @$pb.TagNumber(2)
  void clearImageNr() => $_clearField(2);
}

class GetMemberRequest extends $pb.GeneratedMessage {
  factory GetMemberRequest({
    $core.String? lrzId,
  }) {
    final result = GetMemberRequest._();
    if (lrzId != null) result.lrzId = lrzId;
    return result;
  }

  GetMemberRequest._();

  factory GetMemberRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetMemberRequest()..mergeFromBuffer(data, registry);
  factory GetMemberRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetMemberRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMemberRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: GetMemberRequest.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'lrzId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMemberRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMemberRequest copyWith(void Function(GetMemberRequest) updates) =>
      super.copyWith((message) => updates(message as GetMemberRequest))
          as GetMemberRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use GetMemberRequest() / GetMemberRequest.new instead')
  static GetMemberRequest create() => GetMemberRequest._();
  static $pb.GeneratedMessage $_createMessage() => GetMemberRequest._();
  @$core.override
  GetMemberRequest createEmptyInstance() => GetMemberRequest._();
  @$core.pragma('dart2js:noInline')
  static GetMemberRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMemberRequest>(
          GetMemberRequest.$_createMessage);
  static GetMemberRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lrzId => $_getSZ(0);
  @$pb.TagNumber(1)
  set lrzId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLrzId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLrzId() => $_clearField(1);
}

class GetMemberReply extends $pb.GeneratedMessage {
  factory GetMemberReply({
    $core.String? lrzId,
    $core.String? name,
    $core.int? memberId,
  }) {
    final result = GetMemberReply._();
    if (lrzId != null) result.lrzId = lrzId;
    if (name != null) result.name = name;
    if (memberId != null) result.memberId = memberId;
    return result;
  }

  GetMemberReply._();

  factory GetMemberReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetMemberReply()..mergeFromBuffer(data, registry);
  factory GetMemberReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetMemberReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMemberReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: GetMemberReply.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'lrzId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aI(3, _omitFieldNames ? '' : 'memberId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMemberReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMemberReply copyWith(void Function(GetMemberReply) updates) =>
      super.copyWith((message) => updates(message as GetMemberReply))
          as GetMemberReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use GetMemberReply() / GetMemberReply.new instead')
  static GetMemberReply create() => GetMemberReply._();
  static $pb.GeneratedMessage $_createMessage() => GetMemberReply._();
  @$core.override
  GetMemberReply createEmptyInstance() => GetMemberReply._();
  @$core.pragma('dart2js:noInline')
  static GetMemberReply getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMemberReply>(
          GetMemberReply.$_createMessage);
  static GetMemberReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lrzId => $_getSZ(0);
  @$pb.TagNumber(1)
  set lrzId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLrzId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLrzId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get memberId => $_getIZ(2);
  @$pb.TagNumber(3)
  set memberId($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMemberId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMemberId() => $_clearField(3);
}

class GetUploadStatusReply extends $pb.GeneratedMessage {
  factory GetUploadStatusReply({
    $core.String? fcmToken,
    $core.String? publicKey,
    $core.bool? studentId,
    $core.bool? employeeId,
    $core.bool? externalId,
  }) {
    final result = GetUploadStatusReply._();
    if (fcmToken != null) result.fcmToken = fcmToken;
    if (publicKey != null) result.publicKey = publicKey;
    if (studentId != null) result.studentId = studentId;
    if (employeeId != null) result.employeeId = employeeId;
    if (externalId != null) result.externalId = externalId;
    return result;
  }

  GetUploadStatusReply._();

  factory GetUploadStatusReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetUploadStatusReply()..mergeFromBuffer(data, registry);
  factory GetUploadStatusReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetUploadStatusReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUploadStatusReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: GetUploadStatusReply.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'fcmToken')
    ..aOS(2, _omitFieldNames ? '' : 'publicKey')
    ..aOB(3, _omitFieldNames ? '' : 'studentId')
    ..aOB(4, _omitFieldNames ? '' : 'employeeId')
    ..aOB(5, _omitFieldNames ? '' : 'externalId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUploadStatusReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUploadStatusReply copyWith(void Function(GetUploadStatusReply) updates) =>
      super.copyWith((message) => updates(message as GetUploadStatusReply))
          as GetUploadStatusReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use GetUploadStatusReply() / GetUploadStatusReply.new instead')
  static GetUploadStatusReply create() => GetUploadStatusReply._();
  static $pb.GeneratedMessage $_createMessage() => GetUploadStatusReply._();
  @$core.override
  GetUploadStatusReply createEmptyInstance() => GetUploadStatusReply._();
  @$core.pragma('dart2js:noInline')
  static GetUploadStatusReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUploadStatusReply>(
          GetUploadStatusReply.$_createMessage);
  static GetUploadStatusReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fcmToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set fcmToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFcmToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearFcmToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get publicKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set publicKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get studentId => $_getBF(2);
  @$pb.TagNumber(3)
  set studentId($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStudentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStudentId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get employeeId => $_getBF(3);
  @$pb.TagNumber(4)
  set employeeId($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEmployeeId() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmployeeId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get externalId => $_getBF(4);
  @$pb.TagNumber(5)
  set externalId($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExternalId() => $_has(4);
  @$pb.TagNumber(5)
  void clearExternalId() => $_clearField(5);
}

class GetCanteenHeadCountRequest extends $pb.GeneratedMessage {
  factory GetCanteenHeadCountRequest({
    $core.String? canteenId,
  }) {
    final result = GetCanteenHeadCountRequest._();
    if (canteenId != null) result.canteenId = canteenId;
    return result;
  }

  GetCanteenHeadCountRequest._();

  factory GetCanteenHeadCountRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetCanteenHeadCountRequest()..mergeFromBuffer(data, registry);
  factory GetCanteenHeadCountRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetCanteenHeadCountRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCanteenHeadCountRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: GetCanteenHeadCountRequest.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'canteenId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCanteenHeadCountRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCanteenHeadCountRequest copyWith(
          void Function(GetCanteenHeadCountRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetCanteenHeadCountRequest))
          as GetCanteenHeadCountRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use GetCanteenHeadCountRequest() / GetCanteenHeadCountRequest.new instead')
  static GetCanteenHeadCountRequest create() => GetCanteenHeadCountRequest._();
  static $pb.GeneratedMessage $_createMessage() =>
      GetCanteenHeadCountRequest._();
  @$core.override
  GetCanteenHeadCountRequest createEmptyInstance() =>
      GetCanteenHeadCountRequest._();
  @$core.pragma('dart2js:noInline')
  static GetCanteenHeadCountRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCanteenHeadCountRequest>(
          GetCanteenHeadCountRequest.$_createMessage);
  static GetCanteenHeadCountRequest? _defaultInstance;

  /// The requested canteen ID
  @$pb.TagNumber(1)
  $core.String get canteenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set canteenId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCanteenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanteenId() => $_clearField(1);
}

class GetCanteenHeadCountReply extends $pb.GeneratedMessage {
  factory GetCanteenHeadCountReply({
    $core.int? count,
    $core.int? maxCount,
    $core.double? percent,
    $1.Timestamp? timestamp,
  }) {
    final result = GetCanteenHeadCountReply._();
    if (count != null) result.count = count;
    if (maxCount != null) result.maxCount = maxCount;
    if (percent != null) result.percent = percent;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  GetCanteenHeadCountReply._();

  factory GetCanteenHeadCountReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetCanteenHeadCountReply()..mergeFromBuffer(data, registry);
  factory GetCanteenHeadCountReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetCanteenHeadCountReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCanteenHeadCountReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: GetCanteenHeadCountReply.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'maxCount', fieldType: $pb.PbFieldType.OU3)
    ..aD(3, _omitFieldNames ? '' : 'percent', fieldType: $pb.PbFieldType.OF)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $1.Timestamp.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCanteenHeadCountReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCanteenHeadCountReply copyWith(
          void Function(GetCanteenHeadCountReply) updates) =>
      super.copyWith((message) => updates(message as GetCanteenHeadCountReply))
          as GetCanteenHeadCountReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use GetCanteenHeadCountReply() / GetCanteenHeadCountReply.new instead')
  static GetCanteenHeadCountReply create() => GetCanteenHeadCountReply._();
  static $pb.GeneratedMessage $_createMessage() => GetCanteenHeadCountReply._();
  @$core.override
  GetCanteenHeadCountReply createEmptyInstance() =>
      GetCanteenHeadCountReply._();
  @$core.pragma('dart2js:noInline')
  static GetCanteenHeadCountReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCanteenHeadCountReply>(
          GetCanteenHeadCountReply.$_createMessage);
  static GetCanteenHeadCountReply? _defaultInstance;

  /// The absolut count of humans in the canteen. Only valid in case percent != -1.
  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);

  /// The maximum nunmber of humans in the canteen for the percent to be 100.00. Only valid in case percent != -1.
  @$pb.TagNumber(2)
  $core.int get maxCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set maxCount($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMaxCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxCount() => $_clearField(2);

  /// Current capacity utilization of the canteen clamped to 0 and 100 or -1 in case no data is available.
  @$pb.TagNumber(3)
  $core.double get percent => $_getN(2);
  @$pb.TagNumber(3)
  set percent($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPercent() => $_has(2);
  @$pb.TagNumber(3)
  void clearPercent() => $_clearField(3);

  /// A time stamp indicating how up to date the response is. Only valid in case percent != -1.
  @$pb.TagNumber(4)
  $1.Timestamp get timestamp => $_getN(3);
  @$pb.TagNumber(4)
  set timestamp($1.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureTimestamp() => $_ensure(3);
}

class GetCanteenBusynessRequest extends $pb.GeneratedMessage {
  factory GetCanteenBusynessRequest({
    $core.String? canteenId,
    $core.int? weekday,
  }) {
    final result = GetCanteenBusynessRequest._();
    if (canteenId != null) result.canteenId = canteenId;
    if (weekday != null) result.weekday = weekday;
    return result;
  }

  GetCanteenBusynessRequest._();

  factory GetCanteenBusynessRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetCanteenBusynessRequest()..mergeFromBuffer(data, registry);
  factory GetCanteenBusynessRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetCanteenBusynessRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCanteenBusynessRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: GetCanteenBusynessRequest.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'canteenId')
    ..aI(2, _omitFieldNames ? '' : 'weekday')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCanteenBusynessRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCanteenBusynessRequest copyWith(
          void Function(GetCanteenBusynessRequest) updates) =>
      super.copyWith((message) => updates(message as GetCanteenBusynessRequest))
          as GetCanteenBusynessRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use GetCanteenBusynessRequest() / GetCanteenBusynessRequest.new instead')
  static GetCanteenBusynessRequest create() => GetCanteenBusynessRequest._();
  static $pb.GeneratedMessage $_createMessage() =>
      GetCanteenBusynessRequest._();
  @$core.override
  GetCanteenBusynessRequest createEmptyInstance() =>
      GetCanteenBusynessRequest._();
  @$core.pragma('dart2js:noInline')
  static GetCanteenBusynessRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCanteenBusynessRequest>(
          GetCanteenBusynessRequest.$_createMessage);
  static GetCanteenBusynessRequest? _defaultInstance;

  /// Canteen ID (eat-api id or enum name, e.g. "mensa-garching").
  @$pb.TagNumber(1)
  $core.String get canteenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set canteenId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCanteenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanteenId() => $_clearField(1);

  /// Optional weekday: 0 (Monday) - 6 (Sunday). Defaults to today in Europe/Berlin when omitted.
  @$pb.TagNumber(2)
  $core.int get weekday => $_getIZ(1);
  @$pb.TagNumber(2)
  set weekday($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWeekday() => $_has(1);
  @$pb.TagNumber(2)
  void clearWeekday() => $_clearField(2);
}

class BusynessSlot extends $pb.GeneratedMessage {
  factory BusynessSlot({
    $core.int? hour,
    $core.int? minute,
    $core.double? typicalPercent,
    $core.double? typicalCount,
    $core.int? sampleDays,
  }) {
    final result = BusynessSlot._();
    if (hour != null) result.hour = hour;
    if (minute != null) result.minute = minute;
    if (typicalPercent != null) result.typicalPercent = typicalPercent;
    if (typicalCount != null) result.typicalCount = typicalCount;
    if (sampleDays != null) result.sampleDays = sampleDays;
    return result;
  }

  BusynessSlot._();

  factory BusynessSlot.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      BusynessSlot()..mergeFromBuffer(data, registry);
  factory BusynessSlot.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      BusynessSlot()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BusynessSlot',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: BusynessSlot.$_createMessage)
    ..aI(1, _omitFieldNames ? '' : 'hour')
    ..aI(2, _omitFieldNames ? '' : 'minute')
    ..aD(3, _omitFieldNames ? '' : 'typicalPercent')
    ..aD(4, _omitFieldNames ? '' : 'typicalCount')
    ..aI(5, _omitFieldNames ? '' : 'sampleDays')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusynessSlot clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusynessSlot copyWith(void Function(BusynessSlot) updates) =>
      super.copyWith((message) => updates(message as BusynessSlot))
          as BusynessSlot;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use BusynessSlot() / BusynessSlot.new instead')
  static BusynessSlot create() => BusynessSlot._();
  static $pb.GeneratedMessage $_createMessage() => BusynessSlot._();
  @$core.override
  BusynessSlot createEmptyInstance() => BusynessSlot._();
  @$core.pragma('dart2js:noInline')
  static BusynessSlot getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BusynessSlot>(
          BusynessSlot.$_createMessage);
  static BusynessSlot? _defaultInstance;

  /// Hour in Europe/Berlin (0-23)
  @$pb.TagNumber(1)
  $core.int get hour => $_getIZ(0);
  @$pb.TagNumber(1)
  set hour($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHour() => $_has(0);
  @$pb.TagNumber(1)
  void clearHour() => $_clearField(1);

  /// Minute in Europe/Berlin (0, 15, 30, 45)
  @$pb.TagNumber(2)
  $core.int get minute => $_getIZ(1);
  @$pb.TagNumber(2)
  set minute($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMinute() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinute() => $_clearField(2);

  /// Typical utilization percentage (0-100) averaged across recent weeks
  @$pb.TagNumber(3)
  $core.double get typicalPercent => $_getN(2);
  @$pb.TagNumber(3)
  set typicalPercent($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTypicalPercent() => $_has(2);
  @$pb.TagNumber(3)
  void clearTypicalPercent() => $_clearField(3);

  /// Typical head count averaged across recent weeks
  @$pb.TagNumber(4)
  $core.double get typicalCount => $_getN(3);
  @$pb.TagNumber(4)
  set typicalCount($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTypicalCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearTypicalCount() => $_clearField(4);

  /// Number of distinct days contributing to this slot
  @$pb.TagNumber(5)
  $core.int get sampleDays => $_getIZ(4);
  @$pb.TagNumber(5)
  set sampleDays($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSampleDays() => $_has(4);
  @$pb.TagNumber(5)
  void clearSampleDays() => $_clearField(5);
}

class GetCanteenBusynessReply extends $pb.GeneratedMessage {
  factory GetCanteenBusynessReply({
    GetCanteenHeadCountReply? current,
    $core.int? weekday,
    $core.Iterable<BusynessSlot>? typicalSlots,
    $core.double? vsTypicalPercent,
    $core.bool? hasTypicalComparison,
    BusynessSlot? bestUpcomingSlot,
  }) {
    final result = GetCanteenBusynessReply._();
    if (current != null) result.current = current;
    if (weekday != null) result.weekday = weekday;
    if (typicalSlots != null) result.typicalSlots.addAll(typicalSlots);
    if (vsTypicalPercent != null) result.vsTypicalPercent = vsTypicalPercent;
    if (hasTypicalComparison != null)
      result.hasTypicalComparison = hasTypicalComparison;
    if (bestUpcomingSlot != null) result.bestUpcomingSlot = bestUpcomingSlot;
    return result;
  }

  GetCanteenBusynessReply._();

  factory GetCanteenBusynessReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetCanteenBusynessReply()..mergeFromBuffer(data, registry);
  factory GetCanteenBusynessReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetCanteenBusynessReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCanteenBusynessReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: GetCanteenBusynessReply.$_createMessage)
    ..aOM<GetCanteenHeadCountReply>(1, _omitFieldNames ? '' : 'current',
        subBuilder: GetCanteenHeadCountReply.$_createMessage)
    ..aI(2, _omitFieldNames ? '' : 'weekday')
    ..pPM<BusynessSlot>(3, _omitFieldNames ? '' : 'typicalSlots',
        subBuilder: BusynessSlot.$_createMessage)
    ..aD(4, _omitFieldNames ? '' : 'vsTypicalPercent')
    ..aOB(5, _omitFieldNames ? '' : 'hasTypicalComparison')
    ..aOM<BusynessSlot>(6, _omitFieldNames ? '' : 'bestUpcomingSlot',
        subBuilder: BusynessSlot.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCanteenBusynessReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCanteenBusynessReply copyWith(
          void Function(GetCanteenBusynessReply) updates) =>
      super.copyWith((message) => updates(message as GetCanteenBusynessReply))
          as GetCanteenBusynessReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use GetCanteenBusynessReply() / GetCanteenBusynessReply.new instead')
  static GetCanteenBusynessReply create() => GetCanteenBusynessReply._();
  static $pb.GeneratedMessage $_createMessage() => GetCanteenBusynessReply._();
  @$core.override
  GetCanteenBusynessReply createEmptyInstance() => GetCanteenBusynessReply._();
  @$core.pragma('dart2js:noInline')
  static GetCanteenBusynessReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCanteenBusynessReply>(
          GetCanteenBusynessReply.$_createMessage);
  static GetCanteenBusynessReply? _defaultInstance;

  /// Current live head count (same shape as GetCanteenHeadCountReply; percent == -1 if unavailable)
  @$pb.TagNumber(1)
  GetCanteenHeadCountReply get current => $_getN(0);
  @$pb.TagNumber(1)
  set current(GetCanteenHeadCountReply value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCurrent() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrent() => $_clearField(1);
  @$pb.TagNumber(1)
  GetCanteenHeadCountReply ensureCurrent() => $_ensure(0);

  /// Weekday (0=Monday .. 6=Sunday) that the curve represents
  @$pb.TagNumber(2)
  $core.int get weekday => $_getIZ(1);
  @$pb.TagNumber(2)
  set weekday($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWeekday() => $_has(1);
  @$pb.TagNumber(2)
  void clearWeekday() => $_clearField(2);

  /// Typical 15-minute occupancy curve for the requested weekday
  @$pb.TagNumber(3)
  $pb.PbList<BusynessSlot> get typicalSlots => $_getList(2);

  /// Difference between current percent and typical percent for the current 15-min slot (0 if unavailable)
  @$pb.TagNumber(4)
  $core.double get vsTypicalPercent => $_getN(3);
  @$pb.TagNumber(4)
  set vsTypicalPercent($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVsTypicalPercent() => $_has(3);
  @$pb.TagNumber(4)
  void clearVsTypicalPercent() => $_clearField(4);

  /// True when vs_typical_percent is computed from both live data and historical data
  @$pb.TagNumber(5)
  $core.bool get hasTypicalComparison => $_getBF(4);
  @$pb.TagNumber(5)
  set hasTypicalComparison($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasHasTypicalComparison() => $_has(4);
  @$pb.TagNumber(5)
  void clearHasTypicalComparison() => $_clearField(5);

  /// Quietest upcoming 15-minute lunch slot (11:00-14:30 Berlin) with historical data, if any
  @$pb.TagNumber(6)
  BusynessSlot get bestUpcomingSlot => $_getN(5);
  @$pb.TagNumber(6)
  set bestUpcomingSlot(BusynessSlot value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasBestUpcomingSlot() => $_has(5);
  @$pb.TagNumber(6)
  void clearBestUpcomingSlot() => $_clearField(6);
  @$pb.TagNumber(6)
  BusynessSlot ensureBestUpcomingSlot() => $_ensure(5);
}

class ListStudentClubRequest extends $pb.GeneratedMessage {
  factory ListStudentClubRequest({
    Language? language,
  }) {
    final result = ListStudentClubRequest._();
    if (language != null) result.language = language;
    return result;
  }

  ListStudentClubRequest._();

  factory ListStudentClubRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListStudentClubRequest()..mergeFromBuffer(data, registry);
  factory ListStudentClubRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListStudentClubRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListStudentClubRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListStudentClubRequest.$_createMessage)
    ..aE<Language>(1, _omitFieldNames ? '' : 'language',
        enumValues: Language.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListStudentClubRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListStudentClubRequest copyWith(
          void Function(ListStudentClubRequest) updates) =>
      super.copyWith((message) => updates(message as ListStudentClubRequest))
          as ListStudentClubRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListStudentClubRequest() / ListStudentClubRequest.new instead')
  static ListStudentClubRequest create() => ListStudentClubRequest._();
  static $pb.GeneratedMessage $_createMessage() => ListStudentClubRequest._();
  @$core.override
  ListStudentClubRequest createEmptyInstance() => ListStudentClubRequest._();
  @$core.pragma('dart2js:noInline')
  static ListStudentClubRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListStudentClubRequest>(
          ListStudentClubRequest.$_createMessage);
  static ListStudentClubRequest? _defaultInstance;

  /// Language of the student clubs and categories
  /// Defaults to german
  @$pb.TagNumber(1)
  Language get language => $_getN(0);
  @$pb.TagNumber(1)
  set language(Language value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLanguage() => $_has(0);
  @$pb.TagNumber(1)
  void clearLanguage() => $_clearField(1);
}

class ListStudentClubReply extends $pb.GeneratedMessage {
  factory ListStudentClubReply({
    $core.Iterable<StudentClubCollection>? collections,
  }) {
    final result = ListStudentClubReply._();
    if (collections != null) result.collections.addAll(collections);
    return result;
  }

  ListStudentClubReply._();

  factory ListStudentClubReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListStudentClubReply()..mergeFromBuffer(data, registry);
  factory ListStudentClubReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListStudentClubReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListStudentClubReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListStudentClubReply.$_createMessage)
    ..pPM<StudentClubCollection>(1, _omitFieldNames ? '' : 'collections',
        subBuilder: StudentClubCollection.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListStudentClubReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListStudentClubReply copyWith(void Function(ListStudentClubReply) updates) =>
      super.copyWith((message) => updates(message as ListStudentClubReply))
          as ListStudentClubReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListStudentClubReply() / ListStudentClubReply.new instead')
  static ListStudentClubReply create() => ListStudentClubReply._();
  static $pb.GeneratedMessage $_createMessage() => ListStudentClubReply._();
  @$core.override
  ListStudentClubReply createEmptyInstance() => ListStudentClubReply._();
  @$core.pragma('dart2js:noInline')
  static ListStudentClubReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListStudentClubReply>(
          ListStudentClubReply.$_createMessage);
  static ListStudentClubReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<StudentClubCollection> get collections => $_getList(0);
}

class StudentClub extends $pb.GeneratedMessage {
  factory StudentClub({
    $core.String? name,
    $core.String? description,
    $core.String? linkUrl,
    $core.String? coverUrl,
  }) {
    final result = StudentClub._();
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (linkUrl != null) result.linkUrl = linkUrl;
    if (coverUrl != null) result.coverUrl = coverUrl;
    return result;
  }

  StudentClub._();

  factory StudentClub.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      StudentClub()..mergeFromBuffer(data, registry);
  factory StudentClub.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      StudentClub()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StudentClub',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: StudentClub.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOS(3, _omitFieldNames ? '' : 'linkUrl')
    ..aOS(4, _omitFieldNames ? '' : 'coverUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StudentClub clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StudentClub copyWith(void Function(StudentClub) updates) =>
      super.copyWith((message) => updates(message as StudentClub))
          as StudentClub;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use StudentClub() / StudentClub.new instead')
  static StudentClub create() => StudentClub._();
  static $pb.GeneratedMessage $_createMessage() => StudentClub._();
  @$core.override
  StudentClub createEmptyInstance() => StudentClub._();
  @$core.pragma('dart2js:noInline')
  static StudentClub getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StudentClub>(
          StudentClub.$_createMessage);
  static StudentClub? _defaultInstance;

  /// The name of the club
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// How the club describes itsself
  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);

  /// Where the clubs main internet presence is
  @$pb.TagNumber(3)
  $core.String get linkUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set linkUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLinkUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearLinkUrl() => $_clearField(3);

  /// Where to find a image for this club
  @$pb.TagNumber(4)
  $core.String get coverUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set coverUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCoverUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoverUrl() => $_clearField(4);
}

class StudentClubCollection extends $pb.GeneratedMessage {
  factory StudentClubCollection({
    $core.String? title,
    $core.String? description,
    $core.Iterable<StudentClub>? clubs,
    $fixnum.Int64? unstableCollectionId,
  }) {
    final result = StudentClubCollection._();
    if (title != null) result.title = title;
    if (description != null) result.description = description;
    if (clubs != null) result.clubs.addAll(clubs);
    if (unstableCollectionId != null)
      result.unstableCollectionId = unstableCollectionId;
    return result;
  }

  StudentClubCollection._();

  factory StudentClubCollection.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      StudentClubCollection()..mergeFromBuffer(data, registry);
  factory StudentClubCollection.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      StudentClubCollection()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StudentClubCollection',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: StudentClubCollection.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..pPM<StudentClub>(3, _omitFieldNames ? '' : 'clubs',
        subBuilder: StudentClub.$_createMessage)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'unstableCollectionId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StudentClubCollection clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StudentClubCollection copyWith(
          void Function(StudentClubCollection) updates) =>
      super.copyWith((message) => updates(message as StudentClubCollection))
          as StudentClubCollection;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use StudentClubCollection() / StudentClubCollection.new instead')
  static StudentClubCollection create() => StudentClubCollection._();
  static $pb.GeneratedMessage $_createMessage() => StudentClubCollection._();
  @$core.override
  StudentClubCollection createEmptyInstance() => StudentClubCollection._();
  @$core.pragma('dart2js:noInline')
  static StudentClubCollection getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StudentClubCollection>(
          StudentClubCollection.$_createMessage);
  static StudentClubCollection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<StudentClub> get clubs => $_getList(2);

  /// id of the collection.
  /// Might not be stable over time because of scraping
  @$pb.TagNumber(4)
  $fixnum.Int64 get unstableCollectionId => $_getI64(3);
  @$pb.TagNumber(4)
  set unstableCollectionId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUnstableCollectionId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUnstableCollectionId() => $_clearField(4);
}

class ListStudentGroupRequest extends $pb.GeneratedMessage {
  factory ListStudentGroupRequest({
    Language? language,
  }) {
    final result = ListStudentGroupRequest._();
    if (language != null) result.language = language;
    return result;
  }

  ListStudentGroupRequest._();

  factory ListStudentGroupRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListStudentGroupRequest()..mergeFromBuffer(data, registry);
  factory ListStudentGroupRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListStudentGroupRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListStudentGroupRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListStudentGroupRequest.$_createMessage)
    ..aE<Language>(1, _omitFieldNames ? '' : 'language',
        enumValues: Language.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListStudentGroupRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListStudentGroupRequest copyWith(
          void Function(ListStudentGroupRequest) updates) =>
      super.copyWith((message) => updates(message as ListStudentGroupRequest))
          as ListStudentGroupRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListStudentGroupRequest() / ListStudentGroupRequest.new instead')
  static ListStudentGroupRequest create() => ListStudentGroupRequest._();
  static $pb.GeneratedMessage $_createMessage() => ListStudentGroupRequest._();
  @$core.override
  ListStudentGroupRequest createEmptyInstance() => ListStudentGroupRequest._();
  @$core.pragma('dart2js:noInline')
  static ListStudentGroupRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListStudentGroupRequest>(
          ListStudentGroupRequest.$_createMessage);
  static ListStudentGroupRequest? _defaultInstance;

  /// Language of the student groups and categories
  /// Defaults to german
  @$pb.TagNumber(1)
  Language get language => $_getN(0);
  @$pb.TagNumber(1)
  set language(Language value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLanguage() => $_has(0);
  @$pb.TagNumber(1)
  void clearLanguage() => $_clearField(1);
}

class ListStudentGroupReply extends $pb.GeneratedMessage {
  factory ListStudentGroupReply({
    $core.Iterable<StudentClubCollection>? studentClubs,
    $core.Iterable<StudentCouncilCollection>? studentCouncils,
  }) {
    final result = ListStudentGroupReply._();
    if (studentClubs != null) result.studentClubs.addAll(studentClubs);
    if (studentCouncils != null) result.studentCouncils.addAll(studentCouncils);
    return result;
  }

  ListStudentGroupReply._();

  factory ListStudentGroupReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListStudentGroupReply()..mergeFromBuffer(data, registry);
  factory ListStudentGroupReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListStudentGroupReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListStudentGroupReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListStudentGroupReply.$_createMessage)
    ..pPM<StudentClubCollection>(1, _omitFieldNames ? '' : 'studentClubs',
        subBuilder: StudentClubCollection.$_createMessage)
    ..pPM<StudentCouncilCollection>(2, _omitFieldNames ? '' : 'studentCouncils',
        subBuilder: StudentCouncilCollection.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListStudentGroupReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListStudentGroupReply copyWith(
          void Function(ListStudentGroupReply) updates) =>
      super.copyWith((message) => updates(message as ListStudentGroupReply))
          as ListStudentGroupReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListStudentGroupReply() / ListStudentGroupReply.new instead')
  static ListStudentGroupReply create() => ListStudentGroupReply._();
  static $pb.GeneratedMessage $_createMessage() => ListStudentGroupReply._();
  @$core.override
  ListStudentGroupReply createEmptyInstance() => ListStudentGroupReply._();
  @$core.pragma('dart2js:noInline')
  static ListStudentGroupReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListStudentGroupReply>(
          ListStudentGroupReply.$_createMessage);
  static ListStudentGroupReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<StudentClubCollection> get studentClubs => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<StudentCouncilCollection> get studentCouncils => $_getList(1);
}

class StudentCouncil extends $pb.GeneratedMessage {
  factory StudentCouncil({
    $core.String? name,
    $core.String? description,
    $core.String? linkUrl,
    $core.String? coverUrl,
  }) {
    final result = StudentCouncil._();
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (linkUrl != null) result.linkUrl = linkUrl;
    if (coverUrl != null) result.coverUrl = coverUrl;
    return result;
  }

  StudentCouncil._();

  factory StudentCouncil.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      StudentCouncil()..mergeFromBuffer(data, registry);
  factory StudentCouncil.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      StudentCouncil()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StudentCouncil',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: StudentCouncil.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOS(3, _omitFieldNames ? '' : 'linkUrl')
    ..aOS(4, _omitFieldNames ? '' : 'coverUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StudentCouncil clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StudentCouncil copyWith(void Function(StudentCouncil) updates) =>
      super.copyWith((message) => updates(message as StudentCouncil))
          as StudentCouncil;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use StudentCouncil() / StudentCouncil.new instead')
  static StudentCouncil create() => StudentCouncil._();
  static $pb.GeneratedMessage $_createMessage() => StudentCouncil._();
  @$core.override
  StudentCouncil createEmptyInstance() => StudentCouncil._();
  @$core.pragma('dart2js:noInline')
  static StudentCouncil getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StudentCouncil>(
          StudentCouncil.$_createMessage);
  static StudentCouncil? _defaultInstance;

  /// The name of the council
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// How the council describes itself
  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);

  /// Where the council's main internet presence is
  @$pb.TagNumber(3)
  $core.String get linkUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set linkUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLinkUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearLinkUrl() => $_clearField(3);

  /// Where to find an image for this council
  @$pb.TagNumber(4)
  $core.String get coverUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set coverUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCoverUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoverUrl() => $_clearField(4);
}

class StudentCouncilCollection extends $pb.GeneratedMessage {
  factory StudentCouncilCollection({
    $core.String? title,
    $core.String? description,
    $core.Iterable<StudentCouncil>? councils,
    $fixnum.Int64? unstableCollectionId,
  }) {
    final result = StudentCouncilCollection._();
    if (title != null) result.title = title;
    if (description != null) result.description = description;
    if (councils != null) result.councils.addAll(councils);
    if (unstableCollectionId != null)
      result.unstableCollectionId = unstableCollectionId;
    return result;
  }

  StudentCouncilCollection._();

  factory StudentCouncilCollection.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      StudentCouncilCollection()..mergeFromBuffer(data, registry);
  factory StudentCouncilCollection.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      StudentCouncilCollection()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StudentCouncilCollection',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: StudentCouncilCollection.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..pPM<StudentCouncil>(3, _omitFieldNames ? '' : 'councils',
        subBuilder: StudentCouncil.$_createMessage)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'unstableCollectionId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StudentCouncilCollection clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StudentCouncilCollection copyWith(
          void Function(StudentCouncilCollection) updates) =>
      super.copyWith((message) => updates(message as StudentCouncilCollection))
          as StudentCouncilCollection;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use StudentCouncilCollection() / StudentCouncilCollection.new instead')
  static StudentCouncilCollection create() => StudentCouncilCollection._();
  static $pb.GeneratedMessage $_createMessage() => StudentCouncilCollection._();
  @$core.override
  StudentCouncilCollection createEmptyInstance() =>
      StudentCouncilCollection._();
  @$core.pragma('dart2js:noInline')
  static StudentCouncilCollection getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StudentCouncilCollection>(
          StudentCouncilCollection.$_createMessage);
  static StudentCouncilCollection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<StudentCouncil> get councils => $_getList(2);

  /// id of the collection.
  /// Might not be stable over time.
  /// Not unique across student club and student council collections.
  @$pb.TagNumber(4)
  $fixnum.Int64 get unstableCollectionId => $_getI64(3);
  @$pb.TagNumber(4)
  set unstableCollectionId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUnstableCollectionId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUnstableCollectionId() => $_clearField(4);
}

class ListLibrariesRequest extends $pb.GeneratedMessage {
  factory ListLibrariesRequest({
    $core.String? campus,
  }) {
    final result = ListLibrariesRequest._();
    if (campus != null) result.campus = campus;
    return result;
  }

  ListLibrariesRequest._();

  factory ListLibrariesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListLibrariesRequest()..mergeFromBuffer(data, registry);
  factory ListLibrariesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListLibrariesRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListLibrariesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListLibrariesRequest.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'campus')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListLibrariesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListLibrariesRequest copyWith(void Function(ListLibrariesRequest) updates) =>
      super.copyWith((message) => updates(message as ListLibrariesRequest))
          as ListLibrariesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use ListLibrariesRequest() / ListLibrariesRequest.new instead')
  static ListLibrariesRequest create() => ListLibrariesRequest._();
  static $pb.GeneratedMessage $_createMessage() => ListLibrariesRequest._();
  @$core.override
  ListLibrariesRequest createEmptyInstance() => ListLibrariesRequest._();
  @$core.pragma('dart2js:noInline')
  static ListLibrariesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListLibrariesRequest>(
          ListLibrariesRequest.$_createMessage);
  static ListLibrariesRequest? _defaultInstance;

  /// Optional campus filter (e.g. "garching", "stammgelaende", "weihenstephan")
  @$pb.TagNumber(1)
  $core.String get campus => $_getSZ(0);
  @$pb.TagNumber(1)
  set campus($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCampus() => $_has(0);
  @$pb.TagNumber(1)
  void clearCampus() => $_clearField(1);
}

class LibraryOccupancy extends $pb.GeneratedMessage {
  factory LibraryOccupancy({
    $core.String? libraryId,
    $core.String? name,
    $core.String? campus,
    $core.int? count,
    $core.int? maxCount,
    $core.double? percent,
    $1.Timestamp? timestamp,
  }) {
    final result = LibraryOccupancy._();
    if (libraryId != null) result.libraryId = libraryId;
    if (name != null) result.name = name;
    if (campus != null) result.campus = campus;
    if (count != null) result.count = count;
    if (maxCount != null) result.maxCount = maxCount;
    if (percent != null) result.percent = percent;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  LibraryOccupancy._();

  factory LibraryOccupancy.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      LibraryOccupancy()..mergeFromBuffer(data, registry);
  factory LibraryOccupancy.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      LibraryOccupancy()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LibraryOccupancy',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: LibraryOccupancy.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'libraryId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'campus')
    ..aI(4, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..aI(5, _omitFieldNames ? '' : 'maxCount', fieldType: $pb.PbFieldType.OU3)
    ..aD(6, _omitFieldNames ? '' : 'percent', fieldType: $pb.PbFieldType.OF)
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $1.Timestamp.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LibraryOccupancy clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LibraryOccupancy copyWith(void Function(LibraryOccupancy) updates) =>
      super.copyWith((message) => updates(message as LibraryOccupancy))
          as LibraryOccupancy;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use LibraryOccupancy() / LibraryOccupancy.new instead')
  static LibraryOccupancy create() => LibraryOccupancy._();
  static $pb.GeneratedMessage $_createMessage() => LibraryOccupancy._();
  @$core.override
  LibraryOccupancy createEmptyInstance() => LibraryOccupancy._();
  @$core.pragma('dart2js:noInline')
  static LibraryOccupancy getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LibraryOccupancy>(
          LibraryOccupancy.$_createMessage);
  static LibraryOccupancy? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get libraryId => $_getSZ(0);
  @$pb.TagNumber(1)
  set libraryId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLibraryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLibraryId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get campus => $_getSZ(2);
  @$pb.TagNumber(3)
  set campus($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCampus() => $_has(2);
  @$pb.TagNumber(3)
  void clearCampus() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(4)
  set count($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get maxCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set maxCount($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMaxCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxCount() => $_clearField(5);

  /// Current capacity utilization clamped to 0..100, or -1 if unavailable.
  @$pb.TagNumber(6)
  $core.double get percent => $_getN(5);
  @$pb.TagNumber(6)
  set percent($core.double value) => $_setFloat(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPercent() => $_has(5);
  @$pb.TagNumber(6)
  void clearPercent() => $_clearField(6);

  @$pb.TagNumber(7)
  $1.Timestamp get timestamp => $_getN(6);
  @$pb.TagNumber(7)
  set timestamp($1.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasTimestamp() => $_has(6);
  @$pb.TagNumber(7)
  void clearTimestamp() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureTimestamp() => $_ensure(6);
}

class ListLibrariesReply extends $pb.GeneratedMessage {
  factory ListLibrariesReply({
    $core.Iterable<LibraryOccupancy>? libraries,
  }) {
    final result = ListLibrariesReply._();
    if (libraries != null) result.libraries.addAll(libraries);
    return result;
  }

  ListLibrariesReply._();

  factory ListLibrariesReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListLibrariesReply()..mergeFromBuffer(data, registry);
  factory ListLibrariesReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      ListLibrariesReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListLibrariesReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: ListLibrariesReply.$_createMessage)
    ..pPM<LibraryOccupancy>(1, _omitFieldNames ? '' : 'libraries',
        subBuilder: LibraryOccupancy.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListLibrariesReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListLibrariesReply copyWith(void Function(ListLibrariesReply) updates) =>
      super.copyWith((message) => updates(message as ListLibrariesReply))
          as ListLibrariesReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated('Use ListLibrariesReply() / ListLibrariesReply.new instead')
  static ListLibrariesReply create() => ListLibrariesReply._();
  static $pb.GeneratedMessage $_createMessage() => ListLibrariesReply._();
  @$core.override
  ListLibrariesReply createEmptyInstance() => ListLibrariesReply._();
  @$core.pragma('dart2js:noInline')
  static ListLibrariesReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListLibrariesReply>(
          ListLibrariesReply.$_createMessage);
  static ListLibrariesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<LibraryOccupancy> get libraries => $_getList(0);
}

class GetLibraryBusynessRequest extends $pb.GeneratedMessage {
  factory GetLibraryBusynessRequest({
    $core.String? libraryId,
    $core.int? weekday,
  }) {
    final result = GetLibraryBusynessRequest._();
    if (libraryId != null) result.libraryId = libraryId;
    if (weekday != null) result.weekday = weekday;
    return result;
  }

  GetLibraryBusynessRequest._();

  factory GetLibraryBusynessRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetLibraryBusynessRequest()..mergeFromBuffer(data, registry);
  factory GetLibraryBusynessRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetLibraryBusynessRequest()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetLibraryBusynessRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: GetLibraryBusynessRequest.$_createMessage)
    ..aOS(1, _omitFieldNames ? '' : 'libraryId')
    ..aI(2, _omitFieldNames ? '' : 'weekday')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLibraryBusynessRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLibraryBusynessRequest copyWith(
          void Function(GetLibraryBusynessRequest) updates) =>
      super.copyWith((message) => updates(message as GetLibraryBusynessRequest))
          as GetLibraryBusynessRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use GetLibraryBusynessRequest() / GetLibraryBusynessRequest.new instead')
  static GetLibraryBusynessRequest create() => GetLibraryBusynessRequest._();
  static $pb.GeneratedMessage $_createMessage() =>
      GetLibraryBusynessRequest._();
  @$core.override
  GetLibraryBusynessRequest createEmptyInstance() =>
      GetLibraryBusynessRequest._();
  @$core.pragma('dart2js:noInline')
  static GetLibraryBusynessRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLibraryBusynessRequest>(
          GetLibraryBusynessRequest.$_createMessage);
  static GetLibraryBusynessRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get libraryId => $_getSZ(0);
  @$pb.TagNumber(1)
  set libraryId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLibraryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLibraryId() => $_clearField(1);

  /// Optional weekday: 0 (Monday) - 6 (Sunday). Defaults to today in Europe/Berlin.
  @$pb.TagNumber(2)
  $core.int get weekday => $_getIZ(1);
  @$pb.TagNumber(2)
  set weekday($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWeekday() => $_has(1);
  @$pb.TagNumber(2)
  void clearWeekday() => $_clearField(2);
}

class GetLibraryBusynessReply extends $pb.GeneratedMessage {
  factory GetLibraryBusynessReply({
    LibraryOccupancy? current,
    $core.int? weekday,
    $core.Iterable<BusynessSlot>? typicalSlots,
    $core.double? vsTypicalPercent,
    $core.bool? hasTypicalComparison,
    BusynessSlot? bestUpcomingSlot,
  }) {
    final result = GetLibraryBusynessReply._();
    if (current != null) result.current = current;
    if (weekday != null) result.weekday = weekday;
    if (typicalSlots != null) result.typicalSlots.addAll(typicalSlots);
    if (vsTypicalPercent != null) result.vsTypicalPercent = vsTypicalPercent;
    if (hasTypicalComparison != null)
      result.hasTypicalComparison = hasTypicalComparison;
    if (bestUpcomingSlot != null) result.bestUpcomingSlot = bestUpcomingSlot;
    return result;
  }

  GetLibraryBusynessReply._();

  factory GetLibraryBusynessReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetLibraryBusynessReply()..mergeFromBuffer(data, registry);
  factory GetLibraryBusynessReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      GetLibraryBusynessReply()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetLibraryBusynessReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: GetLibraryBusynessReply.$_createMessage)
    ..aOM<LibraryOccupancy>(1, _omitFieldNames ? '' : 'current',
        subBuilder: LibraryOccupancy.$_createMessage)
    ..aI(2, _omitFieldNames ? '' : 'weekday')
    ..pPM<BusynessSlot>(3, _omitFieldNames ? '' : 'typicalSlots',
        subBuilder: BusynessSlot.$_createMessage)
    ..aD(4, _omitFieldNames ? '' : 'vsTypicalPercent')
    ..aOB(5, _omitFieldNames ? '' : 'hasTypicalComparison')
    ..aOM<BusynessSlot>(6, _omitFieldNames ? '' : 'bestUpcomingSlot',
        subBuilder: BusynessSlot.$_createMessage)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLibraryBusynessReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLibraryBusynessReply copyWith(
          void Function(GetLibraryBusynessReply) updates) =>
      super.copyWith((message) => updates(message as GetLibraryBusynessReply))
          as GetLibraryBusynessReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  @$core.Deprecated(
      'Use GetLibraryBusynessReply() / GetLibraryBusynessReply.new instead')
  static GetLibraryBusynessReply create() => GetLibraryBusynessReply._();
  static $pb.GeneratedMessage $_createMessage() => GetLibraryBusynessReply._();
  @$core.override
  GetLibraryBusynessReply createEmptyInstance() => GetLibraryBusynessReply._();
  @$core.pragma('dart2js:noInline')
  static GetLibraryBusynessReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLibraryBusynessReply>(
          GetLibraryBusynessReply.$_createMessage);
  static GetLibraryBusynessReply? _defaultInstance;

  @$pb.TagNumber(1)
  LibraryOccupancy get current => $_getN(0);
  @$pb.TagNumber(1)
  set current(LibraryOccupancy value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCurrent() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrent() => $_clearField(1);
  @$pb.TagNumber(1)
  LibraryOccupancy ensureCurrent() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get weekday => $_getIZ(1);
  @$pb.TagNumber(2)
  set weekday($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWeekday() => $_has(1);
  @$pb.TagNumber(2)
  void clearWeekday() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<BusynessSlot> get typicalSlots => $_getList(2);

  @$pb.TagNumber(4)
  $core.double get vsTypicalPercent => $_getN(3);
  @$pb.TagNumber(4)
  set vsTypicalPercent($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVsTypicalPercent() => $_has(3);
  @$pb.TagNumber(4)
  void clearVsTypicalPercent() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get hasTypicalComparison => $_getBF(4);
  @$pb.TagNumber(5)
  set hasTypicalComparison($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasHasTypicalComparison() => $_has(4);
  @$pb.TagNumber(5)
  void clearHasTypicalComparison() => $_clearField(5);

  /// Quietest upcoming 15-minute study slot (08:00-21:00 Berlin) with historical data, if any
  @$pb.TagNumber(6)
  BusynessSlot get bestUpcomingSlot => $_getN(5);
  @$pb.TagNumber(6)
  set bestUpcomingSlot(BusynessSlot value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasBestUpcomingSlot() => $_has(5);
  @$pb.TagNumber(6)
  void clearBestUpcomingSlot() => $_clearField(6);
  @$pb.TagNumber(6)
  BusynessSlot ensureBestUpcomingSlot() => $_ensure(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
