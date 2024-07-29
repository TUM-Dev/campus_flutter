//
//  Generated code. Do not modify.
//  source: tumdev/campus_backend.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deviceTypeDescriptor instead')
const DeviceType$json = {
  '1': 'DeviceType',
  '2': [
    {'1': 'IOS', '2': 0},
    {'1': 'ANDROID', '2': 1},
    {'1': 'WINDOWS', '2': 2},
  ],
};

/// Descriptor for `DeviceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List deviceTypeDescriptor = $convert.base64Decode(
    'CgpEZXZpY2VUeXBlEgcKA0lPUxAAEgsKB0FORFJPSUQQARILCgdXSU5ET1dTEAI=');

@$core.Deprecated('Use createDeviceRequestDescriptor instead')
const CreateDeviceRequest$json = {
  '1': 'CreateDeviceRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'public_key', '3': 2, '4': 1, '5': 9, '10': 'publicKey'},
    {'1': 'device_type', '3': 3, '4': 1, '5': 14, '6': '.api.DeviceType', '10': 'deviceType'},
  ],
};

/// Descriptor for `CreateDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDeviceRequestDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVEZXZpY2VSZXF1ZXN0EhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aWNlSWQSHQoKcH'
    'VibGljX2tleRgCIAEoCVIJcHVibGljS2V5EjAKC2RldmljZV90eXBlGAMgASgOMg8uYXBpLkRl'
    'dmljZVR5cGVSCmRldmljZVR5cGU=');

@$core.Deprecated('Use createDeviceReplyDescriptor instead')
const CreateDeviceReply$json = {
  '1': 'CreateDeviceReply',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `CreateDeviceReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDeviceReplyDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVEZXZpY2VSZXBseRIbCglkZXZpY2VfaWQYASABKAlSCGRldmljZUlk');

@$core.Deprecated('Use deleteDeviceRequestDescriptor instead')
const DeleteDeviceRequest$json = {
  '1': 'DeleteDeviceRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'device_type', '3': 2, '4': 1, '5': 14, '6': '.api.DeviceType', '10': 'deviceType'},
  ],
};

/// Descriptor for `DeleteDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDeviceRequestDescriptor = $convert.base64Decode(
    'ChNEZWxldGVEZXZpY2VSZXF1ZXN0EhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aWNlSWQSMAoLZG'
    'V2aWNlX3R5cGUYAiABKA4yDy5hcGkuRGV2aWNlVHlwZVIKZGV2aWNlVHlwZQ==');

@$core.Deprecated('Use deleteDeviceReplyDescriptor instead')
const DeleteDeviceReply$json = {
  '1': 'DeleteDeviceReply',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `DeleteDeviceReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDeviceReplyDescriptor = $convert.base64Decode(
    'ChFEZWxldGVEZXZpY2VSZXBseRIbCglkZXZpY2VfaWQYASABKAlSCGRldmljZUlk');

@$core.Deprecated('Use newsDescriptor instead')
const News$json = {
  '1': 'News',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'text', '3': 3, '4': 1, '5': 9, '10': 'text'},
    {'1': 'link', '3': 4, '4': 1, '5': 9, '10': 'link'},
    {'1': 'image_url', '3': 5, '4': 1, '5': 9, '10': 'imageUrl'},
    {'1': 'source_id', '3': 6, '4': 1, '5': 9, '10': 'sourceId'},
    {'1': 'source_icon_url', '3': 9, '4': 1, '5': 9, '10': 'sourceIconUrl'},
    {'1': 'source_title', '3': 10, '4': 1, '5': 9, '10': 'sourceTitle'},
    {'1': 'created', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'created'},
    {'1': 'date', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'date'},
  ],
};

/// Descriptor for `News`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newsDescriptor = $convert.base64Decode(
    'CgROZXdzEg4KAmlkGAEgASgDUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSEgoEdGV4dBgDIA'
    'EoCVIEdGV4dBISCgRsaW5rGAQgASgJUgRsaW5rEhsKCWltYWdlX3VybBgFIAEoCVIIaW1hZ2VV'
    'cmwSGwoJc291cmNlX2lkGAYgASgJUghzb3VyY2VJZBImCg9zb3VyY2VfaWNvbl91cmwYCSABKA'
    'lSDXNvdXJjZUljb25VcmwSIQoMc291cmNlX3RpdGxlGAogASgJUgtzb3VyY2VUaXRsZRI0Cgdj'
    'cmVhdGVkGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHY3JlYXRlZBIuCgRkYX'
    'RlGAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIEZGF0ZQ==');

@$core.Deprecated('Use listNewsReplyDescriptor instead')
const ListNewsReply$json = {
  '1': 'ListNewsReply',
  '2': [
    {'1': 'news', '3': 1, '4': 3, '5': 11, '6': '.api.News', '10': 'news'},
  ],
};

/// Descriptor for `ListNewsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listNewsReplyDescriptor = $convert.base64Decode(
    'Cg1MaXN0TmV3c1JlcGx5Eh0KBG5ld3MYASADKAsyCS5hcGkuTmV3c1IEbmV3cw==');

@$core.Deprecated('Use listNewsRequestDescriptor instead')
const ListNewsRequest$json = {
  '1': 'ListNewsRequest',
  '2': [
    {'1': 'last_news_id', '3': 1, '4': 1, '5': 5, '10': 'lastNewsId'},
    {'1': 'news_source', '3': 2, '4': 1, '5': 5, '10': 'newsSource'},
    {'1': 'oldest_date_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'oldestDateAt'},
  ],
};

/// Descriptor for `ListNewsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listNewsRequestDescriptor = $convert.base64Decode(
    'Cg9MaXN0TmV3c1JlcXVlc3QSIAoMbGFzdF9uZXdzX2lkGAEgASgFUgpsYXN0TmV3c0lkEh8KC2'
    '5ld3Nfc291cmNlGAIgASgFUgpuZXdzU291cmNlEkAKDm9sZGVzdF9kYXRlX2F0GAMgASgLMhou'
    'Z29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIMb2xkZXN0RGF0ZUF0');

@$core.Deprecated('Use listNewsSourcesRequestDescriptor instead')
const ListNewsSourcesRequest$json = {
  '1': 'ListNewsSourcesRequest',
};

/// Descriptor for `ListNewsSourcesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listNewsSourcesRequestDescriptor = $convert.base64Decode(
    'ChZMaXN0TmV3c1NvdXJjZXNSZXF1ZXN0');

@$core.Deprecated('Use listNewsSourcesReplyDescriptor instead')
const ListNewsSourcesReply$json = {
  '1': 'ListNewsSourcesReply',
  '2': [
    {'1': 'sources', '3': 1, '4': 3, '5': 11, '6': '.api.NewsSource', '10': 'sources'},
  ],
};

/// Descriptor for `ListNewsSourcesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listNewsSourcesReplyDescriptor = $convert.base64Decode(
    'ChRMaXN0TmV3c1NvdXJjZXNSZXBseRIpCgdzb3VyY2VzGAEgAygLMg8uYXBpLk5ld3NTb3VyY2'
    'VSB3NvdXJjZXM=');

