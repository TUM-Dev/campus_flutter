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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/timestamp.pb.dart' as $1;
import 'campus_backend.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'campus_backend.pbenum.dart';

class CreateDeviceRequest extends $pb.GeneratedMessage {
  factory CreateDeviceRequest({
    $core.String? deviceId,
    $core.String? publicKey,
    DeviceType? deviceType,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (publicKey != null) result.publicKey = publicKey;
    if (deviceType != null) result.deviceType = deviceType;
    return result;
  }

  CreateDeviceRequest._();

  factory CreateDeviceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateDeviceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateDeviceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static CreateDeviceRequest create() => CreateDeviceRequest._();
  @$core.override
  CreateDeviceRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateDeviceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateDeviceRequest>(create);
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
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    return result;
  }

  CreateDeviceReply._();

  factory CreateDeviceReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateDeviceReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateDeviceReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static CreateDeviceReply create() => CreateDeviceReply._();
  @$core.override
  CreateDeviceReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateDeviceReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateDeviceReply>(create);
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
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (deviceType != null) result.deviceType = deviceType;
    return result;
  }

  DeleteDeviceRequest._();

  factory DeleteDeviceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteDeviceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteDeviceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static DeleteDeviceRequest create() => DeleteDeviceRequest._();
  @$core.override
  DeleteDeviceRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteDeviceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteDeviceRequest>(create);
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
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    return result;
  }

  DeleteDeviceReply._();

  factory DeleteDeviceReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteDeviceReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteDeviceReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static DeleteDeviceReply create() => DeleteDeviceReply._();
  @$core.override
  DeleteDeviceReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteDeviceReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteDeviceReply>(create);
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
    final result = create();
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
      create()..mergeFromBuffer(data, registry);
  factory News.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'News',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'text')
    ..aOS(4, _omitFieldNames ? '' : 'link')
    ..aOS(5, _omitFieldNames ? '' : 'imageUrl')
    ..aOS(6, _omitFieldNames ? '' : 'sourceId')
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'created',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(8, _omitFieldNames ? '' : 'date',
        subBuilder: $1.Timestamp.create)
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
  static News create() => News._();
  @$core.override
  News createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static News getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<News>(create);
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
    final result = create();
    if (news != null) result.news.addAll(news);
    return result;
  }

  ListNewsReply._();

  factory ListNewsReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListNewsReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListNewsReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..pPM<News>(1, _omitFieldNames ? '' : 'news', subBuilder: News.create)
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
  static ListNewsReply create() => ListNewsReply._();
  @$core.override
  ListNewsReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListNewsReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListNewsReply>(create);
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
    final result = create();
    if (lastNewsId != null) result.lastNewsId = lastNewsId;
    if (newsSource != null) result.newsSource = newsSource;
    if (oldestDateAt != null) result.oldestDateAt = oldestDateAt;
    return result;
  }

  ListNewsRequest._();

  factory ListNewsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListNewsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListNewsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'lastNewsId')
    ..aI(2, _omitFieldNames ? '' : 'newsSource')
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'oldestDateAt',
        subBuilder: $1.Timestamp.create)
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
  static ListNewsRequest create() => ListNewsRequest._();
  @$core.override
  ListNewsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListNewsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListNewsRequest>(create);
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
  factory ListNewsSourcesRequest() => create();

  ListNewsSourcesRequest._();

  factory ListNewsSourcesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListNewsSourcesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListNewsSourcesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static ListNewsSourcesRequest create() => ListNewsSourcesRequest._();
  @$core.override
  ListNewsSourcesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListNewsSourcesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListNewsSourcesRequest>(create);
  static ListNewsSourcesRequest? _defaultInstance;
}

class ListNewsSourcesReply extends $pb.GeneratedMessage {
  factory ListNewsSourcesReply({
    $core.Iterable<NewsSource>? sources,
  }) {
    final result = create();
    if (sources != null) result.sources.addAll(sources);
    return result;
  }

  ListNewsSourcesReply._();

