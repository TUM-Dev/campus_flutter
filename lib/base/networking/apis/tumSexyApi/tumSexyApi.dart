import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/networking/protocols/apiError.dart';

class TumSexyApi extends Api {
  @override
  Map<String, String> get baseHeaders => {};

  @override
  String get baseURL => "https://json.tum.sexy/";

  @override
  // TODO: implement error
  ApiError get error => throw UnimplementedError();

  @override
  bool get needsAuth => false;

  @override
  Map<String, String> get parameters => {};

  @override
  String get path => "";

  @override
  String get paths => "";
}