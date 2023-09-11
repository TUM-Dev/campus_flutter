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
    {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'publicKey', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'publicKey', '17': true},
    {'1': 'deviceType', '3': 3, '4': 1, '5': 14, '6': '.api.DeviceType', '10': 'deviceType'},
  ],
  '8': [
    {'1': '_publicKey'},
  ],
};

/// Descriptor for `RegisterDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerDeviceRequestDescriptor = $convert.base64Decode(
    'ChVSZWdpc3RlckRldmljZVJlcXVlc3QSGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEiEKCX'
    'B1YmxpY0tleRgCIAEoCUgAUglwdWJsaWNLZXmIAQESLwoKZGV2aWNlVHlwZRgDIAEoDjIPLmFw'
    'aS5EZXZpY2VUeXBlUgpkZXZpY2VUeXBlQgwKCl9wdWJsaWNLZXk=');

@$core.Deprecated('Use registerDeviceReplyDescriptor instead')
const RegisterDeviceReply$json = {
  '1': 'RegisterDeviceReply',
  '2': [
    {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `RegisterDeviceReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerDeviceReplyDescriptor = $convert.base64Decode(
    'ChNSZWdpc3RlckRldmljZVJlcGx5EhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZA==');

@$core.Deprecated('Use removeDeviceRequestDescriptor instead')
const RemoveDeviceRequest$json = {
  '1': 'RemoveDeviceRequest',
  '2': [
    {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'deviceType', '3': 2, '4': 1, '5': 14, '6': '.api.DeviceType', '10': 'deviceType'},
  ],
};

/// Descriptor for `RemoveDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeDeviceRequestDescriptor = $convert.base64Decode(
    'ChNSZW1vdmVEZXZpY2VSZXF1ZXN0EhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIvCgpkZX'
    'ZpY2VUeXBlGAIgASgOMg8uYXBpLkRldmljZVR5cGVSCmRldmljZVR5cGU=');

@$core.Deprecated('Use removeDeviceReplyDescriptor instead')
const RemoveDeviceReply$json = {
  '1': 'RemoveDeviceReply',
  '2': [
    {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `RemoveDeviceReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeDeviceReplyDescriptor = $convert.base64Decode(
    'ChFSZW1vdmVEZXZpY2VSZXBseRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQ=');

@$core.Deprecated('Use iOSDeviceRequestResponseRequestDescriptor instead')
const IOSDeviceRequestResponseRequest$json = {
  '1': 'IOSDeviceRequestResponseRequest',
  '2': [
    {'1': 'requestId', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    {'1': 'payload', '3': 2, '4': 1, '5': 9, '10': 'payload'},
  ],
};

/// Descriptor for `IOSDeviceRequestResponseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iOSDeviceRequestResponseRequestDescriptor = $convert.base64Decode(
    'Ch9JT1NEZXZpY2VSZXF1ZXN0UmVzcG9uc2VSZXF1ZXN0EhwKCXJlcXVlc3RJZBgBIAEoCVIJcm'
    'VxdWVzdElkEhgKB3BheWxvYWQYAiABKAlSB3BheWxvYWQ=');

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

@$core.Deprecated('Use getRoomScheduleRequestDescriptor instead')
const GetRoomScheduleRequest$json = {
  '1': 'GetRoomScheduleRequest',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 5, '10': 'room'},
    {'1': 'start', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'start'},
    {'1': 'end', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'end'},
  ],
};

/// Descriptor for `GetRoomScheduleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoomScheduleRequestDescriptor = $convert.base64Decode(
    'ChZHZXRSb29tU2NoZWR1bGVSZXF1ZXN0EhIKBHJvb20YASABKAVSBHJvb20SMAoFc3RhcnQYAi'
    'ABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgVzdGFydBIsCgNlbmQYAyABKAsyGi5n'
    'b29nbGUucHJvdG9idWYuVGltZXN0YW1wUgNlbmQ=');

@$core.Deprecated('Use getRoomScheduleReplyDescriptor instead')
const GetRoomScheduleReply$json = {
  '1': 'GetRoomScheduleReply',
  '2': [
    {'1': 'events', '3': 1, '4': 3, '5': 11, '6': '.api.GetRoomScheduleReply.RoomScheduleEvent', '10': 'events'},
  ],
  '3': [GetRoomScheduleReply_RoomScheduleEvent$json],
};

@$core.Deprecated('Use getRoomScheduleReplyDescriptor instead')
const GetRoomScheduleReply_RoomScheduleEvent$json = {
  '1': 'RoomScheduleEvent',
  '2': [
    {'1': 'start', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'start'},
    {'1': 'end', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'end'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'event_id', '3': 4, '4': 1, '5': 5, '10': 'eventId'},
    {'1': 'course_code', '3': 5, '4': 1, '5': 9, '10': 'courseCode'},
  ],
};

/// Descriptor for `GetRoomScheduleReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoomScheduleReplyDescriptor = $convert.base64Decode(
    'ChRHZXRSb29tU2NoZWR1bGVSZXBseRJDCgZldmVudHMYASADKAsyKy5hcGkuR2V0Um9vbVNjaG'
    'VkdWxlUmVwbHkuUm9vbVNjaGVkdWxlRXZlbnRSBmV2ZW50cxrFAQoRUm9vbVNjaGVkdWxlRXZl'
    'bnQSMAoFc3RhcnQYASABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgVzdGFydBIsCg'
    'NlbmQYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgNlbmQSFAoFdGl0bGUYAyAB'
    'KAlSBXRpdGxlEhkKCGV2ZW50X2lkGAQgASgFUgdldmVudElkEh8KC2NvdXJzZV9jb2RlGAUgAS'
    'gJUgpjb3Vyc2VDb2Rl');

@$core.Deprecated('Use getRoomCoordinatesRequestDescriptor instead')
const GetRoomCoordinatesRequest$json = {
  '1': 'GetRoomCoordinatesRequest',
  '2': [
    {'1': 'arch_id', '3': 1, '4': 1, '5': 9, '10': 'archId'},
  ],
};

/// Descriptor for `GetRoomCoordinatesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoomCoordinatesRequestDescriptor = $convert.base64Decode(
    'ChlHZXRSb29tQ29vcmRpbmF0ZXNSZXF1ZXN0EhcKB2FyY2hfaWQYASABKAlSBmFyY2hJZA==');

@$core.Deprecated('Use getRoomCoordinatesReplyDescriptor instead')
const GetRoomCoordinatesReply$json = {
  '1': 'GetRoomCoordinatesReply',
  '2': [
    {'1': 'utm_zone', '3': 1, '4': 1, '5': 9, '10': 'utmZone'},
    {'1': 'utm_easting', '3': 2, '4': 1, '5': 2, '10': 'utmEasting'},
    {'1': 'utm_northing', '3': 3, '4': 1, '5': 2, '10': 'utmNorthing'},
  ],
};

/// Descriptor for `GetRoomCoordinatesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoomCoordinatesReplyDescriptor = $convert.base64Decode(
    'ChdHZXRSb29tQ29vcmRpbmF0ZXNSZXBseRIZCgh1dG1fem9uZRgBIAEoCVIHdXRtWm9uZRIfCg'
    't1dG1fZWFzdGluZxgCIAEoAlIKdXRtRWFzdGluZxIhCgx1dG1fbm9ydGhpbmcYAyABKAJSC3V0'
    'bU5vcnRoaW5n');

