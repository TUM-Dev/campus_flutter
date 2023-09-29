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

@$core.Deprecated('Use registerDeviceRequestDescriptor instead')
const RegisterDeviceRequest$json = {
  '1': 'RegisterDeviceRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'public_key', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'publicKey', '17': true},
    {'1': 'device_type', '3': 3, '4': 1, '5': 14, '6': '.api.DeviceType', '10': 'deviceType'},
  ],
  '8': [
    {'1': '_public_key'},
  ],
};

/// Descriptor for `RegisterDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerDeviceRequestDescriptor = $convert.base64Decode(
    'ChVSZWdpc3RlckRldmljZVJlcXVlc3QSGwoJZGV2aWNlX2lkGAEgASgJUghkZXZpY2VJZBIiCg'
    'pwdWJsaWNfa2V5GAIgASgJSABSCXB1YmxpY0tleYgBARIwCgtkZXZpY2VfdHlwZRgDIAEoDjIP'
    'LmFwaS5EZXZpY2VUeXBlUgpkZXZpY2VUeXBlQg0KC19wdWJsaWNfa2V5');

@$core.Deprecated('Use registerDeviceReplyDescriptor instead')
const RegisterDeviceReply$json = {
  '1': 'RegisterDeviceReply',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `RegisterDeviceReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerDeviceReplyDescriptor = $convert.base64Decode(
    'ChNSZWdpc3RlckRldmljZVJlcGx5EhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aWNlSWQ=');

@$core.Deprecated('Use removeDeviceRequestDescriptor instead')
const RemoveDeviceRequest$json = {
  '1': 'RemoveDeviceRequest',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'device_type', '3': 2, '4': 1, '5': 14, '6': '.api.DeviceType', '10': 'deviceType'},
  ],
};

/// Descriptor for `RemoveDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeDeviceRequestDescriptor = $convert.base64Decode(
    'ChNSZW1vdmVEZXZpY2VSZXF1ZXN0EhsKCWRldmljZV9pZBgBIAEoCVIIZGV2aWNlSWQSMAoLZG'
    'V2aWNlX3R5cGUYAiABKA4yDy5hcGkuRGV2aWNlVHlwZVIKZGV2aWNlVHlwZQ==');

@$core.Deprecated('Use removeDeviceReplyDescriptor instead')
const RemoveDeviceReply$json = {
  '1': 'RemoveDeviceReply',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `RemoveDeviceReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeDeviceReplyDescriptor = $convert.base64Decode(
    'ChFSZW1vdmVEZXZpY2VSZXBseRIbCglkZXZpY2VfaWQYASABKAlSCGRldmljZUlk');

@$core.Deprecated('Use iOSDeviceRequestResponseRequestDescriptor instead')
const IOSDeviceRequestResponseRequest$json = {
  '1': 'IOSDeviceRequestResponseRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    {'1': 'payload', '3': 2, '4': 1, '5': 9, '10': 'payload'},
  ],
};

/// Descriptor for `IOSDeviceRequestResponseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iOSDeviceRequestResponseRequestDescriptor = $convert.base64Decode(
    'Ch9JT1NEZXZpY2VSZXF1ZXN0UmVzcG9uc2VSZXF1ZXN0Eh0KCnJlcXVlc3RfaWQYASABKAlSCX'
    'JlcXVlc3RJZBIYCgdwYXlsb2FkGAIgASgJUgdwYXlsb2Fk');

@$core.Deprecated('Use iOSDeviceRequestResponseReplyDescriptor instead')
const IOSDeviceRequestResponseReply$json = {
  '1': 'IOSDeviceRequestResponseReply',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `IOSDeviceRequestResponseReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iOSDeviceRequestResponseReplyDescriptor = $convert.base64Decode(
    'Ch1JT1NEZXZpY2VSZXF1ZXN0UmVzcG9uc2VSZXBseRIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYW'
    'dl');

@$core.Deprecated('Use searchRoomsRequestDescriptor instead')
const SearchRoomsRequest$json = {
  '1': 'SearchRoomsRequest',
  '2': [
    {'1': 'query', '3': 1, '4': 1, '5': 9, '10': 'query'},
  ],
};

/// Descriptor for `SearchRoomsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchRoomsRequestDescriptor = $convert.base64Decode(
    'ChJTZWFyY2hSb29tc1JlcXVlc3QSFAoFcXVlcnkYASABKAlSBXF1ZXJ5');

@$core.Deprecated('Use searchRoomsReplyDescriptor instead')
const SearchRoomsReply$json = {
  '1': 'SearchRoomsReply',
  '2': [
    {'1': 'rooms', '3': 1, '4': 3, '5': 11, '6': '.api.Room', '10': 'rooms'},
  ],
};

/// Descriptor for `SearchRoomsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchRoomsReplyDescriptor = $convert.base64Decode(
    'ChBTZWFyY2hSb29tc1JlcGx5Eh8KBXJvb21zGAEgAygLMgkuYXBpLlJvb21SBXJvb21z');

@$core.Deprecated('Use roomDescriptor instead')
const Room$json = {
  '1': 'Room',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
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

/// Descriptor for `Room`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomDescriptor = $convert.base64Decode(
    'CgRSb29tEhcKB3Jvb21faWQYASABKANSBnJvb21JZBIbCglyb29tX2NvZGUYAiABKAlSCHJvb2'
    '1Db2RlEh8KC2J1aWxkaW5nX25yGAMgASgJUgpidWlsZGluZ05yEhcKB2FyY2hfaWQYBCABKAlS'
    'BmFyY2hJZBISCgRpbmZvGAUgASgJUgRpbmZvEhgKB2FkZHJlc3MYBiABKAlSB2FkZHJlc3MSGA'
    'oHcHVycG9zZRgHIAEoCVIHcHVycG9zZRIWCgZjYW1wdXMYCCABKAlSBmNhbXB1cxISCgRuYW1l'
    'GAkgASgJUgRuYW1l');

@$core.Deprecated('Use newsDescriptor instead')
const News$json = {
  '1': 'News',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'text', '3': 3, '4': 1, '5': 9, '10': 'text'},
    {'1': 'link', '3': 4, '4': 1, '5': 9, '10': 'link'},
    {'1': 'image_url', '3': 5, '4': 1, '5': 9, '10': 'imageUrl'},
    {'1': 'source', '3': 6, '4': 1, '5': 9, '10': 'source'},
    {'1': 'created', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'created'},
    {'1': 'date', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'date'},
  ],
};

