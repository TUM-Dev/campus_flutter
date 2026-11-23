// This is a generated file - do not edit.
//
// Generated from tumdev/campus_backend.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

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

@$core.Deprecated('Use ratingSortOrderDescriptor instead')
const RatingSortOrder$json = {
  '1': 'RatingSortOrder',
  '2': [
    {'1': 'RATING_SORT_NEWEST', '2': 0},
    {'1': 'RATING_SORT_HIGHEST', '2': 1},
    {'1': 'RATING_SORT_LOWEST', '2': 2},
    {'1': 'RATING_SORT_HELPFUL', '2': 3},
  ],
};

/// Descriptor for `RatingSortOrder`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List ratingSortOrderDescriptor = $convert.base64Decode(
    'Cg9SYXRpbmdTb3J0T3JkZXISFgoSUkFUSU5HX1NPUlRfTkVXRVNUEAASFwoTUkFUSU5HX1NPUl'
    'RfSElHSEVTVBABEhYKElJBVElOR19TT1JUX0xPV0VTVBACEhcKE1JBVElOR19TT1JUX0hFTFBG'
    'VUwQAw==');

@$core.Deprecated('Use cinemaDescriptor instead')
const Cinema$json = {
  '1': 'Cinema',
  '2': [
    {'1': 'CINEMA_UNSPECIFIED', '2': 0},
    {'1': 'TU_FILM', '2': 1},
    {'1': 'CAMPUSKINO_HEILBRONN', '2': 2},
  ],
};

/// Descriptor for `Cinema`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cinemaDescriptor = $convert.base64Decode(
    'CgZDaW5lbWESFgoSQ0lORU1BX1VOU1BFQ0lGSUVEEAASCwoHVFVfRklMTRABEhgKFENBTVBVU0'
    'tJTk9fSEVJTEJST05OEAI=');

@$core.Deprecated('Use languageDescriptor instead')
const Language$json = {
  '1': 'Language',
  '2': [
    {'1': 'German', '2': 0},
    {'1': 'English', '2': 1},
  ],
};

/// Descriptor for `Language`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List languageDescriptor =
    $convert.base64Decode('CghMYW5ndWFnZRIKCgZHZXJtYW4QABILCgdFbmdsaXNoEAE=');

@$core.Deprecated('Use createDeviceRequestDescriptor instead')
const CreateDeviceRequest$json = {
  '1': 'CreateDeviceRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'public_key', '3': 2, '4': 1, '5': 9, '10': 'publicKey'},
    {
      '1': 'device_type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.api.DeviceType',
      '10': 'deviceType'
    },
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
    {
      '1': 'device_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.api.DeviceType',
      '10': 'deviceType'
    },
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
    {
      '1': 'created',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'created'
    },
    {
      '1': 'date',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'date'
    },
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
    {
      '1': 'oldest_date_at',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'oldestDateAt'
    },
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
final $typed_data.Uint8List listNewsSourcesRequestDescriptor =
    $convert.base64Decode('ChZMaXN0TmV3c1NvdXJjZXNSZXF1ZXN0');

@$core.Deprecated('Use listNewsSourcesReplyDescriptor instead')
const ListNewsSourcesReply$json = {
  '1': 'ListNewsSourcesReply',
  '2': [
    {
      '1': 'sources',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.api.NewsSource',
      '10': 'sources'
    },
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
    {
      '1': 'last_news_alert_id',
      '3': 1,
      '4': 1,
      '5': 5,
      '10': 'lastNewsAlertId'
    },
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
    {
      '1': 'alerts',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.api.NewsAlert',
      '10': 'alerts'
    },
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
    {
      '1': 'created',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'created'
    },
    {
      '1': 'from',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'from'
    },
    {
      '1': 'to',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'to'
    },
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
    {
      '1': 'from',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'from'
    },
    {
      '1': 'to',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'to'
    },
    {'1': 'limit', '3': 4, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 5, '4': 1, '5': 5, '10': 'offset'},
    {
      '1': 'sort_by',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.api.RatingSortOrder',
      '10': 'sortBy'
    },
    {'1': 'only_with_images', '3': 7, '4': 1, '5': 8, '10': 'onlyWithImages'},
    {
      '1': 'only_with_comments',
      '3': 8,
      '4': 1,
      '5': 8,
      '10': 'onlyWithComments'
    },
    {
      '1': 'omit_inline_images',
      '3': 9,
      '4': 1,
      '5': 8,
      '10': 'omitInlineImages'
    },
  ],
};

/// Descriptor for `ListCanteenRatingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCanteenRatingsRequestDescriptor = $convert.base64Decode(
    'ChlMaXN0Q2FudGVlblJhdGluZ3NSZXF1ZXN0Eh0KCmNhbnRlZW5faWQYASABKAlSCWNhbnRlZW'
    '5JZBIuCgRmcm9tGAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIEZnJvbRIqCgJ0'
    'bxgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSAnRvEhQKBWxpbWl0GAQgASgFUg'
    'VsaW1pdBIWCgZvZmZzZXQYBSABKAVSBm9mZnNldBItCgdzb3J0X2J5GAYgASgOMhQuYXBpLlJh'
    'dGluZ1NvcnRPcmRlclIGc29ydEJ5EigKEG9ubHlfd2l0aF9pbWFnZXMYByABKAhSDm9ubHlXaX'
    'RoSW1hZ2VzEiwKEm9ubHlfd2l0aF9jb21tZW50cxgIIAEoCFIQb25seVdpdGhDb21tZW50cxIs'
    'ChJvbWl0X2lubGluZV9pbWFnZXMYCSABKAhSEG9taXRJbmxpbmVJbWFnZXM=');

@$core.Deprecated('Use ratingDistributionDescriptor instead')
const RatingDistribution$json = {
  '1': 'RatingDistribution',
  '2': [
    {'1': 'stars_1', '3': 1, '4': 1, '5': 3, '10': 'stars1'},
    {'1': 'stars_2', '3': 2, '4': 1, '5': 3, '10': 'stars2'},
    {'1': 'stars_3', '3': 3, '4': 1, '5': 3, '10': 'stars3'},
    {'1': 'stars_4', '3': 4, '4': 1, '5': 3, '10': 'stars4'},
    {'1': 'stars_5', '3': 5, '4': 1, '5': 3, '10': 'stars5'},
  ],
};

/// Descriptor for `RatingDistribution`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ratingDistributionDescriptor = $convert.base64Decode(
    'ChJSYXRpbmdEaXN0cmlidXRpb24SFwoHc3RhcnNfMRgBIAEoA1IGc3RhcnMxEhcKB3N0YXJzXz'
    'IYAiABKANSBnN0YXJzMhIXCgdzdGFyc18zGAMgASgDUgZzdGFyczMSFwoHc3RhcnNfNBgEIAEo'
    'A1IGc3RhcnM0EhcKB3N0YXJzXzUYBSABKANSBnN0YXJzNQ==');

@$core.Deprecated('Use listCanteenRatingsReplyDescriptor instead')
const ListCanteenRatingsReply$json = {
  '1': 'ListCanteenRatingsReply',
  '2': [
    {
      '1': 'rating',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.api.SingleRatingReply',
      '10': 'rating'
    },
    {'1': 'avg', '3': 2, '4': 1, '5': 1, '10': 'avg'},
    {'1': 'std', '3': 3, '4': 1, '5': 1, '10': 'std'},
    {'1': 'min', '3': 4, '4': 1, '5': 5, '10': 'min'},
    {'1': 'max', '3': 5, '4': 1, '5': 5, '10': 'max'},
    {
      '1': 'rating_tags',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.api.RatingTagResult',
      '10': 'ratingTags'
    },
    {'1': 'rating_count', '3': 7, '4': 1, '5': 3, '10': 'ratingCount'},
    {
      '1': 'distribution',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.api.RatingDistribution',
      '10': 'distribution'
    },
    {'1': 'total_matching', '3': 9, '4': 1, '5': 3, '10': 'totalMatching'},
    {'1': 'has_more', '3': 10, '4': 1, '5': 8, '10': 'hasMore'},
  ],
};

