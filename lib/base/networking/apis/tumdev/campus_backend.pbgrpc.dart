// This is a generated file - do not edit.
//
// Generated from tumdev/campus_backend.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'campus_backend.pb.dart' as $0;

export 'campus_backend.pb.dart';

@$pb.GrpcServiceName('api.Campus')
class CampusClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  CampusClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.ListNewsAlertsReply> listNewsAlerts(
    $0.ListNewsAlertsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listNewsAlerts, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListNewsSourcesReply> listNewsSources(
    $0.ListNewsSourcesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listNewsSources, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListNewsReply> listNews(
    $0.ListNewsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listNews, request, options: options);
  }

  /// This endpoint retrieves Canteen Ratings from the Backend.
  $grpc.ResponseFuture<$0.ListCanteenRatingsReply> listCanteenRatings(
    $0.ListCanteenRatingsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listCanteenRatings, request, options: options);
  }

  /// Allows to query ratings for a specific dish in a specific cafeteria.
  $grpc.ResponseFuture<$0.GetDishRatingsReply> getDishRatings(
    $0.GetDishRatingsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getDishRatings, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateCanteenRatingReply> createCanteenRating(
    $0.CreateCanteenRatingRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createCanteenRating, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateDishRatingReply> createDishRating(
    $0.CreateDishRatingRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createDishRating, request, options: options);
  }

  /// Update a dish rating previously created by the calling device.
  $grpc.ResponseFuture<$0.UpdateDishRatingReply> updateDishRating(
    $0.UpdateDishRatingRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateDishRating, request, options: options);
  }

  /// Delete a dish rating previously created by the calling device.
  $grpc.ResponseFuture<$0.DeleteDishRatingReply> deleteDishRating(
    $0.DeleteDishRatingRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteDishRating, request, options: options);
  }

  /// Report an abusive or invalid dish rating for moderation.
  $grpc.ResponseFuture<$0.ReportDishRatingReply> reportDishRating(
    $0.ReportDishRatingRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$reportDishRating, request, options: options);
  }

  /// Cast or remove a "helpful" vote on a dish rating.
  $grpc.ResponseFuture<$0.VoteDishRatingReply> voteDishRating(
    $0.VoteDishRatingRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$voteDishRating, request, options: options);
  }

  /// Returns a paginated photo strip for a dish, ranked by helpful votes and recency.
  $grpc.ResponseFuture<$0.ListDishPhotosReply> listDishPhotos(
    $0.ListDishPhotosRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listDishPhotos, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListAvailableDishTagsReply> listAvailableDishTags(
    $0.ListAvailableDishTagsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listAvailableDishTags, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListNameTagsReply> listNameTags(
    $0.ListNameTagsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listNameTags, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListAvailableCanteenTagsReply>
      listAvailableCanteenTags(
    $0.ListAvailableCanteenTagsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listAvailableCanteenTags, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ListCanteensReply> listCanteens(
    $0.ListCanteensRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listCanteens, request, options: options);
  }

  /// Returns all dishes for a specific cafeteria, year, week and day
  $grpc.ResponseFuture<$0.ListDishesReply> listDishes(
    $0.ListDishesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listDishes, request, options: options);
  }

  /// Batch-fetches rating summaries (average, count, histogram, tags) for a daily menu or list of dishes.
  $grpc.ResponseFuture<$0.ListDishRatingSummariesReply> listDishRatingSummaries(
    $0.ListDishRatingSummariesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listDishRatingSummaries, request,
        options: options);
  }

  /// Returns the highest-rated dishes served on a given day, ranked by Bayesian weighted average.
  $grpc.ResponseFuture<$0.ListTopRatedDishesReply> listTopRatedDishes(
    $0.ListTopRatedDishesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listTopRatedDishes, request, options: options);
  }

  /// Crowdsourced report that a dish is sold out today (resets automatically at midnight Berlin time).
  $grpc.ResponseFuture<$0.ReportDishSoldOutReply> reportDishSoldOut(
    $0.ReportDishSoldOutRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$reportDishSoldOut, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUpdateNoteReply> getUpdateNote(
    $0.GetUpdateNoteRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getUpdateNote, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListMoviesReply> listMovies(
    $0.ListMoviesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listMovies, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateFeedbackReply> createFeedback(
    $async.Stream<$0.CreateFeedbackRequest> request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(_$createFeedback, request, options: options)
        .single;
  }

  $grpc.ResponseFuture<$0.GetCanteenHeadCountReply> getCanteenHeadCount(
    $0.GetCanteenHeadCountRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getCanteenHeadCount, request, options: options);
  }

  /// Returns live canteen occupancy alongside typical 15-minute weekday busyness curves and quieter-slot hints.
  $grpc.ResponseFuture<$0.GetCanteenBusynessReply> getCanteenBusyness(
    $0.GetCanteenBusynessRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getCanteenBusyness, request, options: options);
  }

  /// Create an device (Android/iOS/Windows) for push notifications
  $grpc.ResponseFuture<$0.CreateDeviceReply> createDevice(
    $0.CreateDeviceRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createDevice, request, options: options);
  }

  /// Delete a device from push notifications
  $grpc.ResponseFuture<$0.DeleteDeviceReply> deleteDevice(
    $0.DeleteDeviceRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteDevice, request, options: options);
  }

  /// List all avaliable student clubs
  @$core.Deprecated('This method is deprecated')
  $grpc.ResponseFuture<$0.ListStudentClubReply> listStudentClub(
    $0.ListStudentClubRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listStudentClub, request, options: options);
  }

  /// List student clubs and student councils, as shown on the "Campus" tab
  $grpc.ResponseFuture<$0.ListStudentGroupReply> listStudentGroup(
    $0.ListStudentGroupRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listStudentGroup, request, options: options);
  }

  /// List TUM libraries with their latest live occupancy estimates.
  $grpc.ResponseFuture<$0.ListLibrariesReply> listLibraries(
    $0.ListLibrariesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listLibraries, request, options: options);
  }

  /// Returns live library occupancy alongside typical 15-minute weekday busyness curves.
  $grpc.ResponseFuture<$0.GetLibraryBusynessReply> getLibraryBusyness(
    $0.GetLibraryBusynessRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getLibraryBusyness, request, options: options);
  }

  // method descriptors

  static final _$listNewsAlerts =
      $grpc.ClientMethod<$0.ListNewsAlertsRequest, $0.ListNewsAlertsReply>(
          '/api.Campus/ListNewsAlerts',
          ($0.ListNewsAlertsRequest value) => value.writeToBuffer(),
          $0.ListNewsAlertsReply.fromBuffer);
  static final _$listNewsSources =
      $grpc.ClientMethod<$0.ListNewsSourcesRequest, $0.ListNewsSourcesReply>(
          '/api.Campus/ListNewsSources',
          ($0.ListNewsSourcesRequest value) => value.writeToBuffer(),
          $0.ListNewsSourcesReply.fromBuffer);
  static final _$listNews =
      $grpc.ClientMethod<$0.ListNewsRequest, $0.ListNewsReply>(
          '/api.Campus/ListNews',
          ($0.ListNewsRequest value) => value.writeToBuffer(),
          $0.ListNewsReply.fromBuffer);
  static final _$listCanteenRatings = $grpc.ClientMethod<
          $0.ListCanteenRatingsRequest, $0.ListCanteenRatingsReply>(
      '/api.Campus/ListCanteenRatings',
      ($0.ListCanteenRatingsRequest value) => value.writeToBuffer(),
      $0.ListCanteenRatingsReply.fromBuffer);
  static final _$getDishRatings =
      $grpc.ClientMethod<$0.GetDishRatingsRequest, $0.GetDishRatingsReply>(
          '/api.Campus/GetDishRatings',
          ($0.GetDishRatingsRequest value) => value.writeToBuffer(),
          $0.GetDishRatingsReply.fromBuffer);
  static final _$createCanteenRating = $grpc.ClientMethod<
          $0.CreateCanteenRatingRequest, $0.CreateCanteenRatingReply>(
      '/api.Campus/CreateCanteenRating',
      ($0.CreateCanteenRatingRequest value) => value.writeToBuffer(),
      $0.CreateCanteenRatingReply.fromBuffer);
  static final _$createDishRating =
      $grpc.ClientMethod<$0.CreateDishRatingRequest, $0.CreateDishRatingReply>(
          '/api.Campus/CreateDishRating',
          ($0.CreateDishRatingRequest value) => value.writeToBuffer(),
          $0.CreateDishRatingReply.fromBuffer);
  static final _$updateDishRating =
      $grpc.ClientMethod<$0.UpdateDishRatingRequest, $0.UpdateDishRatingReply>(
          '/api.Campus/UpdateDishRating',
          ($0.UpdateDishRatingRequest value) => value.writeToBuffer(),
          $0.UpdateDishRatingReply.fromBuffer);
  static final _$deleteDishRating =
      $grpc.ClientMethod<$0.DeleteDishRatingRequest, $0.DeleteDishRatingReply>(
          '/api.Campus/DeleteDishRating',
          ($0.DeleteDishRatingRequest value) => value.writeToBuffer(),
          $0.DeleteDishRatingReply.fromBuffer);
  static final _$reportDishRating =
      $grpc.ClientMethod<$0.ReportDishRatingRequest, $0.ReportDishRatingReply>(
          '/api.Campus/ReportDishRating',
          ($0.ReportDishRatingRequest value) => value.writeToBuffer(),
          $0.ReportDishRatingReply.fromBuffer);
  static final _$voteDishRating =
      $grpc.ClientMethod<$0.VoteDishRatingRequest, $0.VoteDishRatingReply>(
          '/api.Campus/VoteDishRating',
          ($0.VoteDishRatingRequest value) => value.writeToBuffer(),
          $0.VoteDishRatingReply.fromBuffer);
  static final _$listDishPhotos =
      $grpc.ClientMethod<$0.ListDishPhotosRequest, $0.ListDishPhotosReply>(
          '/api.Campus/ListDishPhotos',
          ($0.ListDishPhotosRequest value) => value.writeToBuffer(),
          $0.ListDishPhotosReply.fromBuffer);
  static final _$listAvailableDishTags = $grpc.ClientMethod<
          $0.ListAvailableDishTagsRequest, $0.ListAvailableDishTagsReply>(
      '/api.Campus/ListAvailableDishTags',
      ($0.ListAvailableDishTagsRequest value) => value.writeToBuffer(),
      $0.ListAvailableDishTagsReply.fromBuffer);
  static final _$listNameTags =
      $grpc.ClientMethod<$0.ListNameTagsRequest, $0.ListNameTagsReply>(
          '/api.Campus/ListNameTags',
          ($0.ListNameTagsRequest value) => value.writeToBuffer(),
          $0.ListNameTagsReply.fromBuffer);
  static final _$listAvailableCanteenTags = $grpc.ClientMethod<
          $0.ListAvailableCanteenTagsRequest, $0.ListAvailableCanteenTagsReply>(
      '/api.Campus/ListAvailableCanteenTags',
      ($0.ListAvailableCanteenTagsRequest value) => value.writeToBuffer(),
      $0.ListAvailableCanteenTagsReply.fromBuffer);
  static final _$listCanteens =
      $grpc.ClientMethod<$0.ListCanteensRequest, $0.ListCanteensReply>(
          '/api.Campus/ListCanteens',
          ($0.ListCanteensRequest value) => value.writeToBuffer(),
          $0.ListCanteensReply.fromBuffer);
  static final _$listDishes =
      $grpc.ClientMethod<$0.ListDishesRequest, $0.ListDishesReply>(
          '/api.Campus/ListDishes',
          ($0.ListDishesRequest value) => value.writeToBuffer(),
          $0.ListDishesReply.fromBuffer);
  static final _$listDishRatingSummaries = $grpc.ClientMethod<
          $0.ListDishRatingSummariesRequest, $0.ListDishRatingSummariesReply>(
      '/api.Campus/ListDishRatingSummaries',
      ($0.ListDishRatingSummariesRequest value) => value.writeToBuffer(),
      $0.ListDishRatingSummariesReply.fromBuffer);
  static final _$listTopRatedDishes = $grpc.ClientMethod<
          $0.ListTopRatedDishesRequest, $0.ListTopRatedDishesReply>(
      '/api.Campus/ListTopRatedDishes',
      ($0.ListTopRatedDishesRequest value) => value.writeToBuffer(),
      $0.ListTopRatedDishesReply.fromBuffer);
  static final _$reportDishSoldOut = $grpc.ClientMethod<
          $0.ReportDishSoldOutRequest, $0.ReportDishSoldOutReply>(
      '/api.Campus/ReportDishSoldOut',
      ($0.ReportDishSoldOutRequest value) => value.writeToBuffer(),
      $0.ReportDishSoldOutReply.fromBuffer);
  static final _$getUpdateNote =
      $grpc.ClientMethod<$0.GetUpdateNoteRequest, $0.GetUpdateNoteReply>(
          '/api.Campus/GetUpdateNote',
          ($0.GetUpdateNoteRequest value) => value.writeToBuffer(),
          $0.GetUpdateNoteReply.fromBuffer);
  static final _$listMovies =
      $grpc.ClientMethod<$0.ListMoviesRequest, $0.ListMoviesReply>(
          '/api.Campus/ListMovies',
          ($0.ListMoviesRequest value) => value.writeToBuffer(),
          $0.ListMoviesReply.fromBuffer);
  static final _$createFeedback =
      $grpc.ClientMethod<$0.CreateFeedbackRequest, $0.CreateFeedbackReply>(
          '/api.Campus/CreateFeedback',
          ($0.CreateFeedbackRequest value) => value.writeToBuffer(),
          $0.CreateFeedbackReply.fromBuffer);
  static final _$getCanteenHeadCount = $grpc.ClientMethod<
          $0.GetCanteenHeadCountRequest, $0.GetCanteenHeadCountReply>(
      '/api.Campus/GetCanteenHeadCount',
      ($0.GetCanteenHeadCountRequest value) => value.writeToBuffer(),
      $0.GetCanteenHeadCountReply.fromBuffer);
  static final _$getCanteenBusyness = $grpc.ClientMethod<
          $0.GetCanteenBusynessRequest, $0.GetCanteenBusynessReply>(
      '/api.Campus/GetCanteenBusyness',
      ($0.GetCanteenBusynessRequest value) => value.writeToBuffer(),
      $0.GetCanteenBusynessReply.fromBuffer);
  static final _$createDevice =
      $grpc.ClientMethod<$0.CreateDeviceRequest, $0.CreateDeviceReply>(
          '/api.Campus/CreateDevice',
          ($0.CreateDeviceRequest value) => value.writeToBuffer(),
          $0.CreateDeviceReply.fromBuffer);
  static final _$deleteDevice =
      $grpc.ClientMethod<$0.DeleteDeviceRequest, $0.DeleteDeviceReply>(
          '/api.Campus/DeleteDevice',
          ($0.DeleteDeviceRequest value) => value.writeToBuffer(),
          $0.DeleteDeviceReply.fromBuffer);
  static final _$listStudentClub =
      $grpc.ClientMethod<$0.ListStudentClubRequest, $0.ListStudentClubReply>(
          '/api.Campus/ListStudentClub',
          ($0.ListStudentClubRequest value) => value.writeToBuffer(),
          $0.ListStudentClubReply.fromBuffer);
  static final _$listStudentGroup =
      $grpc.ClientMethod<$0.ListStudentGroupRequest, $0.ListStudentGroupReply>(
          '/api.Campus/ListStudentGroup',
          ($0.ListStudentGroupRequest value) => value.writeToBuffer(),
          $0.ListStudentGroupReply.fromBuffer);
  static final _$listLibraries =
      $grpc.ClientMethod<$0.ListLibrariesRequest, $0.ListLibrariesReply>(
          '/api.Campus/ListLibraries',
          ($0.ListLibrariesRequest value) => value.writeToBuffer(),
          $0.ListLibrariesReply.fromBuffer);
  static final _$getLibraryBusyness = $grpc.ClientMethod<
          $0.GetLibraryBusynessRequest, $0.GetLibraryBusynessReply>(
      '/api.Campus/GetLibraryBusyness',
      ($0.GetLibraryBusynessRequest value) => value.writeToBuffer(),
      $0.GetLibraryBusynessReply.fromBuffer);
}