/// Descriptor for `News`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newsDescriptor = $convert.base64Decode(
    'CgROZXdzEg4KAmlkGAEgASgDUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSEgoEdGV4dBgDIA'
    'EoCVIEdGV4dBISCgRsaW5rGAQgASgJUgRsaW5rEhsKCWltYWdlX3VybBgFIAEoCVIIaW1hZ2VV'
    'cmwSFgoGc291cmNlGAYgASgJUgZzb3VyY2USNAoHY3JlYXRlZBgHIAEoCzIaLmdvb2dsZS5wcm'
    '90b2J1Zi5UaW1lc3RhbXBSB2NyZWF0ZWQSLgoEZGF0ZRgIIAEoCzIaLmdvb2dsZS5wcm90b2J1'
    'Zi5UaW1lc3RhbXBSBGRhdGU=');

@$core.Deprecated('Use getNewsReplyDescriptor instead')
const GetNewsReply$json = {
  '1': 'GetNewsReply',
  '2': [
    {'1': 'news', '3': 1, '4': 3, '5': 11, '6': '.api.News', '10': 'news'},
  ],
};

/// Descriptor for `GetNewsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNewsReplyDescriptor = $convert.base64Decode(
    'CgxHZXROZXdzUmVwbHkSHQoEbmV3cxgBIAMoCzIJLmFwaS5OZXdzUgRuZXdz');

@$core.Deprecated('Use getNewsRequestDescriptor instead')
const GetNewsRequest$json = {
  '1': 'GetNewsRequest',
  '2': [
    {'1': 'last_news_id', '3': 1, '4': 1, '5': 5, '10': 'lastNewsId'},
    {'1': 'news_source', '3': 2, '4': 1, '5': 5, '10': 'newsSource'},
  ],
};

/// Descriptor for `GetNewsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNewsRequestDescriptor = $convert.base64Decode(
    'Cg5HZXROZXdzUmVxdWVzdBIgCgxsYXN0X25ld3NfaWQYASABKAVSCmxhc3ROZXdzSWQSHwoLbm'
    'V3c19zb3VyY2UYAiABKAVSCm5ld3NTb3VyY2U=');

@$core.Deprecated('Use getNewsSourcesRequestDescriptor instead')
const GetNewsSourcesRequest$json = {
  '1': 'GetNewsSourcesRequest',
};

/// Descriptor for `GetNewsSourcesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNewsSourcesRequestDescriptor = $convert.base64Decode(
    'ChVHZXROZXdzU291cmNlc1JlcXVlc3Q=');

@$core.Deprecated('Use getNewsSourcesReplyDescriptor instead')
const GetNewsSourcesReply$json = {
  '1': 'GetNewsSourcesReply',
  '2': [
    {'1': 'sources', '3': 1, '4': 3, '5': 11, '6': '.api.NewsSource', '10': 'sources'},
  ],
};

/// Descriptor for `GetNewsSourcesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNewsSourcesReplyDescriptor = $convert.base64Decode(
    'ChNHZXROZXdzU291cmNlc1JlcGx5EikKB3NvdXJjZXMYASADKAsyDy5hcGkuTmV3c1NvdXJjZV'
    'IHc291cmNlcw==');

@$core.Deprecated('Use newsSourceDescriptor instead')
const NewsSource$json = {
  '1': 'NewsSource',
  '2': [
    {'1': 'source', '3': 1, '4': 1, '5': 9, '10': 'source'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'icon', '3': 3, '4': 1, '5': 9, '10': 'icon'},
  ],
};

/// Descriptor for `NewsSource`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newsSourceDescriptor = $convert.base64Decode(
    'CgpOZXdzU291cmNlEhYKBnNvdXJjZRgBIAEoCVIGc291cmNlEhQKBXRpdGxlGAIgASgJUgV0aX'
    'RsZRISCgRpY29uGAMgASgJUgRpY29u');

@$core.Deprecated('Use getTopNewsRequestDescriptor instead')
const GetTopNewsRequest$json = {
  '1': 'GetTopNewsRequest',
};

/// Descriptor for `GetTopNewsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTopNewsRequestDescriptor = $convert.base64Decode(
    'ChFHZXRUb3BOZXdzUmVxdWVzdA==');