@$core.Deprecated('Use getRoomMapsRequestDescriptor instead')
const GetRoomMapsRequest$json = {
  '1': 'GetRoomMapsRequest',
  '2': [
    {'1': 'arch_id', '3': 1, '4': 1, '5': 9, '10': 'archId'},
  ],
};

/// Descriptor for `GetRoomMapsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoomMapsRequestDescriptor = $convert.base64Decode(
    'ChJHZXRSb29tTWFwc1JlcXVlc3QSFwoHYXJjaF9pZBgBIAEoCVIGYXJjaElk');

@$core.Deprecated('Use getRoomMapsReplyDescriptor instead')
const GetRoomMapsReply$json = {
  '1': 'GetRoomMapsReply',
  '2': [
    {'1': 'maps', '3': 1, '4': 3, '5': 11, '6': '.api.GetRoomMapsReply.Map', '10': 'maps'},
  ],
  '3': [GetRoomMapsReply_Map$json],
};

@$core.Deprecated('Use getRoomMapsReplyDescriptor instead')
const GetRoomMapsReply_Map$json = {
  '1': 'Map',
  '2': [
    {'1': 'map_id', '3': 1, '4': 1, '5': 3, '10': 'mapId'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'scale', '3': 3, '4': 1, '5': 3, '10': 'scale'},
    {'1': 'width', '3': 4, '4': 1, '5': 3, '10': 'width'},
    {'1': 'height', '3': 5, '4': 1, '5': 3, '10': 'height'},
  ],
};

/// Descriptor for `GetRoomMapsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoomMapsReplyDescriptor = $convert.base64Decode(
    'ChBHZXRSb29tTWFwc1JlcGx5Ei0KBG1hcHMYASADKAsyGS5hcGkuR2V0Um9vbU1hcHNSZXBseS'
    '5NYXBSBG1hcHMaggEKA01hcBIVCgZtYXBfaWQYASABKANSBW1hcElkEiAKC2Rlc2NyaXB0aW9u'
    'GAIgASgJUgtkZXNjcmlwdGlvbhIUCgVzY2FsZRgDIAEoA1IFc2NhbGUSFAoFd2lkdGgYBCABKA'
    'NSBXdpZHRoEhYKBmhlaWdodBgFIAEoA1IGaGVpZ2h0');

@$core.Deprecated('Use getLocationsRequestDescriptor instead')
const GetLocationsRequest$json = {
  '1': 'GetLocationsRequest',
  '2': [
    {'1': 'location', '3': 1, '4': 1, '5': 9, '10': 'location'},
  ],
};

/// Descriptor for `GetLocationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLocationsRequestDescriptor = $convert.base64Decode(
    'ChNHZXRMb2NhdGlvbnNSZXF1ZXN0EhoKCGxvY2F0aW9uGAEgASgJUghsb2NhdGlvbg==');

@$core.Deprecated('Use getLocationsReplyDescriptor instead')
const GetLocationsReply$json = {
  '1': 'GetLocationsReply',
  '2': [
    {'1': 'locations', '3': 1, '4': 3, '5': 11, '6': '.api.GetLocationsReply.Location', '10': 'locations'},
  ],
  '3': [GetLocationsReply_Location$json],
};

@$core.Deprecated('Use getLocationsReplyDescriptor instead')
const GetLocationsReply_Location$json = {
  '1': 'Location',
  '2': [
    {'1': 'location', '3': 1, '4': 1, '5': 9, '10': 'location'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'lon', '3': 3, '4': 1, '5': 9, '10': 'lon'},
    {'1': 'lat', '3': 4, '4': 1, '5': 9, '10': 'lat'},
    {'1': 'radius', '3': 5, '4': 1, '5': 9, '10': 'radius'},
  ],
};

/// Descriptor for `GetLocationsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLocationsReplyDescriptor = $convert.base64Decode(
    'ChFHZXRMb2NhdGlvbnNSZXBseRI9Cglsb2NhdGlvbnMYASADKAsyHy5hcGkuR2V0TG9jYXRpb2'
    '5zUmVwbHkuTG9jYXRpb25SCWxvY2F0aW9ucxp2CghMb2NhdGlvbhIaCghsb2NhdGlvbhgBIAEo'
    'CVIIbG9jYXRpb24SEgoEbmFtZRgCIAEoCVIEbmFtZRIQCgNsb24YAyABKAlSA2xvbhIQCgNsYX'
    'QYBCABKAlSA2xhdBIWCgZyYWRpdXMYBSABKAlSBnJhZGl1cw==');

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
    {'1': 'roomId', '3': 1, '4': 1, '5': 5, '10': 'roomId'},
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
    'CgRSb29tEhYKBnJvb21JZBgBIAEoBVIGcm9vbUlkEhsKCXJvb21fY29kZRgCIAEoCVIIcm9vbU'
    'NvZGUSHwoLYnVpbGRpbmdfbnIYAyABKAlSCmJ1aWxkaW5nTnISFwoHYXJjaF9pZBgEIAEoCVIG'
    'YXJjaElkEhIKBGluZm8YBSABKAlSBGluZm8SGAoHYWRkcmVzcxgGIAEoCVIHYWRkcmVzcxIYCg'
    'dwdXJwb3NlGAcgASgJUgdwdXJwb3NlEhYKBmNhbXB1cxgIIAEoCVIGY2FtcHVzEhIKBG5hbWUY'
    'CSABKAlSBG5hbWU=');

@$core.Deprecated('Use newsSourceArrayDescriptor instead')
const NewsSourceArray$json = {
  '1': 'NewsSourceArray',
  '2': [
    {'1': 'sources', '3': 1, '4': 3, '5': 11, '6': '.api.NewsSource', '10': 'sources'},
  ],
};

/// Descriptor for `NewsSourceArray`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newsSourceArrayDescriptor = $convert.base64Decode(
    'Cg9OZXdzU291cmNlQXJyYXkSKQoHc291cmNlcxgBIAMoCzIPLmFwaS5OZXdzU291cmNlUgdzb3'
    'VyY2Vz');

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