@$core.Deprecated('Use newsSourceDescriptor instead')
const NewsSource$json = {
  '1': 'NewsSource',
  '2': [
    {'1': 'source', '3': 1, '4': 1, '5': 9, '10': 'source'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'icon_url', '3': 3, '4': 1, '5': 9, '10': 'iconUrl'},
  ],
};

/// Descriptor for `NewsSource`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newsSourceDescriptor = $convert.base64Decode(
    'CgpOZXdzU291cmNlEhYKBnNvdXJjZRgBIAEoCVIGc291cmNlEhQKBXRpdGxlGAIgASgJUgV0aX'
    'RsZRIZCghpY29uX3VybBgDIAEoCVIHaWNvblVybA==');

@$core.Deprecated('Use listNewsAlertsRequestDescriptor instead')
const ListNewsAlertsRequest$json = {
  '1': 'ListNewsAlertsRequest',
  '2': [
    {'1': 'last_news_alert_id', '3': 1, '4': 1, '5': 5, '10': 'lastNewsAlertId'},
  ],
};

/// Descriptor for `ListNewsAlertsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listNewsAlertsRequestDescriptor = $convert.base64Decode(
    'ChVMaXN0TmV3c0FsZXJ0c1JlcXVlc3QSKwoSbGFzdF9uZXdzX2FsZXJ0X2lkGAEgASgFUg9sYX'
    'N0TmV3c0FsZXJ0SWQ=');

@$core.Deprecated('Use listNewsAlertsReplyDescriptor instead')
const ListNewsAlertsReply$json = {
  '1': 'ListNewsAlertsReply',
  '2': [
    {'1': 'alerts', '3': 1, '4': 3, '5': 11, '6': '.api.NewsAlert', '10': 'alerts'},
  ],
};

/// Descriptor for `ListNewsAlertsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listNewsAlertsReplyDescriptor = $convert.base64Decode(
    'ChNMaXN0TmV3c0FsZXJ0c1JlcGx5EiYKBmFsZXJ0cxgBIAMoCzIOLmFwaS5OZXdzQWxlcnRSBm'
    'FsZXJ0cw==');

@$core.Deprecated('Use newsAlertDescriptor instead')
const NewsAlert$json = {
  '1': 'NewsAlert',
  '2': [
    {'1': 'image_url', '3': 1, '4': 1, '5': 9, '10': 'imageUrl'},
    {'1': 'link', '3': 2, '4': 1, '5': 9, '10': 'link'},
    {'1': 'created', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'created'},
    {'1': 'from', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'from'},
    {'1': 'to', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'to'},
  ],
};

/// Descriptor for `NewsAlert`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newsAlertDescriptor = $convert.base64Decode(
    'CglOZXdzQWxlcnQSGwoJaW1hZ2VfdXJsGAEgASgJUghpbWFnZVVybBISCgRsaW5rGAIgASgJUg'
    'RsaW5rEjQKB2NyZWF0ZWQYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgdjcmVh'
    'dGVkEi4KBGZyb20YBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgRmcm9tEioKAn'
    'RvGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFICdG8=');