@$pb.GrpcServiceName('api.Campus')
abstract class CampusServiceBase extends $grpc.Service {
  $core.String get $name => 'api.Campus';

  CampusServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.ListNewsAlertsRequest, $0.ListNewsAlertsReply>(
            'ListNewsAlerts',
            listNewsAlerts_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListNewsAlertsRequest.fromBuffer(value),
            ($0.ListNewsAlertsReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListNewsSourcesRequest, $0.ListNewsSourcesReply>(
            'ListNewsSources',
            listNewsSources_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListNewsSourcesRequest.fromBuffer(value),
            ($0.ListNewsSourcesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListNewsRequest, $0.ListNewsReply>(
        'ListNews',
        listNews_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListNewsRequest.fromBuffer(value),
        ($0.ListNewsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListCanteenRatingsRequest,
            $0.ListCanteenRatingsReply>(
        'ListCanteenRatings',
        listCanteenRatings_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListCanteenRatingsRequest.fromBuffer(value),
        ($0.ListCanteenRatingsReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetDishRatingsRequest, $0.GetDishRatingsReply>(
            'GetDishRatings',
            getDishRatings_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetDishRatingsRequest.fromBuffer(value),
            ($0.GetDishRatingsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateCanteenRatingRequest,
            $0.CreateCanteenRatingReply>(
        'CreateCanteenRating',
        createCanteenRating_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateCanteenRatingRequest.fromBuffer(value),
        ($0.CreateCanteenRatingReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateDishRatingRequest,
            $0.CreateDishRatingReply>(
        'CreateDishRating',
        createDishRating_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateDishRatingRequest.fromBuffer(value),
        ($0.CreateDishRatingReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateDishRatingRequest,
            $0.UpdateDishRatingReply>(
        'UpdateDishRating',
        updateDishRating_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateDishRatingRequest.fromBuffer(value),
        ($0.UpdateDishRatingReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteDishRatingRequest,
            $0.DeleteDishRatingReply>(
        'DeleteDishRating',
        deleteDishRating_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteDishRatingRequest.fromBuffer(value),
        ($0.DeleteDishRatingReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReportDishRatingRequest,
            $0.ReportDishRatingReply>(
        'ReportDishRating',
        reportDishRating_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ReportDishRatingRequest.fromBuffer(value),
        ($0.ReportDishRatingReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.VoteDishRatingRequest, $0.VoteDishRatingReply>(
            'VoteDishRating',
            voteDishRating_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.VoteDishRatingRequest.fromBuffer(value),
            ($0.VoteDishRatingReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListDishPhotosRequest, $0.ListDishPhotosReply>(
            'ListDishPhotos',
            listDishPhotos_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListDishPhotosRequest.fromBuffer(value),
            ($0.ListDishPhotosReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListAvailableDishTagsRequest,
            $0.ListAvailableDishTagsReply>(
        'ListAvailableDishTags',
        listAvailableDishTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListAvailableDishTagsRequest.fromBuffer(value),
        ($0.ListAvailableDishTagsReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListNameTagsRequest, $0.ListNameTagsReply>(
            'ListNameTags',
            listNameTags_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListNameTagsRequest.fromBuffer(value),
            ($0.ListNameTagsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListAvailableCanteenTagsRequest,
            $0.ListAvailableCanteenTagsReply>(
        'ListAvailableCanteenTags',
        listAvailableCanteenTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListAvailableCanteenTagsRequest.fromBuffer(value),
        ($0.ListAvailableCanteenTagsReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListCanteensRequest, $0.ListCanteensReply>(
            'ListCanteens',
            listCanteens_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListCanteensRequest.fromBuffer(value),
            ($0.ListCanteensReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListDishesRequest, $0.ListDishesReply>(
        'ListDishes',
        listDishes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListDishesRequest.fromBuffer(value),
        ($0.ListDishesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListDishRatingSummariesRequest,
            $0.ListDishRatingSummariesReply>(
        'ListDishRatingSummaries',
        listDishRatingSummaries_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListDishRatingSummariesRequest.fromBuffer(value),
        ($0.ListDishRatingSummariesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListTopRatedDishesRequest,
            $0.ListTopRatedDishesReply>(
        'ListTopRatedDishes',
        listTopRatedDishes_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListTopRatedDishesRequest.fromBuffer(value),
        ($0.ListTopRatedDishesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReportDishSoldOutRequest,
            $0.ReportDishSoldOutReply>(
        'ReportDishSoldOut',
        reportDishSoldOut_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ReportDishSoldOutRequest.fromBuffer(value),
        ($0.ReportDishSoldOutReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetUpdateNoteRequest, $0.GetUpdateNoteReply>(
            'GetUpdateNote',
            getUpdateNote_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetUpdateNoteRequest.fromBuffer(value),
            ($0.GetUpdateNoteReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListMoviesRequest, $0.ListMoviesReply>(
        'ListMovies',
        listMovies_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListMoviesRequest.fromBuffer(value),
        ($0.ListMoviesReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.CreateFeedbackRequest, $0.CreateFeedbackReply>(
            'CreateFeedback',
            createFeedback,
            true,
            false,
            ($core.List<$core.int> value) =>
                $0.CreateFeedbackRequest.fromBuffer(value),
            ($0.CreateFeedbackReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetCanteenHeadCountRequest,
            $0.GetCanteenHeadCountReply>(
        'GetCanteenHeadCount',
        getCanteenHeadCount_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetCanteenHeadCountRequest.fromBuffer(value),
        ($0.GetCanteenHeadCountReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetCanteenBusynessRequest,
            $0.GetCanteenBusynessReply>(
        'GetCanteenBusyness',
        getCanteenBusyness_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetCanteenBusynessRequest.fromBuffer(value),
        ($0.GetCanteenBusynessReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.CreateDeviceRequest, $0.CreateDeviceReply>(
            'CreateDevice',
            createDevice_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreateDeviceRequest.fromBuffer(value),
            ($0.CreateDeviceReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DeleteDeviceRequest, $0.DeleteDeviceReply>(
            'DeleteDevice',
            deleteDevice_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DeleteDeviceRequest.fromBuffer(value),
            ($0.DeleteDeviceReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListStudentClubRequest, $0.ListStudentClubReply>(
            'ListStudentClub',
            listStudentClub_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListStudentClubRequest.fromBuffer(value),
            ($0.ListStudentClubReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListStudentGroupRequest,
            $0.ListStudentGroupReply>(
        'ListStudentGroup',
        listStudentGroup_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListStudentGroupRequest.fromBuffer(value),
        ($0.ListStudentGroupReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListLibrariesRequest, $0.ListLibrariesReply>(
            'ListLibraries',
            listLibraries_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListLibrariesRequest.fromBuffer(value),
            ($0.ListLibrariesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetLibraryBusynessRequest,
            $0.GetLibraryBusynessReply>(
        'GetLibraryBusyness',
        getLibraryBusyness_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetLibraryBusynessRequest.fromBuffer(value),
        ($0.GetLibraryBusynessReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListNewsAlertsReply> listNewsAlerts_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListNewsAlertsRequest> $request) async {
    return listNewsAlerts($call, await $request);
  }

  $async.Future<$0.ListNewsAlertsReply> listNewsAlerts(
      $grpc.ServiceCall call, $0.ListNewsAlertsRequest request);

  $async.Future<$0.ListNewsSourcesReply> listNewsSources_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListNewsSourcesRequest> $request) async {
    return listNewsSources($call, await $request);
  }

  $async.Future<$0.ListNewsSourcesReply> listNewsSources(
      $grpc.ServiceCall call, $0.ListNewsSourcesRequest request);

  $async.Future<$0.ListNewsReply> listNews_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListNewsRequest> $request) async {
    return listNews($call, await $request);
  }

  $async.Future<$0.ListNewsReply> listNews(
      $grpc.ServiceCall call, $0.ListNewsRequest request);

  $async.Future<$0.ListCanteenRatingsReply> listCanteenRatings_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListCanteenRatingsRequest> $request) async {
    return listCanteenRatings($call, await $request);
  }

  $async.Future<$0.ListCanteenRatingsReply> listCanteenRatings(
      $grpc.ServiceCall call, $0.ListCanteenRatingsRequest request);

  $async.Future<$0.GetDishRatingsReply> getDishRatings_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetDishRatingsRequest> $request) async {
    return getDishRatings($call, await $request);
  }

  $async.Future<$0.GetDishRatingsReply> getDishRatings(
      $grpc.ServiceCall call, $0.GetDishRatingsRequest request);

  $async.Future<$0.CreateCanteenRatingReply> createCanteenRating_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CreateCanteenRatingRequest> $request) async {
    return createCanteenRating($call, await $request);
  }

  $async.Future<$0.CreateCanteenRatingReply> createCanteenRating(
      $grpc.ServiceCall call, $0.CreateCanteenRatingRequest request);

  $async.Future<$0.CreateDishRatingReply> createDishRating_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CreateDishRatingRequest> $request) async {
    return createDishRating($call, await $request);
  }

  $async.Future<$0.CreateDishRatingReply> createDishRating(
      $grpc.ServiceCall call, $0.CreateDishRatingRequest request);

  $async.Future<$0.UpdateDishRatingReply> updateDishRating_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.UpdateDishRatingRequest> $request) async {
    return updateDishRating($call, await $request);
  }

  $async.Future<$0.UpdateDishRatingReply> updateDishRating(
      $grpc.ServiceCall call, $0.UpdateDishRatingRequest request);

  $async.Future<$0.DeleteDishRatingReply> deleteDishRating_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DeleteDishRatingRequest> $request) async {
    return deleteDishRating($call, await $request);
  }

  $async.Future<$0.DeleteDishRatingReply> deleteDishRating(
      $grpc.ServiceCall call, $0.DeleteDishRatingRequest request);

  $async.Future<$0.ReportDishRatingReply> reportDishRating_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ReportDishRatingRequest> $request) async {
    return reportDishRating($call, await $request);
  }

  $async.Future<$0.ReportDishRatingReply> reportDishRating(
      $grpc.ServiceCall call, $0.ReportDishRatingRequest request);

  $async.Future<$0.VoteDishRatingReply> voteDishRating_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.VoteDishRatingRequest> $request) async {
    return voteDishRating($call, await $request);
  }

  $async.Future<$0.VoteDishRatingReply> voteDishRating(
      $grpc.ServiceCall call, $0.VoteDishRatingRequest request);

  $async.Future<$0.ListDishPhotosReply> listDishPhotos_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListDishPhotosRequest> $request) async {
    return listDishPhotos($call, await $request);
  }

  $async.Future<$0.ListDishPhotosReply> listDishPhotos(
      $grpc.ServiceCall call, $0.ListDishPhotosRequest request);

  $async.Future<$0.ListAvailableDishTagsReply> listAvailableDishTags_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListAvailableDishTagsRequest> $request) async {
    return listAvailableDishTags($call, await $request);
  }

  $async.Future<$0.ListAvailableDishTagsReply> listAvailableDishTags(
      $grpc.ServiceCall call, $0.ListAvailableDishTagsRequest request);

  $async.Future<$0.ListNameTagsReply> listNameTags_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListNameTagsRequest> $request) async {
    return listNameTags($call, await $request);
  }

  $async.Future<$0.ListNameTagsReply> listNameTags(
      $grpc.ServiceCall call, $0.ListNameTagsRequest request);

  $async.Future<$0.ListAvailableCanteenTagsReply> listAvailableCanteenTags_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListAvailableCanteenTagsRequest> $request) async {
    return listAvailableCanteenTags($call, await $request);
  }

  $async.Future<$0.ListAvailableCanteenTagsReply> listAvailableCanteenTags(
      $grpc.ServiceCall call, $0.ListAvailableCanteenTagsRequest request);

  $async.Future<$0.ListCanteensReply> listCanteens_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListCanteensRequest> $request) async {
    return listCanteens($call, await $request);
  }

  $async.Future<$0.ListCanteensReply> listCanteens(
      $grpc.ServiceCall call, $0.ListCanteensRequest request);

  $async.Future<$0.ListDishesReply> listDishes_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListDishesRequest> $request) async {
    return listDishes($call, await $request);
  }

  $async.Future<$0.ListDishesReply> listDishes(
      $grpc.ServiceCall call, $0.ListDishesRequest request);

  $async.Future<$0.ListDishRatingSummariesReply> listDishRatingSummaries_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListDishRatingSummariesRequest> $request) async {
    return listDishRatingSummaries($call, await $request);
  }

  $async.Future<$0.ListDishRatingSummariesReply> listDishRatingSummaries(
      $grpc.ServiceCall call, $0.ListDishRatingSummariesRequest request);

  $async.Future<$0.ListTopRatedDishesReply> listTopRatedDishes_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListTopRatedDishesRequest> $request) async {
    return listTopRatedDishes($call, await $request);
  }

  $async.Future<$0.ListTopRatedDishesReply> listTopRatedDishes(
      $grpc.ServiceCall call, $0.ListTopRatedDishesRequest request);

  $async.Future<$0.ReportDishSoldOutReply> reportDishSoldOut_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ReportDishSoldOutRequest> $request) async {
    return reportDishSoldOut($call, await $request);
  }

  $async.Future<$0.ReportDishSoldOutReply> reportDishSoldOut(
      $grpc.ServiceCall call, $0.ReportDishSoldOutRequest request);

  $async.Future<$0.GetUpdateNoteReply> getUpdateNote_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetUpdateNoteRequest> $request) async {
    return getUpdateNote($call, await $request);
  }

  $async.Future<$0.GetUpdateNoteReply> getUpdateNote(
      $grpc.ServiceCall call, $0.GetUpdateNoteRequest request);

  $async.Future<$0.ListMoviesReply> listMovies_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListMoviesRequest> $request) async {
    return listMovies($call, await $request);
  }

  $async.Future<$0.ListMoviesReply> listMovies(
      $grpc.ServiceCall call, $0.ListMoviesRequest request);

  $async.Future<$0.CreateFeedbackReply> createFeedback(
      $grpc.ServiceCall call, $async.Stream<$0.CreateFeedbackRequest> request);

  $async.Future<$0.GetCanteenHeadCountReply> getCanteenHeadCount_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetCanteenHeadCountRequest> $request) async {
    return getCanteenHeadCount($call, await $request);
  }

  $async.Future<$0.GetCanteenHeadCountReply> getCanteenHeadCount(
      $grpc.ServiceCall call, $0.GetCanteenHeadCountRequest request);

  $async.Future<$0.GetCanteenBusynessReply> getCanteenBusyness_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetCanteenBusynessRequest> $request) async {
    return getCanteenBusyness($call, await $request);
  }

  $async.Future<$0.GetCanteenBusynessReply> getCanteenBusyness(
      $grpc.ServiceCall call, $0.GetCanteenBusynessRequest request);

  $async.Future<$0.CreateDeviceReply> createDevice_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateDeviceRequest> $request) async {
    return createDevice($call, await $request);
  }

  $async.Future<$0.CreateDeviceReply> createDevice(
      $grpc.ServiceCall call, $0.CreateDeviceRequest request);

  $async.Future<$0.DeleteDeviceReply> deleteDevice_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteDeviceRequest> $request) async {
    return deleteDevice($call, await $request);
  }

  $async.Future<$0.DeleteDeviceReply> deleteDevice(
      $grpc.ServiceCall call, $0.DeleteDeviceRequest request);

  $async.Future<$0.ListStudentClubReply> listStudentClub_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListStudentClubRequest> $request) async {
    return listStudentClub($call, await $request);
  }

  $async.Future<$0.ListStudentClubReply> listStudentClub(
      $grpc.ServiceCall call, $0.ListStudentClubRequest request);

  $async.Future<$0.ListStudentGroupReply> listStudentGroup_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListStudentGroupRequest> $request) async {
    return listStudentGroup($call, await $request);
  }

  $async.Future<$0.ListStudentGroupReply> listStudentGroup(
      $grpc.ServiceCall call, $0.ListStudentGroupRequest request);

  $async.Future<$0.ListLibrariesReply> listLibraries_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListLibrariesRequest> $request) async {
    return listLibraries($call, await $request);
  }

  $async.Future<$0.ListLibrariesReply> listLibraries(
      $grpc.ServiceCall call, $0.ListLibrariesRequest request);

  $async.Future<$0.GetLibraryBusynessReply> getLibraryBusyness_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetLibraryBusynessRequest> $request) async {
    return getLibraryBusyness($call, await $request);
  }

  $async.Future<$0.GetLibraryBusynessReply> getLibraryBusyness(
      $grpc.ServiceCall call, $0.GetLibraryBusynessRequest request);
}
