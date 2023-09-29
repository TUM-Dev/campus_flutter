//
//  Generated code. Do not modify.
//  source: tumdev/campus_backend.proto
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

import 'campus_backend.pb.dart' as $0;

export 'campus_backend.pb.dart';

@$pb.GrpcServiceName('api.Campus')
class CampusClient extends $grpc.Client {
  static final _$getTopNews = $grpc.ClientMethod<$0.GetTopNewsRequest, $0.GetTopNewsReply>(
      '/api.Campus/GetTopNews',
      ($0.GetTopNewsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetTopNewsReply.fromBuffer(value));
  static final _$getNewsSources = $grpc.ClientMethod<$0.GetNewsSourcesRequest, $0.GetNewsSourcesReply>(
      '/api.Campus/GetNewsSources',
      ($0.GetNewsSourcesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetNewsSourcesReply.fromBuffer(value));
  static final _$getNews = $grpc.ClientMethod<$0.GetNewsRequest, $0.GetNewsReply>(
      '/api.Campus/GetNews',
      ($0.GetNewsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetNewsReply.fromBuffer(value));
  static final _$searchRooms = $grpc.ClientMethod<$0.SearchRoomsRequest, $0.SearchRoomsReply>(
      '/api.Campus/SearchRooms',
      ($0.SearchRoomsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SearchRoomsReply.fromBuffer(value));
  static final _$getCanteenRatings = $grpc.ClientMethod<$0.GetCanteenRatingsRequest, $0.GetCanteenRatingsReply>(
      '/api.Campus/GetCanteenRatings',
      ($0.GetCanteenRatingsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetCanteenRatingsReply.fromBuffer(value));
  static final _$getDishRatings = $grpc.ClientMethod<$0.GetDishRatingsRequest, $0.GetDishRatingsReply>(
      '/api.Campus/GetDishRatings',
      ($0.GetDishRatingsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetDishRatingsReply.fromBuffer(value));
  static final _$newCanteenRating = $grpc.ClientMethod<$0.NewCanteenRatingRequest, $0.NewCanteenRatingReply>(
      '/api.Campus/NewCanteenRating',
      ($0.NewCanteenRatingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.NewCanteenRatingReply.fromBuffer(value));
  static final _$newDishRating = $grpc.ClientMethod<$0.NewDishRatingRequest, $0.NewDishRatingReply>(
      '/api.Campus/NewDishRating',
      ($0.NewDishRatingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.NewDishRatingReply.fromBuffer(value));
  static final _$getAvailableDishTags = $grpc.ClientMethod<$0.GetAvailableDishTagsRequest, $0.GetAvailableDishTagsReply>(
      '/api.Campus/GetAvailableDishTags',
      ($0.GetAvailableDishTagsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetAvailableDishTagsReply.fromBuffer(value));
  static final _$getNameTags = $grpc.ClientMethod<$0.GetNameTagsRequest, $0.GetNameTagsReply>(
      '/api.Campus/GetNameTags',
      ($0.GetNameTagsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetNameTagsReply.fromBuffer(value));
  static final _$getAvailableCanteenTags = $grpc.ClientMethod<$0.GetAvailableCanteenTagsRequest, $0.GetAvailableCanteenTagsReply>(
      '/api.Campus/GetAvailableCanteenTags',
      ($0.GetAvailableCanteenTagsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetAvailableCanteenTagsReply.fromBuffer(value));
  static final _$getCanteens = $grpc.ClientMethod<$0.GetCanteensRequest, $0.GetCanteensReply>(
      '/api.Campus/GetCanteens',
      ($0.GetCanteensRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetCanteensReply.fromBuffer(value));
  static final _$getDishes = $grpc.ClientMethod<$0.GetDishesRequest, $0.GetDishesReply>(
      '/api.Campus/GetDishes',
      ($0.GetDishesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetDishesReply.fromBuffer(value));
  static final _$getResponsiblePerson = $grpc.ClientMethod<$0.GetResponsiblePersonRequest, $0.GetResponsiblePersonReply>(
      '/api.Campus/GetResponsiblePerson',
      ($0.GetResponsiblePersonRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetResponsiblePersonReply.fromBuffer(value));
  static final _$getMoreInformation = $grpc.ClientMethod<$0.GetMoreInformationRequest, $0.GetMoreInformationReply>(
      '/api.Campus/GetMoreInformation',
      ($0.GetMoreInformationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetMoreInformationReply.fromBuffer(value));
  static final _$getOpeningTimes = $grpc.ClientMethod<$0.GetOpeningTimesRequest, $0.GetOpeningTimesReply>(
      '/api.Campus/GetOpeningTimes',
      ($0.GetOpeningTimesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetOpeningTimesReply.fromBuffer(value));
  static final _$getUpdateNote = $grpc.ClientMethod<$0.GetUpdateNoteRequest, $0.GetUpdateNoteReply>(
      '/api.Campus/GetUpdateNote',
      ($0.GetUpdateNoteRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUpdateNoteReply.fromBuffer(value));
  static final _$getStudyRoomList = $grpc.ClientMethod<$0.GetStudyRoomListRequest, $0.GetStudyRoomListReply>(
      '/api.Campus/GetStudyRoomList',
      ($0.GetStudyRoomListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetStudyRoomListReply.fromBuffer(value));
  static final _$getMovies = $grpc.ClientMethod<$0.GetMoviesRequest, $0.GetMoviesReply>(
      '/api.Campus/GetMovies',
      ($0.GetMoviesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetMoviesReply.fromBuffer(value));
  static final _$sendFeedback = $grpc.ClientMethod<$0.SendFeedbackRequest, $0.SendFeedbackReply>(
      '/api.Campus/SendFeedback',
      ($0.SendFeedbackRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SendFeedbackReply.fromBuffer(value));
  static final _$sendFeedbackImage = $grpc.ClientMethod<$0.SendFeedbackImageRequest, $0.SendFeedbackImageReply>(
      '/api.Campus/SendFeedbackImage',
      ($0.SendFeedbackImageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SendFeedbackImageReply.fromBuffer(value));
  static final _$getUploadStatus = $grpc.ClientMethod<$0.GetUploadStatusRequest, $0.GetUploadStatusReply>(
      '/api.Campus/GetUploadStatus',
      ($0.GetUploadStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUploadStatusReply.fromBuffer(value));
  static final _$getNotification = $grpc.ClientMethod<$0.GetNotificationRequest, $0.GetNotificationReply>(
      '/api.Campus/GetNotification',
      ($0.GetNotificationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetNotificationReply.fromBuffer(value));
  static final _$getNotificationConfirm = $grpc.ClientMethod<$0.GetNotificationConfirmRequest, $0.GetNotificationConfirmReply>(
      '/api.Campus/GetNotificationConfirm',
      ($0.GetNotificationConfirmRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetNotificationConfirmReply.fromBuffer(value));
  static final _$getMembers = $grpc.ClientMethod<$0.GetMembersRequest, $0.GetMembersReply>(
      '/api.Campus/GetMembers',
      ($0.GetMembersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetMembersReply.fromBuffer(value));
  static final _$getCanteenHeadCount = $grpc.ClientMethod<$0.GetCanteenHeadCountRequest, $0.GetCanteenHeadCountReply>(
      '/api.Campus/GetCanteenHeadCount',
      ($0.GetCanteenHeadCountRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetCanteenHeadCountReply.fromBuffer(value));
  static final _$iOSDeviceRequestResponse = $grpc.ClientMethod<$0.IOSDeviceRequestResponseRequest, $0.IOSDeviceRequestResponseReply>(
      '/api.Campus/IOSDeviceRequestResponse',
      ($0.IOSDeviceRequestResponseRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.IOSDeviceRequestResponseReply.fromBuffer(value));
  static final _$registerDevice = $grpc.ClientMethod<$0.RegisterDeviceRequest, $0.RegisterDeviceReply>(
      '/api.Campus/RegisterDevice',
      ($0.RegisterDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RegisterDeviceReply.fromBuffer(value));
  static final _$removeDevice = $grpc.ClientMethod<$0.RemoveDeviceRequest, $0.RemoveDeviceReply>(
      '/api.Campus/RemoveDevice',
      ($0.RemoveDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RemoveDeviceReply.fromBuffer(value));

  CampusClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetTopNewsReply> getTopNews($0.GetTopNewsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTopNews, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetNewsSourcesReply> getNewsSources($0.GetNewsSourcesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNewsSources, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetNewsReply> getNews($0.GetNewsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNews, request, options: options);
  }

  $grpc.ResponseFuture<$0.SearchRoomsReply> searchRooms($0.SearchRoomsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$searchRooms, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetCanteenRatingsReply> getCanteenRatings($0.GetCanteenRatingsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCanteenRatings, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetDishRatingsReply> getDishRatings($0.GetDishRatingsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDishRatings, request, options: options);
  }

  $grpc.ResponseFuture<$0.NewCanteenRatingReply> newCanteenRating($0.NewCanteenRatingRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$newCanteenRating, request, options: options);
  }

  $grpc.ResponseFuture<$0.NewDishRatingReply> newDishRating($0.NewDishRatingRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$newDishRating, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetAvailableDishTagsReply> getAvailableDishTags($0.GetAvailableDishTagsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAvailableDishTags, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetNameTagsReply> getNameTags($0.GetNameTagsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNameTags, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetAvailableCanteenTagsReply> getAvailableCanteenTags($0.GetAvailableCanteenTagsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAvailableCanteenTags, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetCanteensReply> getCanteens($0.GetCanteensRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCanteens, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetDishesReply> getDishes($0.GetDishesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDishes, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetResponsiblePersonReply> getResponsiblePerson($0.GetResponsiblePersonRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getResponsiblePerson, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetMoreInformationReply> getMoreInformation($0.GetMoreInformationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMoreInformation, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetOpeningTimesReply> getOpeningTimes($0.GetOpeningTimesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOpeningTimes, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUpdateNoteReply> getUpdateNote($0.GetUpdateNoteRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUpdateNote, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetStudyRoomListReply> getStudyRoomList($0.GetStudyRoomListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStudyRoomList, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetMoviesReply> getMovies($0.GetMoviesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMovies, request, options: options);
  }

  $grpc.ResponseFuture<$0.SendFeedbackReply> sendFeedback($0.SendFeedbackRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendFeedback, request, options: options);
  }

  $grpc.ResponseFuture<$0.SendFeedbackImageReply> sendFeedbackImage($0.SendFeedbackImageRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendFeedbackImage, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUploadStatusReply> getUploadStatus($0.GetUploadStatusRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUploadStatus, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetNotificationReply> getNotification($0.GetNotificationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNotification, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetNotificationConfirmReply> getNotificationConfirm($0.GetNotificationConfirmRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNotificationConfirm, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetMembersReply> getMembers($0.GetMembersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMembers, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetCanteenHeadCountReply> getCanteenHeadCount($0.GetCanteenHeadCountRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCanteenHeadCount, request, options: options);
  }

  $grpc.ResponseFuture<$0.IOSDeviceRequestResponseReply> iOSDeviceRequestResponse($0.IOSDeviceRequestResponseRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$iOSDeviceRequestResponse, request, options: options);
  }

  $grpc.ResponseFuture<$0.RegisterDeviceReply> registerDevice($0.RegisterDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$registerDevice, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemoveDeviceReply> removeDevice($0.RemoveDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeDevice, request, options: options);
  }
}

@$pb.GrpcServiceName('api.Campus')
abstract class CampusServiceBase extends $grpc.Service {
  $core.String get $name => 'api.Campus';

  CampusServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetTopNewsRequest, $0.GetTopNewsReply>(
        'GetTopNews',
        getTopNews_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTopNewsRequest.fromBuffer(value),
        ($0.GetTopNewsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetNewsSourcesRequest, $0.GetNewsSourcesReply>(
        'GetNewsSources',
        getNewsSources_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetNewsSourcesRequest.fromBuffer(value),
        ($0.GetNewsSourcesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetNewsRequest, $0.GetNewsReply>(
        'GetNews',
        getNews_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetNewsRequest.fromBuffer(value),
        ($0.GetNewsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SearchRoomsRequest, $0.SearchRoomsReply>(
        'SearchRooms',
        searchRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SearchRoomsRequest.fromBuffer(value),
        ($0.SearchRoomsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetCanteenRatingsRequest, $0.GetCanteenRatingsReply>(
        'GetCanteenRatings',
        getCanteenRatings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetCanteenRatingsRequest.fromBuffer(value),
        ($0.GetCanteenRatingsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetDishRatingsRequest, $0.GetDishRatingsReply>(
        'GetDishRatings',
        getDishRatings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetDishRatingsRequest.fromBuffer(value),
        ($0.GetDishRatingsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NewCanteenRatingRequest, $0.NewCanteenRatingReply>(
        'NewCanteenRating',
        newCanteenRating_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.NewCanteenRatingRequest.fromBuffer(value),
        ($0.NewCanteenRatingReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NewDishRatingRequest, $0.NewDishRatingReply>(
        'NewDishRating',
        newDishRating_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.NewDishRatingRequest.fromBuffer(value),
        ($0.NewDishRatingReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAvailableDishTagsRequest, $0.GetAvailableDishTagsReply>(
        'GetAvailableDishTags',
        getAvailableDishTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetAvailableDishTagsRequest.fromBuffer(value),
        ($0.GetAvailableDishTagsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetNameTagsRequest, $0.GetNameTagsReply>(
        'GetNameTags',
        getNameTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetNameTagsRequest.fromBuffer(value),
        ($0.GetNameTagsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAvailableCanteenTagsRequest, $0.GetAvailableCanteenTagsReply>(
        'GetAvailableCanteenTags',
        getAvailableCanteenTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetAvailableCanteenTagsRequest.fromBuffer(value),
        ($0.GetAvailableCanteenTagsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetCanteensRequest, $0.GetCanteensReply>(
        'GetCanteens',
        getCanteens_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetCanteensRequest.fromBuffer(value),
        ($0.GetCanteensReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetDishesRequest, $0.GetDishesReply>(
        'GetDishes',
        getDishes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetDishesRequest.fromBuffer(value),
        ($0.GetDishesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetResponsiblePersonRequest, $0.GetResponsiblePersonReply>(
        'GetResponsiblePerson',
        getResponsiblePerson_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetResponsiblePersonRequest.fromBuffer(value),
        ($0.GetResponsiblePersonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetMoreInformationRequest, $0.GetMoreInformationReply>(
        'GetMoreInformation',
        getMoreInformation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetMoreInformationRequest.fromBuffer(value),
        ($0.GetMoreInformationReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetOpeningTimesRequest, $0.GetOpeningTimesReply>(
        'GetOpeningTimes',
        getOpeningTimes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetOpeningTimesRequest.fromBuffer(value),
        ($0.GetOpeningTimesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUpdateNoteRequest, $0.GetUpdateNoteReply>(
        'GetUpdateNote',
        getUpdateNote_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUpdateNoteRequest.fromBuffer(value),
        ($0.GetUpdateNoteReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetStudyRoomListRequest, $0.GetStudyRoomListReply>(
        'GetStudyRoomList',
        getStudyRoomList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetStudyRoomListRequest.fromBuffer(value),
        ($0.GetStudyRoomListReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetMoviesRequest, $0.GetMoviesReply>(
        'GetMovies',
        getMovies_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetMoviesRequest.fromBuffer(value),
        ($0.GetMoviesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendFeedbackRequest, $0.SendFeedbackReply>(
        'SendFeedback',
        sendFeedback_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendFeedbackRequest.fromBuffer(value),
        ($0.SendFeedbackReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendFeedbackImageRequest, $0.SendFeedbackImageReply>(
        'SendFeedbackImage',
        sendFeedbackImage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendFeedbackImageRequest.fromBuffer(value),
        ($0.SendFeedbackImageReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUploadStatusRequest, $0.GetUploadStatusReply>(
        'GetUploadStatus',
        getUploadStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUploadStatusRequest.fromBuffer(value),
        ($0.GetUploadStatusReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetNotificationRequest, $0.GetNotificationReply>(
        'GetNotification',
        getNotification_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetNotificationRequest.fromBuffer(value),
        ($0.GetNotificationReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetNotificationConfirmRequest, $0.GetNotificationConfirmReply>(
        'GetNotificationConfirm',
        getNotificationConfirm_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetNotificationConfirmRequest.fromBuffer(value),
        ($0.GetNotificationConfirmReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetMembersRequest, $0.GetMembersReply>(
        'GetMembers',
        getMembers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetMembersRequest.fromBuffer(value),
        ($0.GetMembersReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetCanteenHeadCountRequest, $0.GetCanteenHeadCountReply>(
        'GetCanteenHeadCount',
        getCanteenHeadCount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetCanteenHeadCountRequest.fromBuffer(value),
        ($0.GetCanteenHeadCountReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IOSDeviceRequestResponseRequest, $0.IOSDeviceRequestResponseReply>(
        'IOSDeviceRequestResponse',
        iOSDeviceRequestResponse_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IOSDeviceRequestResponseRequest.fromBuffer(value),
        ($0.IOSDeviceRequestResponseReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterDeviceRequest, $0.RegisterDeviceReply>(
        'RegisterDevice',
        registerDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterDeviceRequest.fromBuffer(value),
        ($0.RegisterDeviceReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveDeviceRequest, $0.RemoveDeviceReply>(
        'RemoveDevice',
        removeDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoveDeviceRequest.fromBuffer(value),
        ($0.RemoveDeviceReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetTopNewsReply> getTopNews_Pre($grpc.ServiceCall call, $async.Future<$0.GetTopNewsRequest> request) async {
    return getTopNews(call, await request);
  }

  $async.Future<$0.GetNewsSourcesReply> getNewsSources_Pre($grpc.ServiceCall call, $async.Future<$0.GetNewsSourcesRequest> request) async {
    return getNewsSources(call, await request);
  }

  $async.Future<$0.GetNewsReply> getNews_Pre($grpc.ServiceCall call, $async.Future<$0.GetNewsRequest> request) async {
    return getNews(call, await request);
  }

  $async.Future<$0.SearchRoomsReply> searchRooms_Pre($grpc.ServiceCall call, $async.Future<$0.SearchRoomsRequest> request) async {
    return searchRooms(call, await request);
  }

  $async.Future<$0.GetCanteenRatingsReply> getCanteenRatings_Pre($grpc.ServiceCall call, $async.Future<$0.GetCanteenRatingsRequest> request) async {
    return getCanteenRatings(call, await request);
  }

  $async.Future<$0.GetDishRatingsReply> getDishRatings_Pre($grpc.ServiceCall call, $async.Future<$0.GetDishRatingsRequest> request) async {
    return getDishRatings(call, await request);
  }

  $async.Future<$0.NewCanteenRatingReply> newCanteenRating_Pre($grpc.ServiceCall call, $async.Future<$0.NewCanteenRatingRequest> request) async {
    return newCanteenRating(call, await request);
  }

  $async.Future<$0.NewDishRatingReply> newDishRating_Pre($grpc.ServiceCall call, $async.Future<$0.NewDishRatingRequest> request) async {
    return newDishRating(call, await request);
  }

  $async.Future<$0.GetAvailableDishTagsReply> getAvailableDishTags_Pre($grpc.ServiceCall call, $async.Future<$0.GetAvailableDishTagsRequest> request) async {
    return getAvailableDishTags(call, await request);
  }

  $async.Future<$0.GetNameTagsReply> getNameTags_Pre($grpc.ServiceCall call, $async.Future<$0.GetNameTagsRequest> request) async {
    return getNameTags(call, await request);
  }

  $async.Future<$0.GetAvailableCanteenTagsReply> getAvailableCanteenTags_Pre($grpc.ServiceCall call, $async.Future<$0.GetAvailableCanteenTagsRequest> request) async {
    return getAvailableCanteenTags(call, await request);
  }

  $async.Future<$0.GetCanteensReply> getCanteens_Pre($grpc.ServiceCall call, $async.Future<$0.GetCanteensRequest> request) async {
    return getCanteens(call, await request);
  }

  $async.Future<$0.GetDishesReply> getDishes_Pre($grpc.ServiceCall call, $async.Future<$0.GetDishesRequest> request) async {
    return getDishes(call, await request);
  }

  $async.Future<$0.GetResponsiblePersonReply> getResponsiblePerson_Pre($grpc.ServiceCall call, $async.Future<$0.GetResponsiblePersonRequest> request) async {
    return getResponsiblePerson(call, await request);
  }

  $async.Future<$0.GetMoreInformationReply> getMoreInformation_Pre($grpc.ServiceCall call, $async.Future<$0.GetMoreInformationRequest> request) async {
    return getMoreInformation(call, await request);
  }

  $async.Future<$0.GetOpeningTimesReply> getOpeningTimes_Pre($grpc.ServiceCall call, $async.Future<$0.GetOpeningTimesRequest> request) async {
    return getOpeningTimes(call, await request);
  }

  $async.Future<$0.GetUpdateNoteReply> getUpdateNote_Pre($grpc.ServiceCall call, $async.Future<$0.GetUpdateNoteRequest> request) async {
    return getUpdateNote(call, await request);
  }

  $async.Future<$0.GetStudyRoomListReply> getStudyRoomList_Pre($grpc.ServiceCall call, $async.Future<$0.GetStudyRoomListRequest> request) async {
    return getStudyRoomList(call, await request);
  }

  $async.Future<$0.GetMoviesReply> getMovies_Pre($grpc.ServiceCall call, $async.Future<$0.GetMoviesRequest> request) async {
    return getMovies(call, await request);
  }

  $async.Future<$0.SendFeedbackReply> sendFeedback_Pre($grpc.ServiceCall call, $async.Future<$0.SendFeedbackRequest> request) async {
    return sendFeedback(call, await request);
  }

  $async.Future<$0.SendFeedbackImageReply> sendFeedbackImage_Pre($grpc.ServiceCall call, $async.Future<$0.SendFeedbackImageRequest> request) async {
    return sendFeedbackImage(call, await request);
  }

  $async.Future<$0.GetUploadStatusReply> getUploadStatus_Pre($grpc.ServiceCall call, $async.Future<$0.GetUploadStatusRequest> request) async {
    return getUploadStatus(call, await request);
  }

  $async.Future<$0.GetNotificationReply> getNotification_Pre($grpc.ServiceCall call, $async.Future<$0.GetNotificationRequest> request) async {
    return getNotification(call, await request);
  }

  $async.Future<$0.GetNotificationConfirmReply> getNotificationConfirm_Pre($grpc.ServiceCall call, $async.Future<$0.GetNotificationConfirmRequest> request) async {
    return getNotificationConfirm(call, await request);
  }

  $async.Future<$0.GetMembersReply> getMembers_Pre($grpc.ServiceCall call, $async.Future<$0.GetMembersRequest> request) async {
    return getMembers(call, await request);
  }

  $async.Future<$0.GetCanteenHeadCountReply> getCanteenHeadCount_Pre($grpc.ServiceCall call, $async.Future<$0.GetCanteenHeadCountRequest> request) async {
    return getCanteenHeadCount(call, await request);
  }

  $async.Future<$0.IOSDeviceRequestResponseReply> iOSDeviceRequestResponse_Pre($grpc.ServiceCall call, $async.Future<$0.IOSDeviceRequestResponseRequest> request) async {
    return iOSDeviceRequestResponse(call, await request);
  }

  $async.Future<$0.RegisterDeviceReply> registerDevice_Pre($grpc.ServiceCall call, $async.Future<$0.RegisterDeviceRequest> request) async {
    return registerDevice(call, await request);
  }

  $async.Future<$0.RemoveDeviceReply> removeDevice_Pre($grpc.ServiceCall call, $async.Future<$0.RemoveDeviceRequest> request) async {
    return removeDevice(call, await request);
  }

  $async.Future<$0.GetTopNewsReply> getTopNews($grpc.ServiceCall call, $0.GetTopNewsRequest request);
  $async.Future<$0.GetNewsSourcesReply> getNewsSources($grpc.ServiceCall call, $0.GetNewsSourcesRequest request);
  $async.Future<$0.GetNewsReply> getNews($grpc.ServiceCall call, $0.GetNewsRequest request);
  $async.Future<$0.SearchRoomsReply> searchRooms($grpc.ServiceCall call, $0.SearchRoomsRequest request);
  $async.Future<$0.GetCanteenRatingsReply> getCanteenRatings($grpc.ServiceCall call, $0.GetCanteenRatingsRequest request);
  $async.Future<$0.GetDishRatingsReply> getDishRatings($grpc.ServiceCall call, $0.GetDishRatingsRequest request);
  $async.Future<$0.NewCanteenRatingReply> newCanteenRating($grpc.ServiceCall call, $0.NewCanteenRatingRequest request);
  $async.Future<$0.NewDishRatingReply> newDishRating($grpc.ServiceCall call, $0.NewDishRatingRequest request);
  $async.Future<$0.GetAvailableDishTagsReply> getAvailableDishTags($grpc.ServiceCall call, $0.GetAvailableDishTagsRequest request);
  $async.Future<$0.GetNameTagsReply> getNameTags($grpc.ServiceCall call, $0.GetNameTagsRequest request);
  $async.Future<$0.GetAvailableCanteenTagsReply> getAvailableCanteenTags($grpc.ServiceCall call, $0.GetAvailableCanteenTagsRequest request);
  $async.Future<$0.GetCanteensReply> getCanteens($grpc.ServiceCall call, $0.GetCanteensRequest request);
  $async.Future<$0.GetDishesReply> getDishes($grpc.ServiceCall call, $0.GetDishesRequest request);
  $async.Future<$0.GetResponsiblePersonReply> getResponsiblePerson($grpc.ServiceCall call, $0.GetResponsiblePersonRequest request);
  $async.Future<$0.GetMoreInformationReply> getMoreInformation($grpc.ServiceCall call, $0.GetMoreInformationRequest request);
  $async.Future<$0.GetOpeningTimesReply> getOpeningTimes($grpc.ServiceCall call, $0.GetOpeningTimesRequest request);
  $async.Future<$0.GetUpdateNoteReply> getUpdateNote($grpc.ServiceCall call, $0.GetUpdateNoteRequest request);
  $async.Future<$0.GetStudyRoomListReply> getStudyRoomList($grpc.ServiceCall call, $0.GetStudyRoomListRequest request);
  $async.Future<$0.GetMoviesReply> getMovies($grpc.ServiceCall call, $0.GetMoviesRequest request);
  $async.Future<$0.SendFeedbackReply> sendFeedback($grpc.ServiceCall call, $0.SendFeedbackRequest request);
  $async.Future<$0.SendFeedbackImageReply> sendFeedbackImage($grpc.ServiceCall call, $0.SendFeedbackImageRequest request);
  $async.Future<$0.GetUploadStatusReply> getUploadStatus($grpc.ServiceCall call, $0.GetUploadStatusRequest request);
  $async.Future<$0.GetNotificationReply> getNotification($grpc.ServiceCall call, $0.GetNotificationRequest request);
  $async.Future<$0.GetNotificationConfirmReply> getNotificationConfirm($grpc.ServiceCall call, $0.GetNotificationConfirmRequest request);
  $async.Future<$0.GetMembersReply> getMembers($grpc.ServiceCall call, $0.GetMembersRequest request);
  $async.Future<$0.GetCanteenHeadCountReply> getCanteenHeadCount($grpc.ServiceCall call, $0.GetCanteenHeadCountRequest request);
  $async.Future<$0.IOSDeviceRequestResponseReply> iOSDeviceRequestResponse($grpc.ServiceCall call, $0.IOSDeviceRequestResponseRequest request);
  $async.Future<$0.RegisterDeviceReply> registerDevice($grpc.ServiceCall call, $0.RegisterDeviceRequest request);
  $async.Future<$0.RemoveDeviceReply> removeDevice($grpc.ServiceCall call, $0.RemoveDeviceRequest request);
}
