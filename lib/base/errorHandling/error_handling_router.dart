import 'package:campus_flutter/base/enums/credentials.dart';
import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/campus_exception_router.dart';
import 'package:campus_flutter/base/errorHandling/default_error_router.dart';
import 'package:campus_flutter/base/errorHandling/dio_exception_router.dart';
import 'package:campus_flutter/base/errorHandling/grpc_error_router.dart';
import 'package:campus_flutter/base/errorHandling/search_exception_router.dart';
import 'package:campus_flutter/base/errorHandling/tum_online_api_exception_router.dart';
import 'package:campus_flutter/base/errorHandling/type_error_router.dart';
import 'package:campus_flutter/base/extensions/campus_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

class ErrorHandlingRouter extends ConsumerWidget {
  const ErrorHandlingRouter({
    super.key,
    required this.error,
    required this.errorHandlingViewType,
    this.retry,
    this.retryWithContext,
    this.titleColor,
    this.bodyColor,
  });

  final Object? error;
  final ErrorHandlingViewType errorHandlingViewType;
  final Future<dynamic> Function(bool)? retry;
  final Future<dynamic> Function(bool, BuildContext)? retryWithContext;
  final Color? titleColor;
  final Color? bodyColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (error) {
      case DioException dioException:
        recordFlutterError(
          FlutterErrorDetails(
            exception: dioException,
            stack: dioException.stackTrace,
          ),
        );
        return DioExceptionRouter(
          dioException: dioException,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          retryWithContext: retryWithContext,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
      case TumOnlineApiException tumOnlineApiException:
        final isInvalidToken =
            tumOnlineApiException.tumOnlineApiExceptionType !=
                TumOnlineApiExceptionInvalidToken();
        final isTokenNotConfirmed =
            tumOnlineApiException.tumOnlineApiExceptionType !=
                TumOnlineApiExceptionTokenNotConfirmed();
        final isNotAuthorized =
            ref.read(onboardingViewModel).credentials.value !=
                Credentials.tumId;
        if (isNotAuthorized && (isInvalidToken || isTokenNotConfirmed)) {
          recordFlutterError(
            FlutterErrorDetails(
              exception: tumOnlineApiException,
              stack: StackTrace.current,
            ),
          );
        }
        return TumOnlineApiExceptionRouter(
          tumOnlineApiException: tumOnlineApiException,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          retryWithContext: retryWithContext,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
      case SearchException searchException:
        recordFlutterError(
          FlutterErrorDetails(
            exception: searchException,
          ),
        );
        return SearchExceptionRouter(
          searchException: searchException,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          retryWithContext: retryWithContext,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
      case CampusException campusException:
        recordFlutterError(
          FlutterErrorDetails(
            exception: campusException,
          ),
        );
        return CampusExceptionRouter(
          campusException: campusException,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          retryWithContext: retryWithContext,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
      case TypeError typeError:
        recordFlutterError(
          FlutterErrorDetails(
            exception: typeError,
            stack: typeError.stackTrace,
          ),
        );
        return TypeErrorRouter(
          typeError: typeError,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          retryWithContext: retryWithContext,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
      case GrpcError grpcError:
        return GrpcErrorRouter(
          grpcError: grpcError,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          retryWithContext: retryWithContext,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
      default:
        if (error != null) {
          recordFlutterError(
            FlutterErrorDetails(
              exception: error!,
            ),
          );
        }
        return DefaultErrorRouter(
          exception: error,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          retryWithContext: retryWithContext,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
    }
  }

  void recordFlutterError(FlutterErrorDetails flutterErrorDetails) {
    if (!kDebugMode) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(flutterErrorDetails);
    }
  }
}