@$core.Deprecated('Use listCanteenRatingsRequestDescriptor instead')
const ListCanteenRatingsRequest$json = {
  '1': 'ListCanteenRatingsRequest',
  '2': [
    {'1': 'canteen_id', '3': 1, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'from', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'from'},
    {'1': 'to', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'to'},
    {'1': 'limit', '3': 4, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `ListCanteenRatingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCanteenRatingsRequestDescriptor = $convert.base64Decode(
    'ChlMaXN0Q2FudGVlblJhdGluZ3NSZXF1ZXN0Eh0KCmNhbnRlZW5faWQYASABKAlSCWNhbnRlZW'
    '5JZBIuCgRmcm9tGAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIEZnJvbRIqCgJ0'
    'bxgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSAnRvEhQKBWxpbWl0GAQgASgFUg'
    'VsaW1pdA==');

@$core.Deprecated('Use listCanteenRatingsReplyDescriptor instead')
const ListCanteenRatingsReply$json = {
  '1': 'ListCanteenRatingsReply',
  '2': [
    {'1': 'rating', '3': 1, '4': 3, '5': 11, '6': '.api.SingleRatingReply', '10': 'rating'},
    {'1': 'avg', '3': 2, '4': 1, '5': 1, '10': 'avg'},
    {'1': 'std', '3': 3, '4': 1, '5': 1, '10': 'std'},
    {'1': 'min', '3': 4, '4': 1, '5': 5, '10': 'min'},
    {'1': 'max', '3': 5, '4': 1, '5': 5, '10': 'max'},
    {'1': 'rating_tags', '3': 6, '4': 3, '5': 11, '6': '.api.RatingTagResult', '10': 'ratingTags'},
  ],
};

/// Descriptor for `ListCanteenRatingsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCanteenRatingsReplyDescriptor = $convert.base64Decode(
    'ChdMaXN0Q2FudGVlblJhdGluZ3NSZXBseRIuCgZyYXRpbmcYASADKAsyFi5hcGkuU2luZ2xlUm'
    'F0aW5nUmVwbHlSBnJhdGluZxIQCgNhdmcYAiABKAFSA2F2ZxIQCgNzdGQYAyABKAFSA3N0ZBIQ'
    'CgNtaW4YBCABKAVSA21pbhIQCgNtYXgYBSABKAVSA21heBI1CgtyYXRpbmdfdGFncxgGIAMoCz'
    'IULmFwaS5SYXRpbmdUYWdSZXN1bHRSCnJhdGluZ1RhZ3M=');

@$core.Deprecated('Use getDishRatingsRequestDescriptor instead')
const GetDishRatingsRequest$json = {
  '1': 'GetDishRatingsRequest',
  '2': [
    {'1': 'canteen_id', '3': 1, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'dish', '3': 2, '4': 1, '5': 9, '10': 'dish'},
    {'1': 'from', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'from'},
    {'1': 'to', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'to'},
    {'1': 'limit', '3': 5, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `GetDishRatingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDishRatingsRequestDescriptor = $convert.base64Decode(
    'ChVHZXREaXNoUmF0aW5nc1JlcXVlc3QSHQoKY2FudGVlbl9pZBgBIAEoCVIJY2FudGVlbklkEh'
    'IKBGRpc2gYAiABKAlSBGRpc2gSLgoEZnJvbRgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1l'
    'c3RhbXBSBGZyb20SKgoCdG8YBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgJ0bx'
    'IUCgVsaW1pdBgFIAEoBVIFbGltaXQ=');

@$core.Deprecated('Use getDishRatingsReplyDescriptor instead')
const GetDishRatingsReply$json = {
  '1': 'GetDishRatingsReply',
  '2': [
    {'1': 'rating', '3': 1, '4': 3, '5': 11, '6': '.api.SingleRatingReply', '10': 'rating'},
    {'1': 'avg', '3': 2, '4': 1, '5': 1, '10': 'avg'},
    {'1': 'std', '3': 3, '4': 1, '5': 1, '10': 'std'},
    {'1': 'min', '3': 4, '4': 1, '5': 5, '10': 'min'},
    {'1': 'max', '3': 5, '4': 1, '5': 5, '10': 'max'},
    {'1': 'rating_tags', '3': 6, '4': 3, '5': 11, '6': '.api.RatingTagResult', '10': 'ratingTags'},
    {'1': 'name_tags', '3': 7, '4': 3, '5': 11, '6': '.api.RatingTagResult', '10': 'nameTags'},
  ],
};

/// Descriptor for `GetDishRatingsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDishRatingsReplyDescriptor = $convert.base64Decode(
    'ChNHZXREaXNoUmF0aW5nc1JlcGx5Ei4KBnJhdGluZxgBIAMoCzIWLmFwaS5TaW5nbGVSYXRpbm'
    'dSZXBseVIGcmF0aW5nEhAKA2F2ZxgCIAEoAVIDYXZnEhAKA3N0ZBgDIAEoAVIDc3RkEhAKA21p'
    'bhgEIAEoBVIDbWluEhAKA21heBgFIAEoBVIDbWF4EjUKC3JhdGluZ190YWdzGAYgAygLMhQuYX'
    'BpLlJhdGluZ1RhZ1Jlc3VsdFIKcmF0aW5nVGFncxIxCgluYW1lX3RhZ3MYByADKAsyFC5hcGku'
    'UmF0aW5nVGFnUmVzdWx0UghuYW1lVGFncw==');

@$core.Deprecated('Use singleRatingReplyDescriptor instead')
const SingleRatingReply$json = {
  '1': 'SingleRatingReply',
  '2': [
    {'1': 'points', '3': 1, '4': 1, '5': 5, '10': 'points'},
    {'1': 'image', '3': 2, '4': 1, '5': 12, '10': 'image'},
    {'1': 'comment', '3': 3, '4': 1, '5': 9, '10': 'comment'},
    {'1': 'rating_tags', '3': 4, '4': 3, '5': 11, '6': '.api.RatingTagNewRequest', '10': 'ratingTags'},
    {'1': 'visited', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'visited'},
  ],
};

/// Descriptor for `SingleRatingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List singleRatingReplyDescriptor = $convert.base64Decode(
    'ChFTaW5nbGVSYXRpbmdSZXBseRIWCgZwb2ludHMYASABKAVSBnBvaW50cxIUCgVpbWFnZRgCIA'
    'EoDFIFaW1hZ2USGAoHY29tbWVudBgDIAEoCVIHY29tbWVudBI5CgtyYXRpbmdfdGFncxgEIAMo'
    'CzIYLmFwaS5SYXRpbmdUYWdOZXdSZXF1ZXN0UgpyYXRpbmdUYWdzEjQKB3Zpc2l0ZWQYBSABKA'
    'syGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgd2aXNpdGVk');

@$core.Deprecated('Use createCanteenRatingReplyDescriptor instead')
const CreateCanteenRatingReply$json = {
  '1': 'CreateCanteenRatingReply',
};

/// Descriptor for `CreateCanteenRatingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCanteenRatingReplyDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVDYW50ZWVuUmF0aW5nUmVwbHk=');

@$core.Deprecated('Use createCanteenRatingRequestDescriptor instead')
const CreateCanteenRatingRequest$json = {
  '1': 'CreateCanteenRatingRequest',
  '2': [
    {'1': 'points', '3': 1, '4': 1, '5': 5, '10': 'points'},
    {'1': 'canteen_id', '3': 2, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'image', '3': 3, '4': 1, '5': 12, '10': 'image'},
    {'1': 'rating_tags', '3': 4, '4': 3, '5': 11, '6': '.api.RatingTag', '10': 'ratingTags'},
    {'1': 'comment', '3': 6, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `CreateCanteenRatingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCanteenRatingRequestDescriptor = $convert.base64Decode(
    'ChpDcmVhdGVDYW50ZWVuUmF0aW5nUmVxdWVzdBIWCgZwb2ludHMYASABKAVSBnBvaW50cxIdCg'
    'pjYW50ZWVuX2lkGAIgASgJUgljYW50ZWVuSWQSFAoFaW1hZ2UYAyABKAxSBWltYWdlEi8KC3Jh'
    'dGluZ190YWdzGAQgAygLMg4uYXBpLlJhdGluZ1RhZ1IKcmF0aW5nVGFncxIYCgdjb21tZW50GA'
    'YgASgJUgdjb21tZW50');

@$core.Deprecated('Use createDishRatingReplyDescriptor instead')
const CreateDishRatingReply$json = {
  '1': 'CreateDishRatingReply',
};

/// Descriptor for `CreateDishRatingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDishRatingReplyDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVEaXNoUmF0aW5nUmVwbHk=');

@$core.Deprecated('Use createDishRatingRequestDescriptor instead')
const CreateDishRatingRequest$json = {
  '1': 'CreateDishRatingRequest',
  '2': [
    {'1': 'points', '3': 1, '4': 1, '5': 5, '10': 'points'},
    {'1': 'canteen_id', '3': 2, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'dish', '3': 3, '4': 1, '5': 9, '10': 'dish'},
    {'1': 'image', '3': 4, '4': 1, '5': 12, '10': 'image'},
    {'1': 'rating_tags', '3': 5, '4': 3, '5': 11, '6': '.api.RatingTag', '10': 'ratingTags'},
    {'1': 'comment', '3': 7, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `CreateDishRatingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDishRatingRequestDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVEaXNoUmF0aW5nUmVxdWVzdBIWCgZwb2ludHMYASABKAVSBnBvaW50cxIdCgpjYW'
    '50ZWVuX2lkGAIgASgJUgljYW50ZWVuSWQSEgoEZGlzaBgDIAEoCVIEZGlzaBIUCgVpbWFnZRgE'
    'IAEoDFIFaW1hZ2USLwoLcmF0aW5nX3RhZ3MYBSADKAsyDi5hcGkuUmF0aW5nVGFnUgpyYXRpbm'
    'dUYWdzEhgKB2NvbW1lbnQYByABKAlSB2NvbW1lbnQ=');

@$core.Deprecated('Use listAvailableDishTagsRequestDescriptor instead')
const ListAvailableDishTagsRequest$json = {
  '1': 'ListAvailableDishTagsRequest',
};

/// Descriptor for `ListAvailableDishTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAvailableDishTagsRequestDescriptor = $convert.base64Decode(
    'ChxMaXN0QXZhaWxhYmxlRGlzaFRhZ3NSZXF1ZXN0');

@$core.Deprecated('Use listAvailableDishTagsReplyDescriptor instead')
const ListAvailableDishTagsReply$json = {
  '1': 'ListAvailableDishTagsReply',
  '2': [
    {'1': 'rating_tags', '3': 1, '4': 3, '5': 11, '6': '.api.TagsOverview', '10': 'ratingTags'},
  ],
};

/// Descriptor for `ListAvailableDishTagsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAvailableDishTagsReplyDescriptor = $convert.base64Decode(
    'ChpMaXN0QXZhaWxhYmxlRGlzaFRhZ3NSZXBseRIyCgtyYXRpbmdfdGFncxgBIAMoCzIRLmFwaS'
    '5UYWdzT3ZlcnZpZXdSCnJhdGluZ1RhZ3M=');

@$core.Deprecated('Use listNameTagsRequestDescriptor instead')
const ListNameTagsRequest$json = {
  '1': 'ListNameTagsRequest',
};

/// Descriptor for `ListNameTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listNameTagsRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0TmFtZVRhZ3NSZXF1ZXN0');

@$core.Deprecated('Use listNameTagsReplyDescriptor instead')
const ListNameTagsReply$json = {
  '1': 'ListNameTagsReply',
  '2': [
    {'1': 'rating_tags', '3': 1, '4': 3, '5': 11, '6': '.api.TagsOverview', '10': 'ratingTags'},
  ],
};

/// Descriptor for `ListNameTagsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listNameTagsReplyDescriptor = $convert.base64Decode(
    'ChFMaXN0TmFtZVRhZ3NSZXBseRIyCgtyYXRpbmdfdGFncxgBIAMoCzIRLmFwaS5UYWdzT3Zlcn'
    'ZpZXdSCnJhdGluZ1RhZ3M=');

@$core.Deprecated('Use listAvailableCanteenTagsRequestDescriptor instead')
const ListAvailableCanteenTagsRequest$json = {
  '1': 'ListAvailableCanteenTagsRequest',
};

/// Descriptor for `ListAvailableCanteenTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAvailableCanteenTagsRequestDescriptor = $convert.base64Decode(
    'Ch9MaXN0QXZhaWxhYmxlQ2FudGVlblRhZ3NSZXF1ZXN0');

@$core.Deprecated('Use listAvailableCanteenTagsReplyDescriptor instead')
const ListAvailableCanteenTagsReply$json = {
  '1': 'ListAvailableCanteenTagsReply',
  '2': [
    {'1': 'rating_tags', '3': 1, '4': 3, '5': 11, '6': '.api.TagsOverview', '10': 'ratingTags'},
  ],
};

/// Descriptor for `ListAvailableCanteenTagsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAvailableCanteenTagsReplyDescriptor = $convert.base64Decode(
    'Ch1MaXN0QXZhaWxhYmxlQ2FudGVlblRhZ3NSZXBseRIyCgtyYXRpbmdfdGFncxgBIAMoCzIRLm'
    'FwaS5UYWdzT3ZlcnZpZXdSCnJhdGluZ1RhZ3M=');

@$core.Deprecated('Use tagsOverviewDescriptor instead')
const TagsOverview$json = {
  '1': 'TagsOverview',
  '2': [
    {'1': 'tag_id', '3': 1, '4': 1, '5': 5, '10': 'tagId'},
    {'1': 'de', '3': 2, '4': 1, '5': 9, '10': 'de'},
    {'1': 'en', '3': 3, '4': 1, '5': 9, '10': 'en'},
  ],
};

/// Descriptor for `TagsOverview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagsOverviewDescriptor = $convert.base64Decode(
    'CgxUYWdzT3ZlcnZpZXcSFQoGdGFnX2lkGAEgASgFUgV0YWdJZBIOCgJkZRgCIAEoCVICZGUSDg'
    'oCZW4YAyABKAlSAmVu');

@$core.Deprecated('Use ratingTagDescriptor instead')
const RatingTag$json = {
  '1': 'RatingTag',
  '2': [
    {'1': 'tag_id', '3': 1, '4': 1, '5': 3, '10': 'tagId'},
    {'1': 'points', '3': 2, '4': 1, '5': 1, '10': 'points'},
  ],
};

/// Descriptor for `RatingTag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ratingTagDescriptor = $convert.base64Decode(
    'CglSYXRpbmdUYWcSFQoGdGFnX2lkGAEgASgDUgV0YWdJZBIWCgZwb2ludHMYAiABKAFSBnBvaW'
    '50cw==');

@$core.Deprecated('Use ratingTagNewRequestDescriptor instead')
const RatingTagNewRequest$json = {
  '1': 'RatingTagNewRequest',
  '2': [
    {'1': 'tag_id', '3': 1, '4': 1, '5': 5, '10': 'tagId'},
    {'1': 'points', '3': 2, '4': 1, '5': 5, '10': 'points'},
  ],
};

/// Descriptor for `RatingTagNewRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ratingTagNewRequestDescriptor = $convert.base64Decode(
    'ChNSYXRpbmdUYWdOZXdSZXF1ZXN0EhUKBnRhZ19pZBgBIAEoBVIFdGFnSWQSFgoGcG9pbnRzGA'
    'IgASgFUgZwb2ludHM=');

@$core.Deprecated('Use ratingTagResultDescriptor instead')
const RatingTagResult$json = {
  '1': 'RatingTagResult',
  '2': [
    {'1': 'tag_id', '3': 1, '4': 1, '5': 5, '10': 'tagId'},
    {'1': 'avg', '3': 2, '4': 1, '5': 1, '10': 'avg'},
    {'1': 'std', '3': 3, '4': 1, '5': 1, '10': 'std'},
    {'1': 'min', '3': 4, '4': 1, '5': 5, '10': 'min'},
    {'1': 'max', '3': 5, '4': 1, '5': 5, '10': 'max'},
  ],
};

/// Descriptor for `RatingTagResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ratingTagResultDescriptor = $convert.base64Decode(
    'Cg9SYXRpbmdUYWdSZXN1bHQSFQoGdGFnX2lkGAEgASgFUgV0YWdJZBIQCgNhdmcYAiABKAFSA2'
    'F2ZxIQCgNzdGQYAyABKAFSA3N0ZBIQCgNtaW4YBCABKAVSA21pbhIQCgNtYXgYBSABKAVSA21h'
    'eA==');

@$core.Deprecated('Use listCanteensRequestDescriptor instead')
const ListCanteensRequest$json = {
  '1': 'ListCanteensRequest',
};

/// Descriptor for `ListCanteensRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCanteensRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0Q2FudGVlbnNSZXF1ZXN0');

@$core.Deprecated('Use listCanteensReplyDescriptor instead')
const ListCanteensReply$json = {
  '1': 'ListCanteensReply',
  '2': [
    {'1': 'canteen', '3': 1, '4': 3, '5': 11, '6': '.api.Canteen', '10': 'canteen'},
  ],
};

/// Descriptor for `ListCanteensReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCanteensReplyDescriptor = $convert.base64Decode(
    'ChFMaXN0Q2FudGVlbnNSZXBseRImCgdjYW50ZWVuGAEgAygLMgwuYXBpLkNhbnRlZW5SB2Nhbn'
    'RlZW4=');

@$core.Deprecated('Use canteenDescriptor instead')
const Canteen$json = {
  '1': 'Canteen',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
    {'1': 'longitude', '3': 3, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'latitude', '3': 4, '4': 1, '5': 1, '10': 'latitude'},
  ],
};

/// Descriptor for `Canteen`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List canteenDescriptor = $convert.base64Decode(
    'CgdDYW50ZWVuEg4KAmlkGAEgASgJUgJpZBIYCgdhZGRyZXNzGAIgASgJUgdhZGRyZXNzEhwKCW'
    'xvbmdpdHVkZRgDIAEoAVIJbG9uZ2l0dWRlEhoKCGxhdGl0dWRlGAQgASgBUghsYXRpdHVkZQ==');