  factory ListNewsSourcesReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListNewsSourcesReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListNewsSourcesReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..pPM<NewsSource>(1, _omitFieldNames ? '' : 'sources',
        subBuilder: NewsSource.create)
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
  static ListNewsSourcesReply create() => ListNewsSourcesReply._();
  @$core.override
  ListNewsSourcesReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListNewsSourcesReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListNewsSourcesReply>(create);
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
    final result = create();
    if (source != null) result.source = source;
    if (title != null) result.title = title;
    if (iconUrl != null) result.iconUrl = iconUrl;
    return result;
  }

  NewsSource._();

  factory NewsSource.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewsSource.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewsSource',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static NewsSource create() => NewsSource._();
  @$core.override
  NewsSource createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NewsSource getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewsSource>(create);
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
    final result = create();
    if (lastNewsAlertId != null) result.lastNewsAlertId = lastNewsAlertId;
    return result;
  }

  ListNewsAlertsRequest._();

  factory ListNewsAlertsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListNewsAlertsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListNewsAlertsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static ListNewsAlertsRequest create() => ListNewsAlertsRequest._();
  @$core.override
  ListNewsAlertsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListNewsAlertsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListNewsAlertsRequest>(create);
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
    final result = create();
    if (alerts != null) result.alerts.addAll(alerts);
    return result;
  }

  ListNewsAlertsReply._();

  factory ListNewsAlertsReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListNewsAlertsReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListNewsAlertsReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..pPM<NewsAlert>(1, _omitFieldNames ? '' : 'alerts',
        subBuilder: NewsAlert.create)
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
  static ListNewsAlertsReply create() => ListNewsAlertsReply._();
  @$core.override
  ListNewsAlertsReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListNewsAlertsReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListNewsAlertsReply>(create);
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
    final result = create();
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
      create()..mergeFromBuffer(data, registry);
  factory NewsAlert.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewsAlert',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'imageUrl')
    ..aOS(2, _omitFieldNames ? '' : 'link')
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'created',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'from',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'to',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsAlert clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewsAlert copyWith(void Function(NewsAlert) updates) =>
      super.copyWith((message) => updates(message as NewsAlert)) as NewsAlert;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewsAlert create() => NewsAlert._();
  @$core.override
  NewsAlert createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NewsAlert getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewsAlert>(create);
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
  }) {
    final result = create();
    if (canteenId != null) result.canteenId = canteenId;
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (limit != null) result.limit = limit;
    return result;
  }

  ListCanteenRatingsRequest._();

  factory ListCanteenRatingsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListCanteenRatingsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListCanteenRatingsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'canteenId')
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'from',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'to',
        subBuilder: $1.Timestamp.create)
    ..aI(4, _omitFieldNames ? '' : 'limit')
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
  static ListCanteenRatingsRequest create() => ListCanteenRatingsRequest._();
  @$core.override
  ListCanteenRatingsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListCanteenRatingsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListCanteenRatingsRequest>(create);
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
    final result = create();
    if (rating != null) result.rating.addAll(rating);
    if (avg != null) result.avg = avg;
    if (std != null) result.std = std;
    if (min != null) result.min = min;
    if (max != null) result.max = max;
    if (ratingTags != null) result.ratingTags.addAll(ratingTags);
    return result;
  }

  ListCanteenRatingsReply._();

  factory ListCanteenRatingsReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListCanteenRatingsReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListCanteenRatingsReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..pPM<SingleRatingReply>(1, _omitFieldNames ? '' : 'rating',
        subBuilder: SingleRatingReply.create)
    ..aD(2, _omitFieldNames ? '' : 'avg')
    ..aD(3, _omitFieldNames ? '' : 'std')
    ..aI(4, _omitFieldNames ? '' : 'min')
    ..aI(5, _omitFieldNames ? '' : 'max')
    ..pPM<RatingTagResult>(6, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: RatingTagResult.create)
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
  static ListCanteenRatingsReply create() => ListCanteenRatingsReply._();
  @$core.override
  ListCanteenRatingsReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListCanteenRatingsReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListCanteenRatingsReply>(create);
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
}

class GetDishRatingsRequest extends $pb.GeneratedMessage {
  factory GetDishRatingsRequest({
    $core.String? canteenId,
    $core.String? dish,
    $1.Timestamp? from,
    $1.Timestamp? to,
    $core.int? limit,
  }) {
    final result = create();
    if (canteenId != null) result.canteenId = canteenId;
    if (dish != null) result.dish = dish;
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (limit != null) result.limit = limit;
    return result;
  }

  GetDishRatingsRequest._();

