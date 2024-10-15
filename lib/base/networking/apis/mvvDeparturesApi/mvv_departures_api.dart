import 'package:campus_flutter/base/networking/protocols/api.dart';

class MvvDeparturesApi extends Api {
  final String station;
  final int? walkingTime;

  MvvDeparturesApi({required this.station, required this.walkingTime});

  @override
  String get domain => "efa.mvv-muenchen.de";

  @override
  bool get needsAuth => false;

  @override
  Map<String, String> get parameters => {
        "outputFormat": "JSON",
        "language": "en",
        "stateless": "1",
        "coordOutputFormat": "WGS84",
        "type_dm": "stop",
        "name_dm": station,
        if (walkingTime != null) "timeOffset": walkingTime.toString(),
        "useRealtime": "1",
        "itOptionsActive": "1",
        "ptOptionsActive": "1",
        "limit": "20",
        "mergeDep": "1",
        "useAllStops": "1",
        "mode": "direct",
      };

  @override
  String get slug => "/ng/";

  @override
  String get path => "${slug}XML_DM_REQUEST";
}