@$core.Deprecated('Use cafeteriaRatingRequestDescriptor instead')
const CafeteriaRatingRequest$json = {
  '1': 'CafeteriaRatingRequest',
  '2': [
    {'1': 'cafeteriaId', '3': 1, '4': 1, '5': 9, '10': 'cafeteriaId'},
    {'1': 'from', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'from'},
    {'1': 'to', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'to'},
    {'1': 'limit', '3': 4, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `CafeteriaRatingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cafeteriaRatingRequestDescriptor = $convert.base64Decode(
    'ChZDYWZldGVyaWFSYXRpbmdSZXF1ZXN0EiAKC2NhZmV0ZXJpYUlkGAEgASgJUgtjYWZldGVyaW'
    'FJZBIuCgRmcm9tGAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIEZnJvbRIqCgJ0'
    'bxgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSAnRvEhQKBWxpbWl0GAQgASgFUg'
    'VsaW1pdA==');

@$core.Deprecated('Use dishRatingRequestDescriptor instead')
const DishRatingRequest$json = {
  '1': 'DishRatingRequest',
  '2': [
    {'1': 'cafeteriaId', '3': 1, '4': 1, '5': 9, '10': 'cafeteriaId'},
    {'1': 'dish', '3': 2, '4': 1, '5': 9, '10': 'dish'},
    {'1': 'from', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'from'},
    {'1': 'to', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'to'},
    {'1': 'limit', '3': 5, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `DishRatingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dishRatingRequestDescriptor = $convert.base64Decode(
    'ChFEaXNoUmF0aW5nUmVxdWVzdBIgCgtjYWZldGVyaWFJZBgBIAEoCVILY2FmZXRlcmlhSWQSEg'
    'oEZGlzaBgCIAEoCVIEZGlzaBIuCgRmcm9tGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVz'
    'dGFtcFIEZnJvbRIqCgJ0bxgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSAnRvEh'
    'QKBWxpbWl0GAUgASgFUgVsaW1pdA==');

@$core.Deprecated('Use cafeteriaRatingReplyDescriptor instead')
const CafeteriaRatingReply$json = {
  '1': 'CafeteriaRatingReply',
  '2': [
    {'1': 'rating', '3': 1, '4': 3, '5': 11, '6': '.api.SingleRatingReply', '10': 'rating'},
    {'1': 'avg', '3': 2, '4': 1, '5': 1, '10': 'avg'},
    {'1': 'std', '3': 3, '4': 1, '5': 1, '10': 'std'},
    {'1': 'min', '3': 4, '4': 1, '5': 5, '10': 'min'},
    {'1': 'max', '3': 5, '4': 1, '5': 5, '10': 'max'},
    {'1': 'ratingTags', '3': 6, '4': 3, '5': 11, '6': '.api.RatingTagResult', '10': 'ratingTags'},
  ],
};

/// Descriptor for `CafeteriaRatingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cafeteriaRatingReplyDescriptor = $convert.base64Decode(
    'ChRDYWZldGVyaWFSYXRpbmdSZXBseRIuCgZyYXRpbmcYASADKAsyFi5hcGkuU2luZ2xlUmF0aW'
    '5nUmVwbHlSBnJhdGluZxIQCgNhdmcYAiABKAFSA2F2ZxIQCgNzdGQYAyABKAFSA3N0ZBIQCgNt'
    'aW4YBCABKAVSA21pbhIQCgNtYXgYBSABKAVSA21heBI0CgpyYXRpbmdUYWdzGAYgAygLMhQuYX'
    'BpLlJhdGluZ1RhZ1Jlc3VsdFIKcmF0aW5nVGFncw==');

@$core.Deprecated('Use dishRatingReplyDescriptor instead')
const DishRatingReply$json = {
  '1': 'DishRatingReply',
  '2': [
    {'1': 'rating', '3': 1, '4': 3, '5': 11, '6': '.api.SingleRatingReply', '10': 'rating'},
    {'1': 'avg', '3': 2, '4': 1, '5': 1, '10': 'avg'},
    {'1': 'std', '3': 3, '4': 1, '5': 1, '10': 'std'},
    {'1': 'min', '3': 4, '4': 1, '5': 5, '10': 'min'},
    {'1': 'max', '3': 5, '4': 1, '5': 5, '10': 'max'},
    {'1': 'ratingTags', '3': 6, '4': 3, '5': 11, '6': '.api.RatingTagResult', '10': 'ratingTags'},
    {'1': 'nameTags', '3': 7, '4': 3, '5': 11, '6': '.api.RatingTagResult', '10': 'nameTags'},
  ],
};

/// Descriptor for `DishRatingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dishRatingReplyDescriptor = $convert.base64Decode(
    'Cg9EaXNoUmF0aW5nUmVwbHkSLgoGcmF0aW5nGAEgAygLMhYuYXBpLlNpbmdsZVJhdGluZ1JlcG'
    'x5UgZyYXRpbmcSEAoDYXZnGAIgASgBUgNhdmcSEAoDc3RkGAMgASgBUgNzdGQSEAoDbWluGAQg'
    'ASgFUgNtaW4SEAoDbWF4GAUgASgFUgNtYXgSNAoKcmF0aW5nVGFncxgGIAMoCzIULmFwaS5SYX'
    'RpbmdUYWdSZXN1bHRSCnJhdGluZ1RhZ3MSMAoIbmFtZVRhZ3MYByADKAsyFC5hcGkuUmF0aW5n'
    'VGFnUmVzdWx0UghuYW1lVGFncw==');

@$core.Deprecated('Use singleRatingReplyDescriptor instead')
const SingleRatingReply$json = {
  '1': 'SingleRatingReply',
  '2': [
    {'1': 'points', '3': 1, '4': 1, '5': 5, '10': 'points'},
    {'1': 'image', '3': 2, '4': 1, '5': 12, '10': 'image'},
    {'1': 'comment', '3': 3, '4': 1, '5': 9, '10': 'comment'},
    {'1': 'ratingTags', '3': 4, '4': 3, '5': 11, '6': '.api.RatingTagNewRequest', '10': 'ratingTags'},
    {'1': 'visited', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'visited'},
  ],
};

/// Descriptor for `SingleRatingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List singleRatingReplyDescriptor = $convert.base64Decode(
    'ChFTaW5nbGVSYXRpbmdSZXBseRIWCgZwb2ludHMYASABKAVSBnBvaW50cxIUCgVpbWFnZRgCIA'
    'EoDFIFaW1hZ2USGAoHY29tbWVudBgDIAEoCVIHY29tbWVudBI4CgpyYXRpbmdUYWdzGAQgAygL'
    'MhguYXBpLlJhdGluZ1RhZ05ld1JlcXVlc3RSCnJhdGluZ1RhZ3MSNAoHdmlzaXRlZBgFIAEoCz'
    'IaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSB3Zpc2l0ZWQ=');