/// Descriptor for `ListCanteenRatingsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCanteenRatingsReplyDescriptor = $convert.base64Decode(
    'ChdMaXN0Q2FudGVlblJhdGluZ3NSZXBseRIuCgZyYXRpbmcYASADKAsyFi5hcGkuU2luZ2xlUm'
    'F0aW5nUmVwbHlSBnJhdGluZxIQCgNhdmcYAiABKAFSA2F2ZxIQCgNzdGQYAyABKAFSA3N0ZBIQ'
    'CgNtaW4YBCABKAVSA21pbhIQCgNtYXgYBSABKAVSA21heBI1CgtyYXRpbmdfdGFncxgGIAMoCz'
    'IULmFwaS5SYXRpbmdUYWdSZXN1bHRSCnJhdGluZ1RhZ3MSIQoMcmF0aW5nX2NvdW50GAcgASgD'
    'UgtyYXRpbmdDb3VudBI7CgxkaXN0cmlidXRpb24YCCABKAsyFy5hcGkuUmF0aW5nRGlzdHJpYn'
    'V0aW9uUgxkaXN0cmlidXRpb24SJQoOdG90YWxfbWF0Y2hpbmcYCSABKANSDXRvdGFsTWF0Y2hp'
    'bmcSGQoIaGFzX21vcmUYCiABKAhSB2hhc01vcmU=');

@$core.Deprecated('Use getDishRatingsRequestDescriptor instead')
const GetDishRatingsRequest$json = {
  '1': 'GetDishRatingsRequest',
  '2': [
    {'1': 'canteen_id', '3': 1, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'dish', '3': 2, '4': 1, '5': 9, '10': 'dish'},
    {
      '1': 'from',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'from'
    },
    {
      '1': 'to',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'to'
    },
    {'1': 'limit', '3': 5, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 6, '4': 1, '5': 5, '10': 'offset'},
    {
      '1': 'sort_by',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.api.RatingSortOrder',
      '10': 'sortBy'
    },
    {'1': 'only_with_images', '3': 8, '4': 1, '5': 8, '10': 'onlyWithImages'},
    {
      '1': 'only_with_comments',
      '3': 9,
      '4': 1,
      '5': 8,
      '10': 'onlyWithComments'
    },
    {
      '1': 'omit_inline_images',
      '3': 10,
      '4': 1,
      '5': 8,
      '10': 'omitInlineImages'
    },
    {
      '1': 'include_unrated_fallback',
      '3': 11,
      '4': 1,
      '5': 8,
      '10': 'includeUnratedFallback'
    },
  ],
};

/// Descriptor for `GetDishRatingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDishRatingsRequestDescriptor = $convert.base64Decode(
    'ChVHZXREaXNoUmF0aW5nc1JlcXVlc3QSHQoKY2FudGVlbl9pZBgBIAEoCVIJY2FudGVlbklkEh'
    'IKBGRpc2gYAiABKAlSBGRpc2gSLgoEZnJvbRgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1l'
    'c3RhbXBSBGZyb20SKgoCdG8YBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgJ0bx'
    'IUCgVsaW1pdBgFIAEoBVIFbGltaXQSFgoGb2Zmc2V0GAYgASgFUgZvZmZzZXQSLQoHc29ydF9i'
    'eRgHIAEoDjIULmFwaS5SYXRpbmdTb3J0T3JkZXJSBnNvcnRCeRIoChBvbmx5X3dpdGhfaW1hZ2'
    'VzGAggASgIUg5vbmx5V2l0aEltYWdlcxIsChJvbmx5X3dpdGhfY29tbWVudHMYCSABKAhSEG9u'
    'bHlXaXRoQ29tbWVudHMSLAoSb21pdF9pbmxpbmVfaW1hZ2VzGAogASgIUhBvbWl0SW5saW5lSW'
    '1hZ2VzEjgKGGluY2x1ZGVfdW5yYXRlZF9mYWxsYmFjaxgLIAEoCFIWaW5jbHVkZVVucmF0ZWRG'
    'YWxsYmFjaw==');

@$core.Deprecated('Use getDishRatingsReplyDescriptor instead')
const GetDishRatingsReply$json = {
  '1': 'GetDishRatingsReply',
  '2': [
    {
      '1': 'rating',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.api.SingleRatingReply',
      '10': 'rating'
    },
    {'1': 'avg', '3': 2, '4': 1, '5': 1, '10': 'avg'},
    {'1': 'std', '3': 3, '4': 1, '5': 1, '10': 'std'},
    {'1': 'min', '3': 4, '4': 1, '5': 5, '10': 'min'},
    {'1': 'max', '3': 5, '4': 1, '5': 5, '10': 'max'},
    {
      '1': 'rating_tags',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.api.RatingTagResult',
      '10': 'ratingTags'
    },
    {
      '1': 'name_tags',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.api.RatingTagResult',
      '10': 'nameTags'
    },
    {'1': 'rating_count', '3': 8, '4': 1, '5': 3, '10': 'ratingCount'},
    {
      '1': 'distribution',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.api.RatingDistribution',
      '10': 'distribution'
    },
    {'1': 'total_matching', '3': 10, '4': 1, '5': 3, '10': 'totalMatching'},
    {'1': 'has_more', '3': 11, '4': 1, '5': 8, '10': 'hasMore'},
    {'1': 'sold_out', '3': 12, '4': 1, '5': 8, '10': 'soldOut'},
    {
      '1': 'sold_out_report_count',
      '3': 13,
      '4': 1,
      '5': 5,
      '10': 'soldOutReportCount'
    },
  ],
};

/// Descriptor for `GetDishRatingsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDishRatingsReplyDescriptor = $convert.base64Decode(
    'ChNHZXREaXNoUmF0aW5nc1JlcGx5Ei4KBnJhdGluZxgBIAMoCzIWLmFwaS5TaW5nbGVSYXRpbm'
    'dSZXBseVIGcmF0aW5nEhAKA2F2ZxgCIAEoAVIDYXZnEhAKA3N0ZBgDIAEoAVIDc3RkEhAKA21p'
    'bhgEIAEoBVIDbWluEhAKA21heBgFIAEoBVIDbWF4EjUKC3JhdGluZ190YWdzGAYgAygLMhQuYX'
    'BpLlJhdGluZ1RhZ1Jlc3VsdFIKcmF0aW5nVGFncxIxCgluYW1lX3RhZ3MYByADKAsyFC5hcGku'
    'UmF0aW5nVGFnUmVzdWx0UghuYW1lVGFncxIhCgxyYXRpbmdfY291bnQYCCABKANSC3JhdGluZ0'
    'NvdW50EjsKDGRpc3RyaWJ1dGlvbhgJIAEoCzIXLmFwaS5SYXRpbmdEaXN0cmlidXRpb25SDGRp'
    'c3RyaWJ1dGlvbhIlCg50b3RhbF9tYXRjaGluZxgKIAEoA1INdG90YWxNYXRjaGluZxIZCghoYX'
    'NfbW9yZRgLIAEoCFIHaGFzTW9yZRIZCghzb2xkX291dBgMIAEoCFIHc29sZE91dBIxChVzb2xk'
    'X291dF9yZXBvcnRfY291bnQYDSABKAVSEnNvbGRPdXRSZXBvcnRDb3VudA==');

@$core.Deprecated('Use singleRatingReplyDescriptor instead')
const SingleRatingReply$json = {
  '1': 'SingleRatingReply',
  '2': [
    {'1': 'points', '3': 1, '4': 1, '5': 5, '10': 'points'},
    {'1': 'image', '3': 2, '4': 1, '5': 12, '10': 'image'},
    {'1': 'comment', '3': 3, '4': 1, '5': 9, '10': 'comment'},
    {
      '1': 'rating_tags',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.api.RatingTagNewRequest',
      '10': 'ratingTags'
    },
    {
      '1': 'visited',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'visited'
    },
    {'1': 'rating_id', '3': 6, '4': 1, '5': 3, '10': 'ratingId'},
    {'1': 'image_url', '3': 7, '4': 1, '5': 9, '10': 'imageUrl'},
    {'1': 'is_own_rating', '3': 8, '4': 1, '5': 8, '10': 'isOwnRating'},
    {
      '1': 'updated_at',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
    {'1': 'helpful_count', '3': 10, '4': 1, '5': 3, '10': 'helpfulCount'},
    {'1': 'user_voted', '3': 11, '4': 1, '5': 8, '10': 'userVoted'},
  ],
};

/// Descriptor for `SingleRatingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List singleRatingReplyDescriptor = $convert.base64Decode(
    'ChFTaW5nbGVSYXRpbmdSZXBseRIWCgZwb2ludHMYASABKAVSBnBvaW50cxIUCgVpbWFnZRgCIA'
    'EoDFIFaW1hZ2USGAoHY29tbWVudBgDIAEoCVIHY29tbWVudBI5CgtyYXRpbmdfdGFncxgEIAMo'
    'CzIYLmFwaS5SYXRpbmdUYWdOZXdSZXF1ZXN0UgpyYXRpbmdUYWdzEjQKB3Zpc2l0ZWQYBSABKA'
    'syGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgd2aXNpdGVkEhsKCXJhdGluZ19pZBgGIAEo'
    'A1IIcmF0aW5nSWQSGwoJaW1hZ2VfdXJsGAcgASgJUghpbWFnZVVybBIiCg1pc19vd25fcmF0aW'
    '5nGAggASgIUgtpc093blJhdGluZxI5Cgp1cGRhdGVkX2F0GAkgASgLMhouZ29vZ2xlLnByb3Rv'
    'YnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0EiMKDWhlbHBmdWxfY291bnQYCiABKANSDGhlbHBmdW'
    'xDb3VudBIdCgp1c2VyX3ZvdGVkGAsgASgIUgl1c2VyVm90ZWQ=');