@$core.Deprecated('Use getTopNewsReplyDescriptor instead')
const GetTopNewsReply$json = {
  '1': 'GetTopNewsReply',
  '2': [
    {'1': 'image_url', '3': 1, '4': 1, '5': 9, '10': 'imageUrl'},
    {'1': 'link', '3': 2, '4': 1, '5': 9, '10': 'link'},
    {'1': 'created', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'created'},
    {'1': 'from', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'from'},
    {'1': 'to', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'to'},
  ],
};

/// Descriptor for `GetTopNewsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTopNewsReplyDescriptor = $convert.base64Decode(
    'Cg9HZXRUb3BOZXdzUmVwbHkSGwoJaW1hZ2VfdXJsGAEgASgJUghpbWFnZVVybBISCgRsaW5rGA'
    'IgASgJUgRsaW5rEjQKB2NyZWF0ZWQYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1w'
    'UgdjcmVhdGVkEi4KBGZyb20YBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgRmcm'
    '9tEioKAnRvGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFICdG8=');

@$core.Deprecated('Use getCanteenRatingsRequestDescriptor instead')
const GetCanteenRatingsRequest$json = {
  '1': 'GetCanteenRatingsRequest',
  '2': [
    {'1': 'canteen_id', '3': 1, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'from', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'from'},
    {'1': 'to', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'to'},
    {'1': 'limit', '3': 4, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `GetCanteenRatingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCanteenRatingsRequestDescriptor = $convert.base64Decode(
    'ChhHZXRDYW50ZWVuUmF0aW5nc1JlcXVlc3QSHQoKY2FudGVlbl9pZBgBIAEoCVIJY2FudGVlbk'
    'lkEi4KBGZyb20YAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgRmcm9tEioKAnRv'
    'GAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFICdG8SFAoFbGltaXQYBCABKAVSBW'
    'xpbWl0');

@$core.Deprecated('Use getCanteenRatingsReplyDescriptor instead')
const GetCanteenRatingsReply$json = {
  '1': 'GetCanteenRatingsReply',
  '2': [
    {'1': 'rating', '3': 1, '4': 3, '5': 11, '6': '.api.SingleRatingReply', '10': 'rating'},
    {'1': 'avg', '3': 2, '4': 1, '5': 1, '10': 'avg'},
    {'1': 'std', '3': 3, '4': 1, '5': 1, '10': 'std'},
    {'1': 'min', '3': 4, '4': 1, '5': 5, '10': 'min'},
    {'1': 'max', '3': 5, '4': 1, '5': 5, '10': 'max'},
    {'1': 'rating_tags', '3': 6, '4': 3, '5': 11, '6': '.api.RatingTagResult', '10': 'ratingTags'},
  ],
};

/// Descriptor for `GetCanteenRatingsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCanteenRatingsReplyDescriptor = $convert.base64Decode(
    'ChZHZXRDYW50ZWVuUmF0aW5nc1JlcGx5Ei4KBnJhdGluZxgBIAMoCzIWLmFwaS5TaW5nbGVSYX'
    'RpbmdSZXBseVIGcmF0aW5nEhAKA2F2ZxgCIAEoAVIDYXZnEhAKA3N0ZBgDIAEoAVIDc3RkEhAK'
    'A21pbhgEIAEoBVIDbWluEhAKA21heBgFIAEoBVIDbWF4EjUKC3JhdGluZ190YWdzGAYgAygLMh'
    'QuYXBpLlJhdGluZ1RhZ1Jlc3VsdFIKcmF0aW5nVGFncw==');

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

@$core.Deprecated('Use newCanteenRatingReplyDescriptor instead')
const NewCanteenRatingReply$json = {
  '1': 'NewCanteenRatingReply',
};

/// Descriptor for `NewCanteenRatingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newCanteenRatingReplyDescriptor = $convert.base64Decode(
    'ChVOZXdDYW50ZWVuUmF0aW5nUmVwbHk=');

@$core.Deprecated('Use newCanteenRatingRequestDescriptor instead')
const NewCanteenRatingRequest$json = {
  '1': 'NewCanteenRatingRequest',
  '2': [
    {'1': 'points', '3': 1, '4': 1, '5': 5, '10': 'points'},
    {'1': 'canteen_id', '3': 2, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'image', '3': 3, '4': 1, '5': 12, '10': 'image'},
    {'1': 'rating_tags', '3': 4, '4': 3, '5': 11, '6': '.api.RatingTag', '10': 'ratingTags'},
    {'1': 'comment', '3': 6, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `NewCanteenRatingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newCanteenRatingRequestDescriptor = $convert.base64Decode(
    'ChdOZXdDYW50ZWVuUmF0aW5nUmVxdWVzdBIWCgZwb2ludHMYASABKAVSBnBvaW50cxIdCgpjYW'
    '50ZWVuX2lkGAIgASgJUgljYW50ZWVuSWQSFAoFaW1hZ2UYAyABKAxSBWltYWdlEi8KC3JhdGlu'
    'Z190YWdzGAQgAygLMg4uYXBpLlJhdGluZ1RhZ1IKcmF0aW5nVGFncxIYCgdjb21tZW50GAYgAS'
    'gJUgdjb21tZW50');

@$core.Deprecated('Use newDishRatingReplyDescriptor instead')
const NewDishRatingReply$json = {
  '1': 'NewDishRatingReply',
};

/// Descriptor for `NewDishRatingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newDishRatingReplyDescriptor = $convert.base64Decode(
    'ChJOZXdEaXNoUmF0aW5nUmVwbHk=');

@$core.Deprecated('Use newDishRatingRequestDescriptor instead')
const NewDishRatingRequest$json = {
  '1': 'NewDishRatingRequest',
  '2': [
    {'1': 'points', '3': 1, '4': 1, '5': 5, '10': 'points'},
    {'1': 'canteen_id', '3': 2, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'dish', '3': 3, '4': 1, '5': 9, '10': 'dish'},
    {'1': 'image', '3': 4, '4': 1, '5': 12, '10': 'image'},
    {'1': 'rating_tags', '3': 5, '4': 3, '5': 11, '6': '.api.RatingTag', '10': 'ratingTags'},
    {'1': 'comment', '3': 7, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `NewDishRatingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newDishRatingRequestDescriptor = $convert.base64Decode(
    'ChROZXdEaXNoUmF0aW5nUmVxdWVzdBIWCgZwb2ludHMYASABKAVSBnBvaW50cxIdCgpjYW50ZW'
    'VuX2lkGAIgASgJUgljYW50ZWVuSWQSEgoEZGlzaBgDIAEoCVIEZGlzaBIUCgVpbWFnZRgEIAEo'
    'DFIFaW1hZ2USLwoLcmF0aW5nX3RhZ3MYBSADKAsyDi5hcGkuUmF0aW5nVGFnUgpyYXRpbmdUYW'
    'dzEhgKB2NvbW1lbnQYByABKAlSB2NvbW1lbnQ=');

@$core.Deprecated('Use getAvailableDishTagsRequestDescriptor instead')
const GetAvailableDishTagsRequest$json = {
  '1': 'GetAvailableDishTagsRequest',
};

/// Descriptor for `GetAvailableDishTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAvailableDishTagsRequestDescriptor = $convert.base64Decode(
    'ChtHZXRBdmFpbGFibGVEaXNoVGFnc1JlcXVlc3Q=');

@$core.Deprecated('Use getAvailableDishTagsReplyDescriptor instead')
const GetAvailableDishTagsReply$json = {
  '1': 'GetAvailableDishTagsReply',
  '2': [
    {'1': 'rating_tags', '3': 1, '4': 3, '5': 11, '6': '.api.TagsOverview', '10': 'ratingTags'},
  ],
};

/// Descriptor for `GetAvailableDishTagsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAvailableDishTagsReplyDescriptor = $convert.base64Decode(
    'ChlHZXRBdmFpbGFibGVEaXNoVGFnc1JlcGx5EjIKC3JhdGluZ190YWdzGAEgAygLMhEuYXBpLl'
    'RhZ3NPdmVydmlld1IKcmF0aW5nVGFncw==');

@$core.Deprecated('Use getNameTagsRequestDescriptor instead')
const GetNameTagsRequest$json = {
  '1': 'GetNameTagsRequest',
};

/// Descriptor for `GetNameTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNameTagsRequestDescriptor = $convert.base64Decode(
    'ChJHZXROYW1lVGFnc1JlcXVlc3Q=');

@$core.Deprecated('Use getNameTagsReplyDescriptor instead')
const GetNameTagsReply$json = {
  '1': 'GetNameTagsReply',
  '2': [
    {'1': 'rating_tags', '3': 1, '4': 3, '5': 11, '6': '.api.TagsOverview', '10': 'ratingTags'},
  ],
};

/// Descriptor for `GetNameTagsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNameTagsReplyDescriptor = $convert.base64Decode(
    'ChBHZXROYW1lVGFnc1JlcGx5EjIKC3JhdGluZ190YWdzGAEgAygLMhEuYXBpLlRhZ3NPdmVydm'
    'lld1IKcmF0aW5nVGFncw==');

@$core.Deprecated('Use getAvailableCanteenTagsRequestDescriptor instead')
const GetAvailableCanteenTagsRequest$json = {
  '1': 'GetAvailableCanteenTagsRequest',
};

/// Descriptor for `GetAvailableCanteenTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAvailableCanteenTagsRequestDescriptor = $convert.base64Decode(
    'Ch5HZXRBdmFpbGFibGVDYW50ZWVuVGFnc1JlcXVlc3Q=');

@$core.Deprecated('Use getAvailableCanteenTagsReplyDescriptor instead')
const GetAvailableCanteenTagsReply$json = {
  '1': 'GetAvailableCanteenTagsReply',
  '2': [
    {'1': 'rating_tags', '3': 1, '4': 3, '5': 11, '6': '.api.TagsOverview', '10': 'ratingTags'},
  ],
};

/// Descriptor for `GetAvailableCanteenTagsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAvailableCanteenTagsReplyDescriptor = $convert.base64Decode(
    'ChxHZXRBdmFpbGFibGVDYW50ZWVuVGFnc1JlcGx5EjIKC3JhdGluZ190YWdzGAEgAygLMhEuYX'
    'BpLlRhZ3NPdmVydmlld1IKcmF0aW5nVGFncw==');

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

@$core.Deprecated('Use getCanteensRequestDescriptor instead')
const GetCanteensRequest$json = {
  '1': 'GetCanteensRequest',
};

/// Descriptor for `GetCanteensRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCanteensRequestDescriptor = $convert.base64Decode(
    'ChJHZXRDYW50ZWVuc1JlcXVlc3Q=');

@$core.Deprecated('Use getCanteensReplyDescriptor instead')
const GetCanteensReply$json = {
  '1': 'GetCanteensReply',
  '2': [
    {'1': 'canteen', '3': 1, '4': 3, '5': 11, '6': '.api.Canteen', '10': 'canteen'},
  ],
};

/// Descriptor for `GetCanteensReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCanteensReplyDescriptor = $convert.base64Decode(
    'ChBHZXRDYW50ZWVuc1JlcGx5EiYKB2NhbnRlZW4YASADKAsyDC5hcGkuQ2FudGVlblIHY2FudG'
    'Vlbg==');

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

@$core.Deprecated('Use getDishesRequestDescriptor instead')
const GetDishesRequest$json = {
  '1': 'GetDishesRequest',
  '2': [
    {'1': 'canteen_id', '3': 1, '4': 1, '5': 9, '10': 'canteenId'},
    {'1': 'year', '3': 2, '4': 1, '5': 5, '10': 'year'},
    {'1': 'week', '3': 3, '4': 1, '5': 5, '10': 'week'},
    {'1': 'day', '3': 4, '4': 1, '5': 5, '10': 'day'},
  ],
};

/// Descriptor for `GetDishesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDishesRequestDescriptor = $convert.base64Decode(
    'ChBHZXREaXNoZXNSZXF1ZXN0Eh0KCmNhbnRlZW5faWQYASABKAlSCWNhbnRlZW5JZBISCgR5ZW'
    'FyGAIgASgFUgR5ZWFyEhIKBHdlZWsYAyABKAVSBHdlZWsSEAoDZGF5GAQgASgFUgNkYXk=');

