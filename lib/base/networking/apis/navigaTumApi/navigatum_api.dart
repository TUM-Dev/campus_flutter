import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api_serivce.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';

class NavigaTumApi extends Api {
  final NavigaTumService navigaTumService;

  NavigaTumApi({required this.navigaTumService});

  @override
  String get baseURL => "https://nav.tum.de/";

  @override
  bool get needsAuth => false;

  @override
  Map<String, String> get parameters => navigaTumService.getParameters();

  @override
  String get path => "";

  @override
  String get paths {
    switch (navigaTumService) {
      case NavigaTumServiceSearch _:
        return "api/search";
      case NavigaTumServiceDetails details:
        return "api/get/${details.id}";
      case NavigaTumServiceImages images:
        return "cdn/maps/roomfinder/${images.id}";
      case NavigaTumServiceOverlayImages overlayImages:
        return "cdn/maps/roomfinder/${overlayImages.id}";
    }
  }
}