@$core.Deprecated('Use createCanteenRatingReplyDescriptor instead')
const CreateCanteenRatingReply$json = {
  '1': 'CreateCanteenRatingReply',
  '2': [
    {'1': 'rating_id', '3': 1, '4': 1, '5': 3, '10': 'ratingId'},
  ],
};

/// Descriptor for `CreateCanteenRatingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCanteenRatingReplyDescriptor =
    $convert.base64Decode(
        'ChhDcmVhdGVDYW50ZWVuUmF0aW5nUmVwbHkSGwoJcmF0aW5nX2lkGAEgASgDUghyYXRpbmdJZA'
        '==');

@$core.Deprecated('Use createCanteenRatingRequestDescriptor instead')
const CreateCanteenRatingRequest$json = {
  '1': 'CreateCanteenRatingRequest',
  '2': [
    {'1': 'points', '3': 1, '4': 1, '5': 5, '10': 'points'},
    {'1': 'canteen_id', '3': 2, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'image', '3': 3, '4': 1, '5': 12, '10': 'image'},
    {
      '1': 'rating_tags',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.api.RatingTag',
      '10': 'ratingTags'
    },
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
  '2': [
    {'1': 'rating_id', '3': 1, '4': 1, '5': 3, '10': 'ratingId'},
  ],
};

/// Descriptor for `CreateDishRatingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDishRatingReplyDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVEaXNoUmF0aW5nUmVwbHkSGwoJcmF0aW5nX2lkGAEgASgDUghyYXRpbmdJZA==');

@$core.Deprecated('Use createDishRatingRequestDescriptor instead')
const CreateDishRatingRequest$json = {
  '1': 'CreateDishRatingRequest',
  '2': [
    {'1': 'points', '3': 1, '4': 1, '5': 5, '10': 'points'},
    {'1': 'canteen_id', '3': 2, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'dish', '3': 3, '4': 1, '5': 9, '10': 'dish'},
    {'1': 'image', '3': 4, '4': 1, '5': 12, '10': 'image'},
    {
      '1': 'rating_tags',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.api.RatingTag',
      '10': 'ratingTags'
    },
    {'1': 'comment', '3': 7, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `CreateDishRatingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDishRatingRequestDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVEaXNoUmF0aW5nUmVxdWVzdBIWCgZwb2ludHMYASABKAVSBnBvaW50cxIdCgpjYW'
    '50ZWVuX2lkGAIgASgJUgljYW50ZWVuSWQSEgoEZGlzaBgDIAEoCVIEZGlzaBIUCgVpbWFnZRgE'
    'IAEoDFIFaW1hZ2USLwoLcmF0aW5nX3RhZ3MYBSADKAsyDi5hcGkuUmF0aW5nVGFnUgpyYXRpbm'
    'dUYWdzEhgKB2NvbW1lbnQYByABKAlSB2NvbW1lbnQ=');

@$core.Deprecated('Use updateDishRatingRequestDescriptor instead')
const UpdateDishRatingRequest$json = {
  '1': 'UpdateDishRatingRequest',
  '2': [
    {'1': 'rating_id', '3': 1, '4': 1, '5': 3, '10': 'ratingId'},
    {'1': 'points', '3': 2, '4': 1, '5': 5, '10': 'points'},
    {'1': 'comment', '3': 3, '4': 1, '5': 9, '10': 'comment'},
    {
      '1': 'rating_tags',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.api.RatingTag',
      '10': 'ratingTags'
    },
    {'1': 'image', '3': 5, '4': 1, '5': 12, '10': 'image'},
    {'1': 'remove_image', '3': 6, '4': 1, '5': 8, '10': 'removeImage'},
  ],
};

/// Descriptor for `UpdateDishRatingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDishRatingRequestDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVEaXNoUmF0aW5nUmVxdWVzdBIbCglyYXRpbmdfaWQYASABKANSCHJhdGluZ0lkEh'
    'YKBnBvaW50cxgCIAEoBVIGcG9pbnRzEhgKB2NvbW1lbnQYAyABKAlSB2NvbW1lbnQSLwoLcmF0'
    'aW5nX3RhZ3MYBCADKAsyDi5hcGkuUmF0aW5nVGFnUgpyYXRpbmdUYWdzEhQKBWltYWdlGAUgAS'
    'gMUgVpbWFnZRIhCgxyZW1vdmVfaW1hZ2UYBiABKAhSC3JlbW92ZUltYWdl');

@$core.Deprecated('Use updateDishRatingReplyDescriptor instead')
const UpdateDishRatingReply$json = {
  '1': 'UpdateDishRatingReply',
  '2': [
    {'1': 'rating_id', '3': 1, '4': 1, '5': 3, '10': 'ratingId'},
  ],
};

/// Descriptor for `UpdateDishRatingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDishRatingReplyDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVEaXNoUmF0aW5nUmVwbHkSGwoJcmF0aW5nX2lkGAEgASgDUghyYXRpbmdJZA==');

@$core.Deprecated('Use deleteDishRatingRequestDescriptor instead')
const DeleteDishRatingRequest$json = {
  '1': 'DeleteDishRatingRequest',
  '2': [
    {'1': 'rating_id', '3': 1, '4': 1, '5': 3, '10': 'ratingId'},
  ],
};

/// Descriptor for `DeleteDishRatingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDishRatingRequestDescriptor =
    $convert.base64Decode(
        'ChdEZWxldGVEaXNoUmF0aW5nUmVxdWVzdBIbCglyYXRpbmdfaWQYASABKANSCHJhdGluZ0lk');

@$core.Deprecated('Use deleteDishRatingReplyDescriptor instead')
const DeleteDishRatingReply$json = {
  '1': 'DeleteDishRatingReply',
};

/// Descriptor for `DeleteDishRatingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDishRatingReplyDescriptor =
    $convert.base64Decode('ChVEZWxldGVEaXNoUmF0aW5nUmVwbHk=');

@$core.Deprecated('Use reportDishRatingRequestDescriptor instead')
const ReportDishRatingRequest$json = {
  '1': 'ReportDishRatingRequest',
  '2': [
    {'1': 'rating_id', '3': 1, '4': 1, '5': 3, '10': 'ratingId'},
    {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `ReportDishRatingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportDishRatingRequestDescriptor =
    $convert.base64Decode(
        'ChdSZXBvcnREaXNoUmF0aW5nUmVxdWVzdBIbCglyYXRpbmdfaWQYASABKANSCHJhdGluZ0lkEh'
        'YKBnJlYXNvbhgCIAEoCVIGcmVhc29u');

@$core.Deprecated('Use reportDishRatingReplyDescriptor instead')
const ReportDishRatingReply$json = {
  '1': 'ReportDishRatingReply',
  '2': [
    {'1': 'hidden', '3': 1, '4': 1, '5': 8, '10': 'hidden'},
  ],
};

/// Descriptor for `ReportDishRatingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportDishRatingReplyDescriptor =
    $convert.base64Decode(
        'ChVSZXBvcnREaXNoUmF0aW5nUmVwbHkSFgoGaGlkZGVuGAEgASgIUgZoaWRkZW4=');

@$core.Deprecated('Use voteDishRatingRequestDescriptor instead')
const VoteDishRatingRequest$json = {
  '1': 'VoteDishRatingRequest',
  '2': [
    {'1': 'rating_id', '3': 1, '4': 1, '5': 3, '10': 'ratingId'},
    {'1': 'helpful', '3': 2, '4': 1, '5': 8, '10': 'helpful'},
  ],
};

/// Descriptor for `VoteDishRatingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voteDishRatingRequestDescriptor = $convert.base64Decode(
    'ChVWb3RlRGlzaFJhdGluZ1JlcXVlc3QSGwoJcmF0aW5nX2lkGAEgASgDUghyYXRpbmdJZBIYCg'
    'doZWxwZnVsGAIgASgIUgdoZWxwZnVs');

@$core.Deprecated('Use voteDishRatingReplyDescriptor instead')
const VoteDishRatingReply$json = {
  '1': 'VoteDishRatingReply',
  '2': [
    {'1': 'helpful_count', '3': 1, '4': 1, '5': 3, '10': 'helpfulCount'},
    {'1': 'user_voted', '3': 2, '4': 1, '5': 8, '10': 'userVoted'},
  ],
};

/// Descriptor for `VoteDishRatingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voteDishRatingReplyDescriptor = $convert.base64Decode(
    'ChNWb3RlRGlzaFJhdGluZ1JlcGx5EiMKDWhlbHBmdWxfY291bnQYASABKANSDGhlbHBmdWxDb3'
    'VudBIdCgp1c2VyX3ZvdGVkGAIgASgIUgl1c2VyVm90ZWQ=');

@$core.Deprecated('Use listDishPhotosRequestDescriptor instead')
const ListDishPhotosRequest$json = {
  '1': 'ListDishPhotosRequest',
  '2': [
    {'1': 'canteen_id', '3': 1, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'dish', '3': 2, '4': 1, '5': 9, '10': 'dish'},
    {'1': 'limit', '3': 3, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 4, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `ListDishPhotosRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDishPhotosRequestDescriptor = $convert.base64Decode(
    'ChVMaXN0RGlzaFBob3Rvc1JlcXVlc3QSHQoKY2FudGVlbl9pZBgBIAEoCVIJY2FudGVlbklkEh'
    'IKBGRpc2gYAiABKAlSBGRpc2gSFAoFbGltaXQYAyABKAVSBWxpbWl0EhYKBm9mZnNldBgEIAEo'
    'BVIGb2Zmc2V0');

@$core.Deprecated('Use dishPhotoDescriptor instead')
const DishPhoto$json = {
  '1': 'DishPhoto',
  '2': [
    {'1': 'rating_id', '3': 1, '4': 1, '5': 3, '10': 'ratingId'},
    {'1': 'image_url', '3': 2, '4': 1, '5': 9, '10': 'imageUrl'},
    {'1': 'points', '3': 3, '4': 1, '5': 5, '10': 'points'},
    {'1': 'comment', '3': 4, '4': 1, '5': 9, '10': 'comment'},
    {'1': 'helpful_count', '3': 5, '4': 1, '5': 3, '10': 'helpfulCount'},
    {
      '1': 'visited',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'visited'
    },
  ],
};

/// Descriptor for `DishPhoto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dishPhotoDescriptor = $convert.base64Decode(
    'CglEaXNoUGhvdG8SGwoJcmF0aW5nX2lkGAEgASgDUghyYXRpbmdJZBIbCglpbWFnZV91cmwYAi'
    'ABKAlSCGltYWdlVXJsEhYKBnBvaW50cxgDIAEoBVIGcG9pbnRzEhgKB2NvbW1lbnQYBCABKAlS'
    'B2NvbW1lbnQSIwoNaGVscGZ1bF9jb3VudBgFIAEoA1IMaGVscGZ1bENvdW50EjQKB3Zpc2l0ZW'
    'QYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgd2aXNpdGVk');

@$core.Deprecated('Use listDishPhotosReplyDescriptor instead')
const ListDishPhotosReply$json = {
  '1': 'ListDishPhotosReply',
  '2': [
    {
      '1': 'photos',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.api.DishPhoto',
      '10': 'photos'
    },
    {'1': 'total', '3': 2, '4': 1, '5': 3, '10': 'total'},
    {'1': 'has_more', '3': 3, '4': 1, '5': 8, '10': 'hasMore'},
  ],
};

/// Descriptor for `ListDishPhotosReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDishPhotosReplyDescriptor = $convert.base64Decode(
    'ChNMaXN0RGlzaFBob3Rvc1JlcGx5EiYKBnBob3RvcxgBIAMoCzIOLmFwaS5EaXNoUGhvdG9SBn'
    'Bob3RvcxIUCgV0b3RhbBgCIAEoA1IFdG90YWwSGQoIaGFzX21vcmUYAyABKAhSB2hhc01vcmU=');

@$core.Deprecated('Use listAvailableDishTagsRequestDescriptor instead')
const ListAvailableDishTagsRequest$json = {
  '1': 'ListAvailableDishTagsRequest',
};

/// Descriptor for `ListAvailableDishTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAvailableDishTagsRequestDescriptor =
    $convert.base64Decode('ChxMaXN0QXZhaWxhYmxlRGlzaFRhZ3NSZXF1ZXN0');

@$core.Deprecated('Use listAvailableDishTagsReplyDescriptor instead')
const ListAvailableDishTagsReply$json = {
  '1': 'ListAvailableDishTagsReply',
  '2': [
    {
      '1': 'rating_tags',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.api.TagsOverview',
      '10': 'ratingTags'
    },
  ],
};

/// Descriptor for `ListAvailableDishTagsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAvailableDishTagsReplyDescriptor =
    $convert.base64Decode(
        'ChpMaXN0QXZhaWxhYmxlRGlzaFRhZ3NSZXBseRIyCgtyYXRpbmdfdGFncxgBIAMoCzIRLmFwaS'
        '5UYWdzT3ZlcnZpZXdSCnJhdGluZ1RhZ3M=');

@$core.Deprecated('Use listNameTagsRequestDescriptor instead')
const ListNameTagsRequest$json = {
  '1': 'ListNameTagsRequest',
};

/// Descriptor for `ListNameTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listNameTagsRequestDescriptor =
    $convert.base64Decode('ChNMaXN0TmFtZVRhZ3NSZXF1ZXN0');

@$core.Deprecated('Use listNameTagsReplyDescriptor instead')
const ListNameTagsReply$json = {
  '1': 'ListNameTagsReply',
  '2': [
    {
      '1': 'rating_tags',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.api.TagsOverview',
      '10': 'ratingTags'
    },
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
final $typed_data.Uint8List listAvailableCanteenTagsRequestDescriptor =
    $convert.base64Decode('Ch9MaXN0QXZhaWxhYmxlQ2FudGVlblRhZ3NSZXF1ZXN0');

@$core.Deprecated('Use listAvailableCanteenTagsReplyDescriptor instead')
const ListAvailableCanteenTagsReply$json = {
  '1': 'ListAvailableCanteenTagsReply',
  '2': [
    {
      '1': 'rating_tags',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.api.TagsOverview',
      '10': 'ratingTags'
    },
  ],
};

/// Descriptor for `ListAvailableCanteenTagsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAvailableCanteenTagsReplyDescriptor =
    $convert.base64Decode(
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
final $typed_data.Uint8List listCanteensRequestDescriptor =
    $convert.base64Decode('ChNMaXN0Q2FudGVlbnNSZXF1ZXN0');

@$core.Deprecated('Use listCanteensReplyDescriptor instead')
const ListCanteensReply$json = {
  '1': 'ListCanteensReply',
  '2': [
    {
      '1': 'canteen',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.api.Canteen',
      '10': 'canteen'
    },
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
final $typed_data.Uint8List listDishesReplyDescriptor = $convert
    .base64Decode('Cg9MaXN0RGlzaGVzUmVwbHkSEgoEZGlzaBgBIAMoCVIEZGlzaA==');

@$core.Deprecated('Use listDishRatingSummariesRequestDescriptor instead')
const ListDishRatingSummariesRequest$json = {
  '1': 'ListDishRatingSummariesRequest',
  '2': [
    {'1': 'canteen_id', '3': 1, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'year', '3': 2, '4': 1, '5': 5, '10': 'year'},
    {'1': 'week', '3': 3, '4': 1, '5': 5, '10': 'week'},
    {'1': 'day', '3': 4, '4': 1, '5': 5, '10': 'day'},
    {'1': 'dishes', '3': 5, '4': 3, '5': 9, '10': 'dishes'},
    {
      '1': 'from',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'from'
    },
    {
      '1': 'to',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'to'
    },
  ],
};

/// Descriptor for `ListDishRatingSummariesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDishRatingSummariesRequestDescriptor = $convert.base64Decode(
    'Ch5MaXN0RGlzaFJhdGluZ1N1bW1hcmllc1JlcXVlc3QSHQoKY2FudGVlbl9pZBgBIAEoCVIJY2'
    'FudGVlbklkEhIKBHllYXIYAiABKAVSBHllYXISEgoEd2VlaxgDIAEoBVIEd2VlaxIQCgNkYXkY'
    'BCABKAVSA2RheRIWCgZkaXNoZXMYBSADKAlSBmRpc2hlcxIuCgRmcm9tGAYgASgLMhouZ29vZ2'
    'xlLnByb3RvYnVmLlRpbWVzdGFtcFIEZnJvbRIqCgJ0bxgHIAEoCzIaLmdvb2dsZS5wcm90b2J1'
    'Zi5UaW1lc3RhbXBSAnRv');

@$core.Deprecated('Use dishRatingSummaryDescriptor instead')
const DishRatingSummary$json = {
  '1': 'DishRatingSummary',
  '2': [
    {'1': 'dish', '3': 1, '4': 1, '5': 9, '10': 'dish'},
    {'1': 'avg', '3': 2, '4': 1, '5': 1, '10': 'avg'},
    {'1': 'std', '3': 3, '4': 1, '5': 1, '10': 'std'},
    {'1': 'min', '3': 4, '4': 1, '5': 5, '10': 'min'},
    {'1': 'max', '3': 5, '4': 1, '5': 5, '10': 'max'},
    {'1': 'rating_count', '3': 6, '4': 1, '5': 3, '10': 'ratingCount'},
    {
      '1': 'distribution',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.api.RatingDistribution',
      '10': 'distribution'
    },
    {
      '1': 'rating_tags',
      '3': 8,
      '4': 3,
      '5': 11,
      '6': '.api.RatingTagResult',
      '10': 'ratingTags'
    },
    {
      '1': 'name_tags',
      '3': 9,
      '4': 3,
      '5': 11,
      '6': '.api.RatingTagResult',
      '10': 'nameTags'
    },
    {
      '1': 'latest_image_rating_id',
      '3': 10,
      '4': 1,
      '5': 3,
      '10': 'latestImageRatingId'
    },
    {'1': 'latest_image_url', '3': 11, '4': 1, '5': 9, '10': 'latestImageUrl'},
    {'1': 'sold_out', '3': 12, '4': 1, '5': 8, '10': 'soldOut'},
    {
      '1': 'sold_out_report_count',
      '3': 13,
      '4': 1,
      '5': 5,
      '10': 'soldOutReportCount'
    },
  ],
};

/// Descriptor for `DishRatingSummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dishRatingSummaryDescriptor = $convert.base64Decode(
    'ChFEaXNoUmF0aW5nU3VtbWFyeRISCgRkaXNoGAEgASgJUgRkaXNoEhAKA2F2ZxgCIAEoAVIDYX'
    'ZnEhAKA3N0ZBgDIAEoAVIDc3RkEhAKA21pbhgEIAEoBVIDbWluEhAKA21heBgFIAEoBVIDbWF4'
    'EiEKDHJhdGluZ19jb3VudBgGIAEoA1ILcmF0aW5nQ291bnQSOwoMZGlzdHJpYnV0aW9uGAcgAS'
    'gLMhcuYXBpLlJhdGluZ0Rpc3RyaWJ1dGlvblIMZGlzdHJpYnV0aW9uEjUKC3JhdGluZ190YWdz'
    'GAggAygLMhQuYXBpLlJhdGluZ1RhZ1Jlc3VsdFIKcmF0aW5nVGFncxIxCgluYW1lX3RhZ3MYCS'
    'ADKAsyFC5hcGkuUmF0aW5nVGFnUmVzdWx0UghuYW1lVGFncxIzChZsYXRlc3RfaW1hZ2VfcmF0'
    'aW5nX2lkGAogASgDUhNsYXRlc3RJbWFnZVJhdGluZ0lkEigKEGxhdGVzdF9pbWFnZV91cmwYCy'
    'ABKAlSDmxhdGVzdEltYWdlVXJsEhkKCHNvbGRfb3V0GAwgASgIUgdzb2xkT3V0EjEKFXNvbGRf'
    'b3V0X3JlcG9ydF9jb3VudBgNIAEoBVISc29sZE91dFJlcG9ydENvdW50');

@$core.Deprecated('Use listDishRatingSummariesReplyDescriptor instead')
const ListDishRatingSummariesReply$json = {
  '1': 'ListDishRatingSummariesReply',
  '2': [
    {
      '1': 'summaries',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.api.DishRatingSummary',
      '10': 'summaries'
    },
  ],
};

/// Descriptor for `ListDishRatingSummariesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDishRatingSummariesReplyDescriptor =
    $convert.base64Decode(
        'ChxMaXN0RGlzaFJhdGluZ1N1bW1hcmllc1JlcGx5EjQKCXN1bW1hcmllcxgBIAMoCzIWLmFwaS'
        '5EaXNoUmF0aW5nU3VtbWFyeVIJc3VtbWFyaWVz');

@$core.Deprecated('Use listTopRatedDishesRequestDescriptor instead')
const ListTopRatedDishesRequest$json = {
  '1': 'ListTopRatedDishesRequest',
  '2': [
    {'1': 'year', '3': 1, '4': 1, '5': 5, '10': 'year'},
    {'1': 'week', '3': 2, '4': 1, '5': 5, '10': 'week'},
    {'1': 'day', '3': 3, '4': 1, '5': 5, '10': 'day'},
    {'1': 'canteen_id', '3': 4, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'limit', '3': 5, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'min_ratings', '3': 6, '4': 1, '5': 5, '10': 'minRatings'},
  ],
};

/// Descriptor for `ListTopRatedDishesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTopRatedDishesRequestDescriptor = $convert.base64Decode(
    'ChlMaXN0VG9wUmF0ZWREaXNoZXNSZXF1ZXN0EhIKBHllYXIYASABKAVSBHllYXISEgoEd2Vlax'
    'gCIAEoBVIEd2VlaxIQCgNkYXkYAyABKAVSA2RheRIdCgpjYW50ZWVuX2lkGAQgASgJUgljYW50'
    'ZWVuSWQSFAoFbGltaXQYBSABKAVSBWxpbWl0Eh8KC21pbl9yYXRpbmdzGAYgASgFUgptaW5SYX'
    'Rpbmdz');

@$core.Deprecated('Use topRatedDishDescriptor instead')
const TopRatedDish$json = {
  '1': 'TopRatedDish',
  '2': [
    {'1': 'canteen_id', '3': 1, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'dish', '3': 2, '4': 1, '5': 9, '10': 'dish'},
    {'1': 'avg', '3': 3, '4': 1, '5': 1, '10': 'avg'},
    {'1': 'bayesian_score', '3': 4, '4': 1, '5': 1, '10': 'bayesianScore'},
    {'1': 'rating_count', '3': 5, '4': 1, '5': 3, '10': 'ratingCount'},
    {
      '1': 'latest_image_rating_id',
      '3': 6,
      '4': 1,
      '5': 3,
      '10': 'latestImageRatingId'
    },
    {'1': 'latest_image_url', '3': 7, '4': 1, '5': 9, '10': 'latestImageUrl'},
    {'1': 'sold_out', '3': 8, '4': 1, '5': 8, '10': 'soldOut'},
  ],
};

/// Descriptor for `TopRatedDish`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topRatedDishDescriptor = $convert.base64Decode(
    'CgxUb3BSYXRlZERpc2gSHQoKY2FudGVlbl9pZBgBIAEoCVIJY2FudGVlbklkEhIKBGRpc2gYAi'
    'ABKAlSBGRpc2gSEAoDYXZnGAMgASgBUgNhdmcSJQoOYmF5ZXNpYW5fc2NvcmUYBCABKAFSDWJh'
    'eWVzaWFuU2NvcmUSIQoMcmF0aW5nX2NvdW50GAUgASgDUgtyYXRpbmdDb3VudBIzChZsYXRlc3'
    'RfaW1hZ2VfcmF0aW5nX2lkGAYgASgDUhNsYXRlc3RJbWFnZVJhdGluZ0lkEigKEGxhdGVzdF9p'
    'bWFnZV91cmwYByABKAlSDmxhdGVzdEltYWdlVXJsEhkKCHNvbGRfb3V0GAggASgIUgdzb2xkT3'
    'V0');

@$core.Deprecated('Use listTopRatedDishesReplyDescriptor instead')
const ListTopRatedDishesReply$json = {
  '1': 'ListTopRatedDishesReply',
  '2': [
    {
      '1': 'dishes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.api.TopRatedDish',
      '10': 'dishes'
    },
  ],
};

/// Descriptor for `ListTopRatedDishesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTopRatedDishesReplyDescriptor =
    $convert.base64Decode(
        'ChdMaXN0VG9wUmF0ZWREaXNoZXNSZXBseRIpCgZkaXNoZXMYASADKAsyES5hcGkuVG9wUmF0ZW'
        'REaXNoUgZkaXNoZXM=');

@$core.Deprecated('Use reportDishSoldOutRequestDescriptor instead')
const ReportDishSoldOutRequest$json = {
  '1': 'ReportDishSoldOutRequest',
  '2': [
    {'1': 'canteen_id', '3': 1, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'dish', '3': 2, '4': 1, '5': 9, '10': 'dish'},
  ],
};

/// Descriptor for `ReportDishSoldOutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportDishSoldOutRequestDescriptor =
    $convert.base64Decode(
        'ChhSZXBvcnREaXNoU29sZE91dFJlcXVlc3QSHQoKY2FudGVlbl9pZBgBIAEoCVIJY2FudGVlbk'
        'lkEhIKBGRpc2gYAiABKAlSBGRpc2g=');

@$core.Deprecated('Use reportDishSoldOutReplyDescriptor instead')
const ReportDishSoldOutReply$json = {
  '1': 'ReportDishSoldOutReply',
  '2': [
    {'1': 'report_count', '3': 1, '4': 1, '5': 5, '10': 'reportCount'},
    {'1': 'confirmed', '3': 2, '4': 1, '5': 8, '10': 'confirmed'},
    {'1': 'already_reported', '3': 3, '4': 1, '5': 8, '10': 'alreadyReported'},
  ],
};

/// Descriptor for `ReportDishSoldOutReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportDishSoldOutReplyDescriptor = $convert.base64Decode(
    'ChZSZXBvcnREaXNoU29sZE91dFJlcGx5EiEKDHJlcG9ydF9jb3VudBgBIAEoBVILcmVwb3J0Q2'
    '91bnQSHAoJY29uZmlybWVkGAIgASgIUgljb25maXJtZWQSKQoQYWxyZWFkeV9yZXBvcnRlZBgD'
    'IAEoCFIPYWxyZWFkeVJlcG9ydGVk');

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
final $typed_data.Uint8List getUpdateNoteRequestDescriptor =
    $convert.base64Decode(
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
    {
      '1': 'oldest_date_at',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'oldestDateAt'
    },
    {
      '1': 'cinema',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.api.Cinema',
      '10': 'cinema'
    },
  ],
};

/// Descriptor for `ListMoviesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listMoviesRequestDescriptor = $convert.base64Decode(
    'ChFMaXN0TW92aWVzUmVxdWVzdBIXCgdsYXN0X2lkGAEgASgFUgZsYXN0SWQSQAoOb2xkZXN0X2'
    'RhdGVfYXQYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgxvbGRlc3REYXRlQXQS'
    'IwoGY2luZW1hGAMgASgOMgsuYXBpLkNpbmVtYVIGY2luZW1h');

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
    {
      '1': 'date',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'date'
    },
    {
      '1': 'created',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'created'
    },
    {'1': 'title', '3': 6, '4': 1, '5': 9, '10': 'title'},
    {'1': 'location', '3': 18, '4': 1, '5': 9, '10': 'location'},
    {
      '1': 'cinema',
      '3': 19,
      '4': 1,
      '5': 14,
      '6': '.api.Cinema',
      '10': 'cinema'
    },
    {'1': 'release_year', '3': 7, '4': 1, '5': 9, '10': 'releaseYear'},
    {'1': 'runtime', '3': 8, '4': 1, '5': 9, '10': 'runtime'},
    {'1': 'genre', '3': 9, '4': 1, '5': 9, '10': 'genre'},
    {'1': 'director', '3': 10, '4': 1, '5': 9, '10': 'director'},
    {'1': 'actors', '3': 11, '4': 1, '5': 9, '10': 'actors'},
    {'1': 'imdb_rating', '3': 12, '4': 1, '5': 9, '10': 'imdbRating'},
    {'1': 'description', '3': 13, '4': 1, '5': 9, '10': 'description'},
    {'1': 'trailer_url', '3': 15, '4': 1, '5': 9, '10': 'trailerUrl'},
    {
      '1': 'additional_information_url',
      '3': 16,
      '4': 1,
      '5': 9,
      '10': 'additionalInformationUrl'
    },
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
    'Rpb24YEiABKAlSCGxvY2F0aW9uEiMKBmNpbmVtYRgTIAEoDjILLmFwaS5DaW5lbWFSBmNpbmVt'
    'YRIhCgxyZWxlYXNlX3llYXIYByABKAlSC3JlbGVhc2VZZWFyEhgKB3J1bnRpbWUYCCABKAlSB3'
    'J1bnRpbWUSFAoFZ2VucmUYCSABKAlSBWdlbnJlEhoKCGRpcmVjdG9yGAogASgJUghkaXJlY3Rv'
    'chIWCgZhY3RvcnMYCyABKAlSBmFjdG9ycxIfCgtpbWRiX3JhdGluZxgMIAEoCVIKaW1kYlJhdG'
    'luZxIgCgtkZXNjcmlwdGlvbhgNIAEoCVILZGVzY3JpcHRpb24SHwoLdHJhaWxlcl91cmwYDyAB'
    'KAlSCnRyYWlsZXJVcmwSPAoaYWRkaXRpb25hbF9pbmZvcm1hdGlvbl91cmwYECABKAlSGGFkZG'
    'l0aW9uYWxJbmZvcm1hdGlvblVybBIZCghjb3Zlcl9pZBgOIAEoA1IHY292ZXJJZBIbCgljb3Zl'
    'cl91cmwYESABKAlSCGNvdmVyVXJsSgQIARACSgQIAhAD');

@$core.Deprecated('Use createFeedbackRequestDescriptor instead')
const CreateFeedbackRequest$json = {
  '1': 'CreateFeedbackRequest',
  '2': [
    {
      '1': 'recipient',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.api.CreateFeedbackRequest.Recipient',
      '10': 'recipient'
    },
    {'1': 'from_email', '3': 2, '4': 1, '5': 9, '10': 'fromEmail'},
    {'1': 'from_name', '3': 8, '4': 1, '5': 9, '10': 'fromName'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    {
      '1': 'location',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.api.Coordinate',
      '10': 'location'
    },
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
final $typed_data.Uint8List createFeedbackReplyDescriptor =
    $convert.base64Decode('ChNDcmVhdGVGZWVkYmFja1JlcGx5');

@$core.Deprecated('Use createFeedbackImageReplyDescriptor instead')
const CreateFeedbackImageReply$json = {
  '1': 'CreateFeedbackImageReply',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `CreateFeedbackImageReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFeedbackImageReplyDescriptor =
    $convert.base64Decode(
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
final $typed_data.Uint8List createFeedbackImageRequestDescriptor =
    $convert.base64Decode(
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
final $typed_data.Uint8List getMemberRequestDescriptor = $convert
    .base64Decode('ChBHZXRNZW1iZXJSZXF1ZXN0EhUKBmxyel9pZBgBIAEoCVIFbHJ6SWQ=');

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

@$core.Deprecated('Use getCanteenHeadCountRequestDescriptor instead')
const GetCanteenHeadCountRequest$json = {
  '1': 'GetCanteenHeadCountRequest',
  '2': [
    {'1': 'canteen_id', '3': 1, '4': 1, '5': 9, '10': 'canteenId'},
  ],
};

/// Descriptor for `GetCanteenHeadCountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCanteenHeadCountRequestDescriptor =
    $convert.base64Decode(
        'ChpHZXRDYW50ZWVuSGVhZENvdW50UmVxdWVzdBIdCgpjYW50ZWVuX2lkGAEgASgJUgljYW50ZW'
        'VuSWQ=');

@$core.Deprecated('Use getCanteenHeadCountReplyDescriptor instead')
const GetCanteenHeadCountReply$json = {
  '1': 'GetCanteenHeadCountReply',
  '2': [
    {'1': 'count', '3': 1, '4': 1, '5': 13, '10': 'count'},
    {'1': 'max_count', '3': 2, '4': 1, '5': 13, '10': 'maxCount'},
    {'1': 'percent', '3': 3, '4': 1, '5': 2, '10': 'percent'},
    {
      '1': 'timestamp',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
  ],
};

/// Descriptor for `GetCanteenHeadCountReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCanteenHeadCountReplyDescriptor = $convert.base64Decode(
    'ChhHZXRDYW50ZWVuSGVhZENvdW50UmVwbHkSFAoFY291bnQYASABKA1SBWNvdW50EhsKCW1heF'
    '9jb3VudBgCIAEoDVIIbWF4Q291bnQSGAoHcGVyY2VudBgDIAEoAlIHcGVyY2VudBI4Cgl0aW1l'
    'c3RhbXAYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl0aW1lc3RhbXA=');

@$core.Deprecated('Use getCanteenBusynessRequestDescriptor instead')
const GetCanteenBusynessRequest$json = {
  '1': 'GetCanteenBusynessRequest',
  '2': [
    {'1': 'canteen_id', '3': 1, '4': 1, '5': 9, '10': 'canteenId'},
    {
      '1': 'weekday',
      '3': 2,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'weekday',
      '17': true
    },
  ],
  '8': [
    {'1': '_weekday'},
  ],
};

/// Descriptor for `GetCanteenBusynessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCanteenBusynessRequestDescriptor =
    $convert.base64Decode(
        'ChlHZXRDYW50ZWVuQnVzeW5lc3NSZXF1ZXN0Eh0KCmNhbnRlZW5faWQYASABKAlSCWNhbnRlZW'
        '5JZBIdCgd3ZWVrZGF5GAIgASgFSABSB3dlZWtkYXmIAQFCCgoIX3dlZWtkYXk=');

@$core.Deprecated('Use busynessSlotDescriptor instead')
const BusynessSlot$json = {
  '1': 'BusynessSlot',
  '2': [
    {'1': 'hour', '3': 1, '4': 1, '5': 5, '10': 'hour'},
    {'1': 'minute', '3': 2, '4': 1, '5': 5, '10': 'minute'},
    {'1': 'typical_percent', '3': 3, '4': 1, '5': 1, '10': 'typicalPercent'},
    {'1': 'typical_count', '3': 4, '4': 1, '5': 1, '10': 'typicalCount'},
    {'1': 'sample_days', '3': 5, '4': 1, '5': 5, '10': 'sampleDays'},
  ],
};

/// Descriptor for `BusynessSlot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List busynessSlotDescriptor = $convert.base64Decode(
    'CgxCdXN5bmVzc1Nsb3QSEgoEaG91chgBIAEoBVIEaG91chIWCgZtaW51dGUYAiABKAVSBm1pbn'
    'V0ZRInCg90eXBpY2FsX3BlcmNlbnQYAyABKAFSDnR5cGljYWxQZXJjZW50EiMKDXR5cGljYWxf'
    'Y291bnQYBCABKAFSDHR5cGljYWxDb3VudBIfCgtzYW1wbGVfZGF5cxgFIAEoBVIKc2FtcGxlRG'
    'F5cw==');

@$core.Deprecated('Use getCanteenBusynessReplyDescriptor instead')
const GetCanteenBusynessReply$json = {
  '1': 'GetCanteenBusynessReply',
  '2': [
    {
      '1': 'current',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.api.GetCanteenHeadCountReply',
      '10': 'current'
    },
    {'1': 'weekday', '3': 2, '4': 1, '5': 5, '10': 'weekday'},
    {
      '1': 'typical_slots',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.api.BusynessSlot',
      '10': 'typicalSlots'
    },
    {
      '1': 'vs_typical_percent',
      '3': 4,
      '4': 1,
      '5': 1,
      '10': 'vsTypicalPercent'
    },
    {
      '1': 'has_typical_comparison',
      '3': 5,
      '4': 1,
      '5': 8,
      '10': 'hasTypicalComparison'
    },
    {
      '1': 'best_upcoming_slot',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.api.BusynessSlot',
      '10': 'bestUpcomingSlot'
    },
  ],
};

/// Descriptor for `GetCanteenBusynessReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCanteenBusynessReplyDescriptor = $convert.base64Decode(
    'ChdHZXRDYW50ZWVuQnVzeW5lc3NSZXBseRI3CgdjdXJyZW50GAEgASgLMh0uYXBpLkdldENhbn'
    'RlZW5IZWFkQ291bnRSZXBseVIHY3VycmVudBIYCgd3ZWVrZGF5GAIgASgFUgd3ZWVrZGF5EjYK'
    'DXR5cGljYWxfc2xvdHMYAyADKAsyES5hcGkuQnVzeW5lc3NTbG90Ugx0eXBpY2FsU2xvdHMSLA'
    'oSdnNfdHlwaWNhbF9wZXJjZW50GAQgASgBUhB2c1R5cGljYWxQZXJjZW50EjQKFmhhc190eXBp'
    'Y2FsX2NvbXBhcmlzb24YBSABKAhSFGhhc1R5cGljYWxDb21wYXJpc29uEj8KEmJlc3RfdXBjb2'
    '1pbmdfc2xvdBgGIAEoCzIRLmFwaS5CdXN5bmVzc1Nsb3RSEGJlc3RVcGNvbWluZ1Nsb3Q=');

@$core.Deprecated('Use listStudentClubRequestDescriptor instead')
const ListStudentClubRequest$json = {
  '1': 'ListStudentClubRequest',
  '2': [
    {
      '1': 'language',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.api.Language',
      '9': 0,
      '10': 'language',
      '17': true
    },
  ],
  '8': [
    {'1': '_language'},
  ],
};

/// Descriptor for `ListStudentClubRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listStudentClubRequestDescriptor =
    $convert.base64Decode(
        'ChZMaXN0U3R1ZGVudENsdWJSZXF1ZXN0Ei4KCGxhbmd1YWdlGAEgASgOMg0uYXBpLkxhbmd1YW'
        'dlSABSCGxhbmd1YWdliAEBQgsKCV9sYW5ndWFnZQ==');

@$core.Deprecated('Use listStudentClubReplyDescriptor instead')
const ListStudentClubReply$json = {
  '1': 'ListStudentClubReply',
  '2': [
    {
      '1': 'collections',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.api.StudentClubCollection',
      '10': 'collections'
    },
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
    {
      '1': 'description',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'description',
      '17': true
    },
    {
      '1': 'link_url',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'linkUrl',
      '17': true
    },
    {
      '1': 'cover_url',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'coverUrl',
      '17': true
    },
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
    {
      '1': 'clubs',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.api.StudentClub',
      '10': 'clubs'
    },
    {
      '1': 'unstable_collection_id',
      '3': 4,
      '4': 1,
      '5': 4,
      '10': 'unstableCollectionId'
    },
  ],
};

/// Descriptor for `StudentClubCollection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List studentClubCollectionDescriptor = $convert.base64Decode(
    'ChVTdHVkZW50Q2x1YkNvbGxlY3Rpb24SFAoFdGl0bGUYASABKAlSBXRpdGxlEiAKC2Rlc2NyaX'
    'B0aW9uGAIgASgJUgtkZXNjcmlwdGlvbhImCgVjbHVicxgDIAMoCzIQLmFwaS5TdHVkZW50Q2x1'
    'YlIFY2x1YnMSNAoWdW5zdGFibGVfY29sbGVjdGlvbl9pZBgEIAEoBFIUdW5zdGFibGVDb2xsZW'
    'N0aW9uSWQ=');

@$core.Deprecated('Use listStudentGroupRequestDescriptor instead')
const ListStudentGroupRequest$json = {
  '1': 'ListStudentGroupRequest',
  '2': [
    {
      '1': 'language',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.api.Language',
      '9': 0,
      '10': 'language',
      '17': true
    },
  ],
  '8': [
    {'1': '_language'},
  ],
};

/// Descriptor for `ListStudentGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listStudentGroupRequestDescriptor =
    $convert.base64Decode(
        'ChdMaXN0U3R1ZGVudEdyb3VwUmVxdWVzdBIuCghsYW5ndWFnZRgBIAEoDjINLmFwaS5MYW5ndW'
        'FnZUgAUghsYW5ndWFnZYgBAUILCglfbGFuZ3VhZ2U=');

@$core.Deprecated('Use listStudentGroupReplyDescriptor instead')
const ListStudentGroupReply$json = {
  '1': 'ListStudentGroupReply',
  '2': [
    {
      '1': 'student_clubs',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.api.StudentClubCollection',
      '10': 'studentClubs'
    },
    {
      '1': 'student_councils',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.api.StudentCouncilCollection',
      '10': 'studentCouncils'
    },
  ],
};

/// Descriptor for `ListStudentGroupReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listStudentGroupReplyDescriptor = $convert.base64Decode(
    'ChVMaXN0U3R1ZGVudEdyb3VwUmVwbHkSPwoNc3R1ZGVudF9jbHVicxgBIAMoCzIaLmFwaS5TdH'
    'VkZW50Q2x1YkNvbGxlY3Rpb25SDHN0dWRlbnRDbHVicxJIChBzdHVkZW50X2NvdW5jaWxzGAIg'
    'AygLMh0uYXBpLlN0dWRlbnRDb3VuY2lsQ29sbGVjdGlvblIPc3R1ZGVudENvdW5jaWxz');

@$core.Deprecated('Use studentCouncilDescriptor instead')
const StudentCouncil$json = {
  '1': 'StudentCouncil',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'description',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'description',
      '17': true
    },
    {
      '1': 'link_url',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'linkUrl',
      '17': true
    },
    {
      '1': 'cover_url',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'coverUrl',
      '17': true
    },
  ],
  '8': [
    {'1': '_description'},
    {'1': '_link_url'},
    {'1': '_cover_url'},
  ],
};

/// Descriptor for `StudentCouncil`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List studentCouncilDescriptor = $convert.base64Decode(
    'Cg5TdHVkZW50Q291bmNpbBISCgRuYW1lGAEgASgJUgRuYW1lEiUKC2Rlc2NyaXB0aW9uGAIgAS'
    'gJSABSC2Rlc2NyaXB0aW9uiAEBEh4KCGxpbmtfdXJsGAMgASgJSAFSB2xpbmtVcmyIAQESIAoJ'
    'Y292ZXJfdXJsGAQgASgJSAJSCGNvdmVyVXJsiAEBQg4KDF9kZXNjcmlwdGlvbkILCglfbGlua1'
    '91cmxCDAoKX2NvdmVyX3VybA==');

