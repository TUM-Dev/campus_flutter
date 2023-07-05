import 'dart:convert';
import 'package:flutter/foundation.dart';

Uint8List base64DecodeImageData(String source) {
  var mutatedSource = source;
  mutatedSource = mutatedSource.replaceAll(r'\r\\n', "");
  mutatedSource = mutatedSource.replaceAll(r'\\n', "");
  return base64Decode(mutatedSource);
}