@$core.Deprecated('Use getDishesReplyDescriptor instead')
const GetDishesReply$json = {
  '1': 'GetDishesReply',
  '2': [
    {'1': 'dish', '3': 1, '4': 3, '5': 9, '10': 'dish'},
  ],
};

/// Descriptor for `GetDishesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDishesReplyDescriptor = $convert.base64Decode(
    'Cg5HZXREaXNoZXNSZXBseRISCgRkaXNoGAEgAygJUgRkaXNo');

@$core.Deprecated('Use getResponsiblePersonRequestDescriptor instead')
const GetResponsiblePersonRequest$json = {
  '1': 'GetResponsiblePersonRequest',
};

/// Descriptor for `GetResponsiblePersonRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResponsiblePersonRequestDescriptor = $convert.base64Decode(
    'ChtHZXRSZXNwb25zaWJsZVBlcnNvblJlcXVlc3Q=');

@$core.Deprecated('Use getResponsiblePersonReplyDescriptor instead')
const GetResponsiblePersonReply$json = {
  '1': 'GetResponsiblePersonReply',
  '2': [
    {'1': 'responsible_person', '3': 1, '4': 3, '5': 11, '6': '.api.ResponsiblePerson', '10': 'responsiblePerson'},
  ],
};

/// Descriptor for `GetResponsiblePersonReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResponsiblePersonReplyDescriptor = $convert.base64Decode(
    'ChlHZXRSZXNwb25zaWJsZVBlcnNvblJlcGx5EkUKEnJlc3BvbnNpYmxlX3BlcnNvbhgBIAMoCz'
    'IWLmFwaS5SZXNwb25zaWJsZVBlcnNvblIRcmVzcG9uc2libGVQZXJzb24=');