  factory GetDishRatingsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDishRatingsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDishRatingsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'canteenId')
    ..aOS(2, _omitFieldNames ? '' : 'dish')
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'from',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'to',
        subBuilder: $1.Timestamp.create)
    ..aI(5, _omitFieldNames ? '' : 'limit')
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
  static GetDishRatingsRequest create() => GetDishRatingsRequest._();
  @$core.override
  GetDishRatingsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetDishRatingsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDishRatingsRequest>(create);
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
    final result = create();
    if (rating != null) result.rating.addAll(rating);
    if (avg != null) result.avg = avg;
    if (std != null) result.std = std;
    if (min != null) result.min = min;
    if (max != null) result.max = max;
    if (ratingTags != null) result.ratingTags.addAll(ratingTags);
    if (nameTags != null) result.nameTags.addAll(nameTags);
    return result;
  }

  GetDishRatingsReply._();

  factory GetDishRatingsReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDishRatingsReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDishRatingsReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..pPM<SingleRatingReply>(1, _omitFieldNames ? '' : 'rating',
        subBuilder: SingleRatingReply.create)
    ..aD(2, _omitFieldNames ? '' : 'avg')
    ..aD(3, _omitFieldNames ? '' : 'std')
    ..aI(4, _omitFieldNames ? '' : 'min')
    ..aI(5, _omitFieldNames ? '' : 'max')
    ..pPM<RatingTagResult>(6, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: RatingTagResult.create)
    ..pPM<RatingTagResult>(7, _omitFieldNames ? '' : 'nameTags',
        subBuilder: RatingTagResult.create)
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
  static GetDishRatingsReply create() => GetDishRatingsReply._();
  @$core.override
  GetDishRatingsReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetDishRatingsReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDishRatingsReply>(create);
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
}

class SingleRatingReply extends $pb.GeneratedMessage {
  factory SingleRatingReply({
    $core.int? points,
    $core.List<$core.int>? image,
    $core.String? comment,
    $core.Iterable<RatingTagNewRequest>? ratingTags,
    $1.Timestamp? visited,
  }) {
    final result = create();
    if (points != null) result.points = points;
    if (image != null) result.image = image;
    if (comment != null) result.comment = comment;
    if (ratingTags != null) result.ratingTags.addAll(ratingTags);
    if (visited != null) result.visited = visited;
    return result;
  }

  SingleRatingReply._();

  factory SingleRatingReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SingleRatingReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SingleRatingReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'points')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'comment')
    ..pPM<RatingTagNewRequest>(4, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: RatingTagNewRequest.create)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'visited',
        subBuilder: $1.Timestamp.create)
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
  static SingleRatingReply create() => SingleRatingReply._();
  @$core.override
  SingleRatingReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SingleRatingReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SingleRatingReply>(create);
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

  /// Optional JPEG image in Base64
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
}

class CreateCanteenRatingReply extends $pb.GeneratedMessage {
  factory CreateCanteenRatingReply() => create();

  CreateCanteenRatingReply._();

  factory CreateCanteenRatingReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateCanteenRatingReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCanteenRatingReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static CreateCanteenRatingReply create() => CreateCanteenRatingReply._();
  @$core.override
  CreateCanteenRatingReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateCanteenRatingReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCanteenRatingReply>(create);
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
    final result = create();
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
      create()..mergeFromBuffer(data, registry);
  factory CreateCanteenRatingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCanteenRatingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'points')
    ..aOS(2, _omitFieldNames ? '' : 'canteenId')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OY)
    ..pPM<RatingTag>(4, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: RatingTag.create)
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
  static CreateCanteenRatingRequest create() => CreateCanteenRatingRequest._();
  @$core.override
  CreateCanteenRatingRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateCanteenRatingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCanteenRatingRequest>(create);
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
  factory CreateDishRatingReply() => create();

  CreateDishRatingReply._();

  factory CreateDishRatingReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateDishRatingReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateDishRatingReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static CreateDishRatingReply create() => CreateDishRatingReply._();
  @$core.override
  CreateDishRatingReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateDishRatingReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateDishRatingReply>(create);
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
    final result = create();
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
      create()..mergeFromBuffer(data, registry);
  factory CreateDishRatingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateDishRatingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'points')
    ..aOS(2, _omitFieldNames ? '' : 'canteenId')
    ..aOS(3, _omitFieldNames ? '' : 'dish')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OY)
    ..pPM<RatingTag>(5, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: RatingTag.create)
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
  static CreateDishRatingRequest create() => CreateDishRatingRequest._();
  @$core.override
  CreateDishRatingRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateDishRatingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateDishRatingRequest>(create);
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

