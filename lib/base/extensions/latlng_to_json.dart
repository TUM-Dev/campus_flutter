import 'dart:convert';
import 'package:maplibre_gl/maplibre_gl.dart';

extension LatLngJson on LatLng {
  static String? toJsonString(LatLng? latLng) {
    if (latLng == null) {
      return null;
    } else {
      return const JsonEncoder().convert(latLng.toJson());
    }
  }

  static LatLng fromJsonString(List<dynamic> json) {
    return LatLng(json[0], json[1]);
  }
}