@$core.Deprecated('Use responsiblePersonDescriptor instead')
const ResponsiblePerson$json = {
  '1': 'ResponsiblePerson',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'telephone', '3': 2, '4': 1, '5': 9, '10': 'telephone'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'faculty', '3': 4, '4': 1, '5': 9, '10': 'faculty'},
    {'1': 'tum_id', '3': 5, '4': 1, '5': 9, '10': 'tumId'},
  ],
};

/// Descriptor for `ResponsiblePerson`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responsiblePersonDescriptor = $convert.base64Decode(
    'ChFSZXNwb25zaWJsZVBlcnNvbhISCgRuYW1lGAEgASgJUgRuYW1lEhwKCXRlbGVwaG9uZRgCIA'
    'EoCVIJdGVsZXBob25lEhQKBWVtYWlsGAMgASgJUgVlbWFpbBIYCgdmYWN1bHR5GAQgASgJUgdm'
    'YWN1bHR5EhUKBnR1bV9pZBgFIAEoCVIFdHVtSWQ=');

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

@$core.Deprecated('Use getMoreInformationRequestDescriptor instead')
const GetMoreInformationRequest$json = {
  '1': 'GetMoreInformationRequest',
};

/// Descriptor for `GetMoreInformationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMoreInformationRequestDescriptor = $convert.base64Decode(
    'ChlHZXRNb3JlSW5mb3JtYXRpb25SZXF1ZXN0');

@$core.Deprecated('Use getMoreInformationReplyDescriptor instead')
const GetMoreInformationReply$json = {
  '1': 'GetMoreInformationReply',
  '2': [
    {'1': 'infos', '3': 1, '4': 3, '5': 11, '6': '.api.GetMoreInformationReply.MoreInformation', '10': 'infos'},
  ],
  '3': [GetMoreInformationReply_MoreInformation$json],
};

