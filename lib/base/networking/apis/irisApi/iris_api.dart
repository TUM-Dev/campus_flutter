import 'package:campus_flutter/base/networking/apis/irisApi/iris_api_endpoint.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';

class IrisApi extends Api {
  final IrisApiEndpoint irisApiEndpoint;

  IrisApi({required this.irisApiEndpoint});

  @override
  String get domain => "iris.asta.tum.de";

  @override
  bool get needsAuth => false;

  @override
  Map<String, String> get parameters => irisApiEndpoint.getParameters();

  @override
  String get path => "";

  @override
  String get slug => "api";
}