@$core.Deprecated('Use studentCouncilCollectionDescriptor instead')
const StudentCouncilCollection$json = {
  '1': 'StudentCouncilCollection',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {
      '1': 'councils',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.api.StudentCouncil',
      '10': 'councils'
    },
    {
      '1': 'unstable_collection_id',
      '3': 4,
      '4': 1,
      '5': 4,
      '10': 'unstableCollectionId'
    },
  ],
};

/// Descriptor for `StudentCouncilCollection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List studentCouncilCollectionDescriptor = $convert.base64Decode(
    'ChhTdHVkZW50Q291bmNpbENvbGxlY3Rpb24SFAoFdGl0bGUYASABKAlSBXRpdGxlEiAKC2Rlc2'
    'NyaXB0aW9uGAIgASgJUgtkZXNjcmlwdGlvbhIvCghjb3VuY2lscxgDIAMoCzITLmFwaS5TdHVk'
    'ZW50Q291bmNpbFIIY291bmNpbHMSNAoWdW5zdGFibGVfY29sbGVjdGlvbl9pZBgEIAEoBFIUdW'
    '5zdGFibGVDb2xsZWN0aW9uSWQ=');

@$core.Deprecated('Use listLibrariesRequestDescriptor instead')
const ListLibrariesRequest$json = {
  '1': 'ListLibrariesRequest',
  '2': [
    {'1': 'campus', '3': 1, '4': 1, '5': 9, '10': 'campus'},
  ],
};

