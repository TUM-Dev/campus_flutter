import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/networking/protocols/apiError.dart';

class MvvDeparturesApi extends Api {

  final String station;
  final int? walkingTime;

  MvvDeparturesApi({required this.station, required this.walkingTime});

  @override
  Map<String, String> get baseHeaders => {};

  @override
  String get baseURL => "https://efa.mvv-muenchen.de";

  @override
  // TODO: implement error
  ApiError get error => throw UnimplementedError();

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
    "mode": "direct"
  };

  @override
  String get path => "/ng/";

  @override
  String get paths => "XML_DM_REQUEST";

}