@$core.Deprecated('Use newCafeteriaRatingRequestDescriptor instead')
const NewCafeteriaRatingRequest$json = {
  '1': 'NewCafeteriaRatingRequest',
  '2': [
    {'1': 'points', '3': 1, '4': 1, '5': 5, '10': 'points'},
    {'1': 'cafeteriaId', '3': 2, '4': 1, '5': 9, '10': 'cafeteriaId'},
    {'1': 'image', '3': 3, '4': 1, '5': 12, '10': 'image'},
    {'1': 'ratingTags', '3': 4, '4': 3, '5': 11, '6': '.api.RatingTag', '10': 'ratingTags'},
    {'1': 'comment', '3': 6, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `NewCafeteriaRatingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newCafeteriaRatingRequestDescriptor = $convert.base64Decode(
    'ChlOZXdDYWZldGVyaWFSYXRpbmdSZXF1ZXN0EhYKBnBvaW50cxgBIAEoBVIGcG9pbnRzEiAKC2'
    'NhZmV0ZXJpYUlkGAIgASgJUgtjYWZldGVyaWFJZBIUCgVpbWFnZRgDIAEoDFIFaW1hZ2USLgoK'
    'cmF0aW5nVGFncxgEIAMoCzIOLmFwaS5SYXRpbmdUYWdSCnJhdGluZ1RhZ3MSGAoHY29tbWVudB'
    'gGIAEoCVIHY29tbWVudA==');

@$core.Deprecated('Use newDishRatingRequestDescriptor instead')
const NewDishRatingRequest$json = {
  '1': 'NewDishRatingRequest',
  '2': [
    {'1': 'points', '3': 1, '4': 1, '5': 5, '10': 'points'},
    {'1': 'cafeteriaId', '3': 2, '4': 1, '5': 9, '10': 'cafeteriaId'},
    {'1': 'dish', '3': 3, '4': 1, '5': 9, '10': 'dish'},
    {'1': 'image', '3': 4, '4': 1, '5': 12, '10': 'image'},
    {'1': 'ratingTags', '3': 5, '4': 3, '5': 11, '6': '.api.RatingTag', '10': 'ratingTags'},
    {'1': 'comment', '3': 7, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `NewDishRatingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newDishRatingRequestDescriptor = $convert.base64Decode(
    'ChROZXdEaXNoUmF0aW5nUmVxdWVzdBIWCgZwb2ludHMYASABKAVSBnBvaW50cxIgCgtjYWZldG'
    'VyaWFJZBgCIAEoCVILY2FmZXRlcmlhSWQSEgoEZGlzaBgDIAEoCVIEZGlzaBIUCgVpbWFnZRgE'
    'IAEoDFIFaW1hZ2USLgoKcmF0aW5nVGFncxgFIAMoCzIOLmFwaS5SYXRpbmdUYWdSCnJhdGluZ1'
    'RhZ3MSGAoHY29tbWVudBgHIAEoCVIHY29tbWVudA==');

@$core.Deprecated('Use getTagsReplyDescriptor instead')
const GetTagsReply$json = {
  '1': 'GetTagsReply',
  '2': [
    {'1': 'ratingTags', '3': 1, '4': 3, '5': 11, '6': '.api.TagsOverview', '10': 'ratingTags'},
  ],
};

/// Descriptor for `GetTagsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTagsReplyDescriptor = $convert.base64Decode(
    'CgxHZXRUYWdzUmVwbHkSMQoKcmF0aW5nVGFncxgBIAMoCzIRLmFwaS5UYWdzT3ZlcnZpZXdSCn'
    'JhdGluZ1RhZ3M=');

@$core.Deprecated('Use tagsOverviewDescriptor instead')
const TagsOverview$json = {
  '1': 'TagsOverview',
  '2': [
    {'1': 'tagId', '3': 1, '4': 1, '5': 5, '10': 'tagId'},
    {'1': 'de', '3': 2, '4': 1, '5': 9, '10': 'de'},
    {'1': 'en', '3': 3, '4': 1, '5': 9, '10': 'en'},
  ],
};

/// Descriptor for `TagsOverview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagsOverviewDescriptor = $convert.base64Decode(
    'CgxUYWdzT3ZlcnZpZXcSFAoFdGFnSWQYASABKAVSBXRhZ0lkEg4KAmRlGAIgASgJUgJkZRIOCg'
    'JlbhgDIAEoCVICZW4=');

@$core.Deprecated('Use ratingTagDescriptor instead')
const RatingTag$json = {
  '1': 'RatingTag',
  '2': [
    {'1': 'tagId', '3': 1, '4': 1, '5': 5, '10': 'tagId'},
    {'1': 'points', '3': 2, '4': 1, '5': 1, '10': 'points'},
  ],
};

/// Descriptor for `RatingTag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ratingTagDescriptor = $convert.base64Decode(
    'CglSYXRpbmdUYWcSFAoFdGFnSWQYASABKAVSBXRhZ0lkEhYKBnBvaW50cxgCIAEoAVIGcG9pbn'
    'Rz');

@$core.Deprecated('Use ratingTagNewRequestDescriptor instead')
const RatingTagNewRequest$json = {
  '1': 'RatingTagNewRequest',
  '2': [
    {'1': 'tagId', '3': 1, '4': 1, '5': 5, '10': 'tagId'},
    {'1': 'points', '3': 2, '4': 1, '5': 5, '10': 'points'},
  ],
};

/// Descriptor for `RatingTagNewRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ratingTagNewRequestDescriptor = $convert.base64Decode(
    'ChNSYXRpbmdUYWdOZXdSZXF1ZXN0EhQKBXRhZ0lkGAEgASgFUgV0YWdJZBIWCgZwb2ludHMYAi'
    'ABKAVSBnBvaW50cw==');

@$core.Deprecated('Use ratingTagResultDescriptor instead')
const RatingTagResult$json = {
  '1': 'RatingTagResult',
  '2': [
    {'1': 'tagId', '3': 1, '4': 1, '5': 5, '10': 'tagId'},
    {'1': 'avg', '3': 2, '4': 1, '5': 1, '10': 'avg'},
    {'1': 'std', '3': 3, '4': 1, '5': 1, '10': 'std'},
    {'1': 'min', '3': 4, '4': 1, '5': 5, '10': 'min'},
    {'1': 'max', '3': 5, '4': 1, '5': 5, '10': 'max'},
  ],
};

/// Descriptor for `RatingTagResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ratingTagResultDescriptor = $convert.base64Decode(
    'Cg9SYXRpbmdUYWdSZXN1bHQSFAoFdGFnSWQYASABKAVSBXRhZ0lkEhAKA2F2ZxgCIAEoAVIDYX'
    'ZnEhAKA3N0ZBgDIAEoAVIDc3RkEhAKA21pbhgEIAEoBVIDbWluEhAKA21heBgFIAEoBVIDbWF4');

@$core.Deprecated('Use getCafeteriaReplyDescriptor instead')
const GetCafeteriaReply$json = {
  '1': 'GetCafeteriaReply',
  '2': [
    {'1': 'cafeteria', '3': 1, '4': 3, '5': 11, '6': '.api.Cafeteria', '10': 'cafeteria'},
  ],
};

/// Descriptor for `GetCafeteriaReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCafeteriaReplyDescriptor = $convert.base64Decode(
    'ChFHZXRDYWZldGVyaWFSZXBseRIsCgljYWZldGVyaWEYASADKAsyDi5hcGkuQ2FmZXRlcmlhUg'
    'ljYWZldGVyaWE=');

@$core.Deprecated('Use cafeteriaDescriptor instead')
const Cafeteria$json = {
  '1': 'Cafeteria',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
    {'1': 'longitude', '3': 3, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'latitude', '3': 4, '4': 1, '5': 1, '10': 'latitude'},
  ],
};

