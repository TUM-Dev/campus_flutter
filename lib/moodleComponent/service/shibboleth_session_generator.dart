import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ShibbolethSessionGenerator {
  
  Future<ShibbolethSession> generateSession(
      String userName, String password) {
    ShibbolethSession session = ShibbolethSession();
    Completer<ShibbolethSession> helperCompleter = Completer<ShibbolethSession>();
    HeadlessInAppWebView webView = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(
        url: WebUri(
            'https://www.moodle.tum.de/'),
      ),
      onTitleChanged: (controller, title) async {
       if(title!.startsWith("Startseite")) {

         await controller.evaluateJavascript(source: """
         function cycle() {
        document.querySelector("a.btn.btn-primary").click();
       }
        setTimeout(cycle, 1500);
         """);
       }else if(title.startsWith("TUM")) {
         await controller.evaluateJavascript(source: """
        
          function cycle() {
          
          function fillInput(input, value) {

  input.focus();

  input.value = value;

  input.dispatchEvent(new Event('input', { bubbles: true }));
  input.dispatchEvent(new Event('change', { bubbles: true }));

  input.blur();
}
            fillInput(document.getElementById("username"), "$userName");
            fillInput(document.getElementById("password"), "$password");
          
         setTimeout(() => {document.querySelector("button[type='submit']").click();}, 500);
         
            }
            
            cycle();
          """);
        } else {

          final tumCookies = await CookieManager.instance()
              .getCookies(url: WebUri("https://login.tum.de"));
          final moodleCookies = await CookieManager.instance()
              .getCookies(url: WebUri("https://www.moodle.tum.de"));
          final examMoodleCookies = await CookieManager.instance()
              .getCookies(url: WebUri("https://exam.moodle.tum.de"));

            final expiration = tumCookies.first.expiresDate != null ? DateTime.fromMillisecondsSinceEpoch(tumCookies.first.expiresDate!):  DateTime.now().add(
              const Duration(hours: 8),
            );
           session.expiration = expiration;
           session.cookies = {
              for (var cookie in tumCookies) cookie.name: cookie.value,
              for (var cookie in moodleCookies) cookie.name: cookie.value,
              for (var cookie in examMoodleCookies) cookie.name: cookie.value,
            };
        }
      },
      onLoadError: (controller, url, code, message) {
        throw Exception("Failed to load page: $message");
      },
      onLoadResource: (InAppWebViewController controller, LoadedResource resource) {
        if(resource.url!.toString().startsWith("https://www.moodle.tum.de/lib/ajax/service.php")) {
          var sesskey = resource.url!.queryParameters["sesskey"];
          session.sessionId = sesskey!;
          debugPrint("Shibboleth session generated with sesskey: ${session.sessionId}");
          if(!helperCompleter.isCompleted) {
            helperCompleter.complete(session);
          }
        }
      },
    );
    webView.run();
    return helperCompleter.future;
  }
  
}

class ShibbolethSession {
  late String userId;
  late String sessionId;
  Map<String, String> cookies = {};
  late DateTime expiration;

  ShibbolethSession();
}