/// Descriptor for `ListLibrariesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listLibrariesRequestDescriptor =
    $convert.base64Decode(
        'ChRMaXN0TGlicmFyaWVzUmVxdWVzdBIWCgZjYW1wdXMYASABKAlSBmNhbXB1cw==');

@$core.Deprecated('Use libraryOccupancyDescriptor instead')
const LibraryOccupancy$json = {
  '1': 'LibraryOccupancy',
  '2': [
    {'1': 'library_id', '3': 1, '4': 1, '5': 9, '10': 'libraryId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'campus', '3': 3, '4': 1, '5': 9, '10': 'campus'},
    {'1': 'count', '3': 4, '4': 1, '5': 13, '10': 'count'},
    {'1': 'max_count', '3': 5, '4': 1, '5': 13, '10': 'maxCount'},
    {'1': 'percent', '3': 6, '4': 1, '5': 2, '10': 'percent'},
    {
      '1': 'timestamp',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
  ],
};

/// Descriptor for `LibraryOccupancy`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List libraryOccupancyDescriptor = $convert.base64Decode(
    'ChBMaWJyYXJ5T2NjdXBhbmN5Eh0KCmxpYnJhcnlfaWQYASABKAlSCWxpYnJhcnlJZBISCgRuYW'
    '1lGAIgASgJUgRuYW1lEhYKBmNhbXB1cxgDIAEoCVIGY2FtcHVzEhQKBWNvdW50GAQgASgNUgVj'
    'b3VudBIbCgltYXhfY291bnQYBSABKA1SCG1heENvdW50EhgKB3BlcmNlbnQYBiABKAJSB3Blcm'
    'NlbnQSOAoJdGltZXN0YW1wGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdGlt'
    'ZXN0YW1w');

@$core.Deprecated('Use listLibrariesReplyDescriptor instead')
const ListLibrariesReply$json = {
  '1': 'ListLibrariesReply',
  '2': [
    {
      '1': 'libraries',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.api.LibraryOccupancy',
      '10': 'libraries'
    },
  ],
};

/// Descriptor for `ListLibrariesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listLibrariesReplyDescriptor = $convert.base64Decode(
    'ChJMaXN0TGlicmFyaWVzUmVwbHkSMwoJbGlicmFyaWVzGAEgAygLMhUuYXBpLkxpYnJhcnlPY2'
    'N1cGFuY3lSCWxpYnJhcmllcw==');