/// Descriptor for `Cafeteria`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cafeteriaDescriptor = $convert.base64Decode(
    'CglDYWZldGVyaWESDgoCaWQYASABKAlSAmlkEhgKB2FkZHJlc3MYAiABKAlSB2FkZHJlc3MSHA'
    'oJbG9uZ2l0dWRlGAMgASgBUglsb25naXR1ZGUSGgoIbGF0aXR1ZGUYBCABKAFSCGxhdGl0dWRl');

@$core.Deprecated('Use getDishesRequestDescriptor instead')
const GetDishesRequest$json = {
  '1': 'GetDishesRequest',
  '2': [
    {'1': 'cafeteriaId', '3': 1, '4': 1, '5': 9, '10': 'cafeteriaId'},
    {'1': 'year', '3': 2, '4': 1, '5': 5, '10': 'year'},
    {'1': 'week', '3': 3, '4': 1, '5': 5, '10': 'week'},
    {'1': 'day', '3': 4, '4': 1, '5': 5, '10': 'day'},
  ],
};

/// Descriptor for `GetDishesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDishesRequestDescriptor = $convert.base64Decode(
    'ChBHZXREaXNoZXNSZXF1ZXN0EiAKC2NhZmV0ZXJpYUlkGAEgASgJUgtjYWZldGVyaWFJZBISCg'
    'R5ZWFyGAIgASgFUgR5ZWFyEhIKBHdlZWsYAyABKAVSBHdlZWsSEAoDZGF5GAQgASgFUgNkYXk=');

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

@$core.Deprecated('Use getResponsiblePersonReplyDescriptor instead')
const GetResponsiblePersonReply$json = {
  '1': 'GetResponsiblePersonReply',
  '2': [
    {'1': 'responsiblePerson', '3': 1, '4': 3, '5': 11, '6': '.api.ResponsiblePersonElement', '10': 'responsiblePerson'},
  ],
};

/// Descriptor for `GetResponsiblePersonReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResponsiblePersonReplyDescriptor = $convert.base64Decode(
    'ChlHZXRSZXNwb25zaWJsZVBlcnNvblJlcGx5EksKEXJlc3BvbnNpYmxlUGVyc29uGAEgAygLMh'
    '0uYXBpLlJlc3BvbnNpYmxlUGVyc29uRWxlbWVudFIRcmVzcG9uc2libGVQZXJzb24=');

@$core.Deprecated('Use responsiblePersonElementDescriptor instead')
const ResponsiblePersonElement$json = {
  '1': 'ResponsiblePersonElement',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'telephone', '3': 2, '4': 1, '5': 9, '10': 'telephone'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'faculty', '3': 4, '4': 1, '5': 9, '10': 'faculty'},
    {'1': 'tumID', '3': 5, '4': 1, '5': 9, '10': 'tumID'},
  ],
};

/// Descriptor for `ResponsiblePersonElement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responsiblePersonElementDescriptor = $convert.base64Decode(
    'ChhSZXNwb25zaWJsZVBlcnNvbkVsZW1lbnQSEgoEbmFtZRgBIAEoCVIEbmFtZRIcCgl0ZWxlcG'
    'hvbmUYAiABKAlSCXRlbGVwaG9uZRIUCgVlbWFpbBgDIAEoCVIFZW1haWwSGAoHZmFjdWx0eRgE'
    'IAEoCVIHZmFjdWx0eRIUCgV0dW1JRBgFIAEoCVIFdHVtSUQ=');

@$core.Deprecated('Use getBuilding2GpsReplyDescriptor instead')
const GetBuilding2GpsReply$json = {
  '1': 'GetBuilding2GpsReply',
  '2': [
    {'1': 'building2Gps', '3': 1, '4': 3, '5': 11, '6': '.api.Building2GpsElement', '10': 'building2Gps'},
  ],
};

/// Descriptor for `GetBuilding2GpsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBuilding2GpsReplyDescriptor = $convert.base64Decode(
    'ChRHZXRCdWlsZGluZzJHcHNSZXBseRI8CgxidWlsZGluZzJHcHMYASADKAsyGC5hcGkuQnVpbG'
    'RpbmcyR3BzRWxlbWVudFIMYnVpbGRpbmcyR3Bz');

@$core.Deprecated('Use building2GpsElementDescriptor instead')
const Building2GpsElement$json = {
  '1': 'Building2GpsElement',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'latitude', '3': 2, '4': 1, '5': 9, '10': 'latitude'},
    {'1': 'longitude', '3': 3, '4': 1, '5': 9, '10': 'longitude'},
  ],
};

/// Descriptor for `Building2GpsElement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List building2GpsElementDescriptor = $convert.base64Decode(
    'ChNCdWlsZGluZzJHcHNFbGVtZW50Eg4KAmlkGAEgASgJUgJpZBIaCghsYXRpdHVkZRgCIAEoCV'
    'IIbGF0aXR1ZGUSHAoJbG9uZ2l0dWRlGAMgASgJUglsb25naXR1ZGU=');

@$core.Deprecated('Use getAreaFacilitiesByBuildingNrReplyDescriptor instead')
const GetAreaFacilitiesByBuildingNrReply$json = {
  '1': 'GetAreaFacilitiesByBuildingNrReply',
  '2': [
    {'1': 'areaFacilitiesByBuildingNr', '3': 1, '4': 3, '5': 11, '6': '.api.RoomInformationElement', '10': 'areaFacilitiesByBuildingNr'},
  ],
};

/// Descriptor for `GetAreaFacilitiesByBuildingNrReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAreaFacilitiesByBuildingNrReplyDescriptor = $convert.base64Decode(
    'CiJHZXRBcmVhRmFjaWxpdGllc0J5QnVpbGRpbmdOclJlcGx5ElsKGmFyZWFGYWNpbGl0aWVzQn'
    'lCdWlsZGluZ05yGAEgAygLMhsuYXBpLlJvb21JbmZvcm1hdGlvbkVsZW1lbnRSGmFyZWFGYWNp'
    'bGl0aWVzQnlCdWlsZGluZ05y');

@$core.Deprecated('Use getAreaFacilitiesByBuildingNrRequestDescriptor instead')
const GetAreaFacilitiesByBuildingNrRequest$json = {
  '1': 'GetAreaFacilitiesByBuildingNrRequest',
  '2': [
    {'1': 'building_nr', '3': 1, '4': 1, '5': 9, '10': 'buildingNr'},
  ],
};

/// Descriptor for `GetAreaFacilitiesByBuildingNrRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAreaFacilitiesByBuildingNrRequestDescriptor = $convert.base64Decode(
    'CiRHZXRBcmVhRmFjaWxpdGllc0J5QnVpbGRpbmdOclJlcXVlc3QSHwoLYnVpbGRpbmdfbnIYAS'
    'ABKAlSCmJ1aWxkaW5nTnI=');