@$core.Deprecated('Use listDishesRequestDescriptor instead')
const ListDishesRequest$json = {
  '1': 'ListDishesRequest',
  '2': [
    {'1': 'canteen_id', '3': 1, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'year', '3': 2, '4': 1, '5': 5, '10': 'year'},
    {'1': 'week', '3': 3, '4': 1, '5': 5, '10': 'week'},
    {'1': 'day', '3': 4, '4': 1, '5': 5, '10': 'day'},
  ],
};

/// Descriptor for `ListDishesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDishesRequestDescriptor = $convert.base64Decode(
    'ChFMaXN0RGlzaGVzUmVxdWVzdBIdCgpjYW50ZWVuX2lkGAEgASgJUgljYW50ZWVuSWQSEgoEeW'
    'VhchgCIAEoBVIEeWVhchISCgR3ZWVrGAMgASgFUgR3ZWVrEhAKA2RheRgEIAEoBVIDZGF5');

@$core.Deprecated('Use listDishesReplyDescriptor instead')
const ListDishesReply$json = {
  '1': 'ListDishesReply',
  '2': [
    {'1': 'dish', '3': 1, '4': 3, '5': 9, '10': 'dish'},
  ],
};

/// Descriptor for `ListDishesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDishesReplyDescriptor = $convert.base64Decode(
    'Cg9MaXN0RGlzaGVzUmVwbHkSEgoEZGlzaBgBIAMoCVIEZGlzaA==');

