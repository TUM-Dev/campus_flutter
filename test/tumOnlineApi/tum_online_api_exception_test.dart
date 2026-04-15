import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/protocols/api_exception.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/xml_decoder.dart';

void main() {
  group('TumOnlineApiException XML decoding', () {
    /// Builds an XML error response and decodes it into a [TumOnlineApiException].
    TumOnlineApiException _decodeException(String message) {
      final xml = '''
<error>
  <message>$message</message>
</error>
''';
      final json = tumXmlToJson(xml);
      return TumOnlineApiException.fromJson(json);
    }

    test('decodes "Keine Rechte für Funktion" as NoPermission', () {
      final exception = _decodeException('Keine Rechte für Funktion wbservicesbasic.noten');

      expect(
        exception.tumOnlineApiExceptionType,
        isA<TumOnlineApiExceptionNoPermission>(),
      );
    });

    test('decodes "Funktion nicht erlaubt" as NoPermission', () {
      final exception = _decodeException('Funktion nicht erlaubt');

      expect(
        exception.tumOnlineApiExceptionType,
        isA<TumOnlineApiExceptionNoPermission>(),
      );
    });

    test('decodes "Token ist nicht bestätigt!" as TokenNotConfirmed', () {
      final exception = _decodeException('Token ist nicht bestätigt!');

      expect(
        exception.tumOnlineApiExceptionType,
        isA<TumOnlineApiExceptionTokenNotConfirmed>(),
      );
    });

    test('decodes "Token ist ungültig!" as InvalidToken', () {
      final exception = _decodeException('Token ist ungültig!');

      expect(
        exception.tumOnlineApiExceptionType,
        isA<TumOnlineApiExceptionInvalidToken>(),
      );
    });

    test('decodes "Ungültige pIdentNr" as PersonNotFound', () {
      final exception = _decodeException('Ungültige pIdentNr');

      expect(
        exception.tumOnlineApiExceptionType,
        isA<TumOnlineApiExceptionPersonNotFound>(),
      );
    });

    test('decodes "Person ist nicht sichtbar." as PersonNotFound', () {
      final exception = _decodeException('Person ist nicht sichtbar.');

      expect(
        exception.tumOnlineApiExceptionType,
        isA<TumOnlineApiExceptionPersonNotFound>(),
      );
    });

    test('decodes Suchstring error as InvalidSearchString', () {
      final exception = _decodeException(
        'Der Suchstring muss mindestens 3 Zeichen lang sein.',
      );

      expect(
        exception.tumOnlineApiExceptionType,
        isA<TumOnlineApiExceptionInvalidSearchString>(),
      );
    });

    test('decodes unknown message as Unknown with correct message', () {
      const msg = 'Some completely unexpected error occurred.';
      final exception = _decodeException(msg);

      expect(
        exception.tumOnlineApiExceptionType,
        isA<TumOnlineApiExceptionUnknown>(),
      );
      final unknown =
          exception.tumOnlineApiExceptionType as TumOnlineApiExceptionUnknown;
      expect(unknown.message, msg);
    });

    test('TumOnlineApiException implements Exception', () {
      final exception = _decodeException('Token ist ungültig!');
      expect(exception, isA<Exception>());
    });

    test('ExceptionBody decodes directly from JSON', () {
      // Verify ExceptionBody and ExceptionMessage decode independently
      const xml = '''
<error>
  <message>Direct decoding test</message>
</error>
''';
      final json = tumXmlToJson(xml);
      final body = ExceptionBody.fromJson(json);

      expect(body.exceptionMessage.message, 'Direct decoding test');
    });
  });
}