@$core.Deprecated('Use getListOfToiletsReplyDescriptor instead')
const GetListOfToiletsReply$json = {
  '1': 'GetListOfToiletsReply',
  '2': [
    {'1': 'listOfToilets', '3': 1, '4': 3, '5': 11, '6': '.api.RoomInformationElement', '10': 'listOfToilets'},
  ],
};

/// Descriptor for `GetListOfToiletsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getListOfToiletsReplyDescriptor = $convert.base64Decode(
    'ChVHZXRMaXN0T2ZUb2lsZXRzUmVwbHkSQQoNbGlzdE9mVG9pbGV0cxgBIAMoCzIbLmFwaS5Sb2'
    '9tSW5mb3JtYXRpb25FbGVtZW50Ug1saXN0T2ZUb2lsZXRz');

@$core.Deprecated('Use roomInformationElementDescriptor instead')
const RoomInformationElement$json = {
  '1': 'RoomInformationElement',
  '2': [
    {'1': 'roomId', '3': 1, '4': 1, '5': 5, '10': 'roomId'},
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
    'ChZSb29tSW5mb3JtYXRpb25FbGVtZW50EhYKBnJvb21JZBgBIAEoBVIGcm9vbUlkEhsKCXJvb2'
    '1fY29kZRgCIAEoCVIIcm9vbUNvZGUSHwoLYnVpbGRpbmdfbnIYAyABKAlSCmJ1aWxkaW5nTnIS'
    'FwoHYXJjaF9pZBgEIAEoCVIGYXJjaElkEhIKBGluZm8YBSABKAlSBGluZm8SGAoHYWRkcmVzcx'
    'gGIAEoCVIHYWRkcmVzcxIYCgdwdXJwb3NlGAcgASgJUgdwdXJwb3NlEhYKBmNhbXB1cxgIIAEo'
    'CVIGY2FtcHVzEhIKBG5hbWUYCSABKAlSBG5hbWU=');

@$core.Deprecated('Use getListOfElevatorsReplyDescriptor instead')
const GetListOfElevatorsReply$json = {
  '1': 'GetListOfElevatorsReply',
  '2': [
    {'1': 'listOfElevators', '3': 1, '4': 3, '5': 11, '6': '.api.RoomInformationElement', '10': 'listOfElevators'},
  ],
};

/// Descriptor for `GetListOfElevatorsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getListOfElevatorsReplyDescriptor = $convert.base64Decode(
    'ChdHZXRMaXN0T2ZFbGV2YXRvcnNSZXBseRJFCg9saXN0T2ZFbGV2YXRvcnMYASADKAsyGy5hcG'
    'kuUm9vbUluZm9ybWF0aW9uRWxlbWVudFIPbGlzdE9mRWxldmF0b3Jz');

@$core.Deprecated('Use getMoreInformationReplyDescriptor instead')
const GetMoreInformationReply$json = {
  '1': 'GetMoreInformationReply',
  '2': [
    {'1': 'information', '3': 1, '4': 3, '5': 11, '6': '.api.MoreInformationElement', '10': 'information'},
  ],
};

/// Descriptor for `GetMoreInformationReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMoreInformationReplyDescriptor = $convert.base64Decode(
    'ChdHZXRNb3JlSW5mb3JtYXRpb25SZXBseRI9CgtpbmZvcm1hdGlvbhgBIAMoCzIbLmFwaS5Nb3'
    'JlSW5mb3JtYXRpb25FbGVtZW50UgtpbmZvcm1hdGlvbg==');

@$core.Deprecated('Use moreInformationElementDescriptor instead')
const MoreInformationElement$json = {
  '1': 'MoreInformationElement',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'category', '3': 2, '4': 1, '5': 9, '10': 'category'},
    {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `MoreInformationElement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moreInformationElementDescriptor = $convert.base64Decode(
    'ChZNb3JlSW5mb3JtYXRpb25FbGVtZW50EhQKBXRpdGxlGAEgASgJUgV0aXRsZRIaCghjYXRlZ2'
    '9yeRgCIAEoCVIIY2F0ZWdvcnkSEAoDdXJsGAMgASgJUgN1cmw=');

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
    {'1': 'version', '3': 1, '4': 1, '5': 5, '10': 'version'},
  ],
};

/// Descriptor for `GetUpdateNoteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUpdateNoteRequestDescriptor = $convert.base64Decode(
    'ChRHZXRVcGRhdGVOb3RlUmVxdWVzdBIYCgd2ZXJzaW9uGAEgASgFUgd2ZXJzaW9u');

@$core.Deprecated('Use getUpdateNoteReplyDescriptor instead')
const GetUpdateNoteReply$json = {
  '1': 'GetUpdateNoteReply',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `GetUpdateNoteReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUpdateNoteReplyDescriptor = $convert.base64Decode(
    'ChJHZXRVcGRhdGVOb3RlUmVwbHkSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

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
    {'1': 'roomId', '3': 2, '4': 1, '5': 5, '10': 'roomId'},
    {'1': 'room_code', '3': 3, '4': 1, '5': 9, '10': 'roomCode'},
    {'1': 'room_name', '3': 4, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'building_name', '3': 5, '4': 1, '5': 9, '10': 'buildingName'},
  ],
};

/// Descriptor for `StudyRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List studyRoomDescriptor = $convert.base64Decode(
    'CglTdHVkeVJvb20SGQoIZ3JvdXBfaWQYASABKAVSB2dyb3VwSWQSFgoGcm9vbUlkGAIgASgFUg'
    'Zyb29tSWQSGwoJcm9vbV9jb2RlGAMgASgJUghyb29tQ29kZRIbCglyb29tX25hbWUYBCABKAlS'
    'CHJvb21OYW1lEiMKDWJ1aWxkaW5nX25hbWUYBSABKAlSDGJ1aWxkaW5nTmFtZQ==');

@$core.Deprecated('Use getEventListRequestDescriptor instead')
const GetEventListRequest$json = {
  '1': 'GetEventListRequest',
  '2': [
    {'1': 'eventId', '3': 1, '4': 1, '5': 5, '10': 'eventId'},
  ],
};

/// Descriptor for `GetEventListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEventListRequestDescriptor = $convert.base64Decode(
    'ChNHZXRFdmVudExpc3RSZXF1ZXN0EhgKB2V2ZW50SWQYASABKAVSB2V2ZW50SWQ=');

@$core.Deprecated('Use getEventListReplyDescriptor instead')
const GetEventListReply$json = {
  '1': 'GetEventListReply',
  '2': [
    {'1': 'events', '3': 1, '4': 3, '5': 11, '6': '.api.EventListMsgElement', '10': 'events'},
  ],
};

/// Descriptor for `GetEventListReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEventListReplyDescriptor = $convert.base64Decode(
    'ChFHZXRFdmVudExpc3RSZXBseRIwCgZldmVudHMYASADKAsyGC5hcGkuRXZlbnRMaXN0TXNnRW'
    'xlbWVudFIGZXZlbnRz');