@$core.Deprecated('Use getLibraryBusynessRequestDescriptor instead')
const GetLibraryBusynessRequest$json = {
  '1': 'GetLibraryBusynessRequest',
  '2': [
    {'1': 'library_id', '3': 1, '4': 1, '5': 9, '10': 'libraryId'},
    {
      '1': 'weekday',
      '3': 2,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'weekday',
      '17': true
    },
  ],
  '8': [
    {'1': '_weekday'},
  ],
};

/// Descriptor for `GetLibraryBusynessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLibraryBusynessRequestDescriptor =
    $convert.base64Decode(
        'ChlHZXRMaWJyYXJ5QnVzeW5lc3NSZXF1ZXN0Eh0KCmxpYnJhcnlfaWQYASABKAlSCWxpYnJhcn'
        'lJZBIdCgd3ZWVrZGF5GAIgASgFSABSB3dlZWtkYXmIAQFCCgoIX3dlZWtkYXk=');

@$core.Deprecated('Use getLibraryBusynessReplyDescriptor instead')
const GetLibraryBusynessReply$json = {
  '1': 'GetLibraryBusynessReply',
  '2': [
    {
      '1': 'current',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.api.LibraryOccupancy',
      '10': 'current'
    },
    {'1': 'weekday', '3': 2, '4': 1, '5': 5, '10': 'weekday'},
    {
      '1': 'typical_slots',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.api.BusynessSlot',
      '10': 'typicalSlots'
    },
    {
      '1': 'vs_typical_percent',
      '3': 4,
      '4': 1,
      '5': 1,
      '10': 'vsTypicalPercent'
    },
    {
      '1': 'has_typical_comparison',
      '3': 5,
      '4': 1,
      '5': 8,
      '10': 'hasTypicalComparison'
    },
    {
      '1': 'best_upcoming_slot',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.api.BusynessSlot',
      '10': 'bestUpcomingSlot'
    },
  ],
};

/// Descriptor for `GetLibraryBusynessReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLibraryBusynessReplyDescriptor = $convert.base64Decode(
    'ChdHZXRMaWJyYXJ5QnVzeW5lc3NSZXBseRIvCgdjdXJyZW50GAEgASgLMhUuYXBpLkxpYnJhcn'
    'lPY2N1cGFuY3lSB2N1cnJlbnQSGAoHd2Vla2RheRgCIAEoBVIHd2Vla2RheRI2Cg10eXBpY2Fs'
    'X3Nsb3RzGAMgAygLMhEuYXBpLkJ1c3luZXNzU2xvdFIMdHlwaWNhbFNsb3RzEiwKEnZzX3R5cG'
    'ljYWxfcGVyY2VudBgEIAEoAVIQdnNUeXBpY2FsUGVyY2VudBI0ChZoYXNfdHlwaWNhbF9jb21w'
    'YXJpc29uGAUgASgIUhRoYXNUeXBpY2FsQ29tcGFyaXNvbhI/ChJiZXN0X3VwY29taW5nX3Nsb3'
    'QYBiABKAsyES5hcGkuQnVzeW5lc3NTbG90UhBiZXN0VXBjb21pbmdTbG90');
