import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api_serivce.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';

class NavigaTumApi extends Api {
  final NavigaTumApiService navigaTumApiService;

  NavigaTumApi({required this.navigaTumApiService});

  @override
  String get baseURL => "nav.tum.de";

  @override
  bool get needsAuth => false;

  @override
  Map<String, String> get parameters => navigaTumApiService.getParameters();

  @override
  String get path => "";

  @override
  String get paths {
    switch (navigaTumApiService) {
      case NavigaTumApiServiceSearch _:
        return "api/search";
      case NavigaTumApiServiceDetails details:
        return "api/get/${details.id}";
      case NavigaTumApiServiceImages images:
        return "cdn/maps/roomfinder/${images.id}";
      case NavigaTumApiServiceOverlayImages overlayImages:
        return "cdn/maps/roomfinder/${overlayImages.id}";
    }
  }
}