@$core.Deprecated('Use getMoreInformationReplyDescriptor instead')
const GetMoreInformationReply_MoreInformation$json = {
  '1': 'MoreInformation',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'category', '3': 2, '4': 1, '5': 9, '10': 'category'},
    {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `GetMoreInformationReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMoreInformationReplyDescriptor = $convert.base64Decode(
    'ChdHZXRNb3JlSW5mb3JtYXRpb25SZXBseRJCCgVpbmZvcxgBIAMoCzIsLmFwaS5HZXRNb3JlSW'
    '5mb3JtYXRpb25SZXBseS5Nb3JlSW5mb3JtYXRpb25SBWluZm9zGlUKD01vcmVJbmZvcm1hdGlv'
    'bhIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSGgoIY2F0ZWdvcnkYAiABKAlSCGNhdGVnb3J5EhAKA3'
    'VybBgDIAEoCVIDdXJs');

@$core.Deprecated('Use getOpeningTimesRequestDescriptor instead')
const GetOpeningTimesRequest$json = {
  '1': 'GetOpeningTimesRequest',
  '2': [
    {'1': 'language', '3': 1, '4': 1, '5': 9, '10': 'language'},
  ],
};

/// Descriptor for `GetOpeningTimesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOpeningTimesRequestDescriptor = $convert.base64Decode(
    'ChZHZXRPcGVuaW5nVGltZXNSZXF1ZXN0EhoKCGxhbmd1YWdlGAEgASgJUghsYW5ndWFnZQ==');

@$core.Deprecated('Use getOpeningTimesReplyDescriptor instead')
const GetOpeningTimesReply$json = {
  '1': 'GetOpeningTimesReply',
  '2': [
    {'1': 'facilities', '3': 1, '4': 3, '5': 11, '6': '.api.OpeningTimesMsgElement', '10': 'facilities'},
  ],
};

/// Descriptor for `GetOpeningTimesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOpeningTimesReplyDescriptor = $convert.base64Decode(
    'ChRHZXRPcGVuaW5nVGltZXNSZXBseRI7CgpmYWNpbGl0aWVzGAEgAygLMhsuYXBpLk9wZW5pbm'
    'dUaW1lc01zZ0VsZW1lbnRSCmZhY2lsaXRpZXM=');

@$core.Deprecated('Use openingTimesMsgElementDescriptor instead')
const OpeningTimesMsgElement$json = {
  '1': 'OpeningTimesMsgElement',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'category', '3': 2, '4': 1, '5': 9, '10': 'category'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'address', '3': 4, '4': 1, '5': 9, '10': 'address'},
    {'1': 'room', '3': 5, '4': 1, '5': 9, '10': 'room'},
    {'1': 'transport_station', '3': 6, '4': 1, '5': 9, '10': 'transportStation'},
    {'1': 'opening_hours', '3': 7, '4': 1, '5': 9, '10': 'openingHours'},
    {'1': 'infos', '3': 8, '4': 1, '5': 9, '10': 'infos'},
    {'1': 'url', '3': 9, '4': 1, '5': 9, '10': 'url'},
    {'1': 'language', '3': 10, '4': 1, '5': 9, '10': 'language'},
    {'1': 'reference_id', '3': 11, '4': 1, '5': 5, '10': 'referenceId'},
  ],
};

/// Descriptor for `OpeningTimesMsgElement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List openingTimesMsgElementDescriptor = $convert.base64Decode(
    'ChZPcGVuaW5nVGltZXNNc2dFbGVtZW50Eg4KAmlkGAEgASgFUgJpZBIaCghjYXRlZ29yeRgCIA'
    'EoCVIIY2F0ZWdvcnkSEgoEbmFtZRgDIAEoCVIEbmFtZRIYCgdhZGRyZXNzGAQgASgJUgdhZGRy'
    'ZXNzEhIKBHJvb20YBSABKAlSBHJvb20SKwoRdHJhbnNwb3J0X3N0YXRpb24YBiABKAlSEHRyYW'
    '5zcG9ydFN0YXRpb24SIwoNb3BlbmluZ19ob3VycxgHIAEoCVIMb3BlbmluZ0hvdXJzEhQKBWlu'
    'Zm9zGAggASgJUgVpbmZvcxIQCgN1cmwYCSABKAlSA3VybBIaCghsYW5ndWFnZRgKIAEoCVIIbG'
    'FuZ3VhZ2USIQoMcmVmZXJlbmNlX2lkGAsgASgFUgtyZWZlcmVuY2VJZA==');

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

@$core.Deprecated('Use getStudyRoomListRequestDescriptor instead')
const GetStudyRoomListRequest$json = {
  '1': 'GetStudyRoomListRequest',
};

/// Descriptor for `GetStudyRoomListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStudyRoomListRequestDescriptor = $convert.base64Decode(
    'ChdHZXRTdHVkeVJvb21MaXN0UmVxdWVzdA==');

@$core.Deprecated('Use getStudyRoomListReplyDescriptor instead')
const GetStudyRoomListReply$json = {
  '1': 'GetStudyRoomListReply',
  '2': [
    {'1': 'rooms', '3': 1, '4': 3, '5': 11, '6': '.api.StudyRoomMsgElement', '10': 'rooms'},
  ],
};

/// Descriptor for `GetStudyRoomListReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStudyRoomListReplyDescriptor = $convert.base64Decode(
    'ChVHZXRTdHVkeVJvb21MaXN0UmVwbHkSLgoFcm9vbXMYASADKAsyGC5hcGkuU3R1ZHlSb29tTX'
    'NnRWxlbWVudFIFcm9vbXM=');

