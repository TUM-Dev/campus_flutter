//
//  Generated code. Do not modify.
//  source: campus.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'campus.pb.dart' as $1;
import 'google/protobuf/empty.pb.dart' as $0;

export 'campus.pb.dart';

@$pb.GrpcServiceName('api.Campus')
class CampusClient extends $grpc.Client {
  static final _$getTopNews = $grpc.ClientMethod<$0.Empty, $1.GetTopNewsReply>(
      '/api.Campus/GetTopNews',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetTopNewsReply.fromBuffer(value));
  static final _$getNewsSources = $grpc.ClientMethod<$0.Empty, $1.NewsSourceArray>(
      '/api.Campus/GetNewsSources',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.NewsSourceArray.fromBuffer(value));
  static final _$searchRooms = $grpc.ClientMethod<$1.SearchRoomsRequest, $1.SearchRoomsReply>(
      '/api.Campus/SearchRooms',
      ($1.SearchRoomsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.SearchRoomsReply.fromBuffer(value));
  static final _$getLocations = $grpc.ClientMethod<$1.GetLocationsRequest, $1.GetLocationsReply>(
      '/api.Campus/GetLocations',
      ($1.GetLocationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetLocationsReply.fromBuffer(value));
  static final _$getRoomMaps = $grpc.ClientMethod<$1.GetRoomMapsRequest, $1.GetRoomMapsReply>(
      '/api.Campus/GetRoomMaps',
      ($1.GetRoomMapsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetRoomMapsReply.fromBuffer(value));
  static final _$getRoomCoordinates = $grpc.ClientMethod<$1.GetRoomCoordinatesRequest, $1.GetRoomCoordinatesReply>(
      '/api.Campus/GetRoomCoordinates',
      ($1.GetRoomCoordinatesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetRoomCoordinatesReply.fromBuffer(value));
  static final _$getRoomSchedule = $grpc.ClientMethod<$1.GetRoomScheduleRequest, $1.GetRoomScheduleReply>(
      '/api.Campus/GetRoomSchedule',
      ($1.GetRoomScheduleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetRoomScheduleReply.fromBuffer(value));
  static final _$getCafeteriaRatings = $grpc.ClientMethod<$1.CafeteriaRatingRequest, $1.CafeteriaRatingReply>(
      '/api.Campus/GetCafeteriaRatings',
      ($1.CafeteriaRatingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CafeteriaRatingReply.fromBuffer(value));
  static final _$getDishRatings = $grpc.ClientMethod<$1.DishRatingRequest, $1.DishRatingReply>(
      '/api.Campus/GetDishRatings',
      ($1.DishRatingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.DishRatingReply.fromBuffer(value));
  static final _$newCafeteriaRating = $grpc.ClientMethod<$1.NewCafeteriaRatingRequest, $0.Empty>(
      '/api.Campus/NewCafeteriaRating',
      ($1.NewCafeteriaRatingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$newDishRating = $grpc.ClientMethod<$1.NewDishRatingRequest, $0.Empty>(
      '/api.Campus/NewDishRating',
      ($1.NewDishRatingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getAvailableDishTags = $grpc.ClientMethod<$0.Empty, $1.GetTagsReply>(
      '/api.Campus/GetAvailableDishTags',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetTagsReply.fromBuffer(value));
  static final _$getNameTags = $grpc.ClientMethod<$0.Empty, $1.GetTagsReply>(
      '/api.Campus/GetNameTags',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetTagsReply.fromBuffer(value));
  static final _$getAvailableCafeteriaTags = $grpc.ClientMethod<$0.Empty, $1.GetTagsReply>(
      '/api.Campus/GetAvailableCafeteriaTags',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetTagsReply.fromBuffer(value));
  static final _$getCafeterias = $grpc.ClientMethod<$0.Empty, $1.GetCafeteriaReply>(
      '/api.Campus/GetCafeterias',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetCafeteriaReply.fromBuffer(value));
  static final _$getDishes = $grpc.ClientMethod<$1.GetDishesRequest, $1.GetDishesReply>(
      '/api.Campus/GetDishes',
      ($1.GetDishesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetDishesReply.fromBuffer(value));
  static final _$getResponsiblePerson = $grpc.ClientMethod<$0.Empty, $1.GetResponsiblePersonReply>(
      '/api.Campus/GetResponsiblePerson',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetResponsiblePersonReply.fromBuffer(value));
  static final _$getBuilding2Gps = $grpc.ClientMethod<$0.Empty, $1.GetBuilding2GpsReply>(
      '/api.Campus/GetBuilding2Gps',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetBuilding2GpsReply.fromBuffer(value));
  static final _$getAreaFacilitiesByBuildingNr = $grpc.ClientMethod<$1.GetAreaFacilitiesByBuildingNrRequest, $1.GetAreaFacilitiesByBuildingNrReply>(
      '/api.Campus/GetAreaFacilitiesByBuildingNr',
      ($1.GetAreaFacilitiesByBuildingNrRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetAreaFacilitiesByBuildingNrReply.fromBuffer(value));
  static final _$getListOfToilets = $grpc.ClientMethod<$0.Empty, $1.GetListOfToiletsReply>(
      '/api.Campus/GetListOfToilets',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetListOfToiletsReply.fromBuffer(value));
  static final _$getListOfElevators = $grpc.ClientMethod<$0.Empty, $1.GetListOfElevatorsReply>(
      '/api.Campus/GetListOfElevators',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetListOfElevatorsReply.fromBuffer(value));
  static final _$getMoreInformation = $grpc.ClientMethod<$0.Empty, $1.GetMoreInformationReply>(
      '/api.Campus/GetMoreInformation',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetMoreInformationReply.fromBuffer(value));
  static final _$getOpeningTimes = $grpc.ClientMethod<$1.GetOpeningTimesRequest, $1.GetOpeningTimesReply>(
      '/api.Campus/GetOpeningTimes',
      ($1.GetOpeningTimesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetOpeningTimesReply.fromBuffer(value));
  static final _$getUpdateNote = $grpc.ClientMethod<$1.GetUpdateNoteRequest, $1.GetUpdateNoteReply>(
      '/api.Campus/GetUpdateNote',
      ($1.GetUpdateNoteRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetUpdateNoteReply.fromBuffer(value));
  static final _$getStudyRoomList = $grpc.ClientMethod<$0.Empty, $1.GetStudyRoomListReply>(
      '/api.Campus/GetStudyRoomList',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetStudyRoomListReply.fromBuffer(value));
  static final _$getEventList = $grpc.ClientMethod<$1.GetEventListRequest, $1.GetEventListReply>(
      '/api.Campus/GetEventList',
      ($1.GetEventListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetEventListReply.fromBuffer(value));
  static final _$getKino = $grpc.ClientMethod<$1.GetKinoRequest, $1.GetKinoReply>(
      '/api.Campus/GetKino',
      ($1.GetKinoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetKinoReply.fromBuffer(value));
  static final _$sendFeedback = $grpc.ClientMethod<$1.SendFeedbackRequest, $1.SendFeedbackImageReply>(
      '/api.Campus/SendFeedback',
      ($1.SendFeedbackRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.SendFeedbackImageReply.fromBuffer(value));
  static final _$sendFeedbackImage = $grpc.ClientMethod<$1.SendFeedbackImageRequest, $1.SendFeedbackImageReply>(
      '/api.Campus/SendFeedbackImage',
      ($1.SendFeedbackImageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.SendFeedbackImageReply.fromBuffer(value));
  static final _$getUploadStatus = $grpc.ClientMethod<$1.GetUploadStatusRequest, $1.GetUploadStatusReply>(
      '/api.Campus/GetUploadStatus',
      ($1.GetUploadStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetUploadStatusReply.fromBuffer(value));
  static final _$getNotification = $grpc.ClientMethod<$1.NotificationsRequest, $1.GetNotificationsReply>(
      '/api.Campus/GetNotification',
      ($1.NotificationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetNotificationsReply.fromBuffer(value));
  static final _$getNotificationConfirm = $grpc.ClientMethod<$1.NotificationsRequest, $1.GetNotificationsConfirmReply>(
      '/api.Campus/GetNotificationConfirm',
      ($1.NotificationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetNotificationsConfirmReply.fromBuffer(value));
  static final _$getMembers = $grpc.ClientMethod<$1.GetMembersRequest, $1.GetMembersReply>(
      '/api.Campus/GetMembers',
      ($1.GetMembersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetMembersReply.fromBuffer(value));
  static final _$getCanteenHeadCount = $grpc.ClientMethod<$1.GetCanteenHeadCountRequest, $1.GetCanteenHeadCountReply>(
      '/api.Campus/GetCanteenHeadCount',
      ($1.GetCanteenHeadCountRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetCanteenHeadCountReply.fromBuffer(value));
  static final _$iOSDeviceRequestResponse = $grpc.ClientMethod<$1.IOSDeviceRequestResponseRequest, $1.IOSDeviceRequestResponseReply>(
      '/api.Campus/IOSDeviceRequestResponse',
      ($1.IOSDeviceRequestResponseRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.IOSDeviceRequestResponseReply.fromBuffer(value));
  static final _$registerDevice = $grpc.ClientMethod<$1.RegisterDeviceRequest, $1.RegisterDeviceReply>(
      '/api.Campus/RegisterDevice',
      ($1.RegisterDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.RegisterDeviceReply.fromBuffer(value));
  static final _$removeDevice = $grpc.ClientMethod<$1.RemoveDeviceRequest, $1.RemoveDeviceReply>(
      '/api.Campus/RemoveDevice',
      ($1.RemoveDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.RemoveDeviceReply.fromBuffer(value));

  CampusClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.GetTopNewsReply> getTopNews($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTopNews, request, options: options);
  }

  $grpc.ResponseFuture<$1.NewsSourceArray> getNewsSources($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNewsSources, request, options: options);
  }

  $grpc.ResponseFuture<$1.SearchRoomsReply> searchRooms($1.SearchRoomsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$searchRooms, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetLocationsReply> getLocations($1.GetLocationsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLocations, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetRoomMapsReply> getRoomMaps($1.GetRoomMapsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRoomMaps, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetRoomCoordinatesReply> getRoomCoordinates($1.GetRoomCoordinatesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRoomCoordinates, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetRoomScheduleReply> getRoomSchedule($1.GetRoomScheduleRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRoomSchedule, request, options: options);
  }

  $grpc.ResponseFuture<$1.CafeteriaRatingReply> getCafeteriaRatings($1.CafeteriaRatingRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCafeteriaRatings, request, options: options);
  }

  $grpc.ResponseFuture<$1.DishRatingReply> getDishRatings($1.DishRatingRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDishRatings, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> newCafeteriaRating($1.NewCafeteriaRatingRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$newCafeteriaRating, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> newDishRating($1.NewDishRatingRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$newDishRating, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetTagsReply> getAvailableDishTags($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAvailableDishTags, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetTagsReply> getNameTags($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNameTags, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetTagsReply> getAvailableCafeteriaTags($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAvailableCafeteriaTags, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetCafeteriaReply> getCafeterias($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCafeterias, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetDishesReply> getDishes($1.GetDishesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDishes, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetResponsiblePersonReply> getResponsiblePerson($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getResponsiblePerson, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetBuilding2GpsReply> getBuilding2Gps($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBuilding2Gps, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetAreaFacilitiesByBuildingNrReply> getAreaFacilitiesByBuildingNr($1.GetAreaFacilitiesByBuildingNrRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAreaFacilitiesByBuildingNr, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetListOfToiletsReply> getListOfToilets($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getListOfToilets, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetListOfElevatorsReply> getListOfElevators($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getListOfElevators, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetMoreInformationReply> getMoreInformation($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMoreInformation, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetOpeningTimesReply> getOpeningTimes($1.GetOpeningTimesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOpeningTimes, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetUpdateNoteReply> getUpdateNote($1.GetUpdateNoteRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUpdateNote, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetStudyRoomListReply> getStudyRoomList($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStudyRoomList, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetEventListReply> getEventList($1.GetEventListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getEventList, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetKinoReply> getKino($1.GetKinoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getKino, request, options: options);
  }

  $grpc.ResponseFuture<$1.SendFeedbackImageReply> sendFeedback($1.SendFeedbackRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendFeedback, request, options: options);
  }

  $grpc.ResponseFuture<$1.SendFeedbackImageReply> sendFeedbackImage($1.SendFeedbackImageRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendFeedbackImage, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetUploadStatusReply> getUploadStatus($1.GetUploadStatusRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUploadStatus, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetNotificationsReply> getNotification($1.NotificationsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNotification, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetNotificationsConfirmReply> getNotificationConfirm($1.NotificationsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNotificationConfirm, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetMembersReply> getMembers($1.GetMembersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMembers, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetCanteenHeadCountReply> getCanteenHeadCount($1.GetCanteenHeadCountRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCanteenHeadCount, request, options: options);
  }

  $grpc.ResponseFuture<$1.IOSDeviceRequestResponseReply> iOSDeviceRequestResponse($1.IOSDeviceRequestResponseRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$iOSDeviceRequestResponse, request, options: options);
  }

  $grpc.ResponseFuture<$1.RegisterDeviceReply> registerDevice($1.RegisterDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$registerDevice, request, options: options);
  }

  $grpc.ResponseFuture<$1.RemoveDeviceReply> removeDevice($1.RemoveDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeDevice, request, options: options);
  }
}

@$pb.GrpcServiceName('api.Campus')
abstract class CampusServiceBase extends $grpc.Service {
  $core.String get $name => 'api.Campus';

  CampusServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GetTopNewsReply>(
        'GetTopNews',
        getTopNews_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GetTopNewsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.NewsSourceArray>(
        'GetNewsSources',
        getNewsSources_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.NewsSourceArray value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SearchRoomsRequest, $1.SearchRoomsReply>(
        'SearchRooms',
        searchRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SearchRoomsRequest.fromBuffer(value),
        ($1.SearchRoomsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetLocationsRequest, $1.GetLocationsReply>(
        'GetLocations',
        getLocations_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetLocationsRequest.fromBuffer(value),
        ($1.GetLocationsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetRoomMapsRequest, $1.GetRoomMapsReply>(
        'GetRoomMaps',
        getRoomMaps_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetRoomMapsRequest.fromBuffer(value),
        ($1.GetRoomMapsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetRoomCoordinatesRequest, $1.GetRoomCoordinatesReply>(
        'GetRoomCoordinates',
        getRoomCoordinates_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetRoomCoordinatesRequest.fromBuffer(value),
        ($1.GetRoomCoordinatesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetRoomScheduleRequest, $1.GetRoomScheduleReply>(
        'GetRoomSchedule',
        getRoomSchedule_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetRoomScheduleRequest.fromBuffer(value),
        ($1.GetRoomScheduleReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CafeteriaRatingRequest, $1.CafeteriaRatingReply>(
        'GetCafeteriaRatings',
        getCafeteriaRatings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CafeteriaRatingRequest.fromBuffer(value),
        ($1.CafeteriaRatingReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DishRatingRequest, $1.DishRatingReply>(
        'GetDishRatings',
        getDishRatings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DishRatingRequest.fromBuffer(value),
        ($1.DishRatingReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.NewCafeteriaRatingRequest, $0.Empty>(
        'NewCafeteriaRating',
        newCafeteriaRating_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.NewCafeteriaRatingRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.NewDishRatingRequest, $0.Empty>(
        'NewDishRating',
        newDishRating_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.NewDishRatingRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GetTagsReply>(
        'GetAvailableDishTags',
        getAvailableDishTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GetTagsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GetTagsReply>(
        'GetNameTags',
        getNameTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GetTagsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GetTagsReply>(
        'GetAvailableCafeteriaTags',
        getAvailableCafeteriaTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GetTagsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GetCafeteriaReply>(
        'GetCafeterias',
        getCafeterias_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GetCafeteriaReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetDishesRequest, $1.GetDishesReply>(
        'GetDishes',
        getDishes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetDishesRequest.fromBuffer(value),
        ($1.GetDishesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GetResponsiblePersonReply>(
        'GetResponsiblePerson',
        getResponsiblePerson_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GetResponsiblePersonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GetBuilding2GpsReply>(
        'GetBuilding2Gps',
        getBuilding2Gps_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GetBuilding2GpsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetAreaFacilitiesByBuildingNrRequest, $1.GetAreaFacilitiesByBuildingNrReply>(
        'GetAreaFacilitiesByBuildingNr',
        getAreaFacilitiesByBuildingNr_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetAreaFacilitiesByBuildingNrRequest.fromBuffer(value),
        ($1.GetAreaFacilitiesByBuildingNrReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GetListOfToiletsReply>(
        'GetListOfToilets',
        getListOfToilets_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GetListOfToiletsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GetListOfElevatorsReply>(
        'GetListOfElevators',
        getListOfElevators_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GetListOfElevatorsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GetMoreInformationReply>(
        'GetMoreInformation',
        getMoreInformation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GetMoreInformationReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetOpeningTimesRequest, $1.GetOpeningTimesReply>(
        'GetOpeningTimes',
        getOpeningTimes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetOpeningTimesRequest.fromBuffer(value),
        ($1.GetOpeningTimesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetUpdateNoteRequest, $1.GetUpdateNoteReply>(
        'GetUpdateNote',
        getUpdateNote_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetUpdateNoteRequest.fromBuffer(value),
        ($1.GetUpdateNoteReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GetStudyRoomListReply>(
        'GetStudyRoomList',
        getStudyRoomList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GetStudyRoomListReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetEventListRequest, $1.GetEventListReply>(
        'GetEventList',
        getEventList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetEventListRequest.fromBuffer(value),
        ($1.GetEventListReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetKinoRequest, $1.GetKinoReply>(
        'GetKino',
        getKino_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetKinoRequest.fromBuffer(value),
        ($1.GetKinoReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SendFeedbackRequest, $1.SendFeedbackImageReply>(
        'SendFeedback',
        sendFeedback_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SendFeedbackRequest.fromBuffer(value),
        ($1.SendFeedbackImageReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SendFeedbackImageRequest, $1.SendFeedbackImageReply>(
        'SendFeedbackImage',
        sendFeedbackImage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SendFeedbackImageRequest.fromBuffer(value),
        ($1.SendFeedbackImageReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetUploadStatusRequest, $1.GetUploadStatusReply>(
        'GetUploadStatus',
        getUploadStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetUploadStatusRequest.fromBuffer(value),
        ($1.GetUploadStatusReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.NotificationsRequest, $1.GetNotificationsReply>(
        'GetNotification',
        getNotification_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.NotificationsRequest.fromBuffer(value),
        ($1.GetNotificationsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.NotificationsRequest, $1.GetNotificationsConfirmReply>(
        'GetNotificationConfirm',
        getNotificationConfirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.NotificationsRequest.fromBuffer(value),
        ($1.GetNotificationsConfirmReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetMembersRequest, $1.GetMembersReply>(
        'GetMembers',
        getMembers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetMembersRequest.fromBuffer(value),
        ($1.GetMembersReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetCanteenHeadCountRequest, $1.GetCanteenHeadCountReply>(
        'GetCanteenHeadCount',
        getCanteenHeadCount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetCanteenHeadCountRequest.fromBuffer(value),
        ($1.GetCanteenHeadCountReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.IOSDeviceRequestResponseRequest, $1.IOSDeviceRequestResponseReply>(
        'IOSDeviceRequestResponse',
        iOSDeviceRequestResponse_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.IOSDeviceRequestResponseRequest.fromBuffer(value),
        ($1.IOSDeviceRequestResponseReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RegisterDeviceRequest, $1.RegisterDeviceReply>(
        'RegisterDevice',
        registerDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RegisterDeviceRequest.fromBuffer(value),
        ($1.RegisterDeviceReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RemoveDeviceRequest, $1.RemoveDeviceReply>(
        'RemoveDevice',
        removeDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RemoveDeviceRequest.fromBuffer(value),
        ($1.RemoveDeviceReply value) => value.writeToBuffer()));
  }

  $async.Future<$1.GetTopNewsReply> getTopNews_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getTopNews(call, await request);
  }

  $async.Future<$1.NewsSourceArray> getNewsSources_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getNewsSources(call, await request);
  }

  $async.Future<$1.SearchRoomsReply> searchRooms_Pre($grpc.ServiceCall call, $async.Future<$1.SearchRoomsRequest> request) async {
    return searchRooms(call, await request);
  }

  $async.Future<$1.GetLocationsReply> getLocations_Pre($grpc.ServiceCall call, $async.Future<$1.GetLocationsRequest> request) async {
    return getLocations(call, await request);
  }

  $async.Future<$1.GetRoomMapsReply> getRoomMaps_Pre($grpc.ServiceCall call, $async.Future<$1.GetRoomMapsRequest> request) async {
    return getRoomMaps(call, await request);
  }

  $async.Future<$1.GetRoomCoordinatesReply> getRoomCoordinates_Pre($grpc.ServiceCall call, $async.Future<$1.GetRoomCoordinatesRequest> request) async {
    return getRoomCoordinates(call, await request);
  }

  $async.Future<$1.GetRoomScheduleReply> getRoomSchedule_Pre($grpc.ServiceCall call, $async.Future<$1.GetRoomScheduleRequest> request) async {
    return getRoomSchedule(call, await request);
  }

  $async.Future<$1.CafeteriaRatingReply> getCafeteriaRatings_Pre($grpc.ServiceCall call, $async.Future<$1.CafeteriaRatingRequest> request) async {
    return getCafeteriaRatings(call, await request);
  }

  $async.Future<$1.DishRatingReply> getDishRatings_Pre($grpc.ServiceCall call, $async.Future<$1.DishRatingRequest> request) async {
    return getDishRatings(call, await request);
  }

  $async.Future<$0.Empty> newCafeteriaRating_Pre($grpc.ServiceCall call, $async.Future<$1.NewCafeteriaRatingRequest> request) async {
    return newCafeteriaRating(call, await request);
  }

  $async.Future<$0.Empty> newDishRating_Pre($grpc.ServiceCall call, $async.Future<$1.NewDishRatingRequest> request) async {
    return newDishRating(call, await request);
  }

  $async.Future<$1.GetTagsReply> getAvailableDishTags_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getAvailableDishTags(call, await request);
  }

  $async.Future<$1.GetTagsReply> getNameTags_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getNameTags(call, await request);
  }

  $async.Future<$1.GetTagsReply> getAvailableCafeteriaTags_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getAvailableCafeteriaTags(call, await request);
  }

  $async.Future<$1.GetCafeteriaReply> getCafeterias_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getCafeterias(call, await request);
  }

  $async.Future<$1.GetDishesReply> getDishes_Pre($grpc.ServiceCall call, $async.Future<$1.GetDishesRequest> request) async {
    return getDishes(call, await request);
  }

  $async.Future<$1.GetResponsiblePersonReply> getResponsiblePerson_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getResponsiblePerson(call, await request);
  }

  $async.Future<$1.GetBuilding2GpsReply> getBuilding2Gps_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getBuilding2Gps(call, await request);
  }

  $async.Future<$1.GetAreaFacilitiesByBuildingNrReply> getAreaFacilitiesByBuildingNr_Pre($grpc.ServiceCall call, $async.Future<$1.GetAreaFacilitiesByBuildingNrRequest> request) async {
    return getAreaFacilitiesByBuildingNr(call, await request);
  }

  $async.Future<$1.GetListOfToiletsReply> getListOfToilets_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getListOfToilets(call, await request);
  }

  $async.Future<$1.GetListOfElevatorsReply> getListOfElevators_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getListOfElevators(call, await request);
  }

  $async.Future<$1.GetMoreInformationReply> getMoreInformation_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getMoreInformation(call, await request);
  }

  $async.Future<$1.GetOpeningTimesReply> getOpeningTimes_Pre($grpc.ServiceCall call, $async.Future<$1.GetOpeningTimesRequest> request) async {
    return getOpeningTimes(call, await request);
  }

  $async.Future<$1.GetUpdateNoteReply> getUpdateNote_Pre($grpc.ServiceCall call, $async.Future<$1.GetUpdateNoteRequest> request) async {
    return getUpdateNote(call, await request);
  }

  $async.Future<$1.GetStudyRoomListReply> getStudyRoomList_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getStudyRoomList(call, await request);
  }

  $async.Future<$1.GetEventListReply> getEventList_Pre($grpc.ServiceCall call, $async.Future<$1.GetEventListRequest> request) async {
    return getEventList(call, await request);
  }

  $async.Future<$1.GetKinoReply> getKino_Pre($grpc.ServiceCall call, $async.Future<$1.GetKinoRequest> request) async {
    return getKino(call, await request);
  }

  $async.Future<$1.SendFeedbackImageReply> sendFeedback_Pre($grpc.ServiceCall call, $async.Future<$1.SendFeedbackRequest> request) async {
    return sendFeedback(call, await request);
  }

  $async.Future<$1.SendFeedbackImageReply> sendFeedbackImage_Pre($grpc.ServiceCall call, $async.Future<$1.SendFeedbackImageRequest> request) async {
    return sendFeedbackImage(call, await request);
  }

  $async.Future<$1.GetUploadStatusReply> getUploadStatus_Pre($grpc.ServiceCall call, $async.Future<$1.GetUploadStatusRequest> request) async {
    return getUploadStatus(call, await request);
  }

  $async.Future<$1.GetNotificationsReply> getNotification_Pre($grpc.ServiceCall call, $async.Future<$1.NotificationsRequest> request) async {
    return getNotification(call, await request);
  }

  $async.Future<$1.GetNotificationsConfirmReply> getNotificationConfirm_Pre($grpc.ServiceCall call, $async.Future<$1.NotificationsRequest> request) async {
    return getNotificationConfirm(call, await request);
  }

  $async.Future<$1.GetMembersReply> getMembers_Pre($grpc.ServiceCall call, $async.Future<$1.GetMembersRequest> request) async {
    return getMembers(call, await request);
  }

  $async.Future<$1.GetCanteenHeadCountReply> getCanteenHeadCount_Pre($grpc.ServiceCall call, $async.Future<$1.GetCanteenHeadCountRequest> request) async {
    return getCanteenHeadCount(call, await request);
  }

  $async.Future<$1.IOSDeviceRequestResponseReply> iOSDeviceRequestResponse_Pre($grpc.ServiceCall call, $async.Future<$1.IOSDeviceRequestResponseRequest> request) async {
    return iOSDeviceRequestResponse(call, await request);
  }

  $async.Future<$1.RegisterDeviceReply> registerDevice_Pre($grpc.ServiceCall call, $async.Future<$1.RegisterDeviceRequest> request) async {
    return registerDevice(call, await request);
  }

  $async.Future<$1.RemoveDeviceReply> removeDevice_Pre($grpc.ServiceCall call, $async.Future<$1.RemoveDeviceRequest> request) async {
    return removeDevice(call, await request);
  }

  $async.Future<$1.GetTopNewsReply> getTopNews($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.NewsSourceArray> getNewsSources($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.SearchRoomsReply> searchRooms($grpc.ServiceCall call, $1.SearchRoomsRequest request);
  $async.Future<$1.GetLocationsReply> getLocations($grpc.ServiceCall call, $1.GetLocationsRequest request);
  $async.Future<$1.GetRoomMapsReply> getRoomMaps($grpc.ServiceCall call, $1.GetRoomMapsRequest request);
  $async.Future<$1.GetRoomCoordinatesReply> getRoomCoordinates($grpc.ServiceCall call, $1.GetRoomCoordinatesRequest request);
  $async.Future<$1.GetRoomScheduleReply> getRoomSchedule($grpc.ServiceCall call, $1.GetRoomScheduleRequest request);
  $async.Future<$1.CafeteriaRatingReply> getCafeteriaRatings($grpc.ServiceCall call, $1.CafeteriaRatingRequest request);
  $async.Future<$1.DishRatingReply> getDishRatings($grpc.ServiceCall call, $1.DishRatingRequest request);
  $async.Future<$0.Empty> newCafeteriaRating($grpc.ServiceCall call, $1.NewCafeteriaRatingRequest request);
  $async.Future<$0.Empty> newDishRating($grpc.ServiceCall call, $1.NewDishRatingRequest request);
  $async.Future<$1.GetTagsReply> getAvailableDishTags($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.GetTagsReply> getNameTags($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.GetTagsReply> getAvailableCafeteriaTags($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.GetCafeteriaReply> getCafeterias($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.GetDishesReply> getDishes($grpc.ServiceCall call, $1.GetDishesRequest request);
  $async.Future<$1.GetResponsiblePersonReply> getResponsiblePerson($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.GetBuilding2GpsReply> getBuilding2Gps($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.GetAreaFacilitiesByBuildingNrReply> getAreaFacilitiesByBuildingNr($grpc.ServiceCall call, $1.GetAreaFacilitiesByBuildingNrRequest request);
  $async.Future<$1.GetListOfToiletsReply> getListOfToilets($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.GetListOfElevatorsReply> getListOfElevators($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.GetMoreInformationReply> getMoreInformation($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.GetOpeningTimesReply> getOpeningTimes($grpc.ServiceCall call, $1.GetOpeningTimesRequest request);
  $async.Future<$1.GetUpdateNoteReply> getUpdateNote($grpc.ServiceCall call, $1.GetUpdateNoteRequest request);
  $async.Future<$1.GetStudyRoomListReply> getStudyRoomList($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.GetEventListReply> getEventList($grpc.ServiceCall call, $1.GetEventListRequest request);
  $async.Future<$1.GetKinoReply> getKino($grpc.ServiceCall call, $1.GetKinoRequest request);
  $async.Future<$1.SendFeedbackImageReply> sendFeedback($grpc.ServiceCall call, $1.SendFeedbackRequest request);
  $async.Future<$1.SendFeedbackImageReply> sendFeedbackImage($grpc.ServiceCall call, $1.SendFeedbackImageRequest request);
  $async.Future<$1.GetUploadStatusReply> getUploadStatus($grpc.ServiceCall call, $1.GetUploadStatusRequest request);
  $async.Future<$1.GetNotificationsReply> getNotification($grpc.ServiceCall call, $1.NotificationsRequest request);
  $async.Future<$1.GetNotificationsConfirmReply> getNotificationConfirm($grpc.ServiceCall call, $1.NotificationsRequest request);
  $async.Future<$1.GetMembersReply> getMembers($grpc.ServiceCall call, $1.GetMembersRequest request);
  $async.Future<$1.GetCanteenHeadCountReply> getCanteenHeadCount($grpc.ServiceCall call, $1.GetCanteenHeadCountRequest request);
  $async.Future<$1.IOSDeviceRequestResponseReply> iOSDeviceRequestResponse($grpc.ServiceCall call, $1.IOSDeviceRequestResponseRequest request);
  $async.Future<$1.RegisterDeviceReply> registerDevice($grpc.ServiceCall call, $1.RegisterDeviceRequest request);
  $async.Future<$1.RemoveDeviceReply> removeDevice($grpc.ServiceCall call, $1.RemoveDeviceRequest request);
}
