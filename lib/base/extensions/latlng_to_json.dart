import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

extension JsonString on LatLng {
  static String? toJsonString(LatLng? latLng) {
    if (latLng == null) {
      return null;
    } else {
      return const JsonEncoder().convert(latLng.toJson());
    }
  }
}