@$core.Deprecated('Use studyRoomMsgElementDescriptor instead')
const StudyRoomMsgElement$json = {
  '1': 'StudyRoomMsgElement',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'details', '3': 3, '4': 1, '5': 9, '10': 'details'},
    {'1': 'rooms', '3': 4, '4': 3, '5': 11, '6': '.api.StudyRoom', '10': 'rooms'},
  ],
};

/// Descriptor for `StudyRoomMsgElement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List studyRoomMsgElementDescriptor = $convert.base64Decode(
    'ChNTdHVkeVJvb21Nc2dFbGVtZW50Eg4KAmlkGAEgASgFUgJpZBISCgRuYW1lGAIgASgJUgRuYW'
    '1lEhgKB2RldGFpbHMYAyABKAlSB2RldGFpbHMSJAoFcm9vbXMYBCADKAsyDi5hcGkuU3R1ZHlS'
    'b29tUgVyb29tcw==');

@$core.Deprecated('Use studyRoomDescriptor instead')
const StudyRoom$json = {
  '1': 'StudyRoom',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 5, '10': 'groupId'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 5, '10': 'roomId'},
    {'1': 'room_code', '3': 3, '4': 1, '5': 9, '10': 'roomCode'},
    {'1': 'room_name', '3': 4, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'building_name', '3': 5, '4': 1, '5': 9, '10': 'buildingName'},
  ],
};

/// Descriptor for `StudyRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List studyRoomDescriptor = $convert.base64Decode(
    'CglTdHVkeVJvb20SGQoIZ3JvdXBfaWQYASABKAVSB2dyb3VwSWQSFwoHcm9vbV9pZBgCIAEoBV'
    'IGcm9vbUlkEhsKCXJvb21fY29kZRgDIAEoCVIIcm9vbUNvZGUSGwoJcm9vbV9uYW1lGAQgASgJ'
    'Ughyb29tTmFtZRIjCg1idWlsZGluZ19uYW1lGAUgASgJUgxidWlsZGluZ05hbWU=');

@$core.Deprecated('Use getMoviesRequestDescriptor instead')
const GetMoviesRequest$json = {
  '1': 'GetMoviesRequest',
  '2': [
    {'1': 'last_id', '3': 1, '4': 1, '5': 5, '10': 'lastId'},
  ],
};

/// Descriptor for `GetMoviesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMoviesRequestDescriptor = $convert.base64Decode(
    'ChBHZXRNb3ZpZXNSZXF1ZXN0EhcKB2xhc3RfaWQYASABKAVSBmxhc3RJZA==');

@$core.Deprecated('Use getMoviesReplyDescriptor instead')
const GetMoviesReply$json = {
  '1': 'GetMoviesReply',
  '2': [
    {'1': 'movies', '3': 1, '4': 3, '5': 11, '6': '.api.Movie', '10': 'movies'},
  ],
};

/// Descriptor for `GetMoviesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMoviesReplyDescriptor = $convert.base64Decode(
    'Cg5HZXRNb3ZpZXNSZXBseRIiCgZtb3ZpZXMYASADKAsyCi5hcGkuTW92aWVSBm1vdmllcw==');

@$core.Deprecated('Use movieDescriptor instead')
const Movie$json = {
  '1': 'Movie',
  '2': [
    {'1': 'cover_name', '3': 1, '4': 1, '5': 9, '10': 'coverName'},
    {'1': 'cover_path', '3': 2, '4': 1, '5': 9, '10': 'coverPath'},
    {'1': 'movie_id', '3': 3, '4': 1, '5': 3, '10': 'movieId'},
    {'1': 'date', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'date'},
    {'1': 'created', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'created'},
    {'1': 'title', '3': 6, '4': 1, '5': 9, '10': 'title'},
    {'1': 'release_year', '3': 7, '4': 1, '5': 9, '10': 'releaseYear'},
    {'1': 'runtime', '3': 8, '4': 1, '5': 9, '10': 'runtime'},
    {'1': 'genre', '3': 9, '4': 1, '5': 9, '10': 'genre'},
    {'1': 'director', '3': 10, '4': 1, '5': 9, '10': 'director'},
    {'1': 'actors', '3': 11, '4': 1, '5': 9, '10': 'actors'},
    {'1': 'imdb_rating', '3': 12, '4': 1, '5': 9, '10': 'imdbRating'},
    {'1': 'description', '3': 13, '4': 1, '5': 9, '10': 'description'},
    {'1': 'cover_id', '3': 14, '4': 1, '5': 3, '10': 'coverId'},
    {'1': 'link', '3': 16, '4': 1, '5': 9, '10': 'link'},
  ],
  '9': [
    {'1': 15, '2': 16},
  ],
};

