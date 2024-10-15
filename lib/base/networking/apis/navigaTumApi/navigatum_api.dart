import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api_endpoint.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';

class NavigaTumApi extends Api {
  final NavigaTumApiEndpoint navigaTumApiEndpoint;

  NavigaTumApi({required this.navigaTumApiEndpoint});

  @override
  String get domain => "nav.tum.de";

  @override
  bool get needsAuth => false;

  @override
  Map<String, String> get parameters => navigaTumApiEndpoint.getParameters();

  @override
  String get slug => "";

  @override
  String get path {
    switch (navigaTumApiEndpoint) {
      case NavigaTumApiEndpointSearch _:
        return "api/search";
      case NavigaTumApiEndpointDetails details:
        return "api/locations/${details.id}";
      case NavigaTumApiEndpointImages images:
        return "cdn/maps/roomfinder/${images.id}";
      case NavigaTumApiEndpointOverlayImages overlayImages:
        return "cdn/maps/roomfinder/${overlayImages.id}";
    }
  }
}
