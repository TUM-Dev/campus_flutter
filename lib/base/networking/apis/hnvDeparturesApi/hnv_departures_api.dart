import 'package:campus_flutter/base/networking/protocols/api.dart';

class HnvDeparturesApi extends Api {
  final String station;
  final int? walkingTime;

  HnvDeparturesApi({required this.station, required this.walkingTime});

  @override
  String get domain => "www.efa-bw.de";

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
  String get path => "nvbw/";

  @override
  String get slug => "XML_DM_REQUEST";
}
