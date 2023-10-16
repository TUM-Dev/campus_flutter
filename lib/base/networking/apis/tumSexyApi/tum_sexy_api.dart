import 'package:campus_flutter/base/networking/protocols/api.dart';

class TumSexyApi extends Api {
  @override
  String get baseURL => "https://json.tum.sexy/";

  @override
  bool get needsAuth => false;

  @override
  Map<String, String> get parameters => {};

  @override
  String get path => "";

  @override
  String get paths => "";
}
