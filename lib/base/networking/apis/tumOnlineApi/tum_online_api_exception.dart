import 'package:campus_flutter/base/enums/credentials.dart';
import 'package:campus_flutter/base/networking/protocols/api_exception.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TumOnlineApiException implements ApiException {
  final TumOnlineApiExceptionType tumOnlineApiExceptionType;

  TumOnlineApiException({required this.tumOnlineApiExceptionType});

  /// method for decoder
  factory TumOnlineApiException.fromJson(Map<String, dynamic> json) {
    final exception = ExceptionBody.fromJson(json);
    switch (exception.exceptionMessage.message) {
      case String message
          when message.contains("Keine Rechte für Funktion") ||
              message.contains("Funktion nicht erlaubt"):
        return TumOnlineApiException(
          tumOnlineApiExceptionType: TumOnlineApiExceptionNoPermission(),
        );
      case "Token ist nicht bestätigt!":
        return TumOnlineApiException(
          tumOnlineApiExceptionType: TumOnlineApiExceptionTokenNotConfirmed(),
        );
      case "Token ist ungültig!":
        return TumOnlineApiException(
          tumOnlineApiExceptionType: TumOnlineApiExceptionInvalidToken(),
        );
      case "Ungültige pIdentNr":
      case "Person ist nicht sichtbar.":
        return TumOnlineApiException(
          tumOnlineApiExceptionType: TumOnlineApiExceptionPersonNotFound(),
        );
      case String message when message.contains("Suchstring"):
        return TumOnlineApiException(
          tumOnlineApiExceptionType: TumOnlineApiExceptionInvalidSearchString(),
        );
      default:
        return TumOnlineApiException(
          tumOnlineApiExceptionType: TumOnlineApiExceptionUnknown(
            message: exception.exceptionMessage.message,
          ),
        );
    }
  }

  @override
  String message(BuildContext context, WidgetRef ref) {
    switch (tumOnlineApiExceptionType) {
      case TumOnlineApiExceptionNoPermission _:
        return context.tr("noPermission");
      case TumOnlineApiExceptionTokenNotConfirmed _:
        return context.tr("tokenNotConfirmed");
      case TumOnlineApiExceptionInvalidToken _:
        if (ref.read(onboardingViewModel).credentials.value ==
            Credentials.tumId) {
          return context.tr("tokenInvalid");
        } else {
          return context.tr("loginNeeded");
        }
      case TumOnlineApiExceptionRequestRate _:
        return context.tr("rateExceeded");
      case TumOnlineApiExceptionTokenLimitReached _:
        return context.tr("limitReached");
      case TumOnlineApiExceptionNoUserSpecified _:
        return context.tr("noUserSpecified");
      case TumOnlineApiExceptionNoUserFound _:
        return context.tr("noUserFound");
      case TumOnlineApiExceptionPersonNotFound _:
        return context.tr("personNotFound");
      case TumOnlineApiExceptionInvalidSearchString _:
        return context.tr("invalidSearch");
      case TumOnlineApiExceptionUnknown _:
        return context.tr("unknownException");
    }
  }

  @override
  String? recoverySuggestion(BuildContext context, WidgetRef ref) {
    switch (tumOnlineApiExceptionType) {
      case TumOnlineApiExceptionNoPermission _:
        return context.tr("noPermissionRecovery");
      case TumOnlineApiExceptionTokenNotConfirmed _:
        return context.tr("tokenNotConfirmedRecovery");
      case TumOnlineApiExceptionInvalidToken _:
        if (ref.read(onboardingViewModel).credentials.value ==
            Credentials.tumId) {
          return context.tr("tokenInvalidRecovery");
        } else {
          return context.tr("loginNeededRecovery");
        }
      case TumOnlineApiExceptionRequestRate _:
        return context.tr("rateExceededRecovery");
      case TumOnlineApiExceptionTokenLimitReached _:
        return context.tr("limitReachedRecovery");
      case TumOnlineApiExceptionNoUserSpecified _:
        return context.tr("noUserSpecifiedRecovery");
      case TumOnlineApiExceptionNoUserFound _:
        return context.tr("noUserFoundRecovery");
      case TumOnlineApiExceptionPersonNotFound _:
        return context.tr("personNotFoundRecovery");
      case TumOnlineApiExceptionInvalidSearchString _:
        return context.tr("invalidSearchRecovery");
      case TumOnlineApiExceptionUnknown unknown:
        return unknown.message;
    }
  }

  @override
  String toString() {
    return "TumOnlineException: $message";
  }

  @override
  Function()? overwriteRetry(BuildContext context) {
    switch (tumOnlineApiExceptionType) {
      case TumOnlineApiExceptionInvalidToken _:
        return (() => context.go(onboarding));
      default:
        return null;
    }
  }

  @override
  String? overwriteRetryMessage(BuildContext context) {
    switch (tumOnlineApiExceptionType) {
      case TumOnlineApiExceptionInvalidToken _:
        return context.tr("login");
      default:
        return null;
    }
  }
}

/// exception types
sealed class TumOnlineApiExceptionType {}

class TumOnlineApiExceptionNoPermission extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionTokenNotConfirmed
    extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionInvalidToken extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionRequestRate extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionNoUserSpecified extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionPersonNotFound extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionInvalidSearchString
    extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionTokenLimitReached
    extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionNoUserFound extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionUnknown extends TumOnlineApiExceptionType {
  final String message;

  TumOnlineApiExceptionUnknown({required this.message});
}
