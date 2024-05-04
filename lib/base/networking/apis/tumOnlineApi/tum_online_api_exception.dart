import 'package:campus_flutter/base/enums/credentials.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/networking/protocols/api_exception.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
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
        return context.localizations.noPermission;
      case TumOnlineApiExceptionTokenNotConfirmed _:
        return context.localizations.tokenNotConfirmed;
      case TumOnlineApiExceptionInvalidToken _:
        if (ref.read(onboardingViewModel).credentials.value ==
            Credentials.tumId) {
          return context.localizations.tokenInvalid;
        } else {
          return context.localizations.loginNeeded;
        }
      case TumOnlineApiExceptionRequestRate _:
        return context.localizations.rateExceeded;
      case TumOnlineApiExceptionTokenLimitReached _:
        return context.localizations.limitReached;
      case TumOnlineApiExceptionNoUserSpecified _:
        return context.localizations.noUserSpecified;
      case TumOnlineApiExceptionNoUserFound _:
        return context.localizations.noUserFound;
      case TumOnlineApiExceptionPersonNotFound _:
        return context.localizations.personNotFound;
      case TumOnlineApiExceptionInvalidSearchString _:
        return context.localizations.invalidSearch;
      case TumOnlineApiExceptionUnknown _:
        return context.localizations.unknownException;
    }
  }

  @override
  String? recoverySuggestion(BuildContext context, WidgetRef ref) {
    switch (tumOnlineApiExceptionType) {
      case TumOnlineApiExceptionNoPermission _:
        return context.localizations.noPermissionRecovery;
      case TumOnlineApiExceptionTokenNotConfirmed _:
        return context.localizations.tokenNotConfirmedRecovery;
      case TumOnlineApiExceptionInvalidToken _:
        if (ref.read(onboardingViewModel).credentials.value ==
            Credentials.tumId) {
          return context.localizations.tokenInvalidRecovery;
        } else {
          return context.localizations.loginNeededRecovery;
        }
      case TumOnlineApiExceptionRequestRate _:
        return context.localizations.rateExceededRecovery;
      case TumOnlineApiExceptionTokenLimitReached _:
        return context.localizations.limitReachedRecovery;
      case TumOnlineApiExceptionNoUserSpecified _:
        return context.localizations.noUserSpecifiedRecovery;
      case TumOnlineApiExceptionNoUserFound _:
        return context.localizations.noUserFoundRecovery;
      case TumOnlineApiExceptionPersonNotFound _:
        return context.localizations.personNotFoundRecovery;
      case TumOnlineApiExceptionInvalidSearchString _:
        return context.localizations.invalidSearchRecovery;
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
        return context.localizations.login;
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