@$core.Deprecated('Use eventListMsgElementDescriptor instead')
const EventListMsgElement$json = {
  '1': 'EventListMsgElement',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'path', '3': 2, '4': 1, '5': 9, '10': 'path'},
    {'1': 'event', '3': 3, '4': 1, '5': 5, '10': 'event'},
    {'1': 'news', '3': 4, '4': 1, '5': 5, '10': 'news'},
    {'1': 'kino', '3': 5, '4': 1, '5': 5, '10': 'kino'},
    {'1': 'file', '3': 6, '4': 1, '5': 5, '10': 'file'},
    {'1': 'title', '3': 7, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 8, '4': 1, '5': 9, '10': 'description'},
    {'1': 'locality', '3': 9, '4': 1, '5': 9, '10': 'locality'},
    {'1': 'link', '3': 10, '4': 1, '5': 9, '10': 'link'},
    {'1': 'start', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'start'},
    {'1': 'end', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'end'},
    {'1': 'ticket_group', '3': 13, '4': 1, '5': 5, '10': 'ticketGroup'},
  ],
};

/// Descriptor for `EventListMsgElement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventListMsgElementDescriptor = $convert.base64Decode(
    'ChNFdmVudExpc3RNc2dFbGVtZW50EhIKBG5hbWUYASABKAlSBG5hbWUSEgoEcGF0aBgCIAEoCV'
    'IEcGF0aBIUCgVldmVudBgDIAEoBVIFZXZlbnQSEgoEbmV3cxgEIAEoBVIEbmV3cxISCgRraW5v'
    'GAUgASgFUgRraW5vEhIKBGZpbGUYBiABKAVSBGZpbGUSFAoFdGl0bGUYByABKAlSBXRpdGxlEi'
    'AKC2Rlc2NyaXB0aW9uGAggASgJUgtkZXNjcmlwdGlvbhIaCghsb2NhbGl0eRgJIAEoCVIIbG9j'
    'YWxpdHkSEgoEbGluaxgKIAEoCVIEbGluaxIwCgVzdGFydBgLIAEoCzIaLmdvb2dsZS5wcm90b2'
    'J1Zi5UaW1lc3RhbXBSBXN0YXJ0EiwKA2VuZBgMIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1l'
    'c3RhbXBSA2VuZBIhCgx0aWNrZXRfZ3JvdXAYDSABKAVSC3RpY2tldEdyb3Vw');

@$core.Deprecated('Use getKinoRequestDescriptor instead')
const GetKinoRequest$json = {
  '1': 'GetKinoRequest',
  '2': [
    {'1': 'lastId', '3': 1, '4': 1, '5': 5, '10': 'lastId'},
  ],
};

/// Descriptor for `GetKinoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getKinoRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRLaW5vUmVxdWVzdBIWCgZsYXN0SWQYASABKAVSBmxhc3RJZA==');

@$core.Deprecated('Use getKinoReplyDescriptor instead')
const GetKinoReply$json = {
  '1': 'GetKinoReply',
  '2': [
    {'1': 'kinos', '3': 1, '4': 3, '5': 11, '6': '.api.KinoMsgElement', '10': 'kinos'},
  ],
};

/// Descriptor for `GetKinoReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getKinoReplyDescriptor = $convert.base64Decode(
    'CgxHZXRLaW5vUmVwbHkSKQoFa2lub3MYASADKAsyEy5hcGkuS2lub01zZ0VsZW1lbnRSBWtpbm'
    '9z');

@$core.Deprecated('Use kinoMsgElementDescriptor instead')
const KinoMsgElement$json = {
  '1': 'KinoMsgElement',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'path', '3': 2, '4': 1, '5': 9, '10': 'path'},
    {'1': 'kino', '3': 3, '4': 1, '5': 5, '10': 'kino'},
    {'1': 'date', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'date'},
    {'1': 'created', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'created'},
    {'1': 'title', '3': 6, '4': 1, '5': 9, '10': 'title'},
    {'1': 'year', '3': 7, '4': 1, '5': 9, '10': 'year'},
    {'1': 'runtime', '3': 8, '4': 1, '5': 9, '10': 'runtime'},
    {'1': 'genre', '3': 9, '4': 1, '5': 9, '10': 'genre'},
    {'1': 'director', '3': 10, '4': 1, '5': 9, '10': 'director'},
    {'1': 'actors', '3': 11, '4': 1, '5': 9, '10': 'actors'},
    {'1': 'rating', '3': 12, '4': 1, '5': 9, '10': 'rating'},
    {'1': 'description', '3': 13, '4': 1, '5': 9, '10': 'description'},
    {'1': 'cover', '3': 14, '4': 1, '5': 5, '10': 'cover'},
    {'1': 'trailer', '3': 15, '4': 1, '5': 9, '10': 'trailer'},
    {'1': 'link', '3': 16, '4': 1, '5': 9, '10': 'link'},
  ],
};

/// Descriptor for `KinoMsgElement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List kinoMsgElementDescriptor = $convert.base64Decode(
    'Cg5LaW5vTXNnRWxlbWVudBISCgRuYW1lGAEgASgJUgRuYW1lEhIKBHBhdGgYAiABKAlSBHBhdG'
    'gSEgoEa2lubxgDIAEoBVIEa2lubxIuCgRkYXRlGAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRp'
    'bWVzdGFtcFIEZGF0ZRI0CgdjcmVhdGVkGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdG'
    'FtcFIHY3JlYXRlZBIUCgV0aXRsZRgGIAEoCVIFdGl0bGUSEgoEeWVhchgHIAEoCVIEeWVhchIY'
    'CgdydW50aW1lGAggASgJUgdydW50aW1lEhQKBWdlbnJlGAkgASgJUgVnZW5yZRIaCghkaXJlY3'
    'RvchgKIAEoCVIIZGlyZWN0b3ISFgoGYWN0b3JzGAsgASgJUgZhY3RvcnMSFgoGcmF0aW5nGAwg'
    'ASgJUgZyYXRpbmcSIAoLZGVzY3JpcHRpb24YDSABKAlSC2Rlc2NyaXB0aW9uEhQKBWNvdmVyGA'
    '4gASgFUgVjb3ZlchIYCgd0cmFpbGVyGA8gASgJUgd0cmFpbGVyEhIKBGxpbmsYECABKAlSBGxp'
    'bms=');