@$core.Deprecated('Use roomInformationElementDescriptor instead')
const RoomInformationElement$json = {
  '1': 'RoomInformationElement',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 5, '10': 'roomId'},
    {'1': 'room_code', '3': 2, '4': 1, '5': 9, '10': 'roomCode'},
    {'1': 'building_nr', '3': 3, '4': 1, '5': 9, '10': 'buildingNr'},
    {'1': 'arch_id', '3': 4, '4': 1, '5': 9, '10': 'archId'},
    {'1': 'info', '3': 5, '4': 1, '5': 9, '10': 'info'},
    {'1': 'address', '3': 6, '4': 1, '5': 9, '10': 'address'},
    {'1': 'purpose', '3': 7, '4': 1, '5': 9, '10': 'purpose'},
    {'1': 'campus', '3': 8, '4': 1, '5': 9, '10': 'campus'},
    {'1': 'name', '3': 9, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `RoomInformationElement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomInformationElementDescriptor = $convert.base64Decode(
    'ChZSb29tSW5mb3JtYXRpb25FbGVtZW50EhcKB3Jvb21faWQYASABKAVSBnJvb21JZBIbCglyb2'
    '9tX2NvZGUYAiABKAlSCHJvb21Db2RlEh8KC2J1aWxkaW5nX25yGAMgASgJUgpidWlsZGluZ05y'
    'EhcKB2FyY2hfaWQYBCABKAlSBmFyY2hJZBISCgRpbmZvGAUgASgJUgRpbmZvEhgKB2FkZHJlc3'
    'MYBiABKAlSB2FkZHJlc3MSGAoHcHVycG9zZRgHIAEoCVIHcHVycG9zZRIWCgZjYW1wdXMYCCAB'
    'KAlSBmNhbXB1cxISCgRuYW1lGAkgASgJUgRuYW1l');

@$core.Deprecated('Use getUpdateNoteRequestDescriptor instead')
const GetUpdateNoteRequest$json = {
  '1': 'GetUpdateNoteRequest',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 3, '10': 'version'},
  ],
};

/// Descriptor for `GetUpdateNoteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUpdateNoteRequestDescriptor = $convert.base64Decode(
    'ChRHZXRVcGRhdGVOb3RlUmVxdWVzdBIYCgd2ZXJzaW9uGAEgASgDUgd2ZXJzaW9u');

@$core.Deprecated('Use getUpdateNoteReplyDescriptor instead')
const GetUpdateNoteReply$json = {
  '1': 'GetUpdateNoteReply',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    {'1': 'version_name', '3': 2, '4': 1, '5': 9, '10': 'versionName'},
  ],
};

/// Descriptor for `GetUpdateNoteReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUpdateNoteReplyDescriptor = $convert.base64Decode(
    'ChJHZXRVcGRhdGVOb3RlUmVwbHkSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZRIhCgx2ZXJzaW'
    '9uX25hbWUYAiABKAlSC3ZlcnNpb25OYW1l');

@$core.Deprecated('Use listMoviesRequestDescriptor instead')
const ListMoviesRequest$json = {
  '1': 'ListMoviesRequest',
  '2': [
    {'1': 'last_id', '3': 1, '4': 1, '5': 5, '10': 'lastId'},
    {'1': 'oldest_date_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'oldestDateAt'},
  ],
};

/// Descriptor for `ListMoviesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listMoviesRequestDescriptor = $convert.base64Decode(
    'ChFMaXN0TW92aWVzUmVxdWVzdBIXCgdsYXN0X2lkGAEgASgFUgZsYXN0SWQSQAoOb2xkZXN0X2'
    'RhdGVfYXQYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgxvbGRlc3REYXRlQXQ=');

@$core.Deprecated('Use listMoviesReplyDescriptor instead')
const ListMoviesReply$json = {
  '1': 'ListMoviesReply',
  '2': [
    {'1': 'movies', '3': 1, '4': 3, '5': 11, '6': '.api.Movie', '10': 'movies'},
  ],
};

/// Descriptor for `ListMoviesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listMoviesReplyDescriptor = $convert.base64Decode(
    'Cg9MaXN0TW92aWVzUmVwbHkSIgoGbW92aWVzGAEgAygLMgouYXBpLk1vdmllUgZtb3ZpZXM=');

@$core.Deprecated('Use movieDescriptor instead')
const Movie$json = {
  '1': 'Movie',
  '2': [
    {'1': 'movie_id', '3': 3, '4': 1, '5': 3, '10': 'movieId'},
    {'1': 'date', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'date'},
    {'1': 'created', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'created'},
    {'1': 'title', '3': 6, '4': 1, '5': 9, '10': 'title'},
    {'1': 'location', '3': 18, '4': 1, '5': 9, '10': 'location'},
    {'1': 'release_year', '3': 7, '4': 1, '5': 9, '10': 'releaseYear'},
    {'1': 'runtime', '3': 8, '4': 1, '5': 9, '10': 'runtime'},
    {'1': 'genre', '3': 9, '4': 1, '5': 9, '10': 'genre'},
    {'1': 'director', '3': 10, '4': 1, '5': 9, '10': 'director'},
    {'1': 'actors', '3': 11, '4': 1, '5': 9, '10': 'actors'},
    {'1': 'imdb_rating', '3': 12, '4': 1, '5': 9, '10': 'imdbRating'},
    {'1': 'description', '3': 13, '4': 1, '5': 9, '10': 'description'},
    {'1': 'trailer_url', '3': 15, '4': 1, '5': 9, '10': 'trailerUrl'},
    {'1': 'additional_information_url', '3': 16, '4': 1, '5': 9, '10': 'additionalInformationUrl'},
    {'1': 'cover_id', '3': 14, '4': 1, '5': 3, '10': 'coverId'},
    {'1': 'cover_url', '3': 17, '4': 1, '5': 9, '10': 'coverUrl'},
  ],
  '9': [
    {'1': 1, '2': 2},
    {'1': 2, '2': 3},
  ],
};

/// Descriptor for `Movie`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List movieDescriptor = $convert.base64Decode(
    'CgVNb3ZpZRIZCghtb3ZpZV9pZBgDIAEoA1IHbW92aWVJZBIuCgRkYXRlGAQgASgLMhouZ29vZ2'
    'xlLnByb3RvYnVmLlRpbWVzdGFtcFIEZGF0ZRI0CgdjcmVhdGVkGAUgASgLMhouZ29vZ2xlLnBy'
    'b3RvYnVmLlRpbWVzdGFtcFIHY3JlYXRlZBIUCgV0aXRsZRgGIAEoCVIFdGl0bGUSGgoIbG9jYX'
    'Rpb24YEiABKAlSCGxvY2F0aW9uEiEKDHJlbGVhc2VfeWVhchgHIAEoCVILcmVsZWFzZVllYXIS'
    'GAoHcnVudGltZRgIIAEoCVIHcnVudGltZRIUCgVnZW5yZRgJIAEoCVIFZ2VucmUSGgoIZGlyZW'
    'N0b3IYCiABKAlSCGRpcmVjdG9yEhYKBmFjdG9ycxgLIAEoCVIGYWN0b3JzEh8KC2ltZGJfcmF0'
    'aW5nGAwgASgJUgppbWRiUmF0aW5nEiAKC2Rlc2NyaXB0aW9uGA0gASgJUgtkZXNjcmlwdGlvbh'
    'IfCgt0cmFpbGVyX3VybBgPIAEoCVIKdHJhaWxlclVybBI8ChphZGRpdGlvbmFsX2luZm9ybWF0'
    'aW9uX3VybBgQIAEoCVIYYWRkaXRpb25hbEluZm9ybWF0aW9uVXJsEhkKCGNvdmVyX2lkGA4gAS'
    'gDUgdjb3ZlcklkEhsKCWNvdmVyX3VybBgRIAEoCVIIY292ZXJVcmxKBAgBEAJKBAgCEAM=');

@$core.Deprecated('Use createFeedbackRequestDescriptor instead')
const CreateFeedbackRequest$json = {
  '1': 'CreateFeedbackRequest',
  '2': [
    {'1': 'recipient', '3': 1, '4': 1, '5': 14, '6': '.api.CreateFeedbackRequest.Recipient', '10': 'recipient'},
    {'1': 'from_email', '3': 2, '4': 1, '5': 9, '10': 'fromEmail'},
    {'1': 'from_name', '3': 8, '4': 1, '5': 9, '10': 'fromName'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    {'1': 'location', '3': 4, '4': 1, '5': 11, '6': '.api.Coordinate', '10': 'location'},
    {'1': 'os_version', '3': 5, '4': 1, '5': 9, '10': 'osVersion'},
    {'1': 'app_version', '3': 6, '4': 1, '5': 9, '10': 'appVersion'},
    {'1': 'attachment', '3': 7, '4': 1, '5': 12, '10': 'attachment'},
  ],
  '4': [CreateFeedbackRequest_Recipient$json],
};

@$core.Deprecated('Use createFeedbackRequestDescriptor instead')
const CreateFeedbackRequest_Recipient$json = {
  '1': 'Recipient',
  '2': [
    {'1': 'TUM_DEV', '2': 0},
    {'1': 'TUM_CONTACT', '2': 1},
  ],
};

/// Descriptor for `CreateFeedbackRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFeedbackRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVGZWVkYmFja1JlcXVlc3QSQgoJcmVjaXBpZW50GAEgASgOMiQuYXBpLkNyZWF0ZU'
    'ZlZWRiYWNrUmVxdWVzdC5SZWNpcGllbnRSCXJlY2lwaWVudBIdCgpmcm9tX2VtYWlsGAIgASgJ'
    'Uglmcm9tRW1haWwSGwoJZnJvbV9uYW1lGAggASgJUghmcm9tTmFtZRIYCgdtZXNzYWdlGAMgAS'
    'gJUgdtZXNzYWdlEisKCGxvY2F0aW9uGAQgASgLMg8uYXBpLkNvb3JkaW5hdGVSCGxvY2F0aW9u'
    'Eh0KCm9zX3ZlcnNpb24YBSABKAlSCW9zVmVyc2lvbhIfCgthcHBfdmVyc2lvbhgGIAEoCVIKYX'
    'BwVmVyc2lvbhIeCgphdHRhY2htZW50GAcgASgMUgphdHRhY2htZW50IikKCVJlY2lwaWVudBIL'
    'CgdUVU1fREVWEAASDwoLVFVNX0NPTlRBQ1QQAQ==');

