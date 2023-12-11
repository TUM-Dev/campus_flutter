import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/campus_exception_router.dart';
import 'package:campus_flutter/base/errorHandling/default_error_router.dart';
import 'package:campus_flutter/base/errorHandling/dio_exception_router.dart';
import 'package:campus_flutter/base/errorHandling/search_exception_router.dart';
import 'package:campus_flutter/base/errorHandling/tum_online_api_exception_router.dart';
import 'package:campus_flutter/base/errorHandling/type_error_router.dart';
import 'package:campus_flutter/base/extensions/custom_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/loginComponent/viewModels/login_viewmodel.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorHandlingRouter extends ConsumerWidget {
  const ErrorHandlingRouter({
    super.key,
    required this.error,
    required this.errorHandlingViewType,
    this.retry,
    this.titleColor,
    this.bodyColor,
  });

  final Object error;
  final ErrorHandlingViewType errorHandlingViewType;
  final Future<dynamic> Function(bool)? retry;
  final Color? titleColor;
  final Color? bodyColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (error) {
      case DioException dioException:
        FirebaseCrashlytics.instance.recordFlutterFatalError(
          FlutterErrorDetails(
            exception: dioException,
            stack: dioException.stackTrace,
          ),
        );
        return DioExceptionRouter(
          dioException: dioException,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
      case TumOnlineApiException tumOnlineApiException:
        if (ref.read(loginViewModel).credentials.value != Credentials.tumId &&
            tumOnlineApiException.tumOnlineApiExceptionType ==
                TumOnlineApiExceptionInvalidToken()) {
          FirebaseCrashlytics.instance.recordFlutterFatalError(
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
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
      case SearchException searchException:
        FirebaseCrashlytics.instance.recordFlutterFatalError(
          FlutterErrorDetails(
            exception: searchException,
          ),
        );
        return SearchExceptionRouter(
          searchException: searchException,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
      case CampusException campusException:
        FirebaseCrashlytics.instance.recordFlutterFatalError(
          FlutterErrorDetails(
            exception: campusException,
          ),
        );
        return CampusExceptionRouter(
          campusException: campusException,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
      case TypeError typeError:
        FirebaseCrashlytics.instance.recordFlutterFatalError(
          FlutterErrorDetails(
            exception: typeError,
            stack: typeError.stackTrace,
          ),
        );
        return TypeErrorRouter(
          typeError: typeError,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
      default:
        FirebaseCrashlytics.instance.recordFlutterError(
          FlutterErrorDetails(
            exception: error,
          ),
        );
        return DefaultErrorRouter(
          exception: error,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
    }
  }
}