class ListAvailableDishTagsRequest extends $pb.GeneratedMessage {
  factory ListAvailableDishTagsRequest() => create();

  ListAvailableDishTagsRequest._();

  factory ListAvailableDishTagsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListAvailableDishTagsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAvailableDishTagsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static ListAvailableDishTagsRequest create() =>
      ListAvailableDishTagsRequest._();
  @$core.override
  ListAvailableDishTagsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListAvailableDishTagsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAvailableDishTagsRequest>(create);
  static ListAvailableDishTagsRequest? _defaultInstance;
}

class ListAvailableDishTagsReply extends $pb.GeneratedMessage {
  factory ListAvailableDishTagsReply({
    $core.Iterable<TagsOverview>? ratingTags,
  }) {
    final result = create();
    if (ratingTags != null) result.ratingTags.addAll(ratingTags);
    return result;
  }

  ListAvailableDishTagsReply._();

  factory ListAvailableDishTagsReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListAvailableDishTagsReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAvailableDishTagsReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..pPM<TagsOverview>(1, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: TagsOverview.create)
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
  static ListAvailableDishTagsReply create() => ListAvailableDishTagsReply._();
  @$core.override
  ListAvailableDishTagsReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListAvailableDishTagsReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAvailableDishTagsReply>(create);
  static ListAvailableDishTagsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TagsOverview> get ratingTags => $_getList(0);
}

class ListNameTagsRequest extends $pb.GeneratedMessage {
  factory ListNameTagsRequest() => create();

  ListNameTagsRequest._();

  factory ListNameTagsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListNameTagsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListNameTagsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static ListNameTagsRequest create() => ListNameTagsRequest._();
  @$core.override
  ListNameTagsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListNameTagsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListNameTagsRequest>(create);
  static ListNameTagsRequest? _defaultInstance;
}

class ListNameTagsReply extends $pb.GeneratedMessage {
  factory ListNameTagsReply({
    $core.Iterable<TagsOverview>? ratingTags,
  }) {
    final result = create();
    if (ratingTags != null) result.ratingTags.addAll(ratingTags);
    return result;
  }

  ListNameTagsReply._();

  factory ListNameTagsReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListNameTagsReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListNameTagsReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..pPM<TagsOverview>(1, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: TagsOverview.create)
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
  static ListNameTagsReply create() => ListNameTagsReply._();
  @$core.override
  ListNameTagsReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListNameTagsReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListNameTagsReply>(create);
  static ListNameTagsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TagsOverview> get ratingTags => $_getList(0);
}

class ListAvailableCanteenTagsRequest extends $pb.GeneratedMessage {
  factory ListAvailableCanteenTagsRequest() => create();

  ListAvailableCanteenTagsRequest._();

  factory ListAvailableCanteenTagsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListAvailableCanteenTagsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAvailableCanteenTagsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static ListAvailableCanteenTagsRequest create() =>
      ListAvailableCanteenTagsRequest._();
  @$core.override
  ListAvailableCanteenTagsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListAvailableCanteenTagsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAvailableCanteenTagsRequest>(
          create);
  static ListAvailableCanteenTagsRequest? _defaultInstance;
}

class ListAvailableCanteenTagsReply extends $pb.GeneratedMessage {
  factory ListAvailableCanteenTagsReply({
    $core.Iterable<TagsOverview>? ratingTags,
  }) {
    final result = create();
    if (ratingTags != null) result.ratingTags.addAll(ratingTags);
    return result;
  }

  ListAvailableCanteenTagsReply._();

  factory ListAvailableCanteenTagsReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListAvailableCanteenTagsReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListAvailableCanteenTagsReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..pPM<TagsOverview>(1, _omitFieldNames ? '' : 'ratingTags',
        subBuilder: TagsOverview.create)
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
  static ListAvailableCanteenTagsReply create() =>
      ListAvailableCanteenTagsReply._();
  @$core.override
  ListAvailableCanteenTagsReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListAvailableCanteenTagsReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListAvailableCanteenTagsReply>(create);
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
    final result = create();
    if (tagId != null) result.tagId = tagId;
    if (de != null) result.de = de;
    if (en != null) result.en = en;
    return result;
  }

  TagsOverview._();

  factory TagsOverview.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TagsOverview.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TagsOverview',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static TagsOverview create() => TagsOverview._();
  @$core.override
  TagsOverview createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TagsOverview getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TagsOverview>(create);
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
    final result = create();
    if (tagId != null) result.tagId = tagId;
    if (points != null) result.points = points;
    return result;
  }

  RatingTag._();

  factory RatingTag.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RatingTag.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RatingTag',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static RatingTag create() => RatingTag._();
  @$core.override
  RatingTag createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RatingTag getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RatingTag>(create);
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
    final result = create();
    if (tagId != null) result.tagId = tagId;
    if (points != null) result.points = points;
    return result;
  }

  RatingTagNewRequest._();

  factory RatingTagNewRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RatingTagNewRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RatingTagNewRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static RatingTagNewRequest create() => RatingTagNewRequest._();
  @$core.override
  RatingTagNewRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RatingTagNewRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RatingTagNewRequest>(create);
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
    final result = create();
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
      create()..mergeFromBuffer(data, registry);
  factory RatingTagResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RatingTagResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static RatingTagResult create() => RatingTagResult._();
  @$core.override
  RatingTagResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RatingTagResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RatingTagResult>(create);
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
  factory ListCanteensRequest() => create();

  ListCanteensRequest._();

  factory ListCanteensRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListCanteensRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListCanteensRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static ListCanteensRequest create() => ListCanteensRequest._();
  @$core.override
  ListCanteensRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListCanteensRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListCanteensRequest>(create);
  static ListCanteensRequest? _defaultInstance;
}

class ListCanteensReply extends $pb.GeneratedMessage {
  factory ListCanteensReply({
    $core.Iterable<Canteen>? canteen,
  }) {
    final result = create();
    if (canteen != null) result.canteen.addAll(canteen);
    return result;
  }

  ListCanteensReply._();

  factory ListCanteensReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListCanteensReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListCanteensReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..pPM<Canteen>(1, _omitFieldNames ? '' : 'canteen',
        subBuilder: Canteen.create)
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
  static ListCanteensReply create() => ListCanteensReply._();
  @$core.override
  ListCanteensReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListCanteensReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListCanteensReply>(create);
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
    final result = create();
    if (id != null) result.id = id;
    if (address != null) result.address = address;
    if (longitude != null) result.longitude = longitude;
    if (latitude != null) result.latitude = latitude;
    return result;
  }

  Canteen._();

  factory Canteen.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Canteen.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Canteen',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static Canteen create() => Canteen._();
  @$core.override
  Canteen createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Canteen getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Canteen>(create);
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
    final result = create();
    if (canteenId != null) result.canteenId = canteenId;
    if (year != null) result.year = year;
    if (week != null) result.week = week;
    if (day != null) result.day = day;
    return result;
  }

  ListDishesRequest._();

  factory ListDishesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDishesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDishesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static ListDishesRequest create() => ListDishesRequest._();
  @$core.override
  ListDishesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDishesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDishesRequest>(create);
  static ListDishesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get canteenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set canteenId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCanteenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanteenId() => $_clearField(1);

  /// >=2022 until the current year
  @$pb.TagNumber(2)
  $core.int get year => $_getIZ(1);
  @$pb.TagNumber(2)
  set year($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasYear() => $_has(1);
  @$pb.TagNumber(2)
  void clearYear() => $_clearField(2);

  /// Must be in the range 1 - 52
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
    final result = create();
    if (dish != null) result.dish.addAll(dish);
    return result;
  }

  ListDishesReply._();

  factory ListDishesReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDishesReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDishesReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static ListDishesReply create() => ListDishesReply._();
  @$core.override
  ListDishesReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDishesReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDishesReply>(create);
  static ListDishesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get dish => $_getList(0);
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
    final result = create();
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
      create()..mergeFromBuffer(data, registry);
  factory RoomInformationElement.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomInformationElement',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static RoomInformationElement create() => RoomInformationElement._();
  @$core.override
  RoomInformationElement createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomInformationElement getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomInformationElement>(create);
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
    final result = create();
    if (version != null) result.version = version;
    return result;
  }

  GetUpdateNoteRequest._();

  factory GetUpdateNoteRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUpdateNoteRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUpdateNoteRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static GetUpdateNoteRequest create() => GetUpdateNoteRequest._();
  @$core.override
  GetUpdateNoteRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUpdateNoteRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUpdateNoteRequest>(create);
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
    final result = create();
    if (message != null) result.message = message;
    if (versionName != null) result.versionName = versionName;
    return result;
  }

  GetUpdateNoteReply._();

  factory GetUpdateNoteReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUpdateNoteReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUpdateNoteReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static GetUpdateNoteReply create() => GetUpdateNoteReply._();
  @$core.override
  GetUpdateNoteReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUpdateNoteReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUpdateNoteReply>(create);
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
  }) {
    final result = create();
    if (lastId != null) result.lastId = lastId;
    if (oldestDateAt != null) result.oldestDateAt = oldestDateAt;
    return result;
  }

  ListMoviesRequest._();

  factory ListMoviesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListMoviesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListMoviesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'lastId')
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'oldestDateAt',
        subBuilder: $1.Timestamp.create)
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
  static ListMoviesRequest create() => ListMoviesRequest._();
  @$core.override
  ListMoviesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListMoviesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListMoviesRequest>(create);
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
}

