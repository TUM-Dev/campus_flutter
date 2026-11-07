// Run from the repository root: flutter test tool/generate_splash_assets.dart
// SPLASH_FONT_PATH can override the default macOS Arial font.
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  test('Generate native splash artwork', () async {
    final font = FontLoader('SplashTagline')
      ..addFont(
        Future.value(
          ByteData.sublistView(
            File(
              Platform.environment['SPLASH_FONT_PATH'] ??
                  '/System/Library/Fonts/Supplemental/Arial.ttf',
            ).readAsBytesSync(),
          ),
        ),
      );
    await font.load();
    final logo = await vg.loadPicture(
      SvgStringLoader(
        File('assets/images/logos/open-source-tum-white.svg')
            .readAsStringSync(),
      ),
      null,
    );
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder)..scale(3);
    canvas.save();
    canvas.translate(30, 0);
    canvas.scale(140 / logo.size.width);
    canvas.drawPicture(logo.picture);
    canvas.restore();
    final text = TextPainter(
      text: const TextSpan(
        text: 'For Students, From Students',
        style: TextStyle(
          fontFamily: 'SplashTagline',
          fontSize: 12,
          color: Colors.white,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: 200);
    text.paint(canvas, Offset((200 - text.width) / 2, 57));
    final picture = recorder.endRecording();
    final image = await picture.toImage(600, 240);
    final bytes = (await image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
    final dir = Directory('ios/Runner/Assets.xcassets/SplashBranding.imageset')
      ..createSync(recursive: true);
    File('${dir.path}/splash-branding@3x.png').writeAsBytesSync(bytes);
    final android = Directory('android/app/src/main/res/drawable-xxhdpi')
      ..createSync(recursive: true);
    File('${android.path}/splash_branding.png').writeAsBytesSync(bytes);
    final tum = await ui.instantiateImageCodec(
      File('ios/Runner/Assets.xcassets/LaunchImage.imageset/logo-white.png')
          .readAsBytesSync(),
    );
    final frame = await tum.getNextFrame();
    final iconRecorder = ui.PictureRecorder();
    final iconCanvas = Canvas(iconRecorder);
    iconCanvas.drawImageRect(
      frame.image,
      Rect.fromLTWH(
        0,
        0,
        frame.image.width.toDouble(),
        frame.image.height.toDouble(),
      ),
      const Rect.fromLTWH(144, 280.5, 576, 303),
      Paint()..filterQuality = FilterQuality.high,
    );
    final iconPicture = iconRecorder.endRecording();
    final icon = await iconPicture.toImage(864, 864);
    File('${android.path}/splash_icon.png').writeAsBytesSync(
      (await icon.toByteData(format: ui.ImageByteFormat.png))!.buffer
          .asUint8List(),
    );
    icon.dispose();
    iconPicture.dispose();
    frame.image.dispose();
    tum.dispose();
    logo.picture.dispose();
    picture.dispose();
    image.dispose();
  });
}