@$core.Deprecated('Use coordinateDescriptor instead')
const Coordinate$json = {
  '1': 'Coordinate',
  '2': [
    {'1': 'latitude', '3': 1, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 2, '4': 1, '5': 1, '10': 'longitude'},
  ],
};

/// Descriptor for `Coordinate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List coordinateDescriptor = $convert.base64Decode(
    'CgpDb29yZGluYXRlEhoKCGxhdGl0dWRlGAEgASgBUghsYXRpdHVkZRIcCglsb25naXR1ZGUYAi'
    'ABKAFSCWxvbmdpdHVkZQ==');

@$core.Deprecated('Use createFeedbackReplyDescriptor instead')
const CreateFeedbackReply$json = {
  '1': 'CreateFeedbackReply',
};

/// Descriptor for `CreateFeedbackReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFeedbackReplyDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVGZWVkYmFja1JlcGx5');

@$core.Deprecated('Use createFeedbackImageReplyDescriptor instead')
const CreateFeedbackImageReply$json = {
  '1': 'CreateFeedbackImageReply',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `CreateFeedbackImageReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFeedbackImageReplyDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVGZWVkYmFja0ltYWdlUmVwbHkSFgoGc3RhdHVzGAEgASgJUgZzdGF0dXM=');

@$core.Deprecated('Use createFeedbackImageRequestDescriptor instead')
const CreateFeedbackImageRequest$json = {
  '1': 'CreateFeedbackImageRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'image_nr', '3': 2, '4': 1, '5': 5, '10': 'imageNr'},
  ],
};

/// Descriptor for `CreateFeedbackImageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFeedbackImageRequestDescriptor = $convert.base64Decode(
    'ChpDcmVhdGVGZWVkYmFja0ltYWdlUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQSGQoIaW1hZ2Vfbn'
    'IYAiABKAVSB2ltYWdlTnI=');

@$core.Deprecated('Use getMemberRequestDescriptor instead')
const GetMemberRequest$json = {
  '1': 'GetMemberRequest',
  '2': [
    {'1': 'lrz_id', '3': 1, '4': 1, '5': 9, '10': 'lrzId'},
  ],
};

/// Descriptor for `GetMemberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMemberRequestDescriptor = $convert.base64Decode(
    'ChBHZXRNZW1iZXJSZXF1ZXN0EhUKBmxyel9pZBgBIAEoCVIFbHJ6SWQ=');

@$core.Deprecated('Use getMemberReplyDescriptor instead')
const GetMemberReply$json = {
  '1': 'GetMemberReply',
  '2': [
    {'1': 'lrz_id', '3': 1, '4': 1, '5': 9, '10': 'lrzId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'member_id', '3': 3, '4': 1, '5': 5, '10': 'memberId'},
  ],
};

/// Descriptor for `GetMemberReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMemberReplyDescriptor = $convert.base64Decode(
    'Cg5HZXRNZW1iZXJSZXBseRIVCgZscnpfaWQYASABKAlSBWxyeklkEhIKBG5hbWUYAiABKAlSBG'
    '5hbWUSGwoJbWVtYmVyX2lkGAMgASgFUghtZW1iZXJJZA==');

@$core.Deprecated('Use getUploadStatusRequestDescriptor instead')
const GetUploadStatusRequest$json = {
  '1': 'GetUploadStatusRequest',
  '2': [
    {'1': 'lrz_id', '3': 1, '4': 1, '5': 9, '10': 'lrzId'},
  ],
};

/// Descriptor for `GetUploadStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUploadStatusRequestDescriptor = $convert.base64Decode(
    'ChZHZXRVcGxvYWRTdGF0dXNSZXF1ZXN0EhUKBmxyel9pZBgBIAEoCVIFbHJ6SWQ=');

@$core.Deprecated('Use getUploadStatusReplyDescriptor instead')
const GetUploadStatusReply$json = {
  '1': 'GetUploadStatusReply',
  '2': [
    {'1': 'fcm_token', '3': 1, '4': 1, '5': 9, '10': 'fcmToken'},
    {'1': 'public_key', '3': 2, '4': 1, '5': 9, '10': 'publicKey'},
    {'1': 'student_id', '3': 3, '4': 1, '5': 8, '10': 'studentId'},
    {'1': 'employee_id', '3': 4, '4': 1, '5': 8, '10': 'employeeId'},
    {'1': 'external_id', '3': 5, '4': 1, '5': 8, '10': 'externalId'},
  ],
};

/// Descriptor for `GetUploadStatusReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUploadStatusReplyDescriptor = $convert.base64Decode(
    'ChRHZXRVcGxvYWRTdGF0dXNSZXBseRIbCglmY21fdG9rZW4YASABKAlSCGZjbVRva2VuEh0KCn'
    'B1YmxpY19rZXkYAiABKAlSCXB1YmxpY0tleRIdCgpzdHVkZW50X2lkGAMgASgIUglzdHVkZW50'
    'SWQSHwoLZW1wbG95ZWVfaWQYBCABKAhSCmVtcGxveWVlSWQSHwoLZXh0ZXJuYWxfaWQYBSABKA'
    'hSCmV4dGVybmFsSWQ=');

@$core.Deprecated('Use getNotificationRequestDescriptor instead')
const GetNotificationRequest$json = {
  '1': 'GetNotificationRequest',
  '2': [
    {'1': 'notification_id', '3': 1, '4': 1, '5': 5, '10': 'notificationId'},
  ],
};

/// Descriptor for `GetNotificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotificationRequestDescriptor = $convert.base64Decode(
    'ChZHZXROb3RpZmljYXRpb25SZXF1ZXN0EicKD25vdGlmaWNhdGlvbl9pZBgBIAEoBVIObm90aW'
    'ZpY2F0aW9uSWQ=');