class ListMoviesReply extends $pb.GeneratedMessage {
  factory ListMoviesReply({
    $core.Iterable<Movie>? movies,
  }) {
    final result = create();
    if (movies != null) result.movies.addAll(movies);
    return result;
  }

  ListMoviesReply._();

  factory ListMoviesReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListMoviesReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListMoviesReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..pPM<Movie>(1, _omitFieldNames ? '' : 'movies', subBuilder: Movie.create)
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
  static ListMoviesReply create() => ListMoviesReply._();
  @$core.override
  ListMoviesReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListMoviesReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListMoviesReply>(create);
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
  }) {
    final result = create();
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
    return result;
  }

  Movie._();

  factory Movie.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Movie.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Movie',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aInt64(3, _omitFieldNames ? '' : 'movieId')
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'date',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'created',
        subBuilder: $1.Timestamp.create)
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
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Movie clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Movie copyWith(void Function(Movie) updates) =>
      super.copyWith((message) => updates(message as Movie)) as Movie;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Movie create() => Movie._();
  @$core.override
  Movie createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Movie getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Movie>(create);
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
    final result = create();
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
      create()..mergeFromBuffer(data, registry);
  factory CreateFeedbackRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateFeedbackRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aE<CreateFeedbackRequest_Recipient>(1, _omitFieldNames ? '' : 'recipient',
        enumValues: CreateFeedbackRequest_Recipient.values)
    ..aOS(2, _omitFieldNames ? '' : 'fromEmail')
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..aOM<Coordinate>(4, _omitFieldNames ? '' : 'location',
        subBuilder: Coordinate.create)
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
  static CreateFeedbackRequest create() => CreateFeedbackRequest._();
  @$core.override
  CreateFeedbackRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateFeedbackRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateFeedbackRequest>(create);
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
    final result = create();
    if (latitude != null) result.latitude = latitude;
    if (longitude != null) result.longitude = longitude;
    return result;
  }

  Coordinate._();

  factory Coordinate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Coordinate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Coordinate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static Coordinate create() => Coordinate._();
  @$core.override
  Coordinate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Coordinate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Coordinate>(create);
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
  factory CreateFeedbackReply() => create();

  CreateFeedbackReply._();

  factory CreateFeedbackReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateFeedbackReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateFeedbackReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static CreateFeedbackReply create() => CreateFeedbackReply._();
  @$core.override
  CreateFeedbackReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateFeedbackReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateFeedbackReply>(create);
  static CreateFeedbackReply? _defaultInstance;
}

class CreateFeedbackImageReply extends $pb.GeneratedMessage {
  factory CreateFeedbackImageReply({
    $core.String? status,
  }) {
    final result = create();
    if (status != null) result.status = status;
    return result;
  }

  CreateFeedbackImageReply._();