/// Descriptor for `Movie`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List movieDescriptor = $convert.base64Decode(
    'CgVNb3ZpZRIdCgpjb3Zlcl9uYW1lGAEgASgJUgljb3Zlck5hbWUSHQoKY292ZXJfcGF0aBgCIA'
    'EoCVIJY292ZXJQYXRoEhkKCG1vdmllX2lkGAMgASgDUgdtb3ZpZUlkEi4KBGRhdGUYBCABKAsy'
    'Gi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgRkYXRlEjQKB2NyZWF0ZWQYBSABKAsyGi5nb2'
    '9nbGUucHJvdG9idWYuVGltZXN0YW1wUgdjcmVhdGVkEhQKBXRpdGxlGAYgASgJUgV0aXRsZRIh'
    'CgxyZWxlYXNlX3llYXIYByABKAlSC3JlbGVhc2VZZWFyEhgKB3J1bnRpbWUYCCABKAlSB3J1bn'
    'RpbWUSFAoFZ2VucmUYCSABKAlSBWdlbnJlEhoKCGRpcmVjdG9yGAogASgJUghkaXJlY3RvchIW'
    'CgZhY3RvcnMYCyABKAlSBmFjdG9ycxIfCgtpbWRiX3JhdGluZxgMIAEoCVIKaW1kYlJhdGluZx'
    'IgCgtkZXNjcmlwdGlvbhgNIAEoCVILZGVzY3JpcHRpb24SGQoIY292ZXJfaWQYDiABKANSB2Nv'
    'dmVySWQSEgoEbGluaxgQIAEoCVIEbGlua0oECA8QEA==');

@$core.Deprecated('Use sendFeedbackReplyDescriptor instead')
const SendFeedbackReply$json = {
  '1': 'SendFeedbackReply',
};

/// Descriptor for `SendFeedbackReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendFeedbackReplyDescriptor = $convert.base64Decode(
    'ChFTZW5kRmVlZGJhY2tSZXBseQ==');

@$core.Deprecated('Use sendFeedbackRequestDescriptor instead')
const SendFeedbackRequest$json = {
  '1': 'SendFeedbackRequest',
  '2': [
    {'1': 'topic', '3': 1, '4': 1, '5': 9, '10': 'topic'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'email_id', '3': 3, '4': 1, '5': 9, '10': 'emailId'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
    {'1': 'image_count', '3': 5, '4': 1, '5': 5, '10': 'imageCount'},
    {'1': 'latitude', '3': 6, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 7, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'os_version', '3': 8, '4': 1, '5': 9, '10': 'osVersion'},
    {'1': 'app_version', '3': 9, '4': 1, '5': 9, '10': 'appVersion'},
  ],
};

/// Descriptor for `SendFeedbackRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendFeedbackRequestDescriptor = $convert.base64Decode(
    'ChNTZW5kRmVlZGJhY2tSZXF1ZXN0EhQKBXRvcGljGAEgASgJUgV0b3BpYxIUCgVlbWFpbBgCIA'
    'EoCVIFZW1haWwSGQoIZW1haWxfaWQYAyABKAlSB2VtYWlsSWQSGAoHbWVzc2FnZRgEIAEoCVIH'
    'bWVzc2FnZRIfCgtpbWFnZV9jb3VudBgFIAEoBVIKaW1hZ2VDb3VudBIaCghsYXRpdHVkZRgGIA'
    'EoAVIIbGF0aXR1ZGUSHAoJbG9uZ2l0dWRlGAcgASgBUglsb25naXR1ZGUSHQoKb3NfdmVyc2lv'
    'bhgIIAEoCVIJb3NWZXJzaW9uEh8KC2FwcF92ZXJzaW9uGAkgASgJUgphcHBWZXJzaW9u');

@$core.Deprecated('Use sendFeedbackImageReplyDescriptor instead')
const SendFeedbackImageReply$json = {
  '1': 'SendFeedbackImageReply',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `SendFeedbackImageReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendFeedbackImageReplyDescriptor = $convert.base64Decode(
    'ChZTZW5kRmVlZGJhY2tJbWFnZVJlcGx5EhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVz');

@$core.Deprecated('Use sendFeedbackImageRequestDescriptor instead')
const SendFeedbackImageRequest$json = {
  '1': 'SendFeedbackImageRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'image_nr', '3': 2, '4': 1, '5': 5, '10': 'imageNr'},
  ],
};

/// Descriptor for `SendFeedbackImageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendFeedbackImageRequestDescriptor = $convert.base64Decode(
    'ChhTZW5kRmVlZGJhY2tJbWFnZVJlcXVlc3QSDgoCaWQYASABKAVSAmlkEhkKCGltYWdlX25yGA'
    'IgASgFUgdpbWFnZU5y');

@$core.Deprecated('Use getMembersRequestDescriptor instead')
const GetMembersRequest$json = {
  '1': 'GetMembersRequest',
  '2': [
    {'1': 'lrz_id', '3': 1, '4': 1, '5': 9, '10': 'lrzId'},
  ],
};

/// Descriptor for `GetMembersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMembersRequestDescriptor = $convert.base64Decode(
    'ChFHZXRNZW1iZXJzUmVxdWVzdBIVCgZscnpfaWQYASABKAlSBWxyeklk');

@$core.Deprecated('Use getMembersReplyDescriptor instead')
const GetMembersReply$json = {
  '1': 'GetMembersReply',
  '2': [
    {'1': 'lrz_id', '3': 1, '4': 1, '5': 9, '10': 'lrzId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'member_id', '3': 3, '4': 1, '5': 5, '10': 'memberId'},
  ],
};

/// Descriptor for `GetMembersReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMembersReplyDescriptor = $convert.base64Decode(
    'Cg9HZXRNZW1iZXJzUmVwbHkSFQoGbHJ6X2lkGAEgASgJUgVscnpJZBISCgRuYW1lGAIgASgJUg'
    'RuYW1lEhsKCW1lbWJlcl9pZBgDIAEoBVIIbWVtYmVySWQ=');

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

