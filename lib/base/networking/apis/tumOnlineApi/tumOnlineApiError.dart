import 'package:campus_flutter/base/networking/protocols/apiError.dart';

class TumOnlineApiError implements ApiError {
  final TumOnlineApiErrorType tumOnlineApiErrorType;

  TumOnlineApiError({required this.tumOnlineApiErrorType});

  /// method for decoder
  factory TumOnlineApiError.fromJson(Map<String, dynamic> json) {
    final error = ErrorBody.fromJson(json);
    switch (error.errorMessage.message) {
      case String message when message.contains("Keine Rechte für Funktion"):
        return TumOnlineApiError(tumOnlineApiErrorType: TumOnlineApiErrorNoPermission());
      case "Token ist nicht bestätigt!":
        return TumOnlineApiError(tumOnlineApiErrorType: TumOnlineApiErrorTokenNotConfirmed());
      case "Token ist ungültig!":
        return TumOnlineApiError(tumOnlineApiErrorType: TumOnlineApiErrorInvalidToken());
      default:
        return TumOnlineApiError(
            tumOnlineApiErrorType: TumOnlineApiErrorUnknown(message: error.errorMessage.message)
        );
    }
  }

  String get errorDescription {
    switch (tumOnlineApiErrorType) {
      case TumOnlineApiErrorNoPermission _:
        return "No Permission";
      case TumOnlineApiErrorTokenNotConfirmed _:
        return "Token Not Confirmed";
      case TumOnlineApiErrorInvalidToken _:
        return "Token Invalid";
      case TumOnlineApiErrorRequestRate _:
        return "Request Rate Exceeded";
      case TumOnlineApiErrorTokenLimitReached _:
        return "Token limit Reached, Maximum 10 Tokens per User Allowed";
      case TumOnlineApiErrorNoUserSpecified _:
        return "No User Specified";
      case TumOnlineApiErrorNoUserFound _:
        return "No User Found";
      case TumOnlineApiErrorUnknown unkown:
        return "Unknown Error: ${unkown.message}";
    }
  }

  String? get recoverySuggestion {
    switch (tumOnlineApiErrorType) {
      case TumOnlineApiErrorNoPermission _:
        return "Make sure to enable the right permissions for your token.";
      case TumOnlineApiErrorTokenNotConfirmed _:
        return "Go to Tumonline and confirm your token.";
      case TumOnlineApiErrorInvalidToken _:
        return "Try creating a new token.";
      case TumOnlineApiErrorRequestRate _:
        return "Please try again later";
      case TumOnlineApiErrorTokenLimitReached _:
        return "Please delete one of your tokens";
      case TumOnlineApiErrorNoUserSpecified _:
        return "Please enter your Tum ID";
      case TumOnlineApiErrorNoUserFound _:
        return "Make sure you entered your Tum ID correctly";
      default:
        return null;
    }
  }
}

/// error types
sealed class TumOnlineApiErrorType {}

class TumOnlineApiErrorNoPermission extends TumOnlineApiErrorType {}

class TumOnlineApiErrorTokenNotConfirmed extends TumOnlineApiErrorType {}

class TumOnlineApiErrorInvalidToken extends TumOnlineApiErrorType {}

class TumOnlineApiErrorRequestRate extends TumOnlineApiErrorType {}

class TumOnlineApiErrorNoUserSpecified extends TumOnlineApiErrorType {}

class TumOnlineApiErrorTokenLimitReached extends TumOnlineApiErrorType {}

class TumOnlineApiErrorNoUserFound extends TumOnlineApiErrorType {}

class TumOnlineApiErrorUnknown extends TumOnlineApiErrorType {
  final String message;

  TumOnlineApiErrorUnknown({required this.message});
}