@$core.Deprecated('Use getNotificationReplyDescriptor instead')
const GetNotificationReply$json = {
  '1': 'GetNotificationReply',
  '2': [
    {'1': 'notification_id', '3': 1, '4': 1, '5': 5, '10': 'notificationId'},
    {'1': 'type', '3': 2, '4': 1, '5': 5, '10': 'type'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {'1': 'signature', '3': 5, '4': 1, '5': 9, '10': 'signature'},
  ],
};

/// Descriptor for `GetNotificationReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotificationReplyDescriptor = $convert.base64Decode(
    'ChRHZXROb3RpZmljYXRpb25SZXBseRInCg9ub3RpZmljYXRpb25faWQYASABKAVSDm5vdGlmaW'
    'NhdGlvbklkEhIKBHR5cGUYAiABKAVSBHR5cGUSFAoFdGl0bGUYAyABKAlSBXRpdGxlEiAKC2Rl'
    'c2NyaXB0aW9uGAQgASgJUgtkZXNjcmlwdGlvbhIcCglzaWduYXR1cmUYBSABKAlSCXNpZ25hdH'
    'VyZQ==');

@$core.Deprecated('Use getNotificationConfirmRequestDescriptor instead')
const GetNotificationConfirmRequest$json = {
  '1': 'GetNotificationConfirmRequest',
  '2': [
    {'1': 'notification_id', '3': 1, '4': 1, '5': 5, '10': 'notificationId'},
  ],
};

/// Descriptor for `GetNotificationConfirmRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotificationConfirmRequestDescriptor = $convert.base64Decode(
    'Ch1HZXROb3RpZmljYXRpb25Db25maXJtUmVxdWVzdBInCg9ub3RpZmljYXRpb25faWQYASABKA'
    'VSDm5vdGlmaWNhdGlvbklk');

@$core.Deprecated('Use getNotificationConfirmReplyDescriptor instead')
const GetNotificationConfirmReply$json = {
  '1': 'GetNotificationConfirmReply',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `GetNotificationConfirmReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotificationConfirmReplyDescriptor = $convert.base64Decode(
    'ChtHZXROb3RpZmljYXRpb25Db25maXJtUmVwbHkSFgoGc3RhdHVzGAEgASgJUgZzdGF0dXM=');

@$core.Deprecated('Use getCanteenHeadCountRequestDescriptor instead')
const GetCanteenHeadCountRequest$json = {
  '1': 'GetCanteenHeadCountRequest',
  '2': [
    {'1': 'canteen_id', '3': 1, '4': 1, '5': 9, '10': 'canteenId'},
  ],
};

/// Descriptor for `GetCanteenHeadCountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCanteenHeadCountRequestDescriptor = $convert.base64Decode(
    'ChpHZXRDYW50ZWVuSGVhZENvdW50UmVxdWVzdBIdCgpjYW50ZWVuX2lkGAEgASgJUgljYW50ZW'
    'VuSWQ=');

@$core.Deprecated('Use getCanteenHeadCountReplyDescriptor instead')
const GetCanteenHeadCountReply$json = {
  '1': 'GetCanteenHeadCountReply',
  '2': [
    {'1': 'count', '3': 1, '4': 1, '5': 13, '10': 'count'},
    {'1': 'max_count', '3': 2, '4': 1, '5': 13, '10': 'maxCount'},
    {'1': 'percent', '3': 3, '4': 1, '5': 2, '10': 'percent'},
    {'1': 'timestamp', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
  ],
};

/// Descriptor for `GetCanteenHeadCountReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCanteenHeadCountReplyDescriptor = $convert.base64Decode(
    'ChhHZXRDYW50ZWVuSGVhZENvdW50UmVwbHkSFAoFY291bnQYASABKA1SBWNvdW50EhsKCW1heF'
    '9jb3VudBgCIAEoDVIIbWF4Q291bnQSGAoHcGVyY2VudBgDIAEoAlIHcGVyY2VudBI4Cgl0aW1l'
    'c3RhbXAYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl0aW1lc3RhbXA=');

@$core.Deprecated('Use listStudentClubRequestDescriptor instead')
const ListStudentClubRequest$json = {
  '1': 'ListStudentClubRequest',
};

/// Descriptor for `ListStudentClubRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listStudentClubRequestDescriptor = $convert.base64Decode(
    'ChZMaXN0U3R1ZGVudENsdWJSZXF1ZXN0');

@$core.Deprecated('Use listStudentClubReplyDescriptor instead')
const ListStudentClubReply$json = {
  '1': 'ListStudentClubReply',
  '2': [
    {'1': 'collections', '3': 1, '4': 3, '5': 11, '6': '.api.StudentClubCollection', '10': 'collections'},
  ],
};

/// Descriptor for `ListStudentClubReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listStudentClubReplyDescriptor = $convert.base64Decode(
    'ChRMaXN0U3R1ZGVudENsdWJSZXBseRI8Cgtjb2xsZWN0aW9ucxgBIAMoCzIaLmFwaS5TdHVkZW'
    '50Q2x1YkNvbGxlY3Rpb25SC2NvbGxlY3Rpb25z');

@$core.Deprecated('Use studentClubDescriptor instead')
const StudentClub$json = {
  '1': 'StudentClub',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    {'1': 'link_url', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'linkUrl', '17': true},
    {'1': 'cover_url', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'coverUrl', '17': true},
  ],
  '8': [
    {'1': '_description'},
    {'1': '_link_url'},
    {'1': '_cover_url'},
  ],
};

/// Descriptor for `StudentClub`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List studentClubDescriptor = $convert.base64Decode(
    'CgtTdHVkZW50Q2x1YhISCgRuYW1lGAEgASgJUgRuYW1lEiUKC2Rlc2NyaXB0aW9uGAIgASgJSA'
    'BSC2Rlc2NyaXB0aW9uiAEBEh4KCGxpbmtfdXJsGAMgASgJSAFSB2xpbmtVcmyIAQESIAoJY292'
    'ZXJfdXJsGAQgASgJSAJSCGNvdmVyVXJsiAEBQg4KDF9kZXNjcmlwdGlvbkILCglfbGlua191cm'
    'xCDAoKX2NvdmVyX3VybA==');

@$core.Deprecated('Use studentClubCollectionDescriptor instead')
const StudentClubCollection$json = {
  '1': 'StudentClubCollection',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'clubs', '3': 3, '4': 3, '5': 11, '6': '.api.StudentClub', '10': 'clubs'},
  ],
};

/// Descriptor for `StudentClubCollection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List studentClubCollectionDescriptor = $convert.base64Decode(
    'ChVTdHVkZW50Q2x1YkNvbGxlY3Rpb24SFAoFdGl0bGUYASABKAlSBXRpdGxlEiAKC2Rlc2NyaX'
    'B0aW9uGAIgASgJUgtkZXNjcmlwdGlvbhImCgVjbHVicxgDIAMoCzIQLmFwaS5TdHVkZW50Q2x1'
    'YlIFY2x1YnM=');

