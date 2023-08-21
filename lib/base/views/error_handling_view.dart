import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorHandlingView extends StatelessWidget {
  const ErrorHandlingView(
      {super.key,
      required this.error,
      required this.errorHandlingViewType,
      this.retry,
      this.titleColor,
      this.bodyColor});

  final Object error;
  final ErrorHandlingViewType errorHandlingViewType;
  final Future<dynamic> Function(bool)? retry;
  final Color? titleColor;
  final Color? bodyColor;

  @override
  Widget build(BuildContext context) {
    if (error is DioException) {
      final dioException = error as DioException;
      switch (dioException.type) {
        case DioExceptionType.badResponse:
          return _exceptionMessage(
              context, "Bad Response", "Please try again!");
        case DioExceptionType.connectionError:
          return _exceptionMessage(context, "Connection Error",
              "Make sure you have \na working internet connection!");
        case DioExceptionType.cancel:
          return _exceptionMessage(context, "Request Cancelled",
              "Please report this is as a bug \nvia Email or on GitHub");
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return _exceptionMessage(context, "Connection Timeout",
              "Make sure you have \na working internet connection!");
        default:
          if ((error as DioException)
              .error
              .toString()
              .contains("SocketException")) {
            return _exceptionMessage(context, "Connection Error",
                "Make sure you have \na working internet connection!");
          } else {
            return _exceptionMessage(context, "Unknown Error",
                "Please report this is as a bug \nvia Email or on GitHub");
          }
      }
    } else if (error is TumOnlineApiException) {
      final tumOnlineApiException = error as TumOnlineApiException;
      return _exceptionMessage(context, tumOnlineApiException.errorDescription,
          tumOnlineApiException.recoverySuggestion);
    } else if (error is SearchException) {
      final searchError = error as SearchException;
      return _exceptionMessage(context, searchError.message, null);
    } else {
      return _exceptionMessage(context, "Unknown Error",
          "Please report this is as a bug \nvia Email or on GitHub");
    }
  }

  Widget _exceptionMessage(
      BuildContext context, String errorMessage, String? fixMessage) {
    switch (errorHandlingViewType) {
      case ErrorHandlingViewType.fullScreen:
        return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),
          Image.asset("assets/images/errors/error_square.png",
              height: MediaQuery.of(context).size.height * 0.3333,
              fit: BoxFit.scaleDown),
          const Spacer(),
          Expanded(
              flex: 0,
              child: Column(children: [
                Text(errorMessage,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: titleColor ?? Theme.of(context).primaryColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                if (fixMessage != null)
                  Text(fixMessage,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: bodyColor),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis)
              ])),
          const Spacer(),
          if (retry != null) ...[
            ElevatedButton(
                onPressed: () => retry!(true), child: const Text("Try Again")),
            const Spacer()
          ]
        ]));
      case ErrorHandlingViewType.textOnly:
        return Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              errorMessage,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: titleColor ?? Theme.of(context).primaryColor),
              textAlign: TextAlign.center,
            ),
            if (fixMessage != null)
              Text(fixMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: bodyColor))
          ]),
        );
      case ErrorHandlingViewType.descriptionOnly:
        return Center(
            child: Text(errorMessage, style: TextStyle(color: bodyColor)));
      case ErrorHandlingViewType.redDescriptionOnly:
        return Center(
            child:
                Text(errorMessage, style: const TextStyle(color: Colors.red)));
    }
  }
}

enum ErrorHandlingViewType {
  fullScreen,
  textOnly,
  descriptionOnly,
  redDescriptionOnly
}
