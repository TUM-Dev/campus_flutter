import 'package:campus_flutter/base/networking/protocols/api_exception.dart';

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
            tumOnlineApiExceptionType: TumOnlineApiExceptionNoPermission());
      case "Token ist nicht bestätigt!":
        return TumOnlineApiException(
            tumOnlineApiExceptionType: TumOnlineApiExceptionTokenNotConfirmed());
      case "Token ist ungültig!":
        return TumOnlineApiException(
            tumOnlineApiExceptionType: TumOnlineApiExceptionInvalidToken());
      case "Ungültige pIdentNr":
      case "Person ist nicht sichtbar.":
        return TumOnlineApiException(
            tumOnlineApiExceptionType: TumOnlineApiExceptionPersonNotFound());
      case String message when message.contains("Suchstring"):
        return TumOnlineApiException(
            tumOnlineApiExceptionType: TumOnlineApiExceptionInvalidSearchString());
      default:
        return TumOnlineApiException(
            tumOnlineApiExceptionType:
                TumOnlineApiExceptionUnknown(message: exception.exceptionMessage.message));
    }
  }

  @override
  String get errorDescription {
    switch (tumOnlineApiExceptionType) {
      case TumOnlineApiExceptionNoPermission _:
        return "No Permission";
      case TumOnlineApiExceptionTokenNotConfirmed _:
        return "Token Not Confirmed";
      case TumOnlineApiExceptionInvalidToken _:
        return "Token Invalid";
      case TumOnlineApiExceptionRequestRate _:
        return "Request Rate Exceeded";
      case TumOnlineApiExceptionTokenLimitReached _:
        return "Token limit Reached, Maximum 10 Tokens per User Allowed";
      case TumOnlineApiExceptionNoUserSpecified _:
        return "No User Specified";
      case TumOnlineApiExceptionNoUserFound _:
        return "No User Found";
      case TumOnlineApiExceptionPersonNotFound _:
        return "Person Not Found";
      case TumOnlineApiExceptionInvalidSearchString _:
        return "Invalid Search";
      case TumOnlineApiExceptionUnknown _:
        return "Unknown Exception";
    }
  }

  @override
  String? get recoverySuggestion {
    switch (tumOnlineApiExceptionType) {
      case TumOnlineApiExceptionNoPermission _:
        return "Make sure to enable the right permissions for your token!";
      case TumOnlineApiExceptionTokenNotConfirmed _:
        return "Go to TumOnline and confirm your token!";
      case TumOnlineApiExceptionInvalidToken _:
        return "Try creating a new token!";
      case TumOnlineApiExceptionRequestRate _:
        return "Please try again later!";
      case TumOnlineApiExceptionTokenLimitReached _:
        return "Please delete one of your tokens!";
      case TumOnlineApiExceptionNoUserSpecified _:
        return "Please enter your Tum ID!";
      case TumOnlineApiExceptionNoUserFound _:
        return "Make sure you entered your Tum ID correctly!";
      case TumOnlineApiExceptionPersonNotFound _:
        return "Make sure you entered the name correctly!";
      case TumOnlineApiExceptionInvalidSearchString _:
        return "A search string with less than 4 characters must not contain wildcards or special characters!";
      case TumOnlineApiExceptionUnknown unkown:
        return unkown.message;
    }
  }
}

/// exception types
sealed class TumOnlineApiExceptionType {}

class TumOnlineApiExceptionNoPermission extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionTokenNotConfirmed extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionInvalidToken extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionRequestRate extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionNoUserSpecified extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionPersonNotFound extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionInvalidSearchString extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionTokenLimitReached extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionNoUserFound extends TumOnlineApiExceptionType {}

class TumOnlineApiExceptionUnknown extends TumOnlineApiExceptionType {
  final String message;

  TumOnlineApiExceptionUnknown({required this.message});
}