  factory CreateFeedbackImageReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateFeedbackImageReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateFeedbackImageReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static CreateFeedbackImageReply create() => CreateFeedbackImageReply._();
  @$core.override
  CreateFeedbackImageReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateFeedbackImageReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateFeedbackImageReply>(create);
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
    final result = create();
    if (id != null) result.id = id;
    if (imageNr != null) result.imageNr = imageNr;
    return result;
  }

  CreateFeedbackImageRequest._();

  factory CreateFeedbackImageRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateFeedbackImageRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateFeedbackImageRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static CreateFeedbackImageRequest create() => CreateFeedbackImageRequest._();
  @$core.override
  CreateFeedbackImageRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateFeedbackImageRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateFeedbackImageRequest>(create);
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
    final result = create();
    if (lrzId != null) result.lrzId = lrzId;
    return result;
  }

  GetMemberRequest._();

  factory GetMemberRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMemberRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMemberRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static GetMemberRequest create() => GetMemberRequest._();
  @$core.override
  GetMemberRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMemberRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMemberRequest>(create);
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
    final result = create();
    if (lrzId != null) result.lrzId = lrzId;
    if (name != null) result.name = name;
    if (memberId != null) result.memberId = memberId;
    return result;
  }

  GetMemberReply._();

  factory GetMemberReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMemberReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMemberReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static GetMemberReply create() => GetMemberReply._();
  @$core.override
  GetMemberReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMemberReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMemberReply>(create);
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
    final result = create();
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
      create()..mergeFromBuffer(data, registry);
  factory GetUploadStatusReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUploadStatusReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static GetUploadStatusReply create() => GetUploadStatusReply._();
  @$core.override
  GetUploadStatusReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUploadStatusReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUploadStatusReply>(create);
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
    final result = create();
    if (canteenId != null) result.canteenId = canteenId;
    return result;
  }

  GetCanteenHeadCountRequest._();

  factory GetCanteenHeadCountRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCanteenHeadCountRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCanteenHeadCountRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static GetCanteenHeadCountRequest create() => GetCanteenHeadCountRequest._();
  @$core.override
  GetCanteenHeadCountRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetCanteenHeadCountRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCanteenHeadCountRequest>(create);
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
    final result = create();
    if (count != null) result.count = count;
    if (maxCount != null) result.maxCount = maxCount;
    if (percent != null) result.percent = percent;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  GetCanteenHeadCountReply._();

  factory GetCanteenHeadCountReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCanteenHeadCountReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCanteenHeadCountReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'maxCount', fieldType: $pb.PbFieldType.OU3)
    ..aD(3, _omitFieldNames ? '' : 'percent', fieldType: $pb.PbFieldType.OF)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $1.Timestamp.create)
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
  static GetCanteenHeadCountReply create() => GetCanteenHeadCountReply._();
  @$core.override
  GetCanteenHeadCountReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetCanteenHeadCountReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCanteenHeadCountReply>(create);
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

class ListStudentClubRequest extends $pb.GeneratedMessage {
  factory ListStudentClubRequest({
    Language? language,
  }) {
    final result = create();
    if (language != null) result.language = language;
    return result;
  }

  ListStudentClubRequest._();

  factory ListStudentClubRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListStudentClubRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListStudentClubRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static ListStudentClubRequest create() => ListStudentClubRequest._();
  @$core.override
  ListStudentClubRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListStudentClubRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListStudentClubRequest>(create);
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
    final result = create();
    if (collections != null) result.collections.addAll(collections);
    return result;
  }

  ListStudentClubReply._();

  factory ListStudentClubReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListStudentClubReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListStudentClubReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..pPM<StudentClubCollection>(1, _omitFieldNames ? '' : 'collections',
        subBuilder: StudentClubCollection.create)
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
  static ListStudentClubReply create() => ListStudentClubReply._();
  @$core.override
  ListStudentClubReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListStudentClubReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListStudentClubReply>(create);
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
    final result = create();
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (linkUrl != null) result.linkUrl = linkUrl;
    if (coverUrl != null) result.coverUrl = coverUrl;
    return result;
  }

  StudentClub._();

  factory StudentClub.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StudentClub.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StudentClub',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
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
  static StudentClub create() => StudentClub._();
  @$core.override
  StudentClub createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StudentClub getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StudentClub>(create);
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
    final result = create();
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
      create()..mergeFromBuffer(data, registry);
  factory StudentClubCollection.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StudentClubCollection',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..pPM<StudentClub>(3, _omitFieldNames ? '' : 'clubs',
        subBuilder: StudentClub.create)
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
  static StudentClubCollection create() => StudentClubCollection._();
  @$core.override
  StudentClubCollection createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StudentClubCollection getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StudentClubCollection>(create);
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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