@$core.Deprecated('Use sendFeedbackRequestDescriptor instead')
const SendFeedbackRequest$json = {
  '1': 'SendFeedbackRequest',
  '2': [
    {'1': 'topic', '3': 1, '4': 1, '5': 9, '10': 'topic'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'emailId', '3': 3, '4': 1, '5': 9, '10': 'emailId'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
    {'1': 'image_count', '3': 5, '4': 1, '5': 5, '10': 'imageCount'},
    {'1': 'latitude', '3': 6, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 7, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'osVersion', '3': 8, '4': 1, '5': 9, '10': 'osVersion'},
    {'1': 'appVersion', '3': 9, '4': 1, '5': 9, '10': 'appVersion'},
  ],
};

/// Descriptor for `SendFeedbackRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendFeedbackRequestDescriptor = $convert.base64Decode(
    'ChNTZW5kRmVlZGJhY2tSZXF1ZXN0EhQKBXRvcGljGAEgASgJUgV0b3BpYxIUCgVlbWFpbBgCIA'
    'EoCVIFZW1haWwSGAoHZW1haWxJZBgDIAEoCVIHZW1haWxJZBIYCgdtZXNzYWdlGAQgASgJUgdt'
    'ZXNzYWdlEh8KC2ltYWdlX2NvdW50GAUgASgFUgppbWFnZUNvdW50EhoKCGxhdGl0dWRlGAYgAS'
    'gBUghsYXRpdHVkZRIcCglsb25naXR1ZGUYByABKAFSCWxvbmdpdHVkZRIcCglvc1ZlcnNpb24Y'
    'CCABKAlSCW9zVmVyc2lvbhIeCgphcHBWZXJzaW9uGAkgASgJUgphcHBWZXJzaW9u');

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
    {'1': 'imageNr', '3': 2, '4': 1, '5': 5, '10': 'imageNr'},
  ],
};

/// Descriptor for `SendFeedbackImageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendFeedbackImageRequestDescriptor = $convert.base64Decode(
    'ChhTZW5kRmVlZGJhY2tJbWFnZVJlcXVlc3QSDgoCaWQYASABKAVSAmlkEhgKB2ltYWdlTnIYAi'
    'ABKAVSB2ltYWdlTnI=');

@$core.Deprecated('Use getMembersRequestDescriptor instead')
const GetMembersRequest$json = {
  '1': 'GetMembersRequest',
  '2': [
    {'1': 'lrzId', '3': 1, '4': 1, '5': 9, '10': 'lrzId'},
  ],
};

/// Descriptor for `GetMembersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMembersRequestDescriptor = $convert.base64Decode(
    'ChFHZXRNZW1iZXJzUmVxdWVzdBIUCgVscnpJZBgBIAEoCVIFbHJ6SWQ=');

@$core.Deprecated('Use getMembersReplyDescriptor instead')
const GetMembersReply$json = {
  '1': 'GetMembersReply',
  '2': [
    {'1': 'lrzId', '3': 1, '4': 1, '5': 9, '10': 'lrzId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'memberId', '3': 3, '4': 1, '5': 5, '10': 'memberId'},
  ],
};

/// Descriptor for `GetMembersReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMembersReplyDescriptor = $convert.base64Decode(
    'Cg9HZXRNZW1iZXJzUmVwbHkSFAoFbHJ6SWQYASABKAlSBWxyeklkEhIKBG5hbWUYAiABKAlSBG'
    '5hbWUSGgoIbWVtYmVySWQYAyABKAVSCG1lbWJlcklk');

@$core.Deprecated('Use getUploadStatusRequestDescriptor instead')
const GetUploadStatusRequest$json = {
  '1': 'GetUploadStatusRequest',
  '2': [
    {'1': 'lrzId', '3': 1, '4': 1, '5': 9, '10': 'lrzId'},
  ],
};

/// Descriptor for `GetUploadStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUploadStatusRequestDescriptor = $convert.base64Decode(
    'ChZHZXRVcGxvYWRTdGF0dXNSZXF1ZXN0EhQKBWxyeklkGAEgASgJUgVscnpJZA==');

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

@$core.Deprecated('Use getNotificationsReplyDescriptor instead')
const GetNotificationsReply$json = {
  '1': 'GetNotificationsReply',
  '2': [
    {'1': 'notificationId', '3': 1, '4': 1, '5': 5, '10': 'notificationId'},
    {'1': 'type', '3': 2, '4': 1, '5': 5, '10': 'type'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {'1': 'signature', '3': 5, '4': 1, '5': 9, '10': 'signature'},
  ],
};

/// Descriptor for `GetNotificationsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotificationsReplyDescriptor = $convert.base64Decode(
    'ChVHZXROb3RpZmljYXRpb25zUmVwbHkSJgoObm90aWZpY2F0aW9uSWQYASABKAVSDm5vdGlmaW'
    'NhdGlvbklkEhIKBHR5cGUYAiABKAVSBHR5cGUSFAoFdGl0bGUYAyABKAlSBXRpdGxlEiAKC2Rl'
    'c2NyaXB0aW9uGAQgASgJUgtkZXNjcmlwdGlvbhIcCglzaWduYXR1cmUYBSABKAlSCXNpZ25hdH'
    'VyZQ==');

@$core.Deprecated('Use notificationsRequestDescriptor instead')
const NotificationsRequest$json = {
  '1': 'NotificationsRequest',
  '2': [
    {'1': 'notificationId', '3': 1, '4': 1, '5': 5, '10': 'notificationId'},
  ],
};

/// Descriptor for `NotificationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationsRequestDescriptor = $convert.base64Decode(
    'ChROb3RpZmljYXRpb25zUmVxdWVzdBImCg5ub3RpZmljYXRpb25JZBgBIAEoBVIObm90aWZpY2'
    'F0aW9uSWQ=');

@$core.Deprecated('Use getNotificationsConfirmReplyDescriptor instead')
const GetNotificationsConfirmReply$json = {
  '1': 'GetNotificationsConfirmReply',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `GetNotificationsConfirmReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotificationsConfirmReplyDescriptor = $convert.base64Decode(
    'ChxHZXROb3RpZmljYXRpb25zQ29uZmlybVJlcGx5EhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVz');

@$core.Deprecated('Use getCanteenHeadCountRequestDescriptor instead')
const GetCanteenHeadCountRequest$json = {
  '1': 'GetCanteenHeadCountRequest',
  '2': [
    {'1': 'canteenId', '3': 1, '4': 1, '5': 9, '10': 'canteenId'},
  ],
};

/// Descriptor for `GetCanteenHeadCountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCanteenHeadCountRequestDescriptor = $convert.base64Decode(
    'ChpHZXRDYW50ZWVuSGVhZENvdW50UmVxdWVzdBIcCgljYW50ZWVuSWQYASABKAlSCWNhbnRlZW'
    '5JZA==');

@$core.Deprecated('Use getCanteenHeadCountReplyDescriptor instead')
const GetCanteenHeadCountReply$json = {
  '1': 'GetCanteenHeadCountReply',
  '2': [
    {'1': 'count', '3': 1, '4': 1, '5': 13, '10': 'count'},
    {'1': 'maxCount', '3': 2, '4': 1, '5': 13, '10': 'maxCount'},
    {'1': 'percent', '3': 3, '4': 1, '5': 2, '10': 'percent'},
    {'1': 'timestamp', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
  ],
};

/// Descriptor for `GetCanteenHeadCountReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCanteenHeadCountReplyDescriptor = $convert.base64Decode(
    'ChhHZXRDYW50ZWVuSGVhZENvdW50UmVwbHkSFAoFY291bnQYASABKA1SBWNvdW50EhoKCG1heE'
    'NvdW50GAIgASgNUghtYXhDb3VudBIYCgdwZXJjZW50GAMgASgCUgdwZXJjZW50EjgKCXRpbWVz'
    'dGFtcBgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXRpbWVzdGFtcA==');

