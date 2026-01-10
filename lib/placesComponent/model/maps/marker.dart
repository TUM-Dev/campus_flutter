import 'package:maplibre_gl/maplibre_gl.dart';

class Marker {
  String id;
  LatLng position;
  bool isRed;
  double? rotation;
  int? zIndex;
  bool? draggable;
  double? alpha;
  InfoWindow? infoWindow;

  Marker({
    required this.id,
    required this.position,
    this.rotation,
    this.zIndex,
    this.draggable = false,
    this.alpha,
    this.infoWindow,
    this.isRed = false,
  });
}

class InfoWindow {
  String title;
  void Function()? onTap;

  InfoWindow({required this.title, this.onTap});